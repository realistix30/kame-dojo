// modes/dojo.js — Dojo Battle: turn-based grammar RPG

const SENSEI_LIST = [
  { name: 'Tanaka-sensei', color: '#3a6ea5', hp: 5,  sprite: '🧑‍🏫' },
  { name: 'Yamamoto-san', color: '#a53a6e',  hp: 7,  sprite: '🧙' },
  { name: 'Master Oni',   color: '#6e3aa5',  hp: 10, sprite: '👹' },
];

Game.registerScreen('dojo', {
  mount(el) {
    const questions = Game.sampleN(Game.state.questions.grammar, 15);
    if (!questions.length) {
      el.innerHTML = `<div class="center-msg"><p>No grammar questions for ${Game.state.level.toUpperCase()} yet!</p><button class="btn-primary" onclick="Game.showScreen('menu')">Back</button></div>`;
      return;
    }

    let score        = 0;
    let correctCount = 0;
    let attempted    = 0;
    let qIndex     = 0;
    let sensei     = 0;
    let senseiHp   = SENSEI_LIST[0].hp;
    let playerHp   = 5;
    let maxSHp     = SENSEI_LIST[0].hp;
    let maxPHp     = 5;
    let busy       = false;

    el.innerHTML = `
      <div class="dojo-wrap">
        <button class="btn-back" id="dojo-back">← Menu</button>
        <div class="battle-scene">
          <div class="combatant sensei-side">
            <div class="c-name" id="s-name">${SENSEI_LIST[0].name}</div>
            <div class="c-sprite" id="s-sprite">${SENSEI_LIST[0].sprite}</div>
            <div class="hp-bar-wrap">
              <div class="hp-bar" id="s-hp-bar" style="width:100%;background:${SENSEI_LIST[0].color}"></div>
            </div>
            <div class="hp-num" id="s-hp-num">HP ${senseiHp}/${maxSHp}</div>
          </div>
          <div class="vs-label">VS</div>
          <div class="combatant kame-side">
            <div class="c-name">Kame-kun</div>
            <canvas id="dojo-kame" width="90" height="90"></canvas>
            <div class="hp-bar-wrap">
              <div class="hp-bar" id="p-hp-bar" style="width:100%;background:#2a8a5a"></div>
            </div>
            <div class="hp-num" id="p-hp-num">HP ${playerHp}/${maxPHp}</div>
          </div>
        </div>
        <div class="battle-log" id="battle-log">⚔️ Battle start! Answer questions to attack!</div>
        <div class="question-box" id="question-box"></div>
        <div class="dojo-choices" id="dojo-choices"></div>
        <div class="score-row">Score: <b id="dojo-score">0</b></div>
      </div>`;

    document.getElementById('dojo-back').addEventListener('click', () => Game.showScreen('menu'));

    // Kame canvas
    const kc = document.getElementById('dojo-kame');
    const kctx = kc.getContext('2d');
    const sprite = new KameSprite();
    sprite.setState('idle');
    let raf;
    function kameLoop() {
      kctx.clearRect(0, 0, kc.width, kc.height);
      sprite.update();
      sprite.draw(kctx, 45, 60, 2.2);
      raf = requestAnimationFrame(kameLoop);
    }
    kameLoop();
    el._stopKame = () => cancelAnimationFrame(raf);

    function updateBars() {
      document.getElementById('s-hp-bar').style.width = Math.max(0, senseiHp / maxSHp * 100) + '%';
      document.getElementById('p-hp-bar').style.width = Math.max(0, playerHp / maxPHp * 100) + '%';
      document.getElementById('s-hp-num').textContent = `HP ${Math.max(0, senseiHp)}/${maxSHp}`;
      document.getElementById('p-hp-num').textContent = `HP ${Math.max(0, playerHp)}/${maxPHp}`;
    }

    function log(msg) {
      const el2 = document.getElementById('battle-log');
      el2.innerHTML = msg;
    }

    function renderQuestion() {
      if (qIndex >= questions.length) { endBattle('win'); return; }
      const q = questions[qIndex];
      const qbox = document.getElementById('question-box');
      qbox.innerHTML = '';

      const lvl = Game.state.level;

      if (q.type === 'reorder') {
        const shuffled = Game.shuffle([...q.words]);
        qbox.innerHTML = `<p class="q-text">Arrange in correct order:</p>
          <div class="reorder-words" id="reorder-area">
            ${shuffled.map(w => `<span class="word-chip" data-word="${w}">${Furigana.annotate(w, lvl)}</span>`).join('')}
          </div>
          <div class="reorder-answer" id="reorder-answer"><em>Click words to build your answer…</em></div>
          <button class="btn-primary" id="reorder-submit" style="margin-top:8px">Submit</button>`;

        const area   = document.getElementById('reorder-area');
        const ans    = document.getElementById('reorder-answer');
        let selected = [];

        area.querySelectorAll('.word-chip').forEach(chip => {
          chip.addEventListener('click', () => {
            if (busy) return;
            chip.classList.add('selected');
            selected.push(chip.dataset.word);
            chip.style.visibility = 'hidden';
            const p = document.createElement('span');
            p.className = 'word-chip placed';
            p.textContent = chip.dataset.word;
            p.addEventListener('click', () => {
              if (busy) return;
              selected = selected.filter(w => w !== chip.dataset.word);
              chip.style.visibility = 'visible';
              p.remove();
            });
            if (ans.querySelector('em')) ans.innerHTML = '';
            ans.appendChild(p);
          });
        });

        document.getElementById('reorder-submit').addEventListener('click', () => {
          if (busy) return;
          const correctOrder = q.words.join('');
          const userOrder    = selected.join('');
          processAnswer(userOrder === correctOrder, q);
        });
      } else {
        qbox.innerHTML = `<p class="q-text">${Furigana.annotate(q.question, lvl)}</p>`;
        const choiceDiv = document.getElementById('dojo-choices');
        choiceDiv.innerHTML = '';
        q.options.forEach((opt, i) => {
          const btn = document.createElement('button');
          btn.className = 'choice-btn';
          btn.textContent = opt;
          btn.addEventListener('click', () => {
            if (busy) return;
            processAnswer(i === q.answer, q, i);
          });
          choiceDiv.appendChild(btn);
        });
      }
    }

    function processAnswer(correct, q, chosenIdx = -1) {
      busy = true;
      attempted++;
      if (correct) correctCount++;

      // Highlight answers
      document.querySelectorAll('.choice-btn').forEach((b, i) => {
        b.disabled = true;
        if (i === q.answer) b.classList.add('correct');
        else if (i === chosenIdx) b.classList.add('wrong');
      });

      if (correct) {
        senseiHp--;
        score += 150;
        document.getElementById('dojo-score').textContent = score;
        sprite.setState('celebrate', 30);
        log(`⚔️ Hit! ${SENSEI_LIST[sensei].name} takes damage! HP: ${senseiHp}`);
        updateBars();

        if (senseiHp <= 0) {
          sensei++;
          if (sensei >= SENSEI_LIST.length) {
            setTimeout(() => endBattle('win'), 1200);
            return;
          }
          setTimeout(() => {
            maxSHp   = SENSEI_LIST[sensei].hp;
            senseiHp = maxSHp;
            document.getElementById('s-name').textContent   = SENSEI_LIST[sensei].name;
            document.getElementById('s-sprite').textContent = SENSEI_LIST[sensei].sprite;
            document.getElementById('s-hp-bar').style.background = SENSEI_LIST[sensei].color;
            updateBars();
            log(`⚡ New challenger: ${SENSEI_LIST[sensei].name}!`);
            qIndex++;
            renderQuestion();
            busy = false;
          }, 1000);
          return;
        }
      } else {
        Progress.deductXP(10);
        playerHp--;
        sprite.setState('hurt', 40);
        log(`💥 Wrong! ${SENSEI_LIST[sensei].name} attacks! ${q.explanation} <span class="xp-deduct">−10 XP</span>`);
        updateBars();
        if (playerHp <= 0) {
          setTimeout(() => endBattle('lose'), 1200);
          return;
        }
      }

      setTimeout(() => {
        qIndex++;
        document.getElementById('dojo-choices').innerHTML = '';
        renderQuestion();
        busy = false;
      }, 1200);
    }

    function endBattle(result) {
      Game.setScore('dojo', score);
      Progress.saveSession('dojo', Game.state.level, score, correctCount, attempted);
      Game.showScreen('receipt', { mode: 'dojo', level: Game.state.level, score, correct: correctCount, total: attempted, win: result === 'win' });
    }

    renderQuestion();
  },

  unmount() {
    const el = document.getElementById('app');
    if (el && el._stopKame) el._stopKame();
  }
});
