-- ═══════════════════════════════════════════════════════════════════
-- KAME DOJO — Profiles + Leaderboard
-- Paste into Supabase → SQL Editor → Run
-- Run AFTER sessions.sql
-- ═══════════════════════════════════════════════════════════════════


-- ───────────────────────────────────────────────────────────────────
-- SECTION 1: Profiles table
-- ───────────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS profiles (
  user_id    TEXT PRIMARY KEY,
  nickname   TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),

  -- nickname must be between 2 and 20 characters
  CONSTRAINT nickname_length CHECK (
    char_length(nickname) >= 2 AND char_length(nickname) <= 20
  )
);

-- Enable Row Level Security
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- Anyone can insert a profile
CREATE POLICY "profiles_insert"
  ON profiles
  FOR INSERT
  WITH CHECK (true);

-- Anyone can read profiles (needed for leaderboard nickname lookups)
CREATE POLICY "profiles_select"
  ON profiles
  FOR SELECT
  USING (true);

-- Anyone can update a profile (client enforces ownership via user_id)
CREATE POLICY "profiles_update"
  ON profiles
  FOR UPDATE
  USING (true)
  WITH CHECK (true);


-- ───────────────────────────────────────────────────────────────────
-- SECTION 2: get_leaderboard() RPC
-- Returns the top `lim` players ranked by total XP (score sum).
-- SECURITY DEFINER lets the anon key run GROUP BY across sessions
-- without RLS blocking cross-user reads.
-- ───────────────────────────────────────────────────────────────────

CREATE OR REPLACE FUNCTION get_leaderboard(lim INTEGER DEFAULT 50)
RETURNS TABLE(
  user_id        TEXT,
  nickname       TEXT,
  total_xp       BIGINT,
  total_sessions BIGINT,
  last_played    TIMESTAMPTZ
)
SECURITY DEFINER
LANGUAGE SQL
AS $$
  SELECT
    s.user_id,
    COALESCE(p.nickname, 'Trainee')  AS nickname,
    SUM(s.score)::BIGINT             AS total_xp,
    COUNT(*)::BIGINT                 AS total_sessions,
    MAX(s.created_at)                AS last_played
  FROM sessions s
  LEFT JOIN profiles p ON s.user_id = p.user_id
  GROUP BY s.user_id, p.nickname
  ORDER BY total_xp DESC
  LIMIT lim;
$$;


-- ───────────────────────────────────────────────────────────────────
-- SECTION 3: get_my_rank() RPC
-- Returns the caller's 1-based global rank position by total XP.
-- Returns NULL if the user_id has no sessions yet.
-- ───────────────────────────────────────────────────────────────────

CREATE OR REPLACE FUNCTION get_my_rank(my_user_id TEXT)
RETURNS BIGINT
SECURITY DEFINER
LANGUAGE SQL
AS $$
  SELECT ranked.pos
  FROM (
    SELECT
      user_id,
      ROW_NUMBER() OVER (ORDER BY SUM(score) DESC) AS pos
    FROM sessions
    GROUP BY user_id
  ) ranked
  WHERE ranked.user_id = my_user_id;
$$;
