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

    const res = await fetch(
      `${SUPABASE_URL}/rest/v1/questions?level=eq.${level}&select=*&order=id`,
      {
        headers: {
          apikey: SUPABASE_KEY,
          Authorization: `Bearer ${SUPABASE_KEY}`,
        },
      }
    );

    if (!res.ok) throw new Error(`Failed to load questions (${res.status})`);

    const rows = await res.json();
    const data = { kanji: [], grammar: [], vocabulary: [] };

    for (const row of rows) {
      if (!data[row.category]) continue;
      data[row.category].push({
        id:          row.id,
        question:    row.question,
        options:     row.options,
        answer:      row.answer,
        explanation: row.explanation,
        type:        row.type || 'multiple_choice',
        words:       row.words || null,
      });
    }

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
    const key  = `${mode}-${state.level}`;
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
      screens[state.currentScreen].unmount(el);
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
    try {
      const level = Progress.getCurrentLevel();
      await loadLevel(level);
      if (!Progress.getNickname()) {
        showScreen('nickname');
      } else {
        showScreen('menu');
      }
    } catch (err) {
      document.getElementById('app').innerHTML = `
        <div class="center-msg">
          <div style="font-size:2.5rem">⚠️</div>
          <p>Could not connect to the dojo.</p>
          <p style="font-size:.8rem;color:var(--text-dim);margin-top:4px">${err.message}</p>
          <button class="btn-primary" onclick="location.reload()" style="margin-top:8px">Retry</button>
        </div>`;
    }
  }

  return { state, loadLevel, getScore, setScore, showScreen, registerScreen, shuffle, sampleN, init };
})();

// ── Menu screen ─────────────────────────────────────────────────────────────
Game.registerScreen('menu', {
  mount(el) {
    // Sync Game.state.level with progress level — may differ after auto level-up
    const progressLevel = Progress.getCurrentLevel();
    if (Game.state.level !== progressLevel) {
      Game.loadLevel(progressLevel).catch(() => {});
    }

    el.innerHTML = `
      <div class="menu-wrap">
        <canvas id="menu-kame" width="160" height="120"></canvas>
        <h1 class="logo">亀道場</h1>
        <p class="logo-sub">Kame Dojo</p>
        <div class="current-level-badge">
          <span class="current-level-label">Studying</span>
          <span class="current-level-tag">${progressLevel.toUpperCase()}</span>
          <button class="cal-badge-btn" id="menu-cal-btn" title="Take the placement test">🎌 Calibrate</button>
        </div>
        <div class="menu-rank" id="menu-rank-btn">
          <span class="menu-rank-badge" id="menu-rank-badge">🥋</span>
          <div class="menu-rank-info">
            <span class="menu-rank-label" id="menu-rank-label">見習い — Novice</span>
            <span class="menu-rank-sub" id="menu-rank-sub">Tap to view rankings</span>
          </div>
          <span class="menu-rank-arrow">▶</span>
        </div>
        <button class="btn-secondary menu-global-btn" id="menu-global-btn">🌐 Global Leaderboard</button>
        <a href="admin.html" class="admin-portal-link">⚙ Admin</a>
        <div class="mode-cards">
          ${['dash','dojo','garden'].map(m => {
            const st    = Progress.getDailyStats(m);
            const lim   = Progress.DAILY_LIMITS[m];
            const done  = st.answered >= lim;
            const icons = { dash:'🐢', dojo:'⚔️', garden:'🌱' };
            const names = { dash:'Shell Dash', dojo:'Dojo Battle', garden:'Manabi Garden' };
            const descs = { dash:'Kanji Runner', dojo:'Grammar RPG', garden:'Vocabulary' };
            return `<button class="mode-card${done ? ' mode-done' : ''}" data-mode="${m}">
              <span class="mode-icon">${icons[m]}</span>
              <span class="mode-name">${names[m]}</span>
              <span class="mode-desc">${descs[m]}</span>
              <span class="mode-daily-bar-wrap"><span class="mode-daily-bar" style="width:${Math.min(100,Math.round(st.answered/lim*100))}%"></span></span>
              <span class="mode-daily-info${done ? ' mode-daily-done' : ''}">${done ? '✓ Done for today' : `${st.answered} / ${lim} today`}</span>
            </button>`;
          }).join('')}
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

    // Rank badge — show current level rank and XP progress
    const lvl       = Progress.getCurrentLevel();
    const xp        = Progress.getDisplayXP();
    const rank      = Progress.getLevelRank(lvl);
    const threshold = Progress.LEVEL_UP_XP[lvl];
    const nextLevel = Progress.getNextLevel(lvl);
    const nextRank  = nextLevel ? Progress.getLevelRank(nextLevel) : null;
    document.getElementById('menu-rank-badge').textContent = rank.badge;
    document.getElementById('menu-rank-label').textContent = `${rank.label} — ${rank.en}`;
    document.getElementById('menu-rank-sub').textContent   = nextRank && threshold
      ? `${xp.toLocaleString()} / ${threshold.toLocaleString()} XP · ${(threshold - xp).toLocaleString()} to ${nextRank.en}`
      : `${xp.toLocaleString()} XP · Max level!`;
    document.getElementById('menu-rank-btn').addEventListener('click', () => Game.showScreen('rankings'));
    document.getElementById('menu-global-btn').addEventListener('click', () => Game.showScreen('leaderboard'));
    document.getElementById('menu-cal-btn').addEventListener('click', () => Game.showScreen('calibration'));

    // Mode cards — gate on per-mode daily limit
    el.querySelectorAll('.mode-card').forEach(card => {
      card.addEventListener('click', () => {
        const m = card.dataset.mode;
        if (Progress.isDailyLimitReached(m)) {
          _showDailyModal(el, m);
        } else {
          Game.showScreen(m);
        }
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

function _showDailyModal(el, mode) {
  const daily    = Progress.getDailyStats(mode);
  const accuracy = daily.answered > 0 ? Math.round((daily.correct / daily.answered) * 100) : 0;
  const overlay  = document.createElement('div');
  overlay.className = 'daily-modal-overlay';
  overlay.innerHTML = `
    <div class="daily-modal-card">
      <div class="daily-modal-icon">🎉</div>
      <h3 class="daily-modal-title">Daily Goal Complete!</h3>
      <p class="daily-modal-body">You've answered <b>${daily.answered}</b> questions today. Your brain needs rest to consolidate what you learned — come back tomorrow for stronger retention!</p>
      <div class="daily-modal-stats">
        <div class="daily-stat"><span class="daily-stat-num">${accuracy}%</span><span class="daily-stat-label">Accuracy</span></div>
        <div class="daily-stat"><span class="daily-stat-num">+${daily.xpEarned.toLocaleString()}</span><span class="daily-stat-label">XP today</span></div>
        <div class="daily-stat"><span class="daily-stat-num">${daily.correct}</span><span class="daily-stat-label">Correct</span></div>
      </div>
      <div class="daily-modal-btns">
        <button class="btn-secondary" id="dm-rest">Rest today 🌙</button>
        <button class="btn-primary"   id="dm-continue">Keep going</button>
      </div>
    </div>`;
  el.appendChild(overlay);
  document.getElementById('dm-rest').addEventListener('click',     () => overlay.remove());
  document.getElementById('dm-continue').addEventListener('click', () => { overlay.remove(); Game.showScreen(mode); });
}

// ── Persistent user bar ──────────────────────────────────────────────────────
function updateUserBar() {
  const bar  = document.getElementById('user-bar');
  if (!bar) return;
  const nick = Progress.getNickname();
  if (!nick) { bar.style.display = 'none'; return; }
  const lvl  = Progress.getCurrentLevel();
  const rank = Progress.getLevelRank(lvl);
  bar.innerHTML = `
    <span class="user-bar-badge">${rank.badge}</span>
    <span class="user-bar-nick">${nick}</span>
    <span class="user-bar-level">${lvl.toUpperCase()}</span>
    <button class="user-bar-settings" id="ub-settings-btn" title="Change study level">⚙</button>`;
  bar.style.display = 'flex';

  document.getElementById('ub-settings-btn').addEventListener('click', e => {
    e.stopPropagation();
    _toggleLevelPanel();
  });
}

function _toggleLevelPanel() {
  const existing = document.getElementById('level-panel');
  if (existing) { existing.remove(); return; }

  const currentLvl = Progress.getCurrentLevel();
  const panel = document.createElement('div');
  panel.id = 'level-panel';
  panel.className = 'level-panel';
  panel.innerHTML = `
    <div class="level-panel-title">Study Level</div>
    <p class="level-panel-note">XP resets when changing level.</p>
    <div class="level-panel-btns">
      ${['n5','n4','n3','n2','n1'].map(lvl => `
        <button class="level-panel-btn${lvl === currentLvl ? ' active' : ''}" data-lvl="${lvl}">
          ${lvl.toUpperCase()}
        </button>`).join('')}
    </div>`;
  document.body.appendChild(panel);

  panel.querySelectorAll('.level-panel-btn').forEach(btn => {
    btn.addEventListener('click', async e => {
      e.stopPropagation();
      const lvl = btn.dataset.lvl;
      Progress.setCurrentLevel(lvl);
      await Game.loadLevel(lvl);
      updateUserBar();
      panel.remove();
      if (Game.state.currentScreen === 'menu') Game.showScreen('menu');
    });
  });

  // Close on any outside click
  setTimeout(() => {
    document.addEventListener('click', () => {
      document.getElementById('level-panel')?.remove();
    }, { once: true });
  }, 0);
}

// ── Bootstrap ────────────────────────────────────────────────────────────────
window.addEventListener('DOMContentLoaded', () => {
  updateUserBar();
  Game.init();
});
