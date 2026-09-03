// Kame-kun sprite — drawn entirely on canvas, no external images

const KAME = {
  // Shell color palette
  SHELL_DARK:  '#2d6a2d',
  SHELL_MID:   '#3d8b3d',
  SHELL_LIGHT: '#5aad5a',
  SHELL_STRIPE:'#1a4a1a',
  SKIN:        '#a8d060',
  SKIN_DARK:   '#7aaa30',
  EYE_WHITE:   '#f0f0e8',
  EYE_LENS:    '#b8d8f8',
  EYE_PUPIL:   '#1a2840',
  FRAME:       '#222222',
  BAND_WHITE:  '#f5f5f0',
  BAND_RED:    '#d42020',
};

/**
 * Draw Kame-kun centered at (cx, cy) with given scale.
 * frame: 0 = idle, 1 = run-a, 2 = run-b, 3 = hurt, 4 = celebrate
 */
function drawKame(ctx, cx, cy, scale = 2, frame = 0) {
  ctx.save();
  ctx.translate(cx, cy);
  ctx.scale(scale, scale);

  const legOffset = (frame === 1) ? -2 : (frame === 2) ? 2 : 0;
  const bounce    = (frame === 1 || frame === 2) ? -1 : 0;
  const tilt      = (frame === 3) ? 0.15 : (frame === 4) ? -0.1 : 0;

  ctx.rotate(tilt);
  ctx.translate(0, bounce);

  _drawLegs(ctx, legOffset);
  _drawShell(ctx);
  _drawHead(ctx);
  _drawHachimaki(ctx);
  _drawGlasses(ctx);

  ctx.restore();
}

function _drawLegs(ctx, offset) {
  // Two front legs, two back legs
  const legs = [
    { x: -10, y: 8 + offset,  w: 6, h: 5 },   // front-left
    { x:  5,  y: 8 - offset,  w: 6, h: 5 },   // front-right
    { x: -9,  y: 12 - offset, w: 5, h: 4 },   // back-left
    { x:  5,  y: 12 + offset, w: 5, h: 4 },   // back-right
  ];
  for (const l of legs) {
    ctx.fillStyle = KAME.SKIN_DARK;
    _roundRect(ctx, l.x, l.y, l.w, l.h, 2);
    ctx.fill();
    ctx.fillStyle = KAME.SKIN;
    _roundRect(ctx, l.x + 1, l.y + 1, l.w - 2, l.h - 2, 1);
    ctx.fill();
  }
  // Tail
  ctx.fillStyle = KAME.SKIN_DARK;
  _roundRect(ctx, 8, 8, 4, 3, 1);
  ctx.fill();
}

function _drawShell(ctx) {
  // Shell body (oval)
  ctx.fillStyle = KAME.SHELL_DARK;
  _ellipse(ctx, 0, 4, 13, 10);
  ctx.fill();

  ctx.fillStyle = KAME.SHELL_MID;
  _ellipse(ctx, 0, 3, 11, 9);
  ctx.fill();

  // Shell pattern — hexagonal segments approximated with lines
  ctx.strokeStyle = KAME.SHELL_STRIPE;
  ctx.lineWidth = 0.8;

  // Center hex
  _hexPatch(ctx, 0, 2, 4);
  ctx.stroke();

  // Side patches
  _hexPatch(ctx, -6, 2, 3);
  ctx.stroke();
  _hexPatch(ctx, 6, 2, 3);
  ctx.stroke();
  _hexPatch(ctx, -3, 6, 3);
  ctx.stroke();
  _hexPatch(ctx, 3, 6, 3);
  ctx.stroke();

  // Highlight
  ctx.fillStyle = KAME.SHELL_LIGHT;
  _ellipse(ctx, -3, 0, 4, 3);
  ctx.fill();
}

function _hexPatch(ctx, x, y, r) {
  ctx.beginPath();
  for (let i = 0; i < 6; i++) {
    const a = (Math.PI / 3) * i - Math.PI / 6;
    const px = x + r * Math.cos(a);
    const py = y + r * Math.sin(a);
    i === 0 ? ctx.moveTo(px, py) : ctx.lineTo(px, py);
  }
  ctx.closePath();
}

function _drawHead(ctx) {
  // Neck
  ctx.fillStyle = KAME.SKIN_DARK;
  _roundRect(ctx, -4, -6, 8, 6, 2);
  ctx.fill();

  // Head
  ctx.fillStyle = KAME.SKIN;
  _ellipse(ctx, 0, -12, 8, 7);
  ctx.fill();

  // Cheek blush
  ctx.fillStyle = 'rgba(220,100,100,0.35)';
  _ellipse(ctx, -5, -10, 3, 2);
  ctx.fill();
  _ellipse(ctx, 5, -10, 3, 2);
  ctx.fill();
}

function _drawHachimaki(ctx) {
  // Band across forehead
  ctx.fillStyle = KAME.BAND_WHITE;
  ctx.fillRect(-8, -17, 16, 4);

  // Red circle in center
  ctx.fillStyle = KAME.BAND_RED;
  _ellipse(ctx, 0, -15, 3, 2.5);
  ctx.fill();

  // Tail of hachimaki on right
  ctx.fillStyle = KAME.BAND_WHITE;
  ctx.beginPath();
  ctx.moveTo(8, -17);
  ctx.lineTo(13, -19);
  ctx.lineTo(14, -16);
  ctx.lineTo(9, -13);
  ctx.closePath();
  ctx.fill();
}

function _drawGlasses(ctx) {
  // Two round lenses
  const lenses = [{ x: -5, y: -13 }, { x: 3, y: -13 }];

  // Lens fill
  for (const l of lenses) {
    ctx.fillStyle = KAME.EYE_WHITE;
    _ellipse(ctx, l.x, l.y, 3.5, 3);
    ctx.fill();
    ctx.fillStyle = KAME.EYE_LENS;
    _ellipse(ctx, l.x, l.y, 2.8, 2.3);
    ctx.fill();
    // Pupil
    ctx.fillStyle = KAME.EYE_PUPIL;
    _ellipse(ctx, l.x + 0.5, l.y + 0.3, 1.3, 1.4);
    ctx.fill();
    // Shine dot
    ctx.fillStyle = '#ffffff';
    _ellipse(ctx, l.x + 1.2, l.y - 0.5, 0.6, 0.6);
    ctx.fill();
  }

  // Frames
  ctx.strokeStyle = KAME.FRAME;
  ctx.lineWidth = 0.9;
  for (const l of lenses) {
    ctx.beginPath();
    _ellipsePath(ctx, l.x, l.y, 3.5, 3);
    ctx.stroke();
  }

  // Bridge
  ctx.beginPath();
  ctx.moveTo(-1.5, -13);
  ctx.lineTo(1.5, -13);
  ctx.stroke();

  // Arms
  ctx.beginPath();
  ctx.moveTo(-8.5, -13);
  ctx.lineTo(-10, -14);
  ctx.stroke();
  ctx.beginPath();
  ctx.moveTo(6.5, -13);
  ctx.lineTo(8, -14);
  ctx.stroke();
}

// ── Helpers ────────────────────────────────────────────────────────────────

function _ellipse(ctx, x, y, rx, ry) {
  ctx.beginPath();
  _ellipsePath(ctx, x, y, rx, ry);
  ctx.closePath();
}

function _ellipsePath(ctx, x, y, rx, ry) {
  ctx.ellipse(x, y, rx, ry, 0, 0, Math.PI * 2);
}

function _roundRect(ctx, x, y, w, h, r) {
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
}

// Animated Kame-kun helper that cycles run frames
class KameSprite {
  constructor() {
    this.frame = 0;
    this.tick = 0;
    this.frameRate = 8; // ticks per frame
    this.state = 'idle'; // idle | run | hurt | celebrate
    this.stateTimer = 0;
  }

  update() {
    this.tick++;
    if (this.tick >= this.frameRate) {
      this.tick = 0;
      if (this.state === 'run') {
        this.frame = this.frame === 1 ? 2 : 1;
      } else if (this.state === 'celebrate') {
        this.frame = this.frame === 4 ? 0 : 4;
      }
    }
    if (this.stateTimer > 0) {
      this.stateTimer--;
      if (this.stateTimer === 0) {
        this.setState('run');
      }
    }
  }

  setState(state, duration = 0) {
    this.state = state;
    this.stateTimer = duration;
    if (state === 'hurt') this.frame = 3;
    if (state === 'celebrate') this.frame = 4;
    if (state === 'idle') this.frame = 0;
    if (state === 'run') this.frame = 1;
  }

  draw(ctx, cx, cy, scale = 2) {
    drawKame(ctx, cx, cy, scale, this.frame);
  }
}
