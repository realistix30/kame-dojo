-- New leaderboard RPCs: monthly per-level + global all-time
-- Run this in the Supabase SQL Editor

-- Monthly leaderboard per level:
-- Shows users currently at that level, ranked by XP earned this calendar month.
CREATE OR REPLACE FUNCTION get_monthly_leaderboard(p_level TEXT DEFAULT 'n5', lim INTEGER DEFAULT 50)
RETURNS TABLE(user_id TEXT, nickname TEXT, monthly_xp BIGINT, current_level TEXT)
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT
    p.user_id,
    p.nickname,
    COALESCE(SUM(s.score), 0)::BIGINT AS monthly_xp,
    p.current_level
  FROM profiles p
  LEFT JOIN sessions s
    ON s.user_id = p.user_id
    AND s.created_at >= date_trunc('month', NOW() AT TIME ZONE 'UTC')
  WHERE p.current_level = p_level
  GROUP BY p.user_id, p.nickname, p.current_level
  ORDER BY monthly_xp DESC
  LIMIT lim;
$$;

-- Global all-time leaderboard (cross-level, recognition):
-- Sums every session score ever, regardless of current level.
CREATE OR REPLACE FUNCTION get_global_leaderboard(lim INTEGER DEFAULT 50)
RETURNS TABLE(user_id TEXT, nickname TEXT, total_xp BIGINT, current_level TEXT)
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT
    p.user_id,
    p.nickname,
    COALESCE(SUM(s.score), 0)::BIGINT AS total_xp,
    p.current_level
  FROM profiles p
  LEFT JOIN sessions s ON s.user_id = p.user_id
  GROUP BY p.user_id, p.nickname, p.current_level
  ORDER BY total_xp DESC
  LIMIT lim;
$$;

GRANT EXECUTE ON FUNCTION get_monthly_leaderboard(TEXT, INTEGER) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION get_global_leaderboard(INTEGER) TO anon, authenticated;
