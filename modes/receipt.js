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
    const dailyStats  = Progress.getDailyStats(mode);
    const modeLimit   = Progress.DAILY_LIMITS[mode];
    const dailyDone   = dailyStats.answered >= modeLimit;

    // XP before/after — saveSession already called addCachedXP(score)
    const newXP  = Progress.getCachedXP();
    const prevXP = newXP - score;

    const prevRank = Progress.getRankFromXP(prevXP);
    const newRank  = Progress.getRankFromXP(newXP);
    const rankUp   = prevRank.id !== newRank.id;

    const nextRank    = Progress.getNextRank(newRank);
    const xpIntoRank  = newXP - newRank.minXP;
    const xpNeeded    = nextRank ? nextRank.minXP - newRank.minXP : 1;
    const barPct      = nextRank ? Math.min(100, Math.round((xpIntoRank / xpNeeded) * 100)) : 100;

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
              <span>XP EARNED</span>
              <span class="txt-gold">+${score.toLocaleString()}</span>
            </div>
            <div class="receipt-row">
              <span>TODAY</span>
              <span class="${dailyDone ? 'txt-green' : ''}">${dailyStats.answered} / ${modeLimit} ${dailyDone ? '✓ Limit reached!' : 'questions'}</span>
            </div>
          </div>
          ${dailyDone ? `<div class="daily-done-banner">🌙 Daily goal complete! Rest well — your brain is consolidating.</div>` : ''}

          <div class="receipt-rule"></div>

          <div class="receipt-rank-section">
            <div class="receipt-rank-label">DOJO RANK</div>
            <div class="receipt-rank-badge" style="color:${newRank.color}">
              ${newRank.badge} ${newRank.label}
              <span class="receipt-rank-en">${newRank.en}</span>
            </div>
            <div class="rank-bar-wrap">
              <div class="rank-bar" style="width:0%;background:${newRank.color}" id="receipt-bar"></div>
            </div>
            <div class="rank-progress-text">
              ${nextRank
                ? `${xpIntoRank.toLocaleString()} / ${xpNeeded.toLocaleString()} XP &rarr; ${nextRank.badge} ${nextRank.en}`
                : '🏆 Maximum rank achieved!'}
            </div>
          </div>

          ${rankUp ? `
          <div class="rankup-banner">
            ⬆️ RANK UP! &nbsp; ${prevRank.badge} ${prevRank.en} &rarr; ${newRank.badge} ${newRank.en}
          </div>` : ''}

          <div class="receipt-rule"></div>
          <div class="receipt-total-xp">Total XP: ${newXP.toLocaleString()}</div>

          <div class="receipt-buttons">
            <button class="btn-primary"   id="r-again">Play Again</button>
            <button class="btn-secondary" id="r-menu">Menu</button>
            <button class="btn-secondary" id="r-ranks">Rankings</button>
          </div>
        </div>
      </div>`;

    // Animate the rank bar on next frame
    requestAnimationFrame(() => {
      const bar = document.getElementById('receipt-bar');
      if (bar) bar.style.width = barPct + '%';
    });

    document.getElementById('r-again').addEventListener('click', () => {
      if (Progress.isDailyLimitReached(mode)) {
        const wrap = el.querySelector('.receipt-wrap');
        _showDailyModal(wrap || el, mode);
      } else {
        Game.showScreen(mode);
      }
    });
    document.getElementById('r-menu').addEventListener('click',  () => Game.showScreen('menu'));
    document.getElementById('r-ranks').addEventListener('click', () => Game.showScreen('rankings'));
  },
  unmount() {}
});
