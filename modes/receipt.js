// modes/receipt.js — post-session receipt screen

const MODE_META = {
  dash:   { icon: '🐢', name: 'Shell Dash',     msg: { win: '完璧！ Perfect run!', lose: 'ドンマイ！ Keep training!' } },
  dojo:   { icon: '⚔️', name: 'Dojo Battle',    msg: { win: '🏆 Victory!',         lose: '😵 Defeated!' } },
  garden: { icon: '🌱', name: 'Manabi Garden',  msg: { win: '学習完了 Session complete!', lose: '学習完了 Session complete!' } },
};

Game.registerScreen('receipt', {
  mount(el, { mode, level, score, correct, total, win = true }) {
    const meta     = MODE_META[mode] || { icon: '📜', name: mode, msg: { win: 'Done!', lose: 'Done!' } };
    const accuracy    = total > 0 ? Math.round((correct / total) * 100) : 0;
    const dailyStats      = Progress.getDailyStats(mode);
    const modeLimit       = Progress.DAILY_LIMITS[mode];
    const dailyDone       = dailyStats.answered >= modeLimit;
    const wasOverLimit    = (dailyStats.answered - total) >= modeLimit;
    const wrongCount      = total - correct;
    const netXP           = wasOverLimit ? 0 : score - wrongCount * 10;

    // Check for level-up / level-down events (written during saveSession)
    const levelUp = (() => {
      try {
        const v = localStorage.getItem('kame-pending-levelup');
        if (v) { localStorage.removeItem('kame-pending-levelup'); return JSON.parse(v); }
        return null;
      } catch { return null; }
    })();
    const levelDown = (() => {
      try {
        const v = localStorage.getItem('kame-pending-leveldown');
        if (v) { localStorage.removeItem('kame-pending-leveldown'); return JSON.parse(v); }
        return null;
      } catch { return null; }
    })();

    // Preload questions for the new level in the background so modes are ready
    if (levelUp)   Game.loadLevel(levelUp.newLevel).catch(() => {});
    if (levelDown) Game.loadLevel(levelDown.toLevel).catch(() => {});
    updateUserBar();

    // Per-level XP — saveSession already called addCachedXP(score)
    const currentLevel = Progress.getCurrentLevel();
    const levelXP      = Progress.getDisplayXP();
    const rank         = Progress.getLevelRank(currentLevel);
    const nextLevel    = Progress.getNextLevel(currentLevel);
    const nextRank     = nextLevel ? Progress.getLevelRank(nextLevel) : null;
    const threshold    = Progress.LEVEL_UP_XP[currentLevel];
    const barPct       = threshold ? Math.min(100, Math.round((levelXP / threshold) * 100)) : 100;

    el.innerHTML = `
      <div class="receipt-wrap">
        <div class="receipt-card">

          <div class="receipt-header">
            <span class="receipt-mode-icon">${meta.icon}</span>
            <span class="receipt-mode-name">${meta.name}</span>
            <span class="receipt-level-badge">${level.toUpperCase()}</span>
          </div>

          <div class="receipt-rule"></div>

          <div class="receipt-rows">
            <div class="receipt-row">
              <span>RESULT</span>
              <span class="${win ? 'txt-green' : 'txt-red'}">${win ? meta.msg.win : meta.msg.lose}</span>
            </div>
            <div class="receipt-row">
              <span>SCORE</span>
              <span class="txt-gold">${score.toLocaleString()} pts</span>
            </div>
            <div class="receipt-row">
              <span>ACCURACY</span>
              <span>${correct} / ${total} &nbsp;(${accuracy}%)</span>
            </div>
            <div class="receipt-row receipt-xp-row">
              <span>NET XP</span>
              <span class="${wasOverLimit ? 'txt-dim' : netXP >= 0 ? 'txt-gold' : 'txt-red'}">
                ${wasOverLimit ? '—' : (netXP >= 0 ? '+' : '') + netXP.toLocaleString()}
              </span>
            </div>
            <div class="receipt-row">
              <span>TODAY</span>
              <span class="${dailyDone ? 'txt-green' : ''}">${dailyStats.answered} / ${modeLimit} ${dailyDone ? '✓' : 'questions'}</span>
            </div>
          </div>
          ${wasOverLimit
            ? `<div class="daily-done-banner" style="background:#2a1a00;border-color:#aa6600;color:#ffaa44">⚠️ No XP awarded — daily limit was already reached.</div>`
            : dailyDone
              ? `<div class="daily-done-banner">🎉 Daily goal complete! Come back tomorrow for more XP.</div>`
              : ''
          }

          <div class="receipt-rule"></div>

          ${levelUp ? `
          <div class="levelup-banner">
            ⬆️ LEVEL UP! &nbsp; ${Progress.getLevelRank(levelUp.prevLevel).badge} ${levelUp.prevLevel.toUpperCase()} &rarr; ${rank.badge} ${currentLevel.toUpperCase()}
          </div>` : ''}
          ${levelDown ? `
          <div class="leveldown-banner">
            ⬇️ LEVEL DOWN &nbsp; ${Progress.getLevelRank(levelDown.fromLevel).badge} ${levelDown.fromLevel.toUpperCase()} &rarr; ${rank.badge} ${currentLevel.toUpperCase()}
            <span class="leveldown-sub">Restarting at ${levelDown.newXP.toLocaleString()} XP</span>
          </div>` : ''}

          <div class="receipt-rank-section">
            <div class="receipt-rank-label">CURRENT LEVEL</div>
            <div class="receipt-rank-badge" style="color:${rank.color}">
              ${rank.badge} ${rank.label}
              <span class="receipt-rank-en">${rank.en}</span>
            </div>
            <div class="rank-bar-wrap">
              <div class="rank-bar" style="width:0%;background:${rank.color}" id="receipt-bar"></div>
            </div>
            <div class="rank-progress-text">
              ${threshold
                ? `${levelXP.toLocaleString()} / ${threshold.toLocaleString()} XP &rarr; ${nextRank ? nextRank.badge + ' ' + nextRank.en : ''}`
                : '👑 Maximum level achieved!'}
            </div>
          </div>

          <div class="receipt-rule"></div>
          <div class="receipt-total-xp">${currentLevel.toUpperCase()} XP: ${levelXP.toLocaleString()}</div>

          <div class="receipt-buttons">
            <button class="btn-primary"   id="r-again">Play Again</button>
            <button class="btn-secondary" id="r-menu">Menu</button>
            <button class="btn-secondary" id="r-ranks">Rankings</button>
          </div>
        </div>
      </div>`;

    requestAnimationFrame(() => {
      const bar = document.getElementById('receipt-bar');
      if (bar) bar.style.width = barPct + '%';
    });

    document.getElementById('r-again').addEventListener('click', () => {
      if (Progress.isDailyLimitReached(mode)) {
        _showDailyModal(el, mode);
      } else {
        Game.showScreen(mode);
      }
    });
    document.getElementById('r-menu').addEventListener('click',  () => Game.showScreen('menu'));
    document.getElementById('r-ranks').addEventListener('click', () => Game.showScreen('rankings'));
  },
  unmount() {}
});
