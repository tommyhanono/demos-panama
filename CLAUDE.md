# Demos Panamá — CLAUDE.md

Demostraciones de venta para PYMEs de Ciudad de Panamá. **Un archivo HTML por producto, sin dependencias**: se abren en cualquier celular, funcionan sin internet una vez cargadas y no piden instalar nada. Son la herramienta de la primera reunión, no un producto.

## Qué hay

`vetcard.html` (veterinarias, grooming, hotel de mascotas) · `reservafacil.html` (barberías, salones, uñas, spas) y las demás. El README lleva la tabla de qué sector y cuántos prospectos desbloquea cada una.

## Stack

HTML + CSS + JS puro. Sin build, sin npm, sin backend. Se publica por **GitHub Pages**.

## Gotchas

- **Cero dependencias es el punto**, no una limitación: si una demo necesita un CDN, deja de funcionar sin internet en la reunión. Todo va inline.
- El ángulo de venta que sostiene estas demos: **Yappy cobra ~1% vs. 10–30% de las apps de delivery**, y la urgencia de facturación de la DGI (ene-2026). El material de respaldo está en `~/consultoria-pymes-panama`.
- Copy en español panameño, "tú", simple. Nunca voseo argentino.
- GitHub Pages: dos pushes seguidos cancelan el build y aparece como "errored 0ms". Esperar entre pushes.
