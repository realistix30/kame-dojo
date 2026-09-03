// game.js — screen routing, shared state, data loading

const Game = (() => {
  // ── State ────────────────────────────────────────────────────────────────
  const state = {
    level: 'n5',          // active JLPT level
    questions: null,      // loaded question bank { kanji, grammar, vocabulary }
    scores: {},           // { 'dash-n5': 0, 'dojo-n5': 0, 'garden-n5': 0 }
    currentScreen: null,
  };

  // ── Data ─────────────────────────────────────────────────────────────────
  async function loadLevel(level) {
    if (state.questions && state.level === level) return state.questions;
    // KAME_DATA is injected by index.html as a global to support file:// origin
    const data = (typeof KAME_DATA !== 'undefined' && KAME_DATA[level])
      ? KAME_DATA[level]
      : await fetch(`data/${level}.json`).then(r => r.json());
    state.level     = level;
    state.questions = data;
    return data;
  }

  // ── Scores ───────────────────────────────────────────────────────────────
  function getScore(mode) {
    const key = `${mode}-${state.level}`;
    return state.scores[key] ?? (parseInt(localStorage.getItem(`kame-score-${key}`)) || 0);
  }

  function setScore(mode, score) {
    const key = `${mode}-${state.level}`;
    const best = getScore(mode);
    if (score > best) {
      state.scores[key] = score;
      localStorage.setItem(`kame-score-${key}`, score);
    }
  }

  // ── Screen routing ───────────────────────────────────────────────────────
  const screens = {};

  function registerScreen(name, { mount, unmount }) {
    screens[name] = { mount, unmount: unmount || (() => {}) };
  }

  function showScreen(name, opts = {}) {
    const el = document.getElementById('app');

    if (state.currentScreen && screens[state.currentScreen]) {
      screens[state.currentScreen].unmount();
    }

    el.innerHTML = '';
    state.currentScreen = name;

    if (screens[name]) {
      screens[name].mount(el, opts);
    } else {
      el.textContent = `Screen "${name}" not found.`;
    }
  }

  // ── Utility ──────────────────────────────────────────────────────────────
  function shuffle(arr) {
    const a = [...arr];
    for (let i = a.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [a[i], a[j]] = [a[j], a[i]];
    }
    return a;
  }

  function sampleN(arr, n) {
    return shuffle(arr).slice(0, n);
  }

  // ── Init ─────────────────────────────────────────────────────────────────
  async function init() {
    await loadLevel('n5');
    showScreen('menu');
  }

  return { state, loadLevel, getScore, setScore, showScreen, registerScreen, shuffle, sampleN, init };
})();

// ── Menu screen ─────────────────────────────────────────────────────────────
Game.registerScreen('menu', {
  mount(el) {
    el.innerHTML = `
      <div class="menu-wrap">
        <canvas id="menu-kame" width="160" height="120"></canvas>
        <h1 class="logo">亀道場</h1>
        <p class="logo-sub">Kame Dojo</p>
        <div class="level-picker">
          <button class="lvl-btn ${Game.state.level==='n5'?'active':''}" data-lvl="n5">N5</button>
          <button class="lvl-btn ${Game.state.level==='n4'?'active':''}" data-lvl="n4">N4</button>
          <button class="lvl-btn ${Game.state.level==='n3'?'active':''}" data-lvl="n3">N3</button>
        </div>
        <div class="mode-cards">
          <button class="mode-card" data-mode="dash">
            <span class="mode-icon">🐢</span>
            <span class="mode-name">Shell Dash</span>
            <span class="mode-desc">Kanji Runner</span>
            <span class="mode-score">Best: <b id="score-dash">${Game.getScore('dash')}</b></span>
          </button>
          <button class="mode-card" data-mode="dojo">
            <span class="mode-icon">⚔️</span>
            <span class="mode-name">Dojo Battle</span>
            <span class="mode-desc">Grammar RPG</span>
            <span class="mode-score">Best: <b id="score-dojo">${Game.getScore('dojo')}</b></span>
          </button>
          <button class="mode-card" data-mode="garden">
            <span class="mode-icon">🌱</span>
            <span class="mode-name">Manabi Garden</span>
            <span class="mode-desc">Vocabulary</span>
            <span class="mode-score">Plants: <b id="score-garden">${_gardenCount()}</b></span>
          </button>
        </div>
      </div>`;

    // Animate kame on menu canvas
    const canvas = document.getElementById('menu-kame');
    const ctx    = canvas.getContext('2d');
    const sprite = new KameSprite();
    sprite.setState('run');
    let raf;
    function loop() {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      sprite.update();
      sprite.draw(ctx, 80, 70, 3.5);
      raf = requestAnimationFrame(loop);
    }
    loop();
    el._stopKame = () => cancelAnimationFrame(raf);

    // Level picker
    el.querySelectorAll('.lvl-btn').forEach(btn => {
      btn.addEventListener('click', async () => {
        const lvl = btn.dataset.lvl;
        await Game.loadLevel(lvl);
        el.querySelectorAll('.lvl-btn').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        document.getElementById('score-dash').textContent  = Game.getScore('dash');
        document.getElementById('score-dojo').textContent  = Game.getScore('dojo');
        document.getElementById('score-garden').textContent = _gardenCount();
      });
    });

    // Mode cards
    el.querySelectorAll('.mode-card').forEach(card => {
      card.addEventListener('click', () => {
        Game.showScreen(card.dataset.mode);
      });
    });
  },
  unmount(el) {
    if (el && el._stopKame) el._stopKame();
  }
});

function _gardenCount() {
  try {
    const g = JSON.parse(localStorage.getItem(`kame-garden-${Game.state.level}`) || '{}');
    return Object.keys(g).length;
  } catch { return 0; }
}

// ── Bootstrap ────────────────────────────────────────────────────────────────
window.addEventListener('DOMContentLoaded', () => Game.init());
