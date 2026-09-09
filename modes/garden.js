// modes/garden.js — Manabi Garden: relaxed vocabulary mode

const PLANT_STAGES = ['🌱', '🌿', '🌸', '🌳'];
const PLANT_NAMES  = ['seed', 'sprout', 'flower', 'tree'];

Game.registerScreen('garden', {
  mount(el) {
    const questions = [...Game.state.questions.vocabulary];
    if (!questions.length) {
      el.innerHTML = `<div class="center-msg"><p>No vocabulary questions for ${Game.state.level.toUpperCase()} yet!</p><button class="btn-primary" onclick="Game.showScreen('menu')">Back</button></div>`;
      return;
    }

    const storageKey = `kame-garden-${Game.state.level}`;
    function loadGarden() {
      try { return JSON.parse(localStorage.getItem(storageKey) || '{}'); }
      catch { return {}; }
    }
    function saveGarden(g) {
      localStorage.setItem(storageKey, JSON.stringify(g));
    }

    let garden         = loadGarden();
    let queueIdx       = 0;
    let queue          = buildQueue();
    let score          = 0;
    let sessionCorrect = 0;
    let sessionTotal   = 0;
    let answered       = false;

    function buildQueue() {
      // Prioritize questions whose plants haven't reached max stage yet
      const incomplete = questions.filter(q => (garden[q.id] || 0) < 3);
      const complete   = questions.filter(q => (garden[q.id] || 0) >= 3);
      return Game.shuffle(incomplete).concat(Game.shuffle(complete));
    }

    el.innerHTML = `
      <div class="garden-wrap">
        <div class="garden-hud">
          <button class="btn-back" id="garden-back">← Menu</button>
          <span class="hud-label">🌸 Garden</span>
          <span class="hud-value" id="garden-score">${score}</span>
          <span class="hud-label">${Game.state.level.toUpperCase()}</span>
        </div>
        <div class="garden-plot" id="garden-plot"></div>
        <div class="garden-question-area">
          <div class="garden-card" id="garden-card">
            <div class="q-text" id="garden-q"></div>
            <div class="garden-choices" id="garden-choices"></div>
            <div class="garden-feedback" id="garden-fb"></div>
          </div>
        </div>
        <div class="garden-progress" id="garden-progress"></div>
      </div>`;

    document.getElementById('garden-back').addEventListener('click', () => {
      if (sessionTotal > 0) {
        Progress.saveSession('garden', Game.state.level, score, sessionCorrect, sessionTotal);
        Game.showScreen('receipt', { mode: 'garden', level: Game.state.level, score, correct: sessionCorrect, total: sessionTotal, win: true });
      } else {
        Game.showScreen('menu');
      }
    });

    function renderGarden() {
      const plot = document.getElementById('garden-plot');
      const progress = document.getElementById('garden-progress');
      plot.innerHTML = '';
      const total    = questions.length;
      const complete = questions.filter(q => (garden[q.id] || 0) >= 3).length;

      questions.forEach(q => {
        const stage = garden[q.id] || 0;
        const plant = document.createElement('div');
        plant.className = `plant-cell stage-${stage}`;
        plant.title    = q.options[q.answer];

        // Pixel art plant canvas
        const pc = document.createElement('canvas');
        pc.width  = 40;
        pc.height = 48;
        drawPixelPlant(pc.getContext('2d'), stage);
        plant.appendChild(pc);

        const label = document.createElement('div');
        label.className = 'plant-label';
        label.textContent = PLANT_NAMES[stage];
        plant.appendChild(label);

        plot.appendChild(plant);
      });

      progress.textContent = `${complete} / ${total} plants fully grown 🌳`;
    }

    function drawPixelPlant(ctx, stage) {
      ctx.clearRect(0, 0, 40, 48);
      const colors = {
        soil:  ['#5a3820', '#7a4830'],
        stem:  ['#3a8a2a', '#5aaa4a'],
        leaf:  ['#2a7a1a', '#4aaa3a'],
        petal: ['#e85a8a', '#ff8ab8'],
        trunk: ['#6a3a10', '#8a5a30'],
        foliage:['#1a6a1a', '#2a9a2a'],
      };

      // Pot / soil
      ctx.fillStyle = colors.soil[1];
      ctx.fillRect(10, 40, 20, 8);
      ctx.fillStyle = colors.soil[0];
      ctx.fillRect(8,  38, 24, 4);

      if (stage === 0) {
        // Seed — just a bump in the soil
        ctx.fillStyle = '#8a6a20';
        ctx.beginPath();
        ctx.ellipse(20, 38, 5, 3, 0, 0, Math.PI * 2);
        ctx.fill();
        return;
      }

      if (stage >= 1) {
        // Stem
        ctx.fillStyle = colors.stem[0];
        ctx.fillRect(18, 20, 4, 18);
        // Two small leaves
        ctx.fillStyle = colors.leaf[0];
        ctx.beginPath(); ctx.ellipse(13, 30, 6, 4, -0.4, 0, Math.PI * 2); ctx.fill();
        ctx.beginPath(); ctx.ellipse(27, 27, 6, 4,  0.4, 0, Math.PI * 2); ctx.fill();
      }

      if (stage >= 2) {
        // Flower
        const px = 20, py = 16;
        // Petals
        for (let i = 0; i < 6; i++) {
          const a = (Math.PI / 3) * i;
          ctx.fillStyle = colors.petal[i % 2];
          ctx.beginPath();
          ctx.ellipse(px + Math.cos(a) * 6, py + Math.sin(a) * 6, 4, 3, a, 0, Math.PI * 2);
          ctx.fill();
        }
        // Center
        ctx.fillStyle = '#ffe066';
        ctx.beginPath();
        ctx.arc(px, py, 4, 0, Math.PI * 2);
        ctx.fill();
      }

      if (stage >= 3) {
        // Full tree — wide foliage, thick trunk
        ctx.fillStyle = colors.trunk[0];
        ctx.fillRect(16, 22, 8, 16);
        ctx.fillStyle = colors.trunk[1];
        ctx.fillRect(17, 23, 4, 14);
        // Foliage layers
        ctx.fillStyle = colors.foliage[0];
        ctx.beginPath(); ctx.ellipse(20, 18, 14, 10, 0, 0, Math.PI * 2); ctx.fill();
        ctx.fillStyle = colors.foliage[1];
        ctx.beginPath(); ctx.ellipse(20, 14, 10, 8, 0, 0, Math.PI * 2); ctx.fill();
        ctx.fillStyle = '#6ada4a';
        ctx.beginPath(); ctx.ellipse(20, 10, 6, 5, 0, 0, Math.PI * 2); ctx.fill();
      }
    }

    function renderQuestion() {
      if (queueIdx >= queue.length) {
        queue    = buildQueue();
        queueIdx = 0;
      }

      const q = queue[queueIdx];
      const stage = garden[q.id] || 0;
      const stageEmoji = PLANT_STAGES[Math.min(stage, 3)];

      const annotated = Furigana.annotate(q.question, Game.state.level);
      document.getElementById('garden-q').innerHTML =
        `<div class="plant-stage-hint">${stageEmoji} Stage ${Math.min(stage,3)}/3 — <em>${PLANT_NAMES[Math.min(stage,3)]}</em></div>
         <div class="q-text-main">${annotated}</div>`;

      document.getElementById('garden-fb').textContent = '';
      document.getElementById('garden-fb').className   = 'garden-feedback';
      answered = false;

      const choiceDiv = document.getElementById('garden-choices');
      choiceDiv.innerHTML = '';
      q.options.forEach((opt, i) => {
        const btn = document.createElement('button');
        btn.className   = 'choice-btn garden-choice';
        btn.textContent = opt;
        btn.addEventListener('click', () => onChoice(i, q));
        choiceDiv.appendChild(btn);
      });
    }

    function onChoice(idx, q) {
      if (answered) return;
      answered = true;

      document.querySelectorAll('.garden-choice').forEach((b, i) => {
        b.disabled = true;
        if (i === q.answer) b.classList.add('correct');
        else if (i === idx && idx !== q.answer) b.classList.add('wrong');
      });

      const correct = idx === q.answer;
      const fb      = document.getElementById('garden-fb');
      sessionTotal++;
      if (correct) sessionCorrect++;

      if (correct) {
        score += 50;
        document.getElementById('garden-score').textContent = score;
        const prev  = garden[q.id] || 0;
        const next  = Math.min(prev + 1, 3);
        garden[q.id] = next;
        saveGarden(garden);

        if (next > prev) {
          fb.textContent = `✓ ${q.explanation} — Plant grew to ${PLANT_NAMES[next]}! ${PLANT_STAGES[next]}`;
          fb.className   = 'garden-feedback fb-ok';
          renderGarden();
        } else {
          fb.textContent = `✓ ${q.explanation} — Already fully grown! ${PLANT_STAGES[3]}`;
          fb.className   = 'garden-feedback fb-ok';
        }
      } else {
        Progress.deductXP(10);
        fb.innerHTML = `✗ ${q.explanation} <span class="xp-deduct">−10 XP</span>`;
        fb.className = 'garden-feedback fb-bad';
      }

      setTimeout(() => {
        queueIdx++;
        renderQuestion();
      }, 1600);
    }

    renderGarden();
    renderQuestion();
  },

  unmount() {}
});
