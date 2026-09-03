# 亀道場 — Kame Dojo

A browser-based Japanese JLPT learning game. No build tools, no dependencies — open `index.html` and play.

![Kame-kun](https://img.shields.io/badge/JLPT-N5%20%7C%20N4%20%7C%20N3-gold) ![License](https://img.shields.io/badge/license-MIT-blue)

---

## Play it

**Local:** just open `index.html` in any browser.

**Hosted:** deploy the whole folder as-is to Netlify, GitHub Pages, or any static host.

---

## Game Modes

| Mode | File | Description |
|---|---|---|
| 🐢 **Shell Dash** | `modes/dash.js` | Side-scrolling runner. Kanji obstacles fly at Kame-kun — tap the correct reading before impact. 3 lives, score increases per correct answer, obstacle speed ramps up. |
| ⚔️ **Dojo Battle** | `modes/dojo.js` | Turn-based RPG. Fight sensei opponents (Tanaka → Yamamoto → Master Oni) using grammar questions. HP bars, fill-in-the-blank and word-reorder questions. |
| 🌱 **Manabi Garden** | `modes/garden.js` | Relaxed vocabulary mode. Correct answers grow pixel-art plants through 4 stages (seed → sprout → flower → tree). Garden is saved and persists between sessions. |

---

## Project Structure

```
kame-dojo/
│
├── index.html          ← single entry point; all CSS + JS inlined here
├── style.css           ← all visual styles (dark theme, CSS variables)
├── game.js             ← screen router + shared state (Game object)
├── kame.js             ← Kame-kun pixel art sprite + KameSprite animator
│
├── modes/
│   ├── dash.js         ← Shell Dash game logic
│   ├── dojo.js         ← Dojo Battle game logic
│   └── garden.js       ← Manabi Garden game logic
│
└── data/
    ├── n5.json         ← N5 question bank (25 kanji, 10 grammar, 15 vocab)
    ├── n4.json         ← N4 question bank (empty — ready to fill)
    └── n3.json         ← N3 question bank (empty — ready to fill)
```

> **Important:** `index.html` also contains an inlined copy of all question data in the `KAME_DATA` global. This is needed for `file://` and static hosting to work without a server. When you add questions to the JSON files, also update the matching section in `index.html` (see [Adding Questions](#adding-questions)).

---

## How the Code Works

### Screen Routing (`game.js`)

`Game` is a singleton object that owns the `<div id="app">` container. Every screen registers itself with:

```js
Game.registerScreen('name', { mount(el) { ... }, unmount(el) { ... } });
```

Switching screens wipes `#app`, calls the old screen's `unmount()` (to cancel animation loops), then calls the new screen's `mount()` to build its HTML fresh.

```js
Game.showScreen('dash');   // navigates to Shell Dash
Game.showScreen('menu');   // back to menu
```

### Question Banks (`data/*.json`)

Each JSON file has three sections:

```json
{
  "kanji":     [ ...questions ],
  "grammar":   [ ...questions ],
  "vocabulary": [ ...questions ]
}
```

Every question follows this shape:

```json
{
  "id":          "n5-k-001",
  "question":    "日",
  "options":     ["にち / ひ", "つき / がつ", "やま / さん", "かわ / かせん"],
  "answer":      0,
  "explanation": "日 means 'day' or 'sun'. Read as にち (nichi) or ひ (hi)."
}
```

| Field | Type | Description |
|---|---|---|
| `id` | string | Unique ID. Format: `{level}-{type}-{number}` e.g. `n5-k-001` |
| `question` | string | The kanji, sentence gap, or vocab word shown to the player |
| `options` | string[4] | Exactly 4 answer choices |
| `answer` | number | 0-indexed position of the correct option |
| `explanation` | string | Shown after answering — keep it concise |

Grammar word-reorder questions need one extra field:

```json
{
  "id":       "n5-g-010",
  "type":     "reorder",
  "question": "Arrange: (I will not go to school tomorrow.)",
  "words":    ["学校に", "明日は", "行きません"],
  "answer":   1,
  "explanation": "Correct: 明日は学校に行きません。Time expressions come first."
}
```

### Score Persistence

Scores are stored in `localStorage` as personal bests, keyed by mode + level:

```
kame-score-dash-n5   → highest score in Shell Dash N5
kame-score-dojo-n4   → highest score in Dojo Battle N4
```

Only writes when the new score beats the stored one. Reading is instant on page load.

### Garden Persistence

The garden stores a growth stage (0–3) for each question ID:

```js
// Stored as JSON under 'kame-garden-n5'
{ "n5-v-005": 2, "n5-v-001": 3, "n5-v-012": 1 }
```

Stage meanings: `0` = seed, `1` = sprout, `2` = flower, `3` = fully grown tree.

Each correct answer increments the stage by 1 (capped at 3). Questions not yet at stage 3 are always shown first.

### Kame-kun Sprite (`kame.js`)

Kame-kun is drawn entirely with the Canvas 2D API — no image files. The main function:

```js
drawKame(ctx, centerX, centerY, scale, frame)
// frame: 0=idle, 1=run-a, 2=run-b, 3=hurt, 4=celebrate
```

`KameSprite` wraps this with animation state:

```js
const sprite = new KameSprite();
sprite.setState('run');       // start running animation
sprite.setState('hurt', 40);  // show hurt for 40 frames then revert
sprite.update();              // call once per frame
sprite.draw(ctx, x, y, scale);
```

---

## Adding Questions

### 1. Edit the JSON file

Open `data/n5.json` (or n4/n3) and add your question to the right section (`kanji`, `grammar`, or `vocabulary`):

```json
{
  "id": "n5-k-026",
  "question": "火",
  "options": ["き / もく", "ひ / か", "みず / すい", "つち / ど"],
  "answer": 1,
  "explanation": "火 means 'fire'. Read as ひ (hi) or か (ka)."
}
```

**Rules:**
- `id` must be unique across the entire file
- `options` must have exactly 4 entries
- `answer` is 0-indexed (0 = first option, 3 = last option)

### 2. Update the inline data in `index.html`

Search for `KAME_DATA` in `index.html` and add the same question to the matching `kanji` / `grammar` / `vocabulary` array under `n5:` (or `n4:` / `n3:`).

This duplication is needed because the JSON files are only used when the game is served via HTTP. When opened directly as `file://`, the browser blocks file fetches, so `index.html` carries its own copy.

---

## Adding a New Game Mode

1. Create `modes/yourmode.js`
2. Register a screen:

```js
Game.registerScreen('yourmode', {
  mount(el) {
    // Build your HTML into el
    // Use Game.state.questions.kanji / .grammar / .vocabulary
    // Call Game.setScore('yourmode', score) to save high score
    // Call Game.showScreen('menu') to go back
  },
  unmount(el) {
    // Cancel any requestAnimationFrame or timers here
  }
});
```

3. Add a `<script src="modes/yourmode.js"></script>` tag in `index.html`
4. Add a mode card in the `menu` screen inside `game.js` (look for `.mode-cards`)

---

## Adding a New JLPT Level

1. Add questions to `data/n4.json` (same structure as `n5.json`)
2. Add the same questions to the `n4: { ... }` block in `index.html`'s `KAME_DATA`
3. The level picker on the menu already handles N4 — nothing else to change

---

## Local Development

No build tools needed. To avoid `file://` restrictions when testing JSON loading:

```powershell
# Windows — PowerShell HTTP server (included in the repo)
powershell -ExecutionPolicy Bypass -File serve.ps1
# Then open http://localhost:7890
```

Or use any static file server you prefer (VS Code Live Server, etc.).

---

## Contribution Ideas

- [ ] Add N4 and N3 question banks
- [ ] Sound effects (Web Audio API — no external files needed)
- [ ] Hiragana / Katakana practice mode
- [ ] Spaced repetition for garden questions (prioritize weak words)
- [ ] Streak counter and daily challenge
- [ ] Mobile touch / swipe gestures for Shell Dash
- [ ] Dark/light theme toggle
- [ ] Export garden progress as a shareable image

---

## Tech Stack

| Thing | How |
|---|---|
| Language | Vanilla JavaScript (ES6+) |
| Styling | Plain CSS with custom properties |
| Graphics | HTML5 Canvas API (no images) |
| Storage | `localStorage` (browser-native) |
| Dependencies | None |
| Build tools | None |
| Runtime | Any modern browser |
