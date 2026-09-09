// progress.js — session recording, XP tracking, rank system

const Progress = (() => {

  // ── Device identity ───────────────────────────────────────────────
  function getDeviceId() {
    let id = localStorage.getItem('kame-device-id');
    if (!id) {
      id = (typeof crypto !== 'undefined' && crypto.randomUUID)
        ? crypto.randomUUID()
        : 'xxxx-xxxx-4xxx-yxxx'.replace(/[xy]/g, c => {
            const r = Math.random() * 16 | 0;
            return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
          }) + '-' + Date.now().toString(36);
      localStorage.setItem('kame-device-id', id);
    }
    return id;
  }

  // ── Per-level rank data ───────────────────────────────────────────
  const LEVEL_RANKS = {
    n5: { id: 'n5', label: 'N5 修行者', en: 'N5 Trainee',   color: '#4a8aff', badge: '🐢' },
    n4: { id: 'n4', label: 'N4 剣士',   en: 'N4 Swordsman',  color: '#2aaa5a', badge: '⚔️'  },
    n3: { id: 'n3', label: 'N3 武士',   en: 'N3 Warrior',    color: '#ff6a2a', badge: '🏯' },
    n2: { id: 'n2', label: 'N2 師範',   en: 'N2 Expert',     color: '#aa2aff', badge: '🎌' },
    n1: { id: 'n1', label: 'N1 師匠',   en: 'N1 Master',     color: '#ffe066', badge: '👑' },
  };

  // XP needed within each level to advance to the next level
  const LEVEL_UP_XP = { n5: 1000, n4: 1500, n3: 2000, n2: 2500, n1: null };
  const LEVEL_ORDER = ['n5', 'n4', 'n3', 'n2', 'n1'];

  function getLevelRank(level) {
    return LEVEL_RANKS[level] || LEVEL_RANKS.n5;
  }

  function getNextLevel(level) {
    const idx = LEVEL_ORDER.indexOf(level);
    return idx >= 0 && idx < LEVEL_ORDER.length - 1 ? LEVEL_ORDER[idx + 1] : null;
  }

  function getPrevLevel(level) {
    const idx = LEVEL_ORDER.indexOf(level);
    return idx > 0 ? LEVEL_ORDER[idx - 1] : null;
  }

  // ── Current level & per-level XP ─────────────────────────────────
  function getCurrentLevel() {
    return localStorage.getItem('kame-current-level') || 'n5';
  }

  // Raw XP — may be negative (debt tracking). Use getDisplayXP() for display.
  function getCachedXP() {
    return parseInt(localStorage.getItem('kame-level-xp') || '0', 10);
  }

  // Always non-negative — use this for all UI display.
  function getDisplayXP() {
    return Math.max(0, getCachedXP());
  }

  // Adds XP within current level. Auto-advances level when threshold hit.
  // Stores pending level-up event for receipt.js to display.
  function addCachedXP(amount) {
    const level     = getCurrentLevel();
    const threshold = LEVEL_UP_XP[level];
    const xp        = getCachedXP() + amount;

    if (threshold !== null && xp >= threshold) {
      const nextLevel = getNextLevel(level);
      if (nextLevel) {
        const overflow = Math.max(0, xp - threshold);
        localStorage.setItem('kame-current-level', nextLevel);
        localStorage.setItem('kame-level-xp', overflow);
        localStorage.setItem('kame-pending-levelup', JSON.stringify({ prevLevel: level, newLevel: nextLevel }));
        _syncProfile();
        return overflow;
      }
    }

    // XP can stay negative (debt) — do not clamp here
    localStorage.setItem('kame-level-xp', xp);
    return Math.max(0, xp);
  }

  // Deducts XP. XP can go negative (debt tracking).
  // At -100 debt: demotes to previous level at (prevLevel max XP - 200).
  // At N5 with -100: stays at N5, resets to 0 (no lower level to fall to).
  function deductXP(amount) {
    const raw   = getCachedXP() - amount;
    const level = getCurrentLevel();

    if (raw <= -100) {
      const prevLevel = getPrevLevel(level);
      if (prevLevel) {
        const demoteXP = Math.max(0, (LEVEL_UP_XP[prevLevel] || 0) - 200);
        localStorage.setItem('kame-current-level', prevLevel);
        localStorage.setItem('kame-level-xp', demoteXP);
        localStorage.setItem('kame-pending-leveldown', JSON.stringify({ fromLevel: level, toLevel: prevLevel, newXP: demoteXP }));
        _syncProfile();
      } else {
        localStorage.setItem('kame-level-xp', 0);
      }
      return 0;
    }

    localStorage.setItem('kame-level-xp', raw);
    return Math.max(0, raw);
  }

  // Sets current level and resets XP to 0. Used by manual level picker and calibration.
  function setCurrentLevel(level) {
    localStorage.setItem('kame-current-level', level);
    localStorage.setItem('kame-level-xp', 0);
    _syncProfile();
  }

  // ── Daily limit (per mode) ────────────────────────────────────────
  const DAILY_LIMITS = { dash: 20, dojo: 15, garden: 30 };

  function _dailyDatePrefix() {
    const d = new Date();
    return `kame-daily-${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`;
  }

  function getDailyKey(mode) {
    return `${_dailyDatePrefix()}-${mode}`;
  }

  function getDailyStats(mode) {
    try {
      return JSON.parse(localStorage.getItem(getDailyKey(mode)) || '{"answered":0,"correct":0,"xpEarned":0}');
    } catch {
      return { answered: 0, correct: 0, xpEarned: 0 };
    }
  }

  function isDailyLimitReached(mode) {
    return getDailyStats(mode).answered >= DAILY_LIMITS[mode];
  }

  // ── Supabase session save ─────────────────────────────────────────
  function saveSession(mode, level, score, correct, total) {
    addCachedXP(score);

    const daily = getDailyStats(mode);
    daily.answered += total;
    daily.correct  += correct;
    daily.xpEarned += score;
    localStorage.setItem(getDailyKey(mode), JSON.stringify(daily));

    fetch(`${SUPABASE_URL}/rest/v1/sessions`, {
      method: 'POST',
      headers: {
        apikey:         SUPABASE_KEY,
        Authorization:  `Bearer ${SUPABASE_KEY}`,
        'Content-Type': 'application/json',
        Prefer:         'return=minimal',
      },
      body: JSON.stringify({ user_id: getDeviceId(), mode, level, score, correct, total }),
    }).catch(e => console.warn('Session save failed:', e.message));
  }

  // ── Profile sync ──────────────────────────────────────────────────
  function _syncProfile() {
    const nick = getNickname();
    if (!nick) return;
    fetch(`${SUPABASE_URL}/rest/v1/profiles`, {
      method:  'POST',
      headers: {
        apikey:         SUPABASE_KEY,
        Authorization:  `Bearer ${SUPABASE_KEY}`,
        'Content-Type': 'application/json',
        Prefer:         'resolution=merge-duplicates',
      },
      body: JSON.stringify({
        user_id:       getDeviceId(),
        nickname:      nick,
        current_level: getCurrentLevel(),
        level_xp:      getDisplayXP(),
      }),
    }).catch(e => console.warn('Profile sync failed:', e.message));
  }

  // ── Nickname ──────────────────────────────────────────────────────
  function getNickname() {
    return localStorage.getItem('kame-nickname') || '';
  }

  function saveNickname(nick) {
    localStorage.setItem('kame-nickname', nick.trim());
    fetch(`${SUPABASE_URL}/rest/v1/profiles`, {
      method:  'POST',
      headers: {
        apikey:         SUPABASE_KEY,
        Authorization:  `Bearer ${SUPABASE_KEY}`,
        'Content-Type': 'application/json',
        Prefer:         'resolution=merge-duplicates',
      },
      body: JSON.stringify({
        user_id:       getDeviceId(),
        nickname:      nick.trim(),
        current_level: getCurrentLevel(),
        level_xp:      getDisplayXP(),
      }),
    }).catch(e => console.warn('Nickname save failed:', e.message));
  }

  // ── Fetch all sessions for this device ────────────────────────────
  async function fetchSessions() {
    try {
      const res = await fetch(
        `${SUPABASE_URL}/rest/v1/sessions?user_id=eq.${getDeviceId()}&select=*&order=created_at.desc&limit=100`,
        { headers: { apikey: SUPABASE_KEY, Authorization: `Bearer ${SUPABASE_KEY}` } }
      );
      if (!res.ok) throw new Error(res.status);
      return await res.json();
    } catch {
      return [];
    }
  }

  // ── Leaderboard (per level) ───────────────────────────────────────
  async function fetchLeaderboard(level) {
    try {
      const res = await fetch(`${SUPABASE_URL}/rest/v1/rpc/get_leaderboard`, {
        method:  'POST',
        headers: {
          apikey:         SUPABASE_KEY,
          Authorization:  `Bearer ${SUPABASE_KEY}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ p_level: level || getCurrentLevel(), lim: 50 }),
      });
      if (!res.ok) throw new Error(res.status);
      return await res.json();
    } catch { return []; }
  }

  async function fetchMonthlyLeaderboard(level) {
    try {
      const res = await fetch(`${SUPABASE_URL}/rest/v1/rpc/get_monthly_leaderboard`, {
        method:  'POST',
        headers: {
          apikey:         SUPABASE_KEY,
          Authorization:  `Bearer ${SUPABASE_KEY}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ p_level: level || getCurrentLevel(), lim: 50 }),
      });
      if (!res.ok) throw new Error(res.status);
      return await res.json();
    } catch { return []; }
  }

  async function fetchGlobalLeaderboard() {
    try {
      const res = await fetch(`${SUPABASE_URL}/rest/v1/rpc/get_global_leaderboard`, {
        method:  'POST',
        headers: {
          apikey:         SUPABASE_KEY,
          Authorization:  `Bearer ${SUPABASE_KEY}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ lim: 50 }),
      });
      if (!res.ok) throw new Error(res.status);
      return await res.json();
    } catch { return []; }
  }

  async function fetchMyRank(level) {
    try {
      const res = await fetch(`${SUPABASE_URL}/rest/v1/rpc/get_my_rank`, {
        method:  'POST',
        headers: {
          apikey:         SUPABASE_KEY,
          Authorization:  `Bearer ${SUPABASE_KEY}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ my_user_id: getDeviceId(), p_level: level || getCurrentLevel() }),
      });
      if (!res.ok) throw new Error(res.status);
      const n = await res.json();
      return typeof n === 'number' ? n : null;
    } catch { return null; }
  }

  return {
    getDeviceId,
    LEVEL_RANKS, LEVEL_UP_XP, LEVEL_ORDER,
    getLevelRank, getNextLevel, getPrevLevel,
    getCurrentLevel, getCachedXP, getDisplayXP, addCachedXP, deductXP, setCurrentLevel,
    saveSession, fetchSessions,
    DAILY_LIMITS, getDailyStats, isDailyLimitReached,
    getNickname, saveNickname,
    fetchLeaderboard, fetchMonthlyLeaderboard, fetchGlobalLeaderboard, fetchMyRank,
  };
})();
