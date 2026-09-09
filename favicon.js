// favicon.js — renders the Kame-kun canvas sprite as the browser favicon
(function () {
  const K = {
    SHELL_DARK: '#2d6a2d', SHELL_MID: '#3d8b3d', SHELL_LIGHT: '#5aad5a',
    SHELL_STRIPE: '#1a4a1a', SKIN: '#a8d060', SKIN_DARK: '#7aaa30',
    EYE_WHITE: '#f0f0e8', EYE_LENS: '#b8d8f8', EYE_PUPIL: '#1a2840',
    FRAME: '#222222', BAND_WHITE: '#f5f5f0', BAND_RED: '#d42020',
  };

  function ell(ctx, x, y, rx, ry) {
    ctx.beginPath(); ctx.ellipse(x, y, rx, ry, 0, 0, Math.PI * 2); ctx.closePath();
  }
  function rr(ctx, x, y, w, h, r) {
    ctx.beginPath();
    ctx.moveTo(x+r,y); ctx.lineTo(x+w-r,y); ctx.quadraticCurveTo(x+w,y,x+w,y+r);
    ctx.lineTo(x+w,y+h-r); ctx.quadraticCurveTo(x+w,y+h,x+w-r,y+h);
    ctx.lineTo(x+r,y+h); ctx.quadraticCurveTo(x,y+h,x,y+h-r);
    ctx.lineTo(x,y+r); ctx.quadraticCurveTo(x,y,x+r,y);
    ctx.closePath();
  }
  function hex(ctx, x, y, r) {
    ctx.beginPath();
    for (let i = 0; i < 6; i++) {
      const a = (Math.PI/3)*i - Math.PI/6;
      i === 0 ? ctx.moveTo(x+r*Math.cos(a), y+r*Math.sin(a))
              : ctx.lineTo(x+r*Math.cos(a), y+r*Math.sin(a));
    }
    ctx.closePath();
  }

  function draw(ctx, cx, cy, sc) {
    ctx.save();
    ctx.translate(cx, cy);
    ctx.scale(sc, sc);
    ctx.translate(0, -1); // run-frame bounce

    // Legs (run-frame a: front legs down, back legs up)
    const legs = [
      {x:-10,y:10,w:6,h:5}, {x:5,y:6,w:6,h:5},
      {x:-9, y:8, w:5,h:4}, {x:5,y:14,w:5,h:4},
    ];
    for (const l of legs) {
      ctx.fillStyle = K.SKIN_DARK; rr(ctx,l.x,l.y,l.w,l.h,2); ctx.fill();
      ctx.fillStyle = K.SKIN;      rr(ctx,l.x+1,l.y+1,l.w-2,l.h-2,1); ctx.fill();
    }
    // Tail
    ctx.fillStyle = K.SKIN_DARK; rr(ctx,8,8,4,3,1); ctx.fill();

    // Shell
    ctx.fillStyle = K.SHELL_DARK; ell(ctx,0,4,13,10); ctx.fill();
    ctx.fillStyle = K.SHELL_MID;  ell(ctx,0,3,11,9);  ctx.fill();
    ctx.strokeStyle = K.SHELL_STRIPE; ctx.lineWidth = 0.8;
    hex(ctx,0,2,4);   ctx.stroke();
    hex(ctx,-6,2,3);  ctx.stroke();
    hex(ctx,6,2,3);   ctx.stroke();
    hex(ctx,-3,6,3);  ctx.stroke();
    hex(ctx,3,6,3);   ctx.stroke();
    ctx.fillStyle = K.SHELL_LIGHT; ell(ctx,-3,0,4,3); ctx.fill();

    // Neck
    ctx.fillStyle = K.SKIN_DARK; rr(ctx,-4,-6,8,6,2); ctx.fill();
    // Head
    ctx.fillStyle = K.SKIN; ell(ctx,0,-12,8,7); ctx.fill();
    // Blush
    ctx.fillStyle = 'rgba(220,100,100,0.35)';
    ell(ctx,-5,-10,3,2); ctx.fill();
    ell(ctx,5,-10,3,2);  ctx.fill();

    // Hachimaki
    ctx.fillStyle = K.BAND_WHITE; ctx.fillRect(-8,-17,16,4);
    ctx.fillStyle = K.BAND_RED;   ell(ctx,0,-15,3,2.5); ctx.fill();
    ctx.fillStyle = K.BAND_WHITE;
    ctx.beginPath();
    ctx.moveTo(8,-17); ctx.lineTo(13,-19); ctx.lineTo(14,-16); ctx.lineTo(9,-13);
    ctx.closePath(); ctx.fill();

    // Glasses lenses
    const ls = [{x:-5,y:-13},{x:3,y:-13}];
    for (const l of ls) {
      ctx.fillStyle = K.EYE_WHITE; ell(ctx,l.x,l.y,3.5,3); ctx.fill();
      ctx.fillStyle = K.EYE_LENS;  ell(ctx,l.x,l.y,2.8,2.3); ctx.fill();
      ctx.fillStyle = K.EYE_PUPIL; ell(ctx,l.x+0.5,l.y+0.3,1.3,1.4); ctx.fill();
      ctx.fillStyle = '#fff';      ell(ctx,l.x+1.2,l.y-0.5,0.6,0.6); ctx.fill();
    }
    ctx.strokeStyle = K.FRAME; ctx.lineWidth = 0.9;
    for (const l of ls) { ctx.beginPath(); ctx.ellipse(l.x,l.y,3.5,3,0,0,Math.PI*2); ctx.stroke(); }
    ctx.beginPath(); ctx.moveTo(-1.5,-13); ctx.lineTo(1.5,-13); ctx.stroke();
    ctx.beginPath(); ctx.moveTo(-8.5,-13); ctx.lineTo(-10,-14); ctx.stroke();
    ctx.beginPath(); ctx.moveTo(6.5,-13);  ctx.lineTo(8,-14);   ctx.stroke();

    ctx.restore();
  }

  const c = document.createElement('canvas');
  c.width = c.height = 64;
  draw(c.getContext('2d'), 32, 43, 1.8);

  const link = document.querySelector("link[rel='icon']") || document.createElement('link');
  link.rel  = 'icon';
  link.type = 'image/png';
  link.href = c.toDataURL();
  if (!link.parentNode) document.head.appendChild(link);
})();
