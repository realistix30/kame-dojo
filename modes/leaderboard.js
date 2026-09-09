// modes/leaderboard.js — leaderboard with All Time / Monthly / Global modes

Game.registerScreen('leaderboard', {
  mount(el) {
    const myId    = Progress.getDeviceId();
    const myLevel = Progress.getCurrentLevel();

    // mode: 'alltime' | 'monthly' | 'global'
    let mode      = 'alltime';
    let activeTab = myLevel;   // only used for alltime + monthly

    function monthLabel() {
      return new Date().toLocaleDateString(undefined, { month: 'long', year: 'numeric' });
    }

    function render() {
      const isGlobal  = mode === 'global';
      const isMonthly = mode === 'monthly';

      el.innerHTML = `
        <div class="lb-wrap">
          <div class="hud">
            <button class="btn-back" id="lb-back">← Rankings</button>
            <span class="hud-label">🌐 Leaderboard</span>
          </div>

          <div class="lb-mode-btns">
            <button class="lb-mode-btn${mode === 'alltime'  ? ' active' : ''}" data-mode="alltime">🏆 All Time</button>
            <button class="lb-mode-btn${mode === 'monthly'  ? ' active' : ''}" data-mode="monthly">📅 Monthly</button>
            <button class="lb-mode-btn${mode === 'global'   ? ' active' : ''}" data-mode="global">🌍 Global</button>
          </div>

          ${isMonthly ? `<div class="lb-month-label">${monthLabel()}</div>` : ''}

          ${!isGlobal ? `
          <div class="lb-tabs">
            ${Progress.LEVEL_ORDER.map(lvl => {
              const r = Progress.getLevelRank(lvl);
              return `<button class="lb-tab${lvl === activeTab ? ' lb-tab-active' : ''}" data-lvl="${lvl}">
                ${r.badge} ${lvl.toUpperCase()}
              </button>`;
            }).join('')}
          </div>` : `<div class="lb-global-badge">🌍 All Levels — All Time</div>`}

          <div class="lb-body">
            <div class="center-msg" id="lb-loading">
              <p>${isGlobal ? 'Loading global rankings…' : `Loading ${activeTab.toUpperCase()} ${isMonthly ? 'monthly' : 'all-time'}…`}</p>
            </div>
          </div>
        </div>`;

      document.getElementById('lb-back').addEventListener('click', () => Game.showScreen('rankings'));

      el.querySelectorAll('.lb-mode-btn').forEach(btn => {
        btn.addEventListener('click', () => {
          mode = btn.dataset.mode;
          if (mode !== 'global' && !activeTab) activeTab = myLevel;
          render();
        });
      });

      el.querySelectorAll('.lb-tab').forEach(btn => {
        btn.addEventListener('click', () => {
          activeTab = btn.dataset.lvl;
          render();
        });
      });

      if (isGlobal) {
        _loadGlobal();
      } else if (isMonthly) {
        _loadMonthly(activeTab);
      } else {
        _loadAllTime(activeTab);
      }
    }

    // ── All Time (per-level) ──────────────────────────────────────
    function _loadAllTime(level) {
      Promise.all([Progress.fetchLeaderboard(level), Progress.fetchMyRank(level)])
        .then(([rows, myRank]) => {
          const tabRank = Progress.getLevelRank(level);
          const myRankHtml = (myRank && level === myLevel)
            ? `<div class="lb-my-rank">Your rank in ${level.toUpperCase()}: <b>#${myRank}</b></div>`
            : '';
          _renderRows(rows, r => Number(r.level_xp) || 0, tabRank, myRankHtml, 'Level XP', level);
        })
        .catch(_renderError);
    }

    // ── Monthly (per-level) ───────────────────────────────────────
    function _loadMonthly(level) {
      Progress.fetchMonthlyLeaderboard(level)
        .then(rows => {
          const tabRank = Progress.getLevelRank(level);
          _renderRows(rows, r => Number(r.monthly_xp) || 0, tabRank, '', 'This Month', level);
        })
        .catch(_renderError);
    }

    // ── Global all-time ───────────────────────────────────────────
    function _loadGlobal() {
      Progress.fetchGlobalLeaderboard()
        .then(rows => {
          if (!rows.length) {
            document.getElementById('lb-loading').innerHTML =
              '<p style="color:var(--text-dim)">No data yet — play to get on the board!</p>';
            return;
          }

          const rowsHtml = rows.map((r, i) => {
            const pos    = i + 1;
            const isMe   = r.user_id === myId;
            const xp     = Number(r.total_xp) || 0;
            const lvlRank = Progress.getLevelRank(r.current_level || 'n5');
            const medal  = pos === 1 ? '🥇' : pos === 2 ? '🥈' : pos === 3 ? '🥉' : `#${pos}`;
            const nick   = r.nickname || 'Trainee';
            return `
              <div class="lb-row lb-row-global ${isMe ? 'lb-you' : ''}">
                <span class="lb-pos">${medal}</span>
                <span class="lb-badge" title="${lvlRank.en}">${lvlRank.badge}</span>
                <span class="lb-nick">
                  ${nick}${isMe ? ' <span class="lb-you-tag">YOU</span>' : ''}
                  <span class="lb-level-tag">${(r.current_level || 'n5').toUpperCase()}</span>
                </span>
                <span class="lb-xp">${xp.toLocaleString()} XP</span>
              </div>`;
          }).join('');

          document.getElementById('lb-loading').outerHTML = `
            <div class="lb-global-note">Ranked by total XP earned across all levels and all time.</div>
            <div class="lb-header-row">
              <span>Rank</span><span></span><span>Trainer</span><span>Total XP</span>
            </div>
            <div class="lb-list">${rowsHtml}</div>`;
        })
        .catch(_renderError);
    }

    // ── Shared row renderer ───────────────────────────────────────
    function _renderRows(rows, xpFn, tabRank, myRankHtml, xpLabel, level) {
      if (!rows.length) {
        document.getElementById('lb-loading').innerHTML =
          `<p style="color:var(--text-dim)">No ${level.toUpperCase()} trainers yet — be the first!</p>`;
        return;
      }

      const rowsHtml = rows.map((r, i) => {
        const pos   = i + 1;
        const isMe  = r.user_id === myId && level === myLevel;
        const xp    = xpFn(r);
        const medal = pos === 1 ? '🥇' : pos === 2 ? '🥈' : pos === 3 ? '🥉' : `#${pos}`;
        const nick  = r.nickname || 'Trainee';
        return `
          <div class="lb-row ${isMe ? 'lb-you' : ''}">
            <span class="lb-pos">${medal}</span>
            <span class="lb-badge">${tabRank.badge}</span>
            <span class="lb-nick">
              ${nick}${isMe ? ' <span class="lb-you-tag">YOU</span>' : ''}
            </span>
            <span class="lb-xp">${xp.toLocaleString()} XP</span>
          </div>`;
      }).join('');

      document.getElementById('lb-loading').outerHTML = `
        ${myRankHtml}
        <div class="lb-header-row">
          <span>Rank</span><span></span><span>Trainer</span><span>${xpLabel}</span>
        </div>
        <div class="lb-list">${rowsHtml}</div>`;
    }

    function _renderError() {
      const el2 = document.getElementById('lb-loading');
      if (el2) el2.innerHTML = '<p style="color:var(--red)">Could not load leaderboard. Check your connection.</p>';
    }

    render();
  },

  unmount() {}
});
