-- ── Kame Dojo — Mock Exam Tables ────────────────────────────────────────────
-- Run this in the Supabase SQL Editor BEFORE mock_n5.sql

CREATE TABLE IF NOT EXISTS mock_passages (
  id           text PRIMARY KEY,
  level        text NOT NULL,
  section      text NOT NULL,      -- 'grammar' | 'reading' | 'listening'
  mondai       integer NOT NULL,
  title        text,
  content      text NOT NULL,      -- passage text or listening script
  pre_question text                -- listening: context sentence shown before audio plays
);

CREATE TABLE IF NOT EXISTS mock_questions (
  id          text    PRIMARY KEY,
  level       text    NOT NULL,
  section     text    NOT NULL,    -- 'vocabulary' | 'grammar' | 'reading' | 'listening'
  mondai      integer NOT NULL,
  q_number    integer NOT NULL,
  passage_id  text    REFERENCES mock_passages(id),
  type        text    NOT NULL DEFAULT 'multiple_choice',
  question    text    NOT NULL,
  options     jsonb   NOT NULL DEFAULT '[]',
  answer      integer NOT NULL DEFAULT 0,
  words       jsonb,
  explanation text
);

CREATE TABLE IF NOT EXISTS mock_exam_results (
  id           uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id      text        NOT NULL,
  level        text        NOT NULL,
  started_at   timestamptz NOT NULL DEFAULT now(),
  completed_at timestamptz,
  time_seconds integer,
  answers      jsonb       NOT NULL DEFAULT '{}',
  scores       jsonb       NOT NULL DEFAULT '{}',
  total_score  integer
);

-- Indexes for fast queries
CREATE INDEX IF NOT EXISTS idx_mq_level_section_mondai
  ON mock_questions(level, section, mondai, q_number);
CREATE INDEX IF NOT EXISTS idx_mp_level_section
  ON mock_passages(level, section, mondai);
CREATE INDEX IF NOT EXISTS idx_mer_user_level
  ON mock_exam_results(user_id, level);

-- Row Level Security (anon key can read questions/passages, insert results)
ALTER TABLE mock_passages      ENABLE ROW LEVEL SECURITY;
ALTER TABLE mock_questions     ENABLE ROW LEVEL SECURITY;
ALTER TABLE mock_exam_results  ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read passages"
  ON mock_passages FOR SELECT USING (true);
CREATE POLICY "Public read questions"
  ON mock_questions FOR SELECT USING (true);
CREATE POLICY "Public insert results"
  ON mock_exam_results FOR INSERT WITH CHECK (true);
CREATE POLICY "Public read results"
  ON mock_exam_results FOR SELECT USING (true);
