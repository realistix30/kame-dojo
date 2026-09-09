-- Migration: add current_level and level_xp to profiles
-- Run this in the Supabase SQL Editor AFTER the original profiles.sql

ALTER TABLE profiles
  ADD COLUMN IF NOT EXISTS current_level TEXT NOT NULL DEFAULT 'n5',
  ADD COLUMN IF NOT EXISTS level_xp      INTEGER NOT NULL DEFAULT 0;

-- Validate level values
ALTER TABLE profiles
  DROP CONSTRAINT IF EXISTS valid_current_level;
ALTER TABLE profiles
  ADD CONSTRAINT valid_current_level
    CHECK (current_level IN ('n5','n4','n3','n2','n1'));

-- Drop old RPCs before recreating with new signatures
DROP FUNCTION IF EXISTS get_leaderboard(integer);
DROP FUNCTION IF EXISTS get_my_rank(text);

-- Per-level leaderboard: returns top N users in a given JLPT level
CREATE OR REPLACE FUNCTION get_leaderboard(p_level TEXT DEFAULT 'n5', lim INTEGER DEFAULT 50)
RETURNS TABLE(user_id TEXT, nickname TEXT, level_xp BIGINT, current_level TEXT)
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT
    p.user_id,
    p.nickname,
    p.level_xp::BIGINT,
    p.current_level
  FROM profiles p
  WHERE p.current_level = p_level
  ORDER BY p.level_xp DESC
  LIMIT lim;
$$;

-- User's rank within their level's leaderboard
CREATE OR REPLACE FUNCTION get_my_rank(my_user_id TEXT, p_level TEXT DEFAULT 'n5')
RETURNS INTEGER
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT rank::INTEGER
  FROM (
    SELECT
      user_id,
      ROW_NUMBER() OVER (ORDER BY level_xp DESC) AS rank
    FROM profiles
    WHERE current_level = p_level
  ) ranked
  WHERE user_id = my_user_id;
$$;

GRANT EXECUTE ON FUNCTION get_leaderboard(TEXT, INTEGER) TO anon, authenticated;
GRANT EXECUTE ON FUNCTION get_my_rank(TEXT, TEXT) TO anon, authenticated;
