// modes/nickname.js — first-run nickname + starting level setup

Game.registerScreen('nickname', {
  mount(el) {
    const LEVELS = ['n5', 'n4', 'n3', 'n2', 'n1'];
    let chosenLevel = 'n5';

    el.innerHTML = `
      <div class="nickname-wrap">
        <canvas id="nick-kame" width="120" height="100"></canvas>
        <h1 class="logo" style="margin-top:8px">亀道場</h1>
        <p class="logo-sub">Kame Dojo</p>

        <div class="nickname-card">
          <div class="nickname-title">Choose your dojo nickname</div>
          <p class="nickname-hint">Your name will appear on the global leaderboard.</p>
          <input
            id="nick-input"
            class="nickname-input"
            type="text"
            maxlength="20"
            placeholder="e.g. KameMaster99"
            autocomplete="off"
            spellcheck="false"
          />
          <div class="nickname-error" id="nick-error"></div>
          <div class="nickname-counter"><span id="nick-count">0</span> / 20</div>

          <div class="nickname-level-section">
            <div class="nickname-level-label">Starting Level</div>
            <div class="nickname-level-picker" id="nick-level-picker">
              ${LEVELS.map(lvl => `
                <button class="nick-lvl-btn${lvl === 'n5' ? ' active' : ''}" data-lvl="${lvl}">
                  ${lvl.toUpperCase()}
                </button>`).join('')}
            </div>
            <p class="nickname-hint" style="margin-top:4px;font-size:.7rem">
              You can change this anytime, or take a calibration test.
            </p>
          </div>

          <button class="btn-primary nickname-btn" id="nick-confirm">Enter the Dojo 🐢</button>
        </div>
      </div>`;

    // Kame sprite animation
    const canvas = document.getElementById('nick-kame');
    const ctx    = canvas.getContext('2d');
    const sprite = new KameSprite();
    sprite.setState('idle');
    let raf;
    (function loop() {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      sprite.update();
      sprite.draw(ctx, 60, 75, 2.8);
      raf = requestAnimationFrame(loop);
    })();
    el._stopKame = () => cancelAnimationFrame(raf);

    const input   = document.getElementById('nick-input');
    const counter = document.getElementById('nick-count');
    const errEl   = document.getElementById('nick-error');
    const btn     = document.getElementById('nick-confirm');

    // Level picker
    el.querySelectorAll('.nick-lvl-btn').forEach(b => {
      b.addEventListener('click', () => {
        el.querySelectorAll('.nick-lvl-btn').forEach(x => x.classList.remove('active'));
        b.classList.add('active');
        chosenLevel = b.dataset.lvl;
        sprite.setState('run');
      });
    });

    input.addEventListener('input', () => {
      const len = input.value.length;
      counter.textContent = len;
      errEl.textContent   = '';
      sprite.setState(len > 0 ? 'run' : 'idle');
    });

    async function confirm() {
      const nick = input.value.trim();
      if (nick.length < 2) {
        errEl.textContent = 'Nickname must be at least 2 characters.';
        input.focus();
        return;
      }
      sprite.setState('celebrate', 60);
      btn.disabled    = true;
      btn.textContent = 'Saving…';
      Progress.setCurrentLevel(chosenLevel);
      Progress.saveNickname(nick);
      await Game.loadLevel(chosenLevel);
      updateUserBar();
      setTimeout(() => Game.showScreen('menu'), 600);
    }

    btn.addEventListener('click', confirm);
    input.addEventListener('keydown', e => { if (e.key === 'Enter') confirm(); });
    input.focus();
  },

  unmount(el) {
    if (el && el._stopKame) el._stopKame();
  }
});
