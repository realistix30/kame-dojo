// modes/dash.js — Shell Dash: side-scrolling kanji runner

Game.registerScreen('dash', {
  mount(el) {
    const questions = Game.sampleN(Game.state.questions.kanji, 20);
    el.innerHTML = `
      <div class="dash-wrap">
        <div class="hud">
          <button class="btn-back" id="dash-back">← Menu</button>
          <span class="hud-label">SCORE</span>
          <span class="hud-value" id="dash-score">0</span>
          <span class="hud-label">LEVEL</span>
          <span class="hud-value">${Game.state.level.toUpperCase()}</span>
          <div class="lives" id="dash-lives">♥♥♥</div>
        </div>
        <canvas id="dash-canvas"></canvas>
        <div class="dash-choices" id="dash-choices"></div>
        <div class="dash-feedback" id="dash-feedback"></div>
      </div>`;

    document.getElementById('dash-back').addEventListener('click', () => Game.showScreen('menu'));

    const canvas = document.getElementById('dash-canvas');
    const ctx    = canvas.getContext('2d');

    // ── Sizing ──────────────────────────────────────────────────────────────
    function resize() {
      const wrap = el.querySelector('.dash-wrap');
      canvas.width  = wrap.clientWidth;
      canvas.height = 220;
    }
    resize();
    window.addEventListener('resize', resize);
    el._resizeOff = () => window.removeEventListener('resize', resize);

    // ── Game state ──────────────────────────────────────────────────────────
    let score      = 0;
    let lives      = 3;
    let qIndex     = 0;
    let gameActive = true;
    let answered   = false;
    let feedbackTimer = 0;

    const KAME_X    = 80;
    const GROUND_Y  = 170;
    let kameY       = GROUND_Y;

    const sprite = new KameSprite();
    sprite.setState('run');

    // Scrolling background layers
    const layers = [
      { x: 0, speed: 0.3, color: '#1a3a5c' }, // sky (static)
      { x: 0, speed: 1.2, color: null },       // mountains
      { x: 0, speed: 2.5, color: null },       // ground
    ];

    // Stars
    const stars = Array.from({ length: 40 }, () => ({
      x: Math.random() * 800,
      y: Math.random() * 80,
      r: Math.random() * 1.5 + 0.3,
    }));

    // Mountain data (reused across scroll)
    const mtns = Array.from({ length: 8 }, (_, i) => ({
      x: i * 140,
      h: 50 + Math.random() * 60,
    }));

    // Obstacle (kanji) state
    let obstacle = null;
    let obstSpeed = 3.5;

    // Ground tile scroll
    let groundOff = 0;

    // ── Questions ───────────────────────────────────────────────────────────
    function currentQ() { return questions[qIndex]; }

    function spawnObstacle() {
      if (!gameActive) return;
      const q = currentQ();
      obstacle = {
        x: canvas.width + 20,
        kanji: q.question,
        warning: false,
      };
      renderChoices(q);
      answered = false;
    }

    function renderChoices(q) {
      const div = document.getElementById('dash-choices');
      div.innerHTML = '';
      q.options.forEach((opt, i) => {
        const btn = document.createElement('button');
        btn.className = 'choice-btn';
        btn.textContent = opt;
        btn.dataset.idx = i;
        btn.addEventListener('click', () => onChoice(i));
        div.appendChild(btn);
      });
    }

    function onChoice(idx) {
      if (!gameActive || answered || !obstacle) return;
      answered = true;
      const q   = currentQ();
      const ok  = idx === q.answer;

      document.querySelectorAll('.choice-btn').forEach((b, i) => {
        b.disabled = true;
        if (i === q.answer) b.classList.add('correct');
        else if (i === idx && !ok) b.classList.add('wrong');
      });

      showFeedback(ok, q.explanation);

      if (ok) {
        score += 100;
        document.getElementById('dash-score').textContent = score;
        sprite.setState('celebrate', 30);
        // Destroy obstacle
        obstacle = null;
        feedbackTimer = 60;
      } else {
        lives = Math.max(0, lives - 1);
        updateLives();
        sprite.setState('hurt', 40);
        if (lives <= 0) {
          feedbackTimer = 90;
          setTimeout(() => endGame(), 1500);
          gameActive = false;
        } else {
          // Obstacle keeps coming but slower to give time
          if (obstacle) obstacle.x = canvas.width * 0.7;
          feedbackTimer = 50;
        }
      }
    }

    function showFeedback(ok, text) {
      const fb = document.getElementById('dash-feedback');
      fb.textContent = ok ? `✓ ${text}` : `✗ ${text}`;
      fb.className   = 'dash-feedback ' + (ok ? 'fb-ok' : 'fb-bad');
    }

    function updateLives() {
      document.getElementById('dash-lives').textContent =
        '♥'.repeat(lives) + '♡'.repeat(3 - lives);
    }

    function nextQuestion() {
      qIndex++;
      if (qIndex >= questions.length) {
        endGame(true);
        return;
      }
      obstSpeed = Math.min(3.5 + qIndex * 0.15, 7);
      spawnObstacle();
    }

    function endGame(win = false) {
      gameActive = false;
      obstacle   = null;
      Game.setScore('dash', score);

      const div = document.getElementById('dash-choices');
      div.innerHTML = '';

      const fb = document.getElementById('dash-feedback');
      fb.className = 'dash-feedback fb-end';
      fb.innerHTML = win
        ? `<b>完璧！ Perfect!</b><br>Score: ${score}<br><button id="dash-again" class="btn-primary">Play Again</button><button id="dash-menu" class="btn-secondary">Menu</button>`
        : `<b>ドンマイ！ Don't give up!</b><br>Score: ${score}<br><button id="dash-again" class="btn-primary">Try Again</button><button id="dash-menu" class="btn-secondary">Menu</button>`;

      document.getElementById('dash-again').addEventListener('click', () => Game.showScreen('dash'));
      document.getElementById('dash-menu').addEventListener('click',  () => Game.showScreen('menu'));
    }

    // ── Draw ────────────────────────────────────────────────────────────────
    function drawBackground() {
      const w = canvas.width, h = canvas.height;

      // Sky gradient
      const sky = ctx.createLinearGradient(0, 0, 0, h);
      sky.addColorStop(0, '#0a1a30');
      sky.addColorStop(1, '#1a3a5c');
      ctx.fillStyle = sky;
      ctx.fillRect(0, 0, w, h);

      // Stars
      ctx.fillStyle = '#ffffff';
      for (const s of stars) {
        ctx.beginPath();
        ctx.arc(((s.x - layers[0].x * 0.1) % w + w) % w, s.y, s.r, 0, Math.PI * 2);
        ctx.fill();
      }

      // Moon
      ctx.fillStyle = '#fffde7';
      ctx.beginPath();
      ctx.arc(w - 60, 35, 18, 0, Math.PI * 2);
      ctx.fill();
      ctx.fillStyle = '#1a3a5c';
      ctx.beginPath();
      ctx.arc(w - 53, 30, 15, 0, Math.PI * 2);
      ctx.fill();

      // Mountains
      ctx.fillStyle = '#0d2240';
      const mOff = (layers[1].x % (8 * 140) + 8 * 140) % (8 * 140);
      for (const m of mtns) {
        const mx = ((m.x - mOff) % (8 * 140) + 8 * 140) % (8 * 140) - 70;
        ctx.beginPath();
        ctx.moveTo(mx, GROUND_Y - 10);
        ctx.lineTo(mx + 70, GROUND_Y - 10 - m.h);
        ctx.lineTo(mx + 140, GROUND_Y - 10);
        ctx.fill();
      }

      // Ground
      ctx.fillStyle = '#1a4a2a';
      ctx.fillRect(0, GROUND_Y, w, h - GROUND_Y);

      // Ground stripe
      ctx.fillStyle = '#2a6a3a';
      ctx.fillRect(0, GROUND_Y, w, 6);

      // Ground tiles (dashes)
      ctx.fillStyle = '#3a8a4a';
      for (let tx = ((groundOff * -1) % 40 + 40) % 40; tx < w; tx += 40) {
        ctx.fillRect(tx, GROUND_Y + 1, 20, 4);
      }
    }

    function drawObstacle() {
      if (!obstacle) return;
      const x = obstacle.x;
      const y = GROUND_Y - 50;

      // Warning flash when close
      const close = x < canvas.width * 0.35;
      if (close && Math.floor(Date.now() / 150) % 2 === 0) return;

      // Shadow
      ctx.fillStyle = 'rgba(0,0,0,0.3)';
      ctx.beginPath();
      ctx.ellipse(x, GROUND_Y + 2, 22, 6, 0, 0, Math.PI * 2);
      ctx.fill();

      // Kanji stone block
      ctx.fillStyle = close ? '#8b2020' : '#4a3a8a';
      _block(ctx, x - 22, y - 10, 44, 52, 6);
      ctx.fillStyle = close ? '#c03030' : '#6a5aaa';
      _block(ctx, x - 20, y - 8, 40, 48, 5);

      // Kanji text
      ctx.fillStyle = '#ffe066';
      ctx.font = 'bold 28px serif';
      ctx.textAlign = 'center';
      ctx.textBaseline = 'middle';
      ctx.fillText(obstacle.kanji, x, y + 14);

      // Danger label when close
      if (close) {
        ctx.fillStyle = '#ff4444';
        ctx.font = 'bold 10px monospace';
        ctx.fillText('！！', x, y - 16);
      }
    }

    function _block(ctx, x, y, w, h, r) {
      ctx.beginPath();
      ctx.moveTo(x + r, y);
      ctx.lineTo(x + w - r, y);
      ctx.quadraticCurveTo(x + w, y, x + w, y + r);
      ctx.lineTo(x + w, y + h - r);
      ctx.quadraticCurveTo(x + w, y + h, x + w - r, y + h);
      ctx.lineTo(x + r, y + h);
      ctx.quadraticCurveTo(x, y + h, x, y + h - r);
      ctx.lineTo(x, y + r);
      ctx.quadraticCurveTo(x, y, x + r, y);
      ctx.closePath();
      ctx.fill();
    }

    // ── Loop ────────────────────────────────────────────────────────────────
    let raf;
    spawnObstacle();

    function loop() {
      raf = requestAnimationFrame(loop);
      const w = canvas.width;

      // Scroll
      layers[1].x += layers[1].speed;
      layers[2].x += layers[2].speed;
      groundOff   += 2.5;

      // Move obstacle
      if (obstacle && gameActive && !answered) {
        obstacle.x -= obstSpeed;

        // Missed — didn't answer in time
        if (obstacle.x < KAME_X - 30) {
          obstacle   = null;
          answered   = true;
          lives      = Math.max(0, lives - 1);
          updateLives();
          sprite.setState('hurt', 40);
          showFeedback(false, 'Too slow! ' + currentQ().explanation);
          feedbackTimer = 60;

          if (lives <= 0) {
            setTimeout(() => endGame(), 1200);
            gameActive = false;
          }
        }
      }

      if (feedbackTimer > 0) {
        feedbackTimer--;
        if (feedbackTimer === 0 && gameActive) {
          document.getElementById('dash-feedback').textContent = '';
          document.getElementById('dash-feedback').className   = 'dash-feedback';
          nextQuestion();
        }
      }

      sprite.update();

      // Draw
      ctx.clearRect(0, 0, w, canvas.height);
      drawBackground();
      sprite.draw(ctx, KAME_X, kameY, 2.5);
      drawObstacle();
    }

    loop();
    el._raf     = raf;
    el._loopRef = () => cancelAnimationFrame(raf);
  },

  unmount() {
    // cleanup handled by el._loopRef, called via game.js
    const el = document.getElementById('app');
    if (el && el._loopRef)   el._loopRef();
    if (el && el._resizeOff) el._resizeOff();
  }
});
