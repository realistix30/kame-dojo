-- ═══════════════════════════════════════════════════════════════════
-- KAME DOJO — Sessions table (progress receipts)
-- Run ONCE in Supabase → SQL Editor before using the app
-- ═══════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS sessions (
  id         uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id    text        NOT NULL,          -- device UUID from localStorage
  mode       text        NOT NULL,          -- 'dash' | 'dojo' | 'garden'
  level      text        NOT NULL,          -- 'n5' | 'n4' | 'n3'
  score      integer     NOT NULL DEFAULT 0,
  correct    integer     NOT NULL DEFAULT 0,
  total      integer     NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Index for fast per-user lookups
CREATE INDEX IF NOT EXISTS sessions_user_idx ON sessions (user_id, created_at DESC);

-- RLS: anyone can insert and read (data is non-sensitive game scores)
ALTER TABLE sessions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public insert" ON sessions
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Public read" ON sessions
  FOR SELECT USING (true);
