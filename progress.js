// progress.js — session recording, XP tracking, rank system

const Progress = (() => {

  // ── Device identity ───────────────────────────────────────────────
  // Generates a stable anonymous ID per browser/device (no login needed)
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

  // ── Rank ladder ───────────────────────────────────────────────────
  const RANKS = [
    { id: 'novice', label: '見習い',    en: 'Novice',       minXP: 0,     color: '#8a9ac0', badge: '🥋' },
    { id: 'n5',     label: 'N5 修行者', en: 'N5 Trainee',   minXP: 500,   color: '#4a8aff', badge: '🐢' },
    { id: 'n4',     label: 'N4 剣士',   en: 'N4 Swordsman', minXP: 2500,  color: '#2aaa5a', badge: '⚔️'  },
    { id: 'n3',     label: 'N3 武士',   en: 'N3 Warrior',   minXP: 7500,  color: '#ff6a2a', badge: '🏯' },
    { id: 'n2',     label: 'N2 師範',   en: 'N2 Expert',    minXP: 15000, color: '#aa2aff', badge: '🎌' },
    { id: 'n1',     label: 'N1 師匠',   en: 'N1 Master',    minXP: 25000, color: '#ffe066', badge: '👑' },
  ];

  function getRankFromXP(xp) {
    let rank = RANKS[0];
    for (const r of RANKS) {
      if (xp >= r.minXP) rank = r;
      else break;
    }
    return rank;
  }

  function getNextRank(rank) {
    const idx = RANKS.findIndex(r => r.id === rank.id);
    return idx < RANKS.length - 1 ? RANKS[idx + 1] : null;
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

  // ── Local XP cache (localStorage for instant display) ─────────────
  function getCachedXP() {
    return parseInt(localStorage.getItem('kame-total-xp') || '0', 10);
  }

  function addCachedXP(amount) {
    const updated = getCachedXP() + amount;
    localStorage.setItem('kame-total-xp', updated);
    return updated;
  }

  function deductXP(amount) {
    const updated = Math.max(0, getCachedXP() - amount);
    localStorage.setItem('kame-total-xp', updated);
    return updated;
  }

  // ── Supabase session save ─────────────────────────────────────────
  // Fire-and-forget: updates local cache synchronously, Supabase async.
  function saveSession(mode, level, score, correct, total) {
    addCachedXP(score);

    // Update per-mode daily stats synchronously
    const daily = getDailyStats(mode);
    daily.answered += total;
    daily.correct  += correct;
    daily.xpEarned += score;
    localStorage.setItem(getDailyKey(mode), JSON.stringify(daily));

    fetch(`${SUPABASE_URL}/rest/v1/sessions`, {
      method: 'POST',
      headers: {
        apikey:          SUPABASE_KEY,
        Authorization:   `Bearer ${SUPABASE_KEY}`,
        'Content-Type':  'application/json',
        Prefer:          'return=minimal',
      },
      body: JSON.stringify({ user_id: getDeviceId(), mode, level, score, correct, total }),
    }).catch(e => console.warn('Session save failed:', e.message));
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
      body: JSON.stringify({ user_id: getDeviceId(), nickname: nick.trim() }),
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

  // ── Leaderboard ───────────────────────────────────────────────────
  async function fetchLeaderboard() {
    try {
      const res = await fetch(`${SUPABASE_URL}/rest/v1/rpc/get_leaderboard`, {
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

  async function fetchMyRank() {
    try {
      const res = await fetch(`${SUPABASE_URL}/rest/v1/rpc/get_my_rank`, {
        method:  'POST',
        headers: {
          apikey:         SUPABASE_KEY,
          Authorization:  `Bearer ${SUPABASE_KEY}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ my_user_id: getDeviceId() }),
      });
      if (!res.ok) throw new Error(res.status);
      const n = await res.json();
      return typeof n === 'number' ? n : null;
    } catch { return null; }
  }

  return { getDeviceId, RANKS, getRankFromXP, getNextRank, getCachedXP, addCachedXP, deductXP, saveSession, fetchSessions, DAILY_LIMITS, getDailyStats, isDailyLimitReached, getNickname, saveNickname, fetchLeaderboard, fetchMyRank };
})();
