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
      const curIdx       = Progress.LEVEL_ORDER.indexOf(currentLevel);

      // Per-level mastery stats from sessions
      const mastery = Progress.LEVEL_ORDER.map(lvl => {
        const rows    = sessions.filter(s => s.level === lvl);
        const correct = rows.reduce((s, r) => s + (r.correct || 0), 0);
        const total   = rows.reduce((s, r) => s + (r.total   || 0), 0);
        const acc     = total > 0 ? Math.round((correct / total) * 100) : null;
        return { lvl, runs: rows.length, acc };
      });

      const recent   = sessions.slice(0, 10);
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
            ${threshold
              ? `${levelXP.toLocaleString()} / ${threshold.toLocaleString()} XP &rarr; ${nextRank ? nextRank.badge + ' ' + nextRank.en : ''}`
              : '👑 Maximum level achieved!'}
          </div>
        </div>

        <!-- JLPT Progress — ladder + mastery unified -->
        <div class="rank-section-title">JLPT Progress</div>
        <div class="prog-table">
          ${Progress.LEVEL_ORDER.map((lvl, i) => {
            const r        = Progress.getLevelRank(lvl);
            const m        = mastery[i];
            const xpNeeded = Progress.LEVEL_UP_XP[lvl];
            const isActive  = lvl === currentLevel;
            const isCleared = i < curIdx;
            const isLocked  = i > curIdx;

            const rowCls = isActive ? 'prog-active' : isCleared ? 'prog-cleared' : 'prog-locked';
            const stateTag = isCleared
              ? `<span class="prog-state-tag prog-tag-clear">✓ Cleared</span>`
              : isActive
              ? `<span class="prog-state-tag prog-tag-active">● Current</span>`
              : `<span class="prog-state-tag prog-tag-locked">🔒 Locked</span>`;

            const rightCol = isActive
              ? `<div class="prog-xp-col">
                   <div class="prog-bar-wrap">
                     <div class="prog-bar" style="width:${barPct}%;background:${r.color}"></div>
                   </div>
                   <span class="prog-xp-text">${levelXP.toLocaleString()} / ${xpNeeded ? xpNeeded.toLocaleString() : '—'}</span>
                 </div>`
              : isCleared
              ? `<div class="prog-mastery-col">
                   <div class="prog-bar-wrap">
                     <div class="prog-bar" style="width:${m.acc ?? 0}%;background:${r.color};opacity:0.7"></div>
                   </div>
                   <span class="prog-mastery-text">${m.runs} run${m.runs !== 1 ? 's' : ''} &middot; ${m.acc !== null ? m.acc + '%' : '—'} acc</span>
                 </div>`
              : `<span class="prog-locked-hint">${xpNeeded ? xpNeeded.toLocaleString() + ' XP to unlock' : ''}</span>`;

            return `<div class="prog-row ${rowCls}">
              <div class="prog-left">
                <span class="prog-badge" style="color:${r.color}">${r.badge}</span>
                <div class="prog-meta">
                  <span class="prog-name" style="${isActive || isCleared ? `color:${r.color}` : ''}">${r.label}</span>
                  ${stateTag}
                </div>
              </div>
              <div class="prog-right">${rightCol}</div>
            </div>`;
          }).join('')}
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
        </div>` : '<p style="color:var(--text-dim);font-size:.85rem;text-align:center;margin-top:8px">No sessions yet — play a mode to start tracking!</p>'}
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
