// modes/leaderboard.js — global leaderboard (top 50 by XP)

Game.registerScreen('leaderboard', {
  mount(el) {
    const myId = Progress.getDeviceId();

    el.innerHTML = `
      <div class="lb-wrap">
        <div class="hud">
          <button class="btn-back" id="lb-back">← Rankings</button>
          <span class="hud-label">🌐 Global Leaderboard</span>
        </div>
        <div class="lb-body">
          <div class="center-msg" id="lb-loading"><p>Loading top trainers…</p></div>
        </div>
      </div>`;

    document.getElementById('lb-back').addEventListener('click', () => Game.showScreen('rankings'));

    Promise.all([Progress.fetchLeaderboard(), Progress.fetchMyRank()])
      .then(([rows, myRank]) => {
        if (!rows.length) {
          document.getElementById('lb-loading').innerHTML =
            '<p style="color:var(--text-dim)">No scores yet — be the first!</p>';
          return;
        }

        const myNick = Progress.getNickname() || 'You';

        const rowsHtml = rows.map((r, i) => {
          const pos       = i + 1;
          const isMe      = r.user_id === myId;
          const xp        = Number(r.total_xp) || 0;
          const rank      = Progress.getRankFromXP(xp);
          const medal     = pos === 1 ? '🥇' : pos === 2 ? '🥈' : pos === 3 ? '🥉' : `#${pos}`;
          const nick      = r.nickname || 'Trainee';
          const sessions  = r.total_sessions || 0;
          return `
            <div class="lb-row ${isMe ? 'lb-you' : ''}">
              <span class="lb-pos">${medal}</span>
              <span class="lb-badge">${rank.badge}</span>
              <span class="lb-nick">${nick}${isMe ? ' <span class="lb-you-tag">YOU</span>' : ''}</span>
              <span class="lb-xp">${xp.toLocaleString()} XP</span>
              <span class="lb-sessions">${sessions} runs</span>
            </div>`;
        }).join('');

        const myRankHtml = myRank
          ? `<div class="lb-my-rank">Your global rank: <b>#${myRank}</b></div>`
          : '';

        document.getElementById('lb-loading').outerHTML = `
          ${myRankHtml}
          <div class="lb-header-row">
            <span>Rank</span>
            <span></span>
            <span>Trainer</span>
            <span>XP</span>
            <span>Runs</span>
          </div>
          <div class="lb-list">${rowsHtml}</div>`;
      })
      .catch(() => {
        document.getElementById('lb-loading').innerHTML =
          '<p style="color:var(--red)">Could not load leaderboard. Check your connection.</p>';
      });
  },

  unmount() {}
});
