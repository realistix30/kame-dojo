// modes/calibration.js — level placement test

const CAL_LEVELS     = ['n5', 'n4', 'n3', 'n2', 'n1'];
const CAL_Q_PER_LVL  = 5;
const CAL_PASS_MIN   = 4;   // correct out of 5 to advance
// XP awarded when calibration places user at a level

Game.registerScreen('calibration', {
  mount(el) {
    let levelIdx    = 0;
    let qIdx        = 0;
    let correct     = 0;
    let questions   = [];
    let answered    = false;
    const results   = {};   // { n5: {correct:4,total:5}, … }

    // ── Helpers ──────────────────────────────────────────────────
    async function fetchLevel(lvl) {
      const res = await fetch(
        `${SUPABASE_URL}/rest/v1/questions?level=eq.${lvl}&category=in.(grammar,vocabulary)&select=*&limit=40`,
        { headers: { apikey: SUPABASE_KEY, Authorization: `Bearer ${SUPABASE_KEY}` } }
      );
      const rows = await res.json();
      return Game.shuffle(rows).slice(0, CAL_Q_PER_LVL);
    }

    function currentLevel() { return CAL_LEVELS[levelIdx]; }

    function levelStepsHtml(activeIdx) {
      return CAL_LEVELS.map((lvl, i) => {
        const done   = results[lvl] !== undefined;
        const passed = done && results[lvl].correct >= CAL_PASS_MIN;
        const active = i === activeIdx;
        const cls    = done ? (passed ? 'cal-step-pass' : 'cal-step-fail') : (active ? 'cal-step-active' : '');
        const icon   = done ? (passed ? '✓' : '✗') : lvl.toUpperCase();
        return `<div class="cal-step ${cls}"><span>${icon}</span></div>`;
      }).join('<div class="cal-step-line"></div>');
    }

    // ── Intro ─────────────────────────────────────────────────────
    function showIntro() {
      el.innerHTML = `
        <div class="cal-wrap">
          <div class="cal-card">
            <div class="cal-icon">🎌</div>
            <h2 class="cal-title">Level Calibration</h2>
            <p class="cal-desc">
              Answer questions from each JLPT level.<br>
              Get <b>${CAL_PASS_MIN}/${CAL_Q_PER_LVL}</b> right to advance to the next level.<br>
              We'll place you at the right starting point.
            </p>
            <div class="cal-steps">${levelStepsHtml(-1)}</div>
            <p class="cal-note">
              This only moves you <b>up</b> — your progress is never reduced.
            </p>
            <button class="btn-primary cal-start-btn" id="cal-start">Start Test</button>
            <button class="btn-secondary" id="cal-cancel" style="width:100%">← Back</button>
          </div>
        </div>`;
      document.getElementById('cal-start').addEventListener('click', startTest);
      document.getElementById('cal-cancel').addEventListener('click', () => Game.showScreen('menu'));
    }

    // ── Test ──────────────────────────────────────────────────────
    async function startTest() {
      showLoading();
      try {
        questions = await fetchLevel(currentLevel());
        correct   = 0;
        qIdx      = 0;
        showQuestion();
      } catch {
        showError();
      }
    }

    function showLoading() {
      el.innerHTML = `
        <div class="cal-wrap">
          <div class="cal-card">
            <div class="cal-icon">⏳</div>
            <p style="color:var(--text-dim);margin-top:8px">Loading ${currentLevel().toUpperCase()} questions…</p>
          </div>
        </div>`;
    }

    function showError() {
      el.innerHTML = `
        <div class="cal-wrap">
          <div class="cal-card">
            <div class="cal-icon">⚠️</div>
            <p style="color:var(--red)">Failed to load questions. Check your connection.</p>
            <button class="btn-primary" style="margin-top:16px" onclick="Game.showScreen('menu')">Back to Menu</button>
          </div>
        </div>`;
    }

    function showQuestion() {
      answered = false;
      const q   = questions[qIdx];
      const lvl = currentLevel();

      el.innerHTML = `
        <div class="cal-wrap">
          <div class="cal-card cal-card-q">
            <div class="cal-steps cal-steps-top">${levelStepsHtml(levelIdx)}</div>
            <div class="cal-progress">${lvl.toUpperCase()} — Question ${qIdx + 1} of ${CAL_Q_PER_LVL}</div>
            <div class="cal-q-text">${Furigana.annotate(q.question, lvl)}</div>
            <div id="cal-interaction"></div>
            <div class="cal-score-row">
              <span class="cal-score-label">Correct so far:</span>
              <span class="cal-score-val">${correct} / ${qIdx}</span>
            </div>
          </div>
        </div>`;

      if (q.type === 'reorder') {
        mountReorder(q, lvl);
      } else {
        mountMultipleChoice(q);
      }
    }

    function mountMultipleChoice(q) {
      const area = el.querySelector('#cal-interaction');
      if (!area) return;
      const opts = Array.isArray(q.options) ? q.options : [];
      area.innerHTML = `<div class="cal-choices">
        ${opts.map((opt, i) =>
          `<button class="choice-btn cal-choice" data-idx="${i}">${opt}</button>`
        ).join('')}
      </div>`;

      area.querySelectorAll('.cal-choice').forEach(btn => {
        btn.addEventListener('click', () => {
          if (answered) return;
          const idx = parseInt(btn.dataset.idx);
          const ok  = idx === q.answer;
          answered  = true;
          if (ok) correct++;

          area.querySelectorAll('.cal-choice').forEach((b, i) => {
            b.disabled = true;
            if (i === q.answer) b.classList.add('correct');
            else if (i === idx && !ok) b.classList.add('wrong');
          });
          setTimeout(advanceQ, ok ? 700 : 1000);
        });
      });
    }

    function mountReorder(q, lvl) {
      const area  = el.querySelector('#cal-interaction');
      if (!area) return;
      const words = Array.isArray(q.words) && q.words.length ? q.words : [];
      if (!words.length) { mountMultipleChoice(q); return; }

      const shuffled = Game.shuffle([...words]);
      let selected   = [];

      // Build pool
      area.innerHTML = `<p class="cal-reorder-hint">Tap words to arrange in correct order:</p>`;

      const pool = document.createElement('div');
      pool.className = 'cal-reorder-pool';
      shuffled.forEach(w => {
        const chip = document.createElement('span');
        chip.className = 'word-chip cal-chip';
        chip.dataset.word = w;
        chip.innerHTML = Furigana.annotate(w, lvl);
        pool.appendChild(chip);
      });
      area.appendChild(pool);

      const ansArea = document.createElement('div');
      ansArea.className = 'cal-reorder-answer';
      ansArea.innerHTML = '<em>Your answer appears here…</em>';
      area.appendChild(ansArea);

      const submit = document.createElement('button');
      submit.className = 'btn-primary cal-reorder-submit';
      submit.textContent = 'Submit';
      submit.disabled = true;
      area.appendChild(submit);

      function refresh() {
        submit.disabled = selected.length !== words.length;
      }

      pool.querySelectorAll('.cal-chip').forEach(chip => {
        chip.addEventListener('click', () => {
          if (answered || chip.classList.contains('chip-used')) return;
          chip.classList.add('chip-used');
          const word = chip.dataset.word;
          selected.push(word);

          const em = ansArea.querySelector('em');
          if (em) em.remove();

          const placed = document.createElement('span');
          placed.className = 'word-chip cal-chip-placed';
          placed.textContent = chip.dataset.word;
          placed.addEventListener('click', () => {
            if (answered) return;
            const pos = selected.lastIndexOf(word);
            if (pos !== -1) selected.splice(pos, 1);
            chip.classList.remove('chip-used');
            placed.remove();
            if (!ansArea.children.length) ansArea.innerHTML = '<em>Your answer appears here…</em>';
            refresh();
          });
          ansArea.appendChild(placed);
          refresh();
        });
      });

      submit.addEventListener('click', () => {
        if (answered) return;
        answered = true;
        const ok = selected.join('') === words.join('');
        if (ok) correct++;

        submit.disabled = true;
        pool.querySelectorAll('.cal-chip').forEach(c => { c.style.pointerEvents = 'none'; });
        ansArea.querySelectorAll('.cal-chip-placed').forEach(c => { c.style.pointerEvents = 'none'; });

        ansArea.style.borderColor = ok ? 'var(--green)' : 'var(--red)';
        ansArea.style.background  = ok ? '#0d2a1a' : '#2a0d0d';

        if (!ok) {
          const hint = document.createElement('div');
          hint.className   = 'cal-reorder-correct';
          hint.textContent = '✓ ' + words.join(' ');
          ansArea.insertAdjacentElement('afterend', hint);
        }
        setTimeout(advanceQ, ok ? 800 : 1400);
      });
    }

    function advanceQ() {
      qIdx++;
      if (qIdx >= CAL_Q_PER_LVL) {
        finishLevel();
      } else {
        showQuestion();
      }
    }

    async function finishLevel() {
      const lvl    = currentLevel();
      const passed = correct >= CAL_PASS_MIN;
      results[lvl] = { correct, total: CAL_Q_PER_LVL, passed };

      const isLast = levelIdx === CAL_LEVELS.length - 1;

      if (passed && !isLast) {
        // Show level-pass interstitial then load next
        showLevelPass(lvl, correct);
        await new Promise(r => setTimeout(r, 1400));
        levelIdx++;
        try {
          questions = await fetchLevel(currentLevel());
        } catch {
          showError(); return;
        }
        correct = 0;
        qIdx    = 0;
        showQuestion();
      } else {
        // Done — passed all or failed this level
        showResult();
      }
    }

    function showLevelPass(lvl, score) {
      el.innerHTML = `
        <div class="cal-wrap">
          <div class="cal-card">
            <div class="cal-icon">✅</div>
            <div class="cal-level-pass-msg">
              <b>${lvl.toUpperCase()}</b> — ${score}/${CAL_Q_PER_LVL} correct
            </div>
            <p style="color:var(--text-dim);font-size:.85rem;margin-top:6px">
              Advancing to ${CAL_LEVELS[levelIdx + 1].toUpperCase()}…
            </p>
          </div>
        </div>`;
    }

    // ── Result ────────────────────────────────────────────────────
    function showResult() {
      // Determine final level: highest level user passed (or n5 if none)
      let finalLevel = 'n5';
      for (const lvl of CAL_LEVELS) {
        if (results[lvl]?.passed) finalLevel = lvl;
        else break;
      }

      Progress.setCurrentLevel(finalLevel);
      Game.loadLevel(finalLevel).catch(() => {});

      const rank      = Progress.getLevelRank(finalLevel);
      const allPassed = CAL_LEVELS.every(l => results[l]?.passed);

      el.innerHTML = `
        <div class="cal-wrap">
          <div class="cal-card">
            <div class="cal-icon">${allPassed ? '👑' : '🎌'}</div>
            <h2 class="cal-title">${allPassed ? 'Perfect Score!' : 'Calibration Complete'}</h2>

            <div class="cal-result-level" style="color:${rank.color}">
              ${rank.badge} ${rank.label}
              <span class="cal-result-sublevel">${finalLevel.toUpperCase()} questions</span>
            </div>

            <div class="cal-level-results">
              ${CAL_LEVELS.map(lvl => {
                const r   = results[lvl];
                if (!r) return `<div class="cal-lvl-row cal-lvl-skipped">
                  <span class="cal-lvl-name">${lvl.toUpperCase()}</span>
                  <span class="cal-lvl-score">—</span>
                  <span class="cal-lvl-badge">skipped</span>
                </div>`;
                const cls = r.passed ? 'cal-lvl-pass' : 'cal-lvl-fail';
                return `<div class="cal-lvl-row ${cls}">
                  <span class="cal-lvl-name">${lvl.toUpperCase()}</span>
                  <span class="cal-lvl-score">${r.correct}/${r.total}</span>
                  <span class="cal-lvl-badge">${r.passed ? '✓ Pass' : '✗ Stop'}</span>
                </div>`;
              }).join('')}
            </div>

            <div class="cal-xp-notice">✅ Level set to <b>${finalLevel.toUpperCase()}</b> — starting fresh from 0 XP!</div>

            <button class="btn-primary" id="cal-done" style="width:100%;margin-top:16px">Enter the Dojo 🐢</button>
          </div>
        </div>`;

      document.getElementById('cal-done').addEventListener('click', () => Game.showScreen('menu'));
    }

    showIntro();
  },

  unmount() {}
});
