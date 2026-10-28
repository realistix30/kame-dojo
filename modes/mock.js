// modes/mock.js — JLPT Mock Exam (v2)

// ── Exam structure config per level ──────────────────────────────────────────
const MOCK_CONFIG = {
  n5: {
    sections: [
      {
        key: 'vocab', title: '言語知識（文字・語彙）', minutes: 25,
        mondais: [
          { db: 'vocabulary', mondai: 1, label: '問題１', desc: 'の言葉の読み方として最もよいものを、一つ選んでください。' },
          { db: 'vocabulary', mondai: 2, label: '問題２', desc: 'の言葉を漢字で書くとき、最もよいものを一つ選んでください。' },
          { db: 'vocabulary', mondai: 3, label: '問題３', desc: '（　）に何を入れますか。最もよいものを一つ選んでください。' },
          { db: 'vocabulary', mondai: 4, label: '問題４', desc: 'の文と大体同じ意味の文を一つ選んでください。' },
        ]
      },
      {
        key: 'grammar', title: '言語知識（文法）・読解', minutes: 50,
        mondais: [
          { db: 'grammar', mondai: 1, label: '問題１', desc: '（　）に何を入れますか。最もよいものを一つ選んでください。' },
          { db: 'grammar', mondai: 2, label: '問題２', desc: 'ことばを正しいじゅんばんにならべてください。', isReorder: true },
          { db: 'grammar', mondai: 3, label: '問題３', desc: '次の文章を読んで問いに答えてください。', hasPassage: true },
          { db: 'reading', mondai: 1, label: '問題４', desc: '次の文章を読んで問いに答えてください。', hasPassage: true },
          { db: 'reading', mondai: 2, label: '問題５', desc: '次の文章を読んで問いに答えてください。', hasPassage: true },
        ]
      },
      {
        key: 'listening', title: '聴解', minutes: 30,
        mondais: [
          { db: 'listening', mondai: 1, label: '問題１', desc: '問題1では、まず質問を聞いてください。それから話を聞いて、正しい答えを一つ選んでください。', perScript: true },
          { db: 'listening', mondai: 2, label: '問題２', desc: '問題2では、まず質問を聞いてください。そして話を聞いて、正しい答えを一つ選んでください。', perScript: true },
          { db: 'listening', mondai: 3, label: '問題３', desc: '問題3では、短い文を聞いてください。そのへんじとして正しいものを一つ選んでください。', perScript: true },
        ]
      }
    ]
  }
};
['n4','n3','n2','n1'].forEach(l => { MOCK_CONFIG[l] = MOCK_CONFIG.n5; });

// ── Screen registration ───────────────────────────────────────────────────────
Game.registerScreen('mock', {
  async mount(el, opts = {}) {
    const level = Game.state.level;

    el.innerHTML = `<div class="center-msg"><span style="font-size:2rem">📝</span><p style="margin-top:8px">Preparing exam…</p></div>`;

    let questions, passages;
    try {
      [questions, passages] = await Promise.all([
        _mockFetch(`mock_questions?level=eq.${level}&select=*&order=section,mondai,q_number`),
        _mockFetch(`mock_passages?level=eq.${level}&select=*&order=section,mondai`)
      ]);
    } catch (err) {
      el.innerHTML = `<div class="center-msg"><p>Could not load exam data.</p><p style="font-size:.8rem;color:var(--text-dim)">${err.message}</p><button class="btn-primary" onclick="Game.showScreen('menu')">Back</button></div>`;
      return;
    }

    if (!questions.length) {
      el.innerHTML = `<div class="center-msg"><p>No mock exam available for <b>${level.toUpperCase()}</b> yet.</p><button class="btn-primary" onclick="Game.showScreen('menu')">← Back to Menu</button></div>`;
      return;
    }

    // ── Build lookup maps ─────────────────────────────────────────────────────
    const passageMap = {};
    passages.forEach(p => { passageMap[p.id] = p; });

    const qMap = {};
    questions.forEach(q => {
      const key = `${q.section}-${q.mondai}`;
      if (!qMap[key]) qMap[key] = [];
      qMap[key].push(q);
    });

    const config   = MOCK_CONFIG[level] || MOCK_CONFIG.n5;
    const sequence = _buildSequence(config, qMap, passageMap);

    // ── Exam state ────────────────────────────────────────────────────────────
    let curIdx             = 0;
    let userAnswers        = {};
    let startTime          = 0;
    let timerInterval      = null;
    let timeLeft           = 0;
    let currentSectionKey  = '';
    let currentSectionTitle = '';
    let sectionIsListening = false;
    let sectionQuestions   = [];  // { seqIdx, question } for current section
    let currentQSeqIdx     = -1;  // seqIdx of question currently on screen
    let sidebarOpen        = true;

    // ── Shell ─────────────────────────────────────────────────────────────────
    el.innerHTML = `
      <div class="mock-wrap">
        <div class="mock-header">
          <button class="btn-back" id="mock-back-btn">← Menu</button>
          <button class="mock-sb-toggle" id="mock-sb-toggle" style="display:none">☰ Nav</button>
          <span class="mock-header-title" id="mock-header-title">JLPT ${level.toUpperCase()} 模擬試験</span>
        </div>
        <div class="mock-section-bar" id="mock-section-bar"></div>
        <div class="mock-progress-bar" id="mock-progress-bar"></div>
        <div class="mock-body">
          <div class="mock-sidebar" id="mock-sidebar" style="display:none">
            <div class="mock-sb-timer" id="mock-sb-timer" style="display:none">
              <span class="mock-timer-icon">⏱</span>
              <span class="mock-timer-digits" id="mock-timer-digits">--:--</span>
            </div>
            <div class="mock-sb-title">Questions</div>
            <div class="mock-sb-legend">
              <span class="mock-sleg-done">✓ Done</span>
              <span class="mock-sleg-skip">○ Skipped</span>
              <span class="mock-sleg-open">· Open</span>
            </div>
            <div class="mock-sb-grid" id="mock-sb-grid"></div>
            <div class="mock-sb-footer">
              <button class="mock-submit-sec-btn" id="mock-submit-sec-btn">Submit Section →</button>
            </div>
          </div>
          <div class="mock-content" id="mock-content"></div>
        </div>
      </div>`;

    el._mockCleanup = () => { clearInterval(timerInterval); speechSynthesis.cancel(); };

    document.getElementById('mock-back-btn').addEventListener('click', () => {
      if (confirm('試験を終了しますか？ Exit exam? Progress will be lost.')) {
        el._mockCleanup(); Game.showScreen('menu');
      }
    });

    document.getElementById('mock-sb-toggle').addEventListener('click', () => {
      sidebarOpen = !sidebarOpen;
      document.getElementById('mock-sidebar').style.display = sidebarOpen ? '' : 'none';
    });

    document.getElementById('mock-submit-sec-btn').addEventListener('click', () => _submitSection(false));

    renderIntro();

    // ── Intro ─────────────────────────────────────────────────────────────────
    function renderIntro() {
      const totalQ   = questions.length;
      const sections = config.sections;
      document.getElementById('mock-content').innerHTML = `
        <div class="mock-intro-card">
          <div class="mock-intro-icon">📝</div>
          <h2 class="mock-intro-title">JLPT ${level.toUpperCase()} 模擬試験</h2>
          <p class="mock-intro-subtitle">Mock Examination — ${totalQ} questions</p>
          <div class="mock-intro-sections">
            ${sections.map(s => `
              <div class="mock-intro-row">
                <span class="mock-intro-section-name">${s.title}</span>
                <span class="mock-intro-section-time">⏱ ${s.minutes} min</span>
              </div>`).join('')}
          </div>
          <div class="mock-intro-notes">
            <p>☰ Use the Navigator sidebar to jump between questions within a section.</p>
            <p>⏭ Submit each section early when finished, or it auto-submits on timeout.</p>
            <p>🔊 Listening questions play audio via your device's Japanese TTS voice.</p>
          </div>
          <button class="btn-primary mock-start-btn" id="mock-start-btn">開始 — Begin Exam →</button>
          <button class="btn-secondary" onclick="Game.showScreen('menu')" style="margin-top:8px;width:100%">Cancel</button>
        </div>`;
      document.getElementById('mock-start-btn').addEventListener('click', () => {
        startTime = Date.now();
        curIdx    = 0;
        advance();
      });
    }

    // ── Section helpers ───────────────────────────────────────────────────────
    function buildSectionQuestions() {
      sectionQuestions = [];
      let inSection = false;
      for (let i = 0; i < sequence.length; i++) {
        const f = sequence[i];
        if (f.type === 'section-start') {
          if (f.key === currentSectionKey) inSection = true;
          else if (inSection) break;
        }
        if (inSection && (f.type === 'question' || f.type === 'listening-question')) {
          sectionQuestions.push({ seqIdx: i, question: f.question });
        }
      }
    }

    function showSidebar() {
      buildSectionQuestions();
      if (!sectionQuestions.length) return;
      document.getElementById('mock-sidebar').style.display = sidebarOpen ? '' : 'none';
      document.getElementById('mock-sb-toggle').style.display = '';
      _refreshSidebar();
    }

    function hideSidebar() {
      document.getElementById('mock-sidebar').style.display = 'none';
      document.getElementById('mock-sb-toggle').style.display = 'none';
    }

    function _refreshSidebar() {
      const grid = document.getElementById('mock-sb-grid');
      if (!grid) return;
      grid.innerHTML = sectionQuestions.map((sq, i) => {
        const ua       = userAnswers[sq.question.id];
        const isCur    = sq.seqIdx === currentQSeqIdx;
        const answered = ua !== undefined && ua !== -1 && !(ua && ua.type === 'reorder' && ua.correct === false);
        const skipped  = ua === -1 || (ua && ua.type === 'reorder' && ua.correct === false);
        let cls = 'mock-qn-btn';
        if (isCur)     cls += ' qn-cur';
        else if (answered) cls += ' qn-done';
        else if (skipped)  cls += ' qn-skip';
        else               cls += ' qn-open';
        const canJump = !sectionIsListening || isCur;
        return `<button class="${cls}" data-si="${sq.seqIdx}" ${canJump ? '' : 'disabled title="Listening: no navigation"'}>${i + 1}</button>`;
      }).join('');

      grid.querySelectorAll('.mock-qn-btn:not([disabled])').forEach(btn => {
        btn.addEventListener('click', () => {
          const si = parseInt(btn.dataset.si);
          curIdx   = si;
          advance();
        });
      });

      _updateSubmitBtn();
    }

    function _updateSubmitBtn() {
      const done = sectionQuestions.filter(sq => userAnswers[sq.question.id] !== undefined).length;
      const btn  = document.getElementById('mock-submit-sec-btn');
      if (btn) btn.textContent = `Submit Section (${done}/${sectionQuestions.length}) →`;
    }

    function _submitSection(auto = false) {
      const done      = sectionQuestions.filter(sq => userAnswers[sq.question.id] !== undefined).length;
      const remaining = sectionQuestions.length - done;
      if (!auto && remaining > 0) {
        if (!confirm(`Submit section? ${remaining} question(s) will be marked as skipped.`)) return;
      }
      // Mark unanswered as skipped
      sectionQuestions.forEach(sq => {
        if (userAnswers[sq.question.id] === undefined) userAnswers[sq.question.id] = -1;
      });
      clearInterval(timerInterval);
      hideSidebar();
      // Advance to section-end (then +1 to get past it)
      while (curIdx < sequence.length && sequence[curIdx].type !== 'section-end') curIdx++;
      curIdx++;
      advance();
    }

    // ── Timer ─────────────────────────────────────────────────────────────────
    function startSectionTimer(minutes) {
      clearInterval(timerInterval);
      timeLeft = minutes * 60;
      const sbTimer = document.getElementById('mock-sb-timer');
      if (sbTimer) sbTimer.style.display = '';
      _renderTimer();
      timerInterval = setInterval(() => {
        timeLeft = Math.max(0, timeLeft - 1);
        _renderTimer();
        if (timeLeft === 0) { clearInterval(timerInterval); _submitSection(true); }
      }, 1000);
    }

    function _renderTimer() {
      const digits = document.getElementById('mock-timer-digits');
      if (!digits) return;
      const m = String(Math.floor(timeLeft / 60)).padStart(2, '0');
      const s = String(timeLeft % 60).padStart(2, '0');
      digits.textContent = `${m}:${s}`;
      const sbTimer = document.getElementById('mock-sb-timer');
      if (sbTimer) sbTimer.className = 'mock-sb-timer' + (timeLeft < 60 ? ' mock-sb-timer-warn' : '');
    }

    // ── Progress ──────────────────────────────────────────────────────────────
    function _updateProgressBar() {
      const answered = Object.keys(userAnswers).length;
      const bar = document.getElementById('mock-progress-bar');
      if (bar) bar.style.width = `${Math.round(answered / questions.length * 100)}%`;
    }

    function _renderSectionBar(qNum, qTotal) {
      const bar = document.getElementById('mock-section-bar');
      if (!bar || !currentSectionTitle) return;
      const qPart = (qNum && qTotal) ? `<span class="mock-bar-q">Q${qNum} / ${qTotal}</span>` : '';
      bar.innerHTML = `<span class="mock-bar-sec">${currentSectionTitle}</span>${qPart}`;
    }

    // ── Frame renderer ────────────────────────────────────────────────────────
    function advance() {
      if (curIdx >= sequence.length) { finishExam(); return; }
      const frame = sequence[curIdx];
      _updateProgressBar();
      if (frame.type === 'section-start') {
        currentSectionKey   = frame.key;
        currentSectionTitle = frame.title;
        sectionIsListening  = frame.key === 'listening';
      }
      renderFrame(frame);
    }

    function next() { curIdx++; advance(); }

    function renderFrame(frame) {
      switch (frame.type) {
        case 'section-start':      renderSectionStart(frame); break;
        case 'mondai-start':       renderMondaiStart(frame);  break;
        case 'question':           renderQuestion(frame);     break;
        case 'listening-question': renderListeningQ(frame);   break;
        case 'section-end':        curIdx++; advance();       break;
        default:                   next();                    break;
      }
    }

    // ── Section start card ────────────────────────────────────────────────────
    function renderSectionStart(frame) {
      hideSidebar();
      _renderSectionBar();
      document.getElementById('mock-content').innerHTML = `
        <div class="mock-section-card">
          <div class="mock-section-eyebrow">Next Section</div>
          <h2 class="mock-section-title">${frame.title}</h2>
          <div class="mock-section-time">⏱ ${frame.minutes} minutes</div>
          <p class="mock-section-note" style="margin-top:12px;font-size:.84rem;color:var(--text-dim)">
            The timer starts when you click Start.
          </p>
          <button class="btn-primary" id="sec-start-btn" style="margin-top:20px;width:100%">Start Section →</button>
        </div>`;
      document.getElementById('sec-start-btn').addEventListener('click', () => {
        startSectionTimer(frame.minutes);
        curIdx++;
        advance();
      });
    }

    // ── Mondai start card ─────────────────────────────────────────────────────
    function renderMondaiStart(frame) {
      _renderSectionBar();
      document.getElementById('mock-content').innerHTML = `
        <div class="mock-mondai-card">
          <div class="mock-mondai-label">${frame.label}</div>
          <p class="mock-mondai-desc">${frame.desc}</p>
          <button class="btn-primary" id="mondai-next-btn" style="margin-top:16px;width:100%">Next →</button>
        </div>`;
      document.getElementById('mondai-next-btn').addEventListener('click', () => { curIdx++; advance(); });
    }

    // ── Furigana helper: annotate but skip 【...】 target words ───────────────
    function _annotate(text, lvl) {
      const parts = text.split(/(【[^】]*】)/g);
      return parts.map(p => p.startsWith('【') ? p : Furigana.annotate(p, lvl)).join('');
    }

    // ── Question ──────────────────────────────────────────────────────────────
    function renderQuestion(frame) {
      const q       = frame.question;
      const passage = frame.passage || null;
      const qNum    = frame.qNum;
      const qTotal  = frame.qTotal;
      const lvl     = Game.state.level;

      currentQSeqIdx = curIdx;
      _renderSectionBar(qNum, qTotal);
      showSidebar();

      const ann = txt => _annotate(txt, lvl);

      const passageHtml = passage ? `
        <div class="mock-passage-box">
          ${passage.title ? `<div class="mock-passage-title">${passage.title}</div>` : ''}
          <div class="mock-passage-text">${passage.content.replace(/\n/g, '<br>')}</div>
        </div>` : '';

      let bodyHtml;
      if (q.type === 'reorder') {
        const shuffled = Game.shuffle([...q.words]);
        bodyHtml = `
          <p class="mock-q-text">${ann(q.question)}</p>
          <div class="mock-reorder-pool" id="mock-pool">
            ${shuffled.map(w => `<span class="word-chip mock-chip" data-word="${w}">${ann(w)}</span>`).join('')}
          </div>
          <div class="mock-reorder-answer" id="mock-ans-area"><em>クリックしてここに並べてください…</em></div>
          <button class="btn-primary" id="mock-reorder-submit" style="margin-top:8px">この順番で答える</button>`;
      } else {
        bodyHtml = `
          <p class="mock-q-text">${ann(q.question)}</p>
          <div class="mock-choices" id="mock-choices">
            ${(q.options || []).map((opt, i) => `
              <button class="mock-choice-btn" data-idx="${i}">
                <span class="mock-choice-num">${['①','②','③','④'][i]}</span>
                <span>${opt}</span>
              </button>`).join('')}
          </div>`;
      }

      document.getElementById('mock-content').innerHTML = `
        <div class="mock-q-wrap">
          ${passageHtml}
          <div class="mock-q-header">
            <span class="mock-q-label">${frame.label || ''}</span>
            <span class="mock-q-counter">Q${qNum} / ${qTotal}</span>
          </div>
          ${bodyHtml}
          <button class="mock-skip-btn" id="mock-skip-btn">Skip →</button>
        </div>`;

      document.getElementById('mock-skip-btn').addEventListener('click', () => {
        userAnswers[q.id] = -1;
        _refreshSidebar();
        next();
      });

      if (q.type === 'reorder') {
        _initReorder(q);
      } else {
        document.querySelectorAll('.mock-choice-btn').forEach(btn => {
          btn.addEventListener('click', () => {
            const idx = parseInt(btn.dataset.idx);
            userAnswers[q.id] = idx;
            // No answer highlighting during the exam — results shown in review
            document.querySelectorAll('.mock-choices .mock-choice-btn').forEach(b => {
              b.disabled = true;
              if (parseInt(b.dataset.idx) === idx) b.classList.add('mock-chosen');
            });
            document.getElementById('mock-skip-btn')?.remove();
            _refreshSidebar();
            _appendNextBtn();
          });
        });
      }
    }

    function _initReorder(q) {
      let selected = [];
      const pool    = document.getElementById('mock-pool');
      const ansArea = document.getElementById('mock-ans-area');

      pool.querySelectorAll('.mock-chip').forEach(chip => {
        chip.addEventListener('click', () => {
          chip.style.visibility = 'hidden';
          selected.push(chip.dataset.word);
          const placed = document.createElement('span');
          placed.className = 'word-chip placed mock-chip-placed';
          placed.textContent = chip.dataset.word;
          placed.addEventListener('click', () => {
            selected = selected.filter(w => w !== chip.dataset.word);
            chip.style.visibility = 'visible';
            placed.remove();
            if (!ansArea.children.length) ansArea.innerHTML = '<em>クリックしてここに並べてください…</em>';
          });
          if (ansArea.querySelector('em')) ansArea.innerHTML = '';
          ansArea.appendChild(placed);
        });
      });

      document.getElementById('mock-reorder-submit').addEventListener('click', () => {
        const correct = selected.join('') === q.words.join('');
        userAnswers[q.id] = { type: 'reorder', selected: [...selected], correct };
        pool.querySelectorAll('.mock-chip').forEach(c => { c.style.pointerEvents = 'none'; });
        document.getElementById('mock-reorder-submit').disabled = true;
        document.getElementById('mock-skip-btn')?.remove();
        // No correct/wrong color feedback during exam
        ansArea.classList.add('reorder-submitted');
        _refreshSidebar();
        _appendNextBtn();
      });
    }

    function _appendNextBtn() {
      const nextBtn = document.createElement('button');
      nextBtn.className  = 'dash-next-btn';
      nextBtn.textContent = 'Next →';
      nextBtn.style.marginTop = '12px';
      nextBtn.addEventListener('click', next);
      document.querySelector('.mock-q-wrap')?.appendChild(nextBtn);
    }

    // ── Listening question ────────────────────────────────────────────────────
    function renderListeningQ(frame) {
      const q      = frame.question;
      const p      = frame.passage;
      const qNum   = frame.qNum;
      const qTotal = frame.qTotal;
      const lvl    = Game.state.level;
      const ann    = txt => _annotate(txt, lvl);
      const MAX_PLAYS = 2;
      let playsUsed = 0;
      let questionRevealed = false;

      currentQSeqIdx = curIdx;
      _renderSectionBar(qNum, qTotal);
      showSidebar();

      const preQHtml = p && p.pre_question
        ? `<div class="mock-listen-preq">${ann(p.pre_question)}</div>`
        : '';

      document.getElementById('mock-content').innerHTML = `
        <div class="mock-q-wrap">
          <div class="mock-q-header">
            <span class="mock-q-label">${frame.label || ''}</span>
            <span class="mock-q-counter">Q${qNum} / ${qTotal}</span>
          </div>
          ${preQHtml}
          <div class="mock-listen-player">
            <button class="mock-play-btn" id="mock-play-btn">
              🔊 再生する &nbsp;(${MAX_PLAYS}回まで)
            </button>
            <div class="mock-play-status" id="mock-play-status"></div>
          </div>
          <div class="mock-listen-q-area" id="mock-listen-q-area" style="display:none">
            <p class="mock-q-text">${ann(q.question)}</p>
            <div class="mock-choices" id="mock-listen-choices">
              ${(q.options || []).map((opt, i) => `
                <button class="mock-choice-btn" data-idx="${i}">
                  <span class="mock-choice-num">${['①','②','③','④'][i]}</span>
                  <span>${ann(opt)}</span>
                </button>`).join('')}
            </div>
          </div>
          <button class="mock-skip-btn" id="mock-listen-skip">Skip →</button>
        </div>`;

      document.getElementById('mock-play-btn').addEventListener('click', () => {
        if (playsUsed >= MAX_PLAYS) return;
        playsUsed++;
        const playBtn = document.getElementById('mock-play-btn');
        const status  = document.getElementById('mock-play-status');
        playBtn.disabled = true;
        playBtn.textContent = '🔊 再生中…';

        speechSynthesis.cancel();
        const script = (p && p.pre_question ? p.pre_question + ' ' : '') + (p ? p.content : '');
        const utt    = new SpeechSynthesisUtterance(script);
        utt.lang     = 'ja-JP';
        utt.rate     = 0.85;
        utt.onend    = () => {
          if (!questionRevealed) {
            questionRevealed = true;
            document.getElementById('mock-listen-q-area').style.display = '';
          }
          if (playsUsed < MAX_PLAYS) {
            playBtn.disabled    = false;
            playBtn.textContent = `🔊 もう一度 (残り${MAX_PLAYS - playsUsed}回)`;
          } else {
            playBtn.textContent = '🔊 再生済み';
          }
          status.textContent = `（${playsUsed}/${MAX_PLAYS}回再生済み）`;
        };
        speechSynthesis.speak(utt);
      });

      document.getElementById('mock-listen-skip').addEventListener('click', () => {
        userAnswers[q.id] = -1;
        speechSynthesis.cancel();
        _refreshSidebar();
        next();
      });

      // Attach directly to choice buttons — avoids { once } firing on play button click
      document.querySelectorAll('#mock-listen-choices .mock-choice-btn').forEach(choiceBtn => {
        choiceBtn.addEventListener('click', () => {
          if (userAnswers[q.id] !== undefined) return;
          const idx = parseInt(choiceBtn.dataset.idx);
          userAnswers[q.id] = idx;
          speechSynthesis.cancel();
          document.querySelectorAll('#mock-listen-choices .mock-choice-btn').forEach(b => {
            b.disabled = true;
            if (parseInt(b.dataset.idx) === idx) b.classList.add('mock-chosen');
          });
          document.getElementById('mock-listen-skip')?.remove();
          _refreshSidebar();
          _appendNextBtn();
        });
      });
    }

    // ── Finish exam ───────────────────────────────────────────────────────────
    function finishExam() {
      clearInterval(timerInterval);
      speechSynthesis.cancel();
      hideSidebar();

      const timeTaken = Math.round((Date.now() - startTime) / 1000);

      const scores       = {};
      const mondaiScores = {};
      questions.forEach(q => {
        if (!scores[q.section]) scores[q.section] = { c: 0, t: 0 };
        const mk = `${q.section}-${q.mondai}`;
        if (!mondaiScores[mk]) mondaiScores[mk] = { c: 0, t: 0, section: q.section, mondai: q.mondai };
        const ans = userAnswers[q.id];
        const ok  = q.type === 'reorder' ? (ans && ans.correct) : (ans === q.answer);
        scores[q.section].t++;
        scores[q.section].c += ok ? 1 : 0;
        mondaiScores[mk].t++;
        mondaiScores[mk].c += ok ? 1 : 0;
      });

      const nick = Progress.getNickname() || 'anonymous';
      fetch(`${SUPABASE_URL}/rest/v1/mock_exam_results`, {
        method: 'POST',
        headers: {
          apikey: SUPABASE_KEY, Authorization: `Bearer ${SUPABASE_KEY}`,
          'Content-Type': 'application/json', Prefer: 'return=minimal',
        },
        body: JSON.stringify({
          user_id: nick, level, time_seconds: timeTaken,
          answers: userAnswers, scores,
          total_score: Object.values(scores).reduce((s, v) => s + v.c, 0),
          completed_at: new Date().toISOString(),
        }),
      }).catch(() => {});

      renderResults(scores, mondaiScores, timeTaken);
    }

    // ── Results ───────────────────────────────────────────────────────────────
    function renderResults(scores, mondaiScores, timeTaken) {
      const sbTimer = document.getElementById('mock-sb-timer');
      if (sbTimer) sbTimer.style.display = 'none';
      document.getElementById('mock-sidebar').style.display  = 'none';
      document.getElementById('mock-section-bar').innerHTML  = '';
      document.getElementById('mock-progress-bar').style.width = '100%';

      const total    = Object.values(scores).reduce((s, v) => s + v.c, 0);
      const maxTotal = Object.values(scores).reduce((s, v) => s + v.t, 0);
      const pct      = maxTotal ? Math.round(total / maxTotal * 100) : 0;
      const mins = Math.floor(timeTaken / 60);
      const secs = timeTaken % 60;
      const SEC  = { vocabulary: 'Vocabulary', grammar: 'Grammar', reading: 'Reading', listening: 'Listening' };

      const sectionRows = Object.entries(scores).map(([sec, { c, t }]) => {
        if (!t) return '';
        const spct = Math.round(c / t * 100);
        const pass = spct >= 60;
        return `<div class="mock-result-row">
          <span class="mock-result-label">${SEC[sec] || sec}</span>
          <span class="mock-result-score">${c} / ${t}</span>
          <span class="mock-result-pct" style="color:${pass ? '#4adc8c' : '#ff7070'}">${spct}%</span>
          <span class="mock-result-badge ${pass ? 'mock-pass' : 'mock-fail'}">${pass ? 'PASS' : 'FAIL'}</span>
        </div>`;
      }).join('');

      // Mondai label lookup
      const cfg = MOCK_CONFIG[level] || MOCK_CONFIG.n5;
      function mondaiLabel(section, mondai) {
        for (const s of cfg.sections)
          for (const m of s.mondais)
            if (m.db === section && m.mondai === mondai) return m.label;
        return `問題${mondai}`;
      }

      const TIPS = {
        vocabulary: { tip: 'Practice kanji reading daily in Shell Dash (🐢).' },
        grammar:    { tip: 'Train particles and grammar in Dojo Battle (⚔️).' },
        reading:    { tip: 'Expand vocabulary in Manabi Garden (🌱) for better reading.' },
        listening:  { tip: 'Replay listening sections and predict answers before options appear.' },
      };
      const MODE_BTN = {
        vocabulary: `<button class="mock-imp-mode-btn" onclick="Game.showScreen('dash')">Shell Dash 🐢</button>`,
        grammar:    `<button class="mock-imp-mode-btn" onclick="Game.showScreen('dojo')">Dojo Battle ⚔️</button>`,
        reading:    `<button class="mock-imp-mode-btn" onclick="Game.showScreen('garden')">Manabi Garden 🌱</button>`,
        listening:  `<button class="mock-imp-mode-btn" onclick="Game.showScreen('mock')">Mock Exam 📝</button>`,
      };

      const weakMondais = Object.values(mondaiScores)
        .filter(m => m.t > 0 && Math.round(m.c / m.t * 100) < 70)
        .sort((a, b) => (a.c / a.t) - (b.c / b.t));

      let improvHtml = '';
      if (weakMondais.length) {
        const seenSecs = new Set();
        const rows = weakMondais.map(m => {
          const mpct  = Math.round(m.c / m.t * 100);
          const lbl   = mondaiLabel(m.section, m.mondai);
          const tip   = !seenSecs.has(m.section) && TIPS[m.section]
            ? `<span class="mock-imp-tip">→ ${TIPS[m.section].tip}</span>` : '';
          seenSecs.add(m.section);
          return `<div class="mock-imp-row">
            <span class="mock-imp-label">${SEC[m.section] || m.section} ${lbl}</span>
            <span class="mock-imp-score">${m.c}/${m.t} — ${mpct}%</span>
            ${tip}
          </div>`;
        }).join('');
        const practiceHtml = [...seenSecs].filter(s => MODE_BTN[s])
          .map(s => MODE_BTN[s]).join('');
        improvHtml = `
          <div class="mock-improvement">
            <div class="mock-imp-title">📚 Areas to Improve</div>
            ${rows}
            ${practiceHtml ? `<div class="mock-imp-practice">Practice now: ${practiceHtml}</div>` : ''}
          </div>`;
      } else {
        improvHtml = `<div class="mock-improvement mock-imp-great">✨ Strong performance across all sections!</div>`;
      }

      document.getElementById('mock-content').innerHTML = `
        <div class="mock-results-card">
          <div class="mock-results-icon">${pct >= 60 ? '🎉' : '📚'}</div>
          <h2 class="mock-results-title">試験終了</h2>
          <p class="mock-results-sub">JLPT ${Game.state.level.toUpperCase()} Mock Exam — Complete</p>
          <div class="mock-results-big">
            ${total} <span class="mock-results-divider">/</span> ${maxTotal}
            <span class="mock-results-pct">${pct}%</span>
          </div>
          <div class="mock-results-time">⏱ ${mins}m ${secs}s</div>
          <div class="mock-section-scores">${sectionRows}</div>
          ${improvHtml}
          <div class="mock-results-btns">
            <button class="btn-secondary" id="mock-review-btn">📋 Review Answers</button>
            <button class="btn-primary"   onclick="Game.showScreen('menu')">← Back to Menu</button>
          </div>
        </div>`;

      document.getElementById('mock-review-btn').addEventListener('click', renderReview);
    }

    // ── Review ────────────────────────────────────────────────────────────────
    function renderReview() {
      const lvl = Game.state.level;
      const items = questions.map(q => {
        const ua = userAnswers[q.id];
        let status, userText, correctText;
        if (ua === undefined || ua === -1) {
          status = 'skip'; userText = '（スキップ）';
          correctText = q.type === 'reorder' ? q.words.join(' ') : (q.options?.[q.answer] ?? '');
        } else if (q.type === 'reorder') {
          status      = ua.correct ? 'ok' : 'bad';
          userText    = ua.selected?.join(' ') ?? '';
          correctText = q.words?.join(' ') ?? '';
        } else {
          status      = ua === q.answer ? 'ok' : 'bad';
          userText    = q.options?.[ua] ?? '';
          correctText = q.options?.[q.answer] ?? '';
        }
        const icons = { ok: '✓', bad: '✗', skip: '○' };
        // Always show correct answer; show user's answer on bad/skip
        const answersHtml = `<div class="mock-rv-answers">
          ${status === 'bad' ? `<div class="mock-rv-user">❌ あなた: ${userText}</div>` : ''}
          ${status === 'skip' ? `<div class="mock-rv-user mock-rv-skipped">○ スキップ</div>` : ''}
          <div class="mock-rv-correct">✓ 正解: ${correctText}</div>
          ${status === 'ok' ? `<div class="mock-rv-user-ok">あなた: ${userText}</div>` : ''}
        </div>`;
        return `<div class="mock-rv-item mock-rv-${status}">
          <div class="mock-rv-top">
            <span class="mock-rv-icon">${icons[status]}</span>
            <span class="mock-rv-q">${_annotate(q.question, lvl)}</span>
          </div>
          ${answersHtml}
          ${q.explanation ? `<div class="mock-rv-exp">💡 ${q.explanation}</div>` : ''}
        </div>`;
      }).join('');

      document.getElementById('mock-content').innerHTML = `
        <div class="mock-review-wrap">
          <div class="mock-review-top">
            <h3>答え合わせ — Answer Review</h3>
            <button class="btn-secondary" onclick="Game.showScreen('menu')">← Menu</button>
          </div>
          <div class="mock-review-list">${items}</div>
        </div>`;
    }
  },

  unmount(el) {
    speechSynthesis.cancel();
    if (el && el._mockCleanup) el._mockCleanup();
  }
});

// ── Helpers ───────────────────────────────────────────────────────────────────

async function _mockFetch(endpoint) {
  const res = await fetch(`${SUPABASE_URL}/rest/v1/${endpoint}`, {
    headers: { apikey: SUPABASE_KEY, Authorization: `Bearer ${SUPABASE_KEY}` }
  });
  if (!res.ok) throw new Error(`HTTP ${res.status}`);
  return res.json();
}

function _buildSequence(config, qMap, passageMap) {
  const seq = [];
  for (const examSection of config.sections) {
    seq.push({ type: 'section-start', key: examSection.key, title: examSection.title, minutes: examSection.minutes });
    for (const m of examSection.mondais) {
      const key = `${m.db}-${m.mondai}`;
      const qs  = qMap[key];
      if (!qs || !qs.length) continue;
      seq.push({ type: 'mondai-start', label: m.label, desc: m.desc || '' });
      const sharedPassage = m.hasPassage && qs[0]?.passage_id ? passageMap[qs[0].passage_id] : null;
      qs.forEach((q, i) => {
        if (m.perScript) {
          seq.push({ type: 'listening-question', question: q, passage: q.passage_id ? passageMap[q.passage_id] : null, label: m.label, qNum: i + 1, qTotal: qs.length });
        } else {
          seq.push({ type: 'question', question: q, passage: sharedPassage, label: m.label, qNum: i + 1, qTotal: qs.length });
        }
      });
    }
    seq.push({ type: 'section-end' });
  }
  return seq;
}
