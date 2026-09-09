# Kame Dojo — User Manual
**亀道場 · Japanese Learning App**

---

## Table of Contents
1. [What is Kame Dojo?](#1-what-is-kame-dojo)
2. [Getting Started](#2-getting-started)
3. [Game Modes](#3-game-modes)
4. [XP & Level System](#4-xp--level-system)
5. [Daily Limits](#5-daily-limits)
6. [Calibration Test](#6-calibration-test)
7. [Rankings & Leaderboard](#7-rankings--leaderboard)
8. [Settings](#8-settings)

---

## 1. What is Kame Dojo?

Kame Dojo is a gamified Japanese language learning app built around the JLPT (Japanese Language Proficiency Test) framework. You start at **N5** (beginner) and progress through **N4 → N3 → N2 → N1** (near-native) by earning XP through daily practice sessions.

The turtle (亀 *kame*) mascot guides your journey. Every correct answer brings you closer to mastery; every wrong answer costs XP and keeps you honest.

---

## 2. Getting Started

### First Launch — Nickname Screen

When you open Kame Dojo for the first time you will see the **nickname screen**.

1. **Enter your nickname** — between 2 and 20 characters. This name appears on the global leaderboard.
2. **Choose a starting level** — tap N5, N4, N3, N2, or N1.
   - If you are a complete beginner, choose **N5**.
   - If you already know some Japanese, pick your honest level or run the **Calibration Test** after setup.
3. Tap **Enter the Dojo 🐢** to confirm.

> Your device ID is stored locally. No account or password is required.

---

## 3. Game Modes

From the main menu you can access three study modes. Each mode targets a different skill area and uses questions from your **current study level**.

### 🐢 Shell Dash — Kanji Runner

A side-scrolling runner game. Kanji obstacles scroll toward Kame. Four answer choices appear at the bottom.

| Action | Effect |
|--------|--------|
| Tap correct answer | Kame jumps over the obstacle. **+XP** |
| Tap wrong answer | Kame stumbles. **−10 XP** |
| Miss the obstacle | Kame gets hit. **−10 XP** |

The run ends when the timer expires or Kame loses all lives.

### ⚔️ Dojo Battle — Grammar RPG

A turn-based battle. You face an opponent and answer grammar questions to deal damage.

| Outcome | Effect |
|---------|--------|
| Correct answer | Deal damage to the enemy. **+XP** |
| Wrong answer | Take damage yourself. **−10 XP** |
| Win the battle | Score bonus |
| Lose the battle | Session ends |

### 🌱 Manabi Garden — Vocabulary

A flashcard-style vocabulary session. Words are presented one at a time; you select the correct meaning from four choices.

| Outcome | Effect |
|---------|--------|
| Correct | Card is marked learned. **+XP** |
| Wrong | Card is flagged for review. **−10 XP** |

Words you have already learned in a session are tracked so you won't see them again that day until all cards are cycled through.

---

## 4. XP & Level System

### How XP Works

XP is **per-level** — not a single cumulative total. Each level has its own XP counter that resets when you advance or change level.

### Level-Up Thresholds

Earn enough XP within your current level and you automatically advance to the next:

| Current Level | XP Needed to Advance |
|--------------|----------------------|
| N5           | 5,000 XP             |
| N4           | 10,000 XP            |
| N3           | 20,000 XP            |
| N2           | 35,000 XP            |
| N1           | Max level — no cap   |

When you level up, your XP **resets to 0** in the new level (any overflow XP carries over).

### Wrong Answer Penalty

Every wrong answer deducts **10 XP**. Your displayed XP never drops below **0** — but the debt is tracked internally.

### Level Demotion at −100 XP

If your XP debt reaches **−100**, you are demoted to the previous level:

| Demoted From | Lands At |
|-------------|----------|
| N4 → N5 | N5 at **4,800 XP** (5,000 − 200) |
| N3 → N4 | N4 at **9,800 XP** (10,000 − 200) |
| N2 → N3 | N3 at **19,800 XP** (20,000 − 200) |
| N1 → N2 | N2 at **34,800 XP** (35,000 − 200) |

If you are already at N5, the XP simply resets to 0 — you cannot go lower.

A **level down banner** appears on the receipt screen after a demotion.

---

## 5. Daily Limits

Each mode has a daily question limit to encourage spaced repetition:

| Mode | Daily Limit |
|------|------------|
| Shell Dash | 20 questions |
| Dojo Battle | 15 questions |
| Manabi Garden | 30 questions |

The progress bar on each mode card shows how many questions you have answered today. When the limit is reached, the card shows **✓ Done for today**.

You can still choose to continue past the limit — the app will ask you to confirm before bypassing the daily goal.

> Limits reset at midnight local time.

---

## 6. Calibration Test

The calibration test places you at the correct level if you already know some Japanese.

### How to Start

From the main menu, tap **🎌 Calibrate** in the level badge area.

> ⚠️ Running calibration **resets your XP to 0** at the placed level. Your session history is kept.

### How It Works

1. You are given **5 questions per JLPT level** (N5 → N1), mixing grammar and vocabulary.
2. Get **4 out of 5 correct** to pass that level and advance to the next.
3. The test stops at the first level you fail.
4. You are placed at the **highest level you passed**.

| Result | Placement |
|--------|-----------|
| Pass N5, fail N4 | Placed at N5 with 0 XP |
| Pass N4, fail N3 | Placed at N4 with 0 XP |
| Pass all 5 levels | Placed at N1 with 0 XP |

---

## 7. Rankings & Leaderboard

### Personal Rankings Screen

Tap the rank badge on the main menu (or **Rankings** on any receipt screen) to view your personal progress.

**JLPT Progress table** — shows all five levels in one view:

| State | Meaning |
|-------|---------|
| ✓ Cleared | You graduated from this level. Shows runs + accuracy. |
| ● Current | Your active level. Shows live XP progress bar. |
| 🔒 Locked | Not yet reached. Shows XP needed to unlock. |

Below the progress table you will find your **10 most recent sessions** with score, accuracy, and date.

### Global Leaderboard

Tap **🌐 Global** from the rankings screen (or the Global Leaderboard button on the main menu).

The leaderboard has three modes:

| Mode | What It Shows |
|------|--------------|
| 🏆 All Time | Top 50 players at each level, ranked by current level XP |
| 📅 Monthly | Top 50 players at each level, ranked by XP earned this calendar month |
| 🌍 Global | Top 50 players across all levels, ranked by total all-time XP (for recognition) |

Use the **N5 / N4 / N3 / N2 / N1** tabs to switch between levels in All Time and Monthly views. You appear only in the tab matching your **current level**.

---

## 8. Settings

### Changing Your Study Level

Tap the **⚙** icon in the top-right user bar at any time.

A dropdown appears with N5–N1 buttons. Selecting a level:
- Changes your study level immediately
- **Resets your XP to 0** at the chosen level
- Reloads questions for that level

> Use this if you want to deliberately practice a lower level or jump ahead. The leaderboard places you in the category of your current level.

---

*Kame Dojo — 亀道場*
*Good luck on your JLPT journey! 🐢*
