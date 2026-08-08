/* ============================================================
   Lógica compartida de las demos.
   Cada plantilla define window.DEMO antes de cargar este archivo.
   ============================================================ */
(function(){
  const C = window.DEMO || {};
  const E = {serv:'',precio:0,dur:0,prof:'',dia:'',hora:''};
  const DD = ['dom','lun','mar','mié','jue','vie','sáb'];
  const HORAS = C.horas || ['8:00','8:30','9:00','9:30','10:00','10:30','11:00','2:00','2:30','3:00','3:30','4:00'];
  const OCUPADAS = C.ocupadas || ['9:30','11:00','3:00'];
  const PASOS = C.pasos || 4;

  /* ---------- navegación ---------- */
  window.entrar = function(modo){
    document.body.dataset.modo = modo;
    document.getElementById('selector').classList.add('oculto');
    document.getElementById('btn-cambiar').hidden = false;
    verVista(modo === 'escritorio' ? 'panel' : 'cliente');
  };
  window.abrirSelector = function(){
    document.getElementById('selector').classList.remove('oculto');
    document.getElementById('btn-cambiar').hidden = true;
    window.scrollTo({top:0});
  };
  window.verVista = function(v){
    document.querySelectorAll('.vista').forEach(x => x.classList.remove('activa'));
    const el = document.getElementById('v-'+v);
    if (el) el.classList.add('activa');
    document.querySelectorAll('.vista-btn,.nav-lat button').forEach(b =>
      b.setAttribute('aria-selected', b.dataset.v === v));
    window.scrollTo({top:0, behavior:'smooth'});
  };
  document.addEventListener('keydown', e => {
    if (document.body.dataset.modo !== 'escritorio') return;
    if (e.target.tagName === 'INPUT' || e.target.tagName === 'SELECT') return;
    const mapa = C.atajos || {r:'cliente', e:'carnet', p:'panel', c:'cuenta', s:'tecnico'};
    const v = mapa[e.key.toLowerCase()];
    if (v) verVista(v);
  });

  /* ---------- flujo de reserva ---------- */
  window.irPaso = function(n){
    document.querySelectorAll('.paso').forEach(p => p.classList.remove('activo'));
    const el = document.getElementById('p'+n);
    if (el) el.classList.add('activo');
    for (let i=1; i<=PASOS; i++){
      const g = document.getElementById('g'+i);
      if (g) g.classList.toggle('on', i <= Math.min(n, PASOS));
    }
  };
  function marcar(btn){
    btn.parentNode.querySelectorAll('.opcion').forEach(o => o.setAttribute('aria-pressed','false'));
    btn.setAttribute('aria-pressed','true');
  }
  window.elegirServicio = function(b, nombre, precio, dur){
    marcar(b); E.serv = nombre; E.precio = precio; E.dur = dur;
    setTimeout(() => irPaso(2), 170);
  };
  window.elegirProfesional = function(b, nombre){
    marcar(b); E.prof = nombre;
    setTimeout(() => { pintarDias(); irPaso(3); }, 170);
  };

  function pintarDias(){
    const c = document.getElementById('dias'); if (!c) return;
    c.innerHTML = '';
    const base = new Date(2026, 7, 7);
    for (let i=0; i<8; i++){
      const f = new Date(base); f.setDate(base.getDate()+i);
      const b = document.createElement('button');
      b.className = 'dia'; b.type = 'button'; b.setAttribute('aria-pressed','false');
      b.innerHTML = '<small>'+(i===0?'hoy':DD[f.getDay()])+'</small><b>'+f.getDate()+'</b>';
      b.onclick = () => {
        c.querySelectorAll('.dia').forEach(d => d.setAttribute('aria-pressed','false'));
        b.setAttribute('aria-pressed','true');
        E.dia = (i===0 ? 'hoy' : DD[f.getDay()]+' '+f.getDate());
        pintarHoras();
      };
      c.appendChild(b);
    }
    c.firstChild.click();
  }
  window.pintarDias = pintarDias;

  function pintarHoras(){
    const c = document.getElementById('horas'); if (!c) return;
    c.innerHTML = '';
    HORAS.forEach(h => {
      const b = document.createElement('button');
      b.className = 'hora'; b.type = 'button'; b.textContent = h;
      if (OCUPADAS.includes(h)) { b.disabled = true; }
      else {
        b.setAttribute('aria-pressed','false');
        b.onclick = () => {
          c.querySelectorAll('.hora').forEach(x => x.setAttribute('aria-pressed','false'));
          b.setAttribute('aria-pressed','true'); E.hora = h;
          setTimeout(() => { pintarResumen(); irPaso(4); }, 170);
        };
      }
      c.appendChild(b);
    });
  }

  function pintarResumen(){
    const r = document.getElementById('resumen'); if (!r) return;
    r.innerHTML =
      '<div class="linea"><dt>'+(C.etiquetaServicio||'Servicio')+'</dt><dd>'+E.serv+'</dd></div>'+
      '<div class="linea"><dt>'+(C.etiquetaProfesional||'Atiende')+'</dt><dd>'+E.prof+'</dd></div>'+
      '<div class="linea"><dt>Cuándo</dt><dd>'+E.dia+' · '+E.hora+'</dd></div>'+
      '<div class="linea"><dt>Duración</dt><dd>'+E.dur+' min</dd></div>'+
      '<div class="linea total"><dt>Total</dt><dd>$'+E.precio.toFixed(2)+'</dd></div>';
  }

  window.confirmar = function(){
    const campos = {};
    document.querySelectorAll('#p4 input').forEach(i => campos[i.id] = i.value);
    const nombre = (campos['f-nombre'] || '').trim().split(' ')[0] || '';
    const extra = campos['f-extra'] || '';
    const t = document.getElementById('txt-listo');
    if (t) t.textContent = E.dia.charAt(0).toUpperCase()+E.dia.slice(1)+' a las '+E.hora+' · '+E.serv;
    irPaso(5);
    const datos = {nombre, extra, serv:E.serv, prof:E.prof, dia:E.dia, hora:E.hora, precio:E.precio};
    setTimeout(() => {
      const h = document.getElementById('hilo1');
      if (h && C.mensaje1) h.innerHTML = burbuja(C.mensaje1(datos), C.sello1 || 'Ahora · entregado');
    }, 900);
    setTimeout(() => {
      const h = document.getElementById('hilo2');
      if (h && C.mensaje2) h.innerHTML = burbuja(C.mensaje2(datos), C.sello2 || '6:00 p.m. · entregado');
    }, 2100);
  };
  function burbuja(texto, sello){
    return '<div class="burbuja">'+texto+'<div class="sello-hora">'+sello+'</div></div>';
  }

  window.reiniciar = function(){
    E.serv=''; E.prof=''; E.hora='';
    document.querySelectorAll('.opcion').forEach(o => o.setAttribute('aria-pressed','false'));
    ['hilo1','hilo2'].forEach(id => {
      const h = document.getElementById(id);
      if (h) h.innerHTML = '<div class="puntos"><i></i><i></i><i></i></div>';
    });
    irPaso(1);
  };

  /* ---------- calculadora ---------- */
  window.calcular = function(){
    if (!C.calc) return;
    const a = +document.getElementById('rng-a').value;
    const b = +document.getElementById('rng-b').value;
    const r = C.calc.formula(a, b);
    document.getElementById('c-a').textContent = C.calc.formatoA ? C.calc.formatoA(a) : a.toLocaleString('en-US');
    document.getElementById('c-b').textContent = C.calc.formatoB ? C.calc.formatoB(b) : b+'%';
    Object.keys(r.filas).forEach(k => {
      const el = document.getElementById('c-'+k);
      if (el) el.textContent = r.filas[k];
    });
    const v = document.getElementById('veredicto');
    if (v) v.innerHTML = r.veredicto;
  };

  if (document.getElementById('rng-a')) calcular();
})();
