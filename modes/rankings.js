// modes/rankings.js — dojo rankings screen

Game.registerScreen('rankings', {
  mount(el) {
    el.innerHTML = `
      <div class="rankings-wrap">
        <div class="hud">
          <button class="btn-back" id="rank-back">← Menu</button>
          <span class="hud-label">🏆 Dojo Rankings</span>
          <button class="btn-secondary rank-global-btn" id="rank-global-btn">🌐 Global</button>
        </div>
        <div class="rank-body">
          <div class="center-msg" id="rank-loading"><p>Loading your records…</p></div>
        </div>
      </div>`;

    document.getElementById('rank-back').addEventListener('click', () => Game.showScreen('menu'));
    document.getElementById('rank-global-btn').addEventListener('click', () => Game.showScreen('leaderboard'));

    Progress.fetchSessions().then(sessions => {
      // Sync XP: trust whichever is higher (server vs cached)
      const serverXP = sessions.reduce((s, r) => s + (r.score || 0), 0);
      const xp = Math.max(Progress.getCachedXP(), serverXP);
      localStorage.setItem('kame-total-xp', xp);

      const rank     = Progress.getRankFromXP(xp);
      const nextRank = Progress.getNextRank(rank);
      const xpInto   = xp - rank.minXP;
      const xpNeeded = nextRank ? nextRank.minXP - rank.minXP : 1;
      const barPct   = nextRank ? Math.min(100, Math.round((xpInto / xpNeeded) * 100)) : 100;

      // Per-level mastery stats
      const LEVELS = ['n5', 'n4', 'n3', 'n2', 'n1'];
      const mastery = LEVELS.map(lvl => {
        const rows    = sessions.filter(s => s.level === lvl);
        const correct = rows.reduce((s, r) => s + (r.correct || 0), 0);
        const total   = rows.reduce((s, r) => s + (r.total   || 0), 0);
        const acc     = total > 0 ? Math.round((correct / total) * 100) : null;
        const best    = rows.reduce((max, r) => Math.max(max, r.score || 0), 0);
        return { lvl, runs: rows.length, acc, best };
      });

      const recent = sessions.slice(0, 10);
      const modeIcon = { dash: '🐢', dojo: '⚔️', garden: '🌱' };

      document.getElementById('rank-loading').outerHTML = `
        <!-- Current rank card -->
        <div class="rank-current-card" style="border-color:${rank.color}">
          <div class="rank-current-badge">${rank.badge}</div>
          <div class="rank-current-title" style="color:${rank.color}">${rank.label}</div>
          <div class="rank-current-en">${rank.en}</div>
          <div class="rank-bar-wrap" style="margin-top:10px;width:100%">
            <div class="rank-bar" style="width:0%;background:${rank.color}" id="rank-main-bar"></div>
          </div>
          <div class="rank-progress-text">
            ${nextRank
              ? `${xpInto.toLocaleString()} / ${xpNeeded.toLocaleString()} XP &rarr; ${nextRank.badge} ${nextRank.en}`
              : '🏆 Maximum rank achieved!'}
          </div>
          <div class="rank-total-xp">Total XP: ${xp.toLocaleString()}</div>
        </div>

        <!-- Rank ladder -->
        <div class="rank-section-title">Rank Ladder</div>
        <div class="rank-ladder">
          ${Progress.RANKS.map(r => {
            const cls = r.id === rank.id ? 'active' : xp >= r.minXP ? 'cleared' : '';
            return `<div class="rank-step ${cls}">
              <span class="rank-step-badge">${r.badge}</span>
              <span class="rank-step-label" style="${r.id === rank.id ? `color:${r.color}` : ''}">${r.label}</span>
              <span class="rank-step-xp">${r.minXP === 0 ? 'Start' : r.minXP.toLocaleString() + ' XP'}</span>
              ${r.id === rank.id ? '<span class="rank-step-current">◀ YOU</span>' : ''}
            </div>`;
          }).join('')}
        </div>

        <!-- Level mastery -->
        <div class="rank-section-title">Level Mastery</div>
        <div class="mastery-table">
          ${mastery.map(m => `
            <div class="mastery-row ${m.runs === 0 ? 'locked' : ''}">
              <span class="mastery-lvl">${m.lvl.toUpperCase()}</span>
              <div class="mastery-bar-wrap">
                <div class="mastery-bar" style="width:${m.acc ?? 0}%"></div>
              </div>
              <span class="mastery-acc">${m.acc !== null ? m.acc + '%' : '—'}</span>
              <span class="mastery-sessions">${m.runs} run${m.runs !== 1 ? 's' : ''}</span>
            </div>`).join('')}
        </div>

        <!-- Recent sessions -->
        ${recent.length ? `
        <div class="rank-section-title">Recent Sessions</div>
        <div class="session-list">
          ${recent.map(s => {
            const acc = s.total > 0 ? Math.round(s.correct / s.total * 100) : 0;
            const d   = new Date(s.created_at);
            const ts  = d.toLocaleDateString(undefined, { month:'short', day:'numeric' });
            return `<div class="session-row">
              <span>${modeIcon[s.mode] || '📜'} ${s.mode}</span>
              <span class="session-lvl">${s.level.toUpperCase()}</span>
              <span class="txt-gold">${(s.score || 0).toLocaleString()} pts</span>
              <span>${acc}%</span>
              <span class="session-date">${ts}</span>
            </div>`;
          }).join('')}
        </div>` : '<p style="color:var(--text-dim);font-size:.85rem;text-align:center">No sessions yet — play a mode to start tracking!</p>'}
      `;

      // Animate bar
      requestAnimationFrame(() => {
        const bar = document.getElementById('rank-main-bar');
        if (bar) bar.style.width = barPct + '%';
      });

    }).catch(() => {
      document.getElementById('rank-loading').innerHTML =
        '<p style="color:var(--red)">Could not load data. Check your connection.</p>';
    });
  },
  unmount() {}
});
