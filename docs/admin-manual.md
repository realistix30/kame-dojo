# Kame Dojo — Admin Manual
**亀道場 · Administrator Reference**

---

## Table of Contents
1. [Admin Portal Access](#1-admin-portal-access)
2. [Authentication](#2-authentication)
3. [Question Browser](#3-question-browser)
4. [Editing Questions](#4-editing-questions)
5. [Adding a Single Question](#5-adding-a-single-question)
6. [Bulk Import (JSON / CSV)](#6-bulk-import-json--csv)
7. [Supabase Setup](#7-supabase-setup)
8. [Database Schema](#8-database-schema)
9. [Adding Questions via SQL](#9-adding-questions-via-sql)
10. [Changing the Admin Password](#10-changing-the-admin-password)
11. [Leaderboard RPCs](#11-leaderboard-rpcs)

---

## 1. Admin Portal Access

The admin portal is a standalone page separate from the main app.

**URL:** `admin.html` (same domain as the main app)

Direct link from the main menu: the small **⚙ Admin** link at the bottom of the menu screen.

---

## 2. Authentication

The admin portal requires **two credentials**:

| Field | Description |
|-------|-------------|
| Admin Password | Verified locally via SHA-256 hash. Default: `admin` |
| Supabase Service Key | Your project's `service_role` key (not the `anon` key). Found in Supabase → Project Settings → API |

Both must be correct to gain access. The service key is stored in `sessionStorage` for the duration of the browser session and is never persisted to disk.

> **Security note:** Change the default password before deploying to production. See [Section 8](#8-changing-the-admin-password).

---

## 3. Question Browser

After logging in you will see a table of all questions in the database.

### Columns

| Column | Description |
|--------|-------------|
| ID | Database row ID |
| Level | JLPT level (n5 / n4 / n3 / n2 / n1) |
| Category | `grammar`, `vocabulary`, or `kanji` |
| Type | `multiple_choice` or `reorder` |
| Question | First 60 characters of the question text |
| Answer | The correct answer |

### Filtering

Use the filter dropdowns at the top of the table to narrow by **level** and/or **category**. The table updates instantly.

### Edit Button

Click the **Edit** button on any row to open the edit drawer for that question.

---

## 4. Editing Questions

The edit drawer slides in from the right. All fields are editable.

### Fields

| Field | Notes |
|-------|-------|
| Level | n5 / n4 / n3 / n2 / n1 |
| Category | grammar / vocabulary / kanji |
| Type | multiple_choice / reorder |
| Question Text | The question displayed to the player |
| Options | Up to 4 answer choices. Click the circle (○) beside an option to mark it as the correct answer (turns filled ●). |
| Explanation | Shown to the player after they answer. Should explain why the correct answer is right. |

### For `reorder` Type Questions

Reorder questions ask the player to arrange words into the correct sentence order. In addition to the fields above, the `words` column in the database stores a JSON array of the words to arrange. This must be edited directly in Supabase (see [Section 7](#7-adding-new-questions)).

### Saving

Click **Save Changes** to PATCH the record. A confirmation message appears. The table row updates immediately without a page reload.

> Changes take effect for all players immediately — there is no staging environment.

---

## 5. Adding a Single Question

Use the **+ Add** button in the admin header to create a new question without leaving the portal.

### Steps

1. Click **+ Add** in the top header bar.
2. The edit drawer slides in from the right with the title **Add New Question**.
3. Fill in all fields (same fields as editing — see Section 4).
4. Click **Add Question** to POST the record to Supabase.
5. The new question appears at the top of the question table immediately.

> The drawer stays open after adding so you can add multiple questions in sequence. Click **Cancel** or **✕ Close** when finished.

---

## 6. Bulk Import (JSON / CSV)

Use the **⬆ Import** button to add many questions at once from a file or pasted content.

### Opening the Import Modal

Click **⬆ Import** in the admin header. The import modal opens with two format tabs: **JSON** and **CSV**.

### Step-by-Step

1. Select the format tab that matches your file (**JSON** or **CSV**).
2. Either:
   - **Drop a file** onto the drop zone, or click it to browse for a `.json` / `.csv` file.
   - **Paste content** directly into the text area below the drop zone.
3. The portal parses the content instantly and shows a **preview** of the first 5 questions.
4. Check the import status line — it shows how many questions were detected and if there are any parse errors.
5. Click **Import N** (where N is the question count) to submit to Supabase.
6. A success message confirms how many rows were inserted. The question table updates automatically.

### Downloading Templates

Click **⬇ JSON Template** or **⬇ CSV Template** inside the import modal to download pre-filled example files. These are also available in the `docs/` folder:

| File | Format |
|------|--------|
| `docs/import-template.json` | JSON array of example questions |
| `docs/import-template.csv` | CSV with header row |

---

### JSON Format

The file must be a JSON **array** of question objects. Each object must have:

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `level` | string | ✓ | `n5`, `n4`, `n3`, `n2`, or `n1` |
| `category` | string | ✓ | `grammar`, `vocabulary`, or `kanji` |
| `type` | string | ✓ | `multiple_choice` or `reorder` |
| `question` | string | ✓ | The question text shown to the player |
| `options` | array | ✓ for `multiple_choice` | Array of 4 answer strings |
| `answer` | integer | ✓ for `multiple_choice` | 0-based index of the correct option |
| `words` | array | ✓ for `reorder` | Array of word strings in correct order |
| `answer` | string | ✓ for `reorder` | The assembled correct sentence |
| `explanation` | string | | Post-answer explanation |

**Example (multiple choice):**
```json
{
  "level": "n5",
  "category": "grammar",
  "type": "multiple_choice",
  "question": "私___学生です。",
  "options": ["は", "が", "を", "に"],
  "answer": 0,
  "explanation": "「は」is the topic marker particle."
}
```

**Example (reorder):**
```json
{
  "level": "n4",
  "category": "grammar",
  "type": "reorder",
  "question": "Arrange into a correct sentence:",
  "options": [],
  "answer": "私は毎日学校に行きます",
  "words": ["私は", "毎日", "学校に", "行きます"],
  "explanation": "Subject + Time + Destination + Verb."
}
```

---

### CSV Format

The first row must be a header row with these column names (order matters):

```
level,category,type,question,option0,option1,option2,option3,answer,words,explanation
```

| Column | Notes |
|--------|-------|
| `level` | `n5` / `n4` / `n3` / `n2` / `n1` |
| `category` | `grammar` / `vocabulary` / `kanji` |
| `type` | `multiple_choice` or `reorder` |
| `question` | Question text |
| `option0`–`option3` | The four answer choices (leave blank for reorder) |
| `answer` | For `multiple_choice`: the 0-based index of the correct option. For `reorder`: the correct assembled sentence (quote the field if it contains commas). |
| `words` | For `reorder` only: words separated by `|` (pipe character), e.g. `私は|毎日|学校に|行きます`. Quote the entire field. |
| `explanation` | Optional. |

**Example rows:**
```csv
n5,grammar,multiple_choice,私___学生です。,は,が,を,に,0,,「は」is the topic marker particle.
n4,grammar,reorder,Arrange into a correct sentence:,,,,,"私は毎日学校に行きます","私は|毎日|学校に|行きます",Subject + Time + Destination + Verb.
```

> **Tip:** Use the downloaded CSV template as a starting point and replace the example rows.

---

## 7. Supabase Setup

Run the following SQL files in order in the **Supabase SQL Editor** (Database → SQL Editor → New query).

### Execution Order

| File | Purpose |
|------|---------|
| `supabase/sessions.sql` | Creates the `sessions` table |
| `supabase/profiles.sql` | Creates the `profiles` table with RLS |
| `supabase/profiles_update.sql` | Adds `current_level` and `level_xp` columns; replaces leaderboard RPCs |
| `supabase/leaderboard_monthly_global.sql` | Adds monthly and global leaderboard RPCs |
| `supabase/seed.sql` | Seeds N5 questions |
| `supabase/seed_extra.sql` | Seeds N4 / N3 / additional questions |

### Enabling Row-Level Security (RLS)

RLS is configured inside `profiles.sql`. The leaderboard RPCs use `SECURITY DEFINER` so they can read across user rows regardless of RLS policies.

---

## 8. Database Schema

### `questions` table

| Column | Type | Description |
|--------|------|-------------|
| `id` | integer | Primary key |
| `level` | text | `n5`, `n4`, `n3`, `n2`, or `n1` |
| `category` | text | `grammar`, `vocabulary`, or `kanji` |
| `type` | text | `multiple_choice` or `reorder` |
| `question` | text | Question text shown to the player |
| `options` | jsonb | Array of answer strings, e.g. `["は", "が", "を", "に"]` |
| `answer` | text | The correct answer string |
| `explanation` | text | Post-answer explanation |
| `words` | jsonb | For reorder type: array of words to arrange, e.g. `["私", "は", "学生", "です"]` |

### `sessions` table

| Column | Type | Description |
|--------|------|-------------|
| `id` | integer | Primary key |
| `user_id` | text | Anonymous device UUID |
| `mode` | text | `dash`, `dojo`, or `garden` |
| `level` | text | JLPT level played |
| `score` | integer | XP earned this session |
| `correct` | integer | Number of correct answers |
| `total` | integer | Total questions attempted |
| `created_at` | timestamptz | Session timestamp |

### `profiles` table

| Column | Type | Description |
|--------|------|-------------|
| `user_id` | text | Primary key — anonymous device UUID |
| `nickname` | text | Display name (2–20 characters) |
| `current_level` | text | Player's current JLPT level |
| `level_xp` | integer | XP within the current level |
| `created_at` | timestamptz | First registration timestamp |

---

## 9. Adding Questions via SQL

### Via Supabase SQL Editor

```sql
INSERT INTO questions (level, category, type, question, options, answer, explanation)
VALUES (
  'n5',
  'grammar',
  'multiple_choice',
  '私___学生です。',
  '["は", "が", "を", "に"]',
  'は',
  '「は」is the topic marker particle. It marks 私 (I/me) as the topic of the sentence.'
);
```

### For Reorder Questions

```sql
INSERT INTO questions (level, category, type, question, options, answer, explanation, words)
VALUES (
  'n4',
  'grammar',
  'reorder',
  'Arrange into a correct sentence:',
  '[]',
  '私は毎日学校に行きます',
  'The correct order follows Subject + Time + Destination + Verb pattern.',
  '["私は", "毎日", "学校に", "行きます"]'
);
```

`words` is the array the player drags and drops. `answer` is the full correct assembled sentence.

---

## 10. Changing the Admin Password

The admin password is verified as a SHA-256 hash hardcoded in `admin.html`.

### Steps

1. Generate the SHA-256 hash of your new password. In a browser console:
   ```js
   const hash = await crypto.subtle.digest('SHA-256', new TextEncoder().encode('yourNewPassword'));
   console.log([...new Uint8Array(hash)].map(b => b.toString(16).padStart(2,'0')).join(''));
   ```
2. Open `admin.html` and find the line:
   ```js
   const ADMIN_HASH = '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918';
   ```
   (This is the SHA-256 of `admin`.)
3. Replace the hash string with your new hash.
4. Save and redeploy.

> The service key is never stored in source code — it is entered by the admin at login and kept only in `sessionStorage`.

---

## 11. Leaderboard RPCs

These PostgreSQL functions are called by the frontend via Supabase REST API.

| Function | Signature | Description |
|----------|-----------|-------------|
| `get_leaderboard` | `(p_level TEXT, lim INT)` | All-time top players at a given level, by `level_xp` |
| `get_monthly_leaderboard` | `(p_level TEXT, lim INT)` | This month's top players at a given level, by session XP sum |
| `get_global_leaderboard` | `(lim INT)` | All-time top players across all levels, by total session XP sum |
| `get_my_rank` | `(my_user_id TEXT, p_level TEXT)` | Rank of a specific user within a level's all-time leaderboard |

All RPCs use `SECURITY DEFINER` and `SET search_path = public` to safely bypass RLS for aggregated reads. They are granted to `anon` and `authenticated` roles.

### Re-creating RPCs

If you need to modify an RPC, drop and recreate it:

```sql
DROP FUNCTION IF EXISTS get_leaderboard(TEXT, INTEGER);
-- then paste the updated CREATE OR REPLACE FUNCTION ...
```

---

## Troubleshooting

| Issue | Check |
|-------|-------|
| Questions not loading | Verify `SUPABASE_URL` and `SUPABASE_KEY` in `config.js` are correct |
| Leaderboard empty | Run `profiles_update.sql` and `leaderboard_monthly_global.sql` |
| Admin login rejected | Confirm you are using the `service_role` key, not the `anon` key |
| RPC 404 error | The function does not exist — run the relevant SQL file |
| RPC permission denied | Re-run the `GRANT EXECUTE` lines at the bottom of the SQL file |
| Reorder questions show no words | Ensure the `words` column contains a valid JSON array, not `null` or `[]` |
| Import shows parse error (CSV) | Check that reorder `words` and `answer` fields are quoted; pipe-separate words inside the field |
| Import shows parse error (JSON) | Validate JSON syntax at jsonlint.com; check `options` is an array, `answer` is an integer for multiple_choice |
| Import succeeds but questions missing | Check the Supabase `questions` table constraints — `level` must be one of n5/n4/n3/n2/n1 |

---

*Kame Dojo Admin Manual — 亀道場*
*For support, check the project repository or review the browser console for error details.*
