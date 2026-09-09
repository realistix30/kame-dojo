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
      const currentLevel = Progress.getCurrentLevel();
      const levelXP      = Progress.getDisplayXP();
      const rank         = Progress.getLevelRank(currentLevel);
      const nextLevel    = Progress.getNextLevel(currentLevel);
      const nextRank     = nextLevel ? Progress.getLevelRank(nextLevel) : null;
      const threshold    = Progress.LEVEL_UP_XP[currentLevel];
      const barPct       = threshold ? Math.min(100, Math.round((levelXP / threshold) * 100)) : 100;

      // Per-level mastery stats
      const mastery = Progress.LEVEL_ORDER.map(lvl => {
        const rows    = sessions.filter(s => s.level === lvl);
        const correct = rows.reduce((s, r) => s + (r.correct || 0), 0);
        const total   = rows.reduce((s, r) => s + (r.total   || 0), 0);
        const acc     = total > 0 ? Math.round((correct / total) * 100) : null;
        const best    = rows.reduce((max, r) => Math.max(max, r.score || 0), 0);
        return { lvl, runs: rows.length, acc, best };
      });

      const recent   = sessions.slice(0, 10);
      const modeIcon = { dash: '🐢', dojo: '⚔️', garden: '🌱' };
      const curIdx   = Progress.LEVEL_ORDER.indexOf(currentLevel);

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
            ${threshold
              ? `${levelXP.toLocaleString()} / ${threshold.toLocaleString()} XP &rarr; ${nextRank ? nextRank.badge + ' ' + nextRank.en : ''}`
              : '👑 Maximum level achieved!'}
          </div>
          <div class="rank-total-xp">${currentLevel.toUpperCase()} XP: ${levelXP.toLocaleString()}</div>
        </div>

        <!-- Level ladder -->
        <div class="rank-section-title">Level Ladder</div>
        <div class="rank-ladder">
          ${Progress.LEVEL_ORDER.map((lvl, i) => {
            const r   = Progress.getLevelRank(lvl);
            const xpNeeded = Progress.LEVEL_UP_XP[lvl];
            const cls = lvl === currentLevel ? 'active' : i < curIdx ? 'cleared' : '';
            return `<div class="rank-step ${cls}">
              <span class="rank-step-badge">${r.badge}</span>
              <span class="rank-step-label" style="${lvl === currentLevel ? `color:${r.color}` : ''}">${r.label}</span>
              <span class="rank-step-xp">${xpNeeded ? xpNeeded.toLocaleString() + ' XP to next' : 'Max level'}</span>
              ${lvl === currentLevel ? '<span class="rank-step-current">◀ YOU</span>' : ''}
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
