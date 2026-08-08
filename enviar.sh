#!/bin/zsh
# ============================================================
#  PROSPECCIÓN — 52 mensajes, cada uno con su demo personalizada
#  Uso:  ./enviar.sh test        ver los mensajes sin enviar
#        ./enviar.sh             enviar, uno cada 5 minutos
#        INTERVALO=120 ./enviar.sh    cambiar el espaciado
# ============================================================
set -u
MODO="${1:-real}"
INTERVALO="${INTERVALO:-300}"
WACLI="$HOME/bin/wacli"
PLIST="$HOME/Library/LaunchAgents/com.tommyhanono.wacli-sync.plist"
LOG="$HOME/demos-panama/envios/envio-$(date +%Y%m%d-%H%M).log"
mkdir -p "$HOME/demos-panama/envios"
N=0

enviar(){
  local nombre="$1" numero="$2" msg="$3"
  N=$((N+1))
  if [[ "$MODO" == "test" ]]; then
    echo "\n=============== [$N] $nombre  ($numero) ==============="
    echo "$msg"
    return
  fi
  [[ $N -gt 1 ]] && sleep "$INTERVALO"
  echo "--- [$(date +%H:%M:%S)] [$N] $nombre ($numero)" >> "$LOG"
  "$WACLI" send text --to "$numero" --message "$msg" >> "$LOG" 2>&1 \
    && echo "OK: $nombre" >> "$LOG" || echo "FALLO: $nombre" >> "$LOG"
}

if [[ "$MODO" != "test" ]]; then
  echo "=== INICIO $(date) · intervalo ${INTERVALO}s ===" > "$LOG"
  launchctl unload "$PLIST" 2>>"$LOG"; sleep 5
fi


# ---------- VET ----------
enviar "Mercy Veterinary Hospital" "50765141701" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Mercy Veterinary Hospital. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/mercy-veterinary-hospital.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Veterinaria Lapenta" "50765155908" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Veterinaria Lapenta. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/veterinaria-lapenta.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Panamá Pets Clínica Veterinaria" "50762071805" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Panamá Pets Clínica Veterinaria. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/panama-pets-clinica-veterinaria.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Mascota Consentida" "50767442777" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Mascota Consentida. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/mascota-consentida.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Fashion Pet" "50762009830" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Fashion Pet. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/fashion-pet.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Patitas Market" "50761173841" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Patitas Market. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/patitas-market.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Clínica del Dr. Jorge Landires" "50766724092" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Clínica del Dr. Jorge Landires. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/clinica-del-dr-jorge-landires.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Tomo Vet" "50769806018" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Tomo Vet. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/tomo-vet.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Dogland" "50767702910" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Dogland. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/dogland.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Pets Fashion" "50769671859" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Pets Fashion. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/pets-fashion.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Kaspet" "50766729280" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Kaspet. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/kaspet.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Clínica Veterinaria Andy's Pets" "50762570925" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Clínica Veterinaria Andy's Pets. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/clinica-veterinaria-andy-s-pets.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Consultoría Veterinaria de Panamá" "50768486747" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Consultoría Veterinaria de Panamá. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/consultoria-veterinaria-de-panama.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Asistencia Médica Animal" "50768745363" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Asistencia Médica Animal. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/asistencia-medica-animal.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Veterinaria 24 de Diciembre" "50766555070" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Veterinaria 24 de Diciembre. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/veterinaria-24-de-diciembre.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Veterinaria Chilibre" "50767802795" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas con el historial de cada mascota. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando le toca. Además separa la agenda entre consulta, grooming y cirugía, y le muestra a usted qué pacientes llevan meses sin volver.

Le preparé una demostración con el nombre de Veterinaria Chilibre. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/veterinaria-chilibre.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y veterinarios de su clínica.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"

# ---------- DENTAL ----------
enviar "Clínica Dental Tovar" "50766717699" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para clínicas dentales en Panamá.

Le escribo por dos cosas concretas. La primera es el recordatorio automático de los seis meses: en cualquier clínica hay decenas de pacientes que se hicieron una limpieza y nunca volvieron, no porque no quisieran, sino porque nadie les recordó. La segunda son los presupuestos que quedan abiertos: la mayoría no se pierde porque el paciente dijo que no, sino porque nadie volvió a preguntar.

El sistema hace las dos cosas solo, y además maneja la agenda por doctor, el odontograma, la historia clínica llenada antes de que el paciente llegue y el recordatorio del día previo.

Le preparé una demostración con el nombre de Clínica Dental Tovar. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/clinica-dental-tovar.html

La implementación es de B/.800.00 y B/.70.00 mensuales, con sus tratamientos, precios y doctores configurados.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Dental Design" "50766755062" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para clínicas dentales en Panamá.

Le escribo por dos cosas concretas. La primera es el recordatorio automático de los seis meses: en cualquier clínica hay decenas de pacientes que se hicieron una limpieza y nunca volvieron, no porque no quisieran, sino porque nadie les recordó. La segunda son los presupuestos que quedan abiertos: la mayoría no se pierde porque el paciente dijo que no, sino porque nadie volvió a preguntar.

El sistema hace las dos cosas solo, y además maneja la agenda por doctor, el odontograma, la historia clínica llenada antes de que el paciente llegue y el recordatorio del día previo.

Le preparé una demostración con el nombre de Dental Design. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/dental-design.html

La implementación es de B/.800.00 y B/.70.00 mensuales, con sus tratamientos, precios y doctores configurados.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Clínica Dental City" "50766754222" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para clínicas dentales en Panamá.

Le escribo por dos cosas concretas. La primera es el recordatorio automático de los seis meses: en cualquier clínica hay decenas de pacientes que se hicieron una limpieza y nunca volvieron, no porque no quisieran, sino porque nadie les recordó. La segunda son los presupuestos que quedan abiertos: la mayoría no se pierde porque el paciente dijo que no, sino porque nadie volvió a preguntar.

El sistema hace las dos cosas solo, y además maneja la agenda por doctor, el odontograma, la historia clínica llenada antes de que el paciente llegue y el recordatorio del día previo.

Le preparé una demostración con el nombre de Clínica Dental City. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/clinica-dental-city.html

La implementación es de B/.800.00 y B/.70.00 mensuales, con sus tratamientos, precios y doctores configurados.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Denti Club" "50762715353" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para clínicas dentales en Panamá.

Le escribo por dos cosas concretas. La primera es el recordatorio automático de los seis meses: en cualquier clínica hay decenas de pacientes que se hicieron una limpieza y nunca volvieron, no porque no quisieran, sino porque nadie les recordó. La segunda son los presupuestos que quedan abiertos: la mayoría no se pierde porque el paciente dijo que no, sino porque nadie volvió a preguntar.

El sistema hace las dos cosas solo, y además maneja la agenda por doctor, el odontograma, la historia clínica llenada antes de que el paciente llegue y el recordatorio del día previo.

Le preparé una demostración con el nombre de Denti Club. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/denti-club.html

La implementación es de B/.800.00 y B/.70.00 mensuales, con sus tratamientos, precios y doctores configurados.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Esthetic Dental Clinic" "50769494350" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para clínicas dentales en Panamá.

Le escribo por dos cosas concretas. La primera es el recordatorio automático de los seis meses: en cualquier clínica hay decenas de pacientes que se hicieron una limpieza y nunca volvieron, no porque no quisieran, sino porque nadie les recordó. La segunda son los presupuestos que quedan abiertos: la mayoría no se pierde porque el paciente dijo que no, sino porque nadie volvió a preguntar.

El sistema hace las dos cosas solo, y además maneja la agenda por doctor, el odontograma, la historia clínica llenada antes de que el paciente llegue y el recordatorio del día previo.

Le preparé una demostración con el nombre de Esthetic Dental Clinic. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/esthetic-dental-clinic.html

La implementación es de B/.800.00 y B/.70.00 mensuales, con sus tratamientos, precios y doctores configurados.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Clínica Barnes Lam" "50766740005" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para clínicas dentales en Panamá.

Le escribo por dos cosas concretas. La primera es el recordatorio automático de los seis meses: en cualquier clínica hay decenas de pacientes que se hicieron una limpieza y nunca volvieron, no porque no quisieran, sino porque nadie les recordó. La segunda son los presupuestos que quedan abiertos: la mayoría no se pierde porque el paciente dijo que no, sino porque nadie volvió a preguntar.

El sistema hace las dos cosas solo, y además maneja la agenda por doctor, el odontograma, la historia clínica llenada antes de que el paciente llegue y el recordatorio del día previo.

Le preparé una demostración con el nombre de Clínica Barnes Lam. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/clinica-barnes-lam.html

La implementación es de B/.800.00 y B/.70.00 mensuales, con sus tratamientos, precios y doctores configurados.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Centro de Odontología Dr. Horacio Villarreal" "50766185475" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para clínicas dentales en Panamá.

Le escribo por dos cosas concretas. La primera es el recordatorio automático de los seis meses: en cualquier clínica hay decenas de pacientes que se hicieron una limpieza y nunca volvieron, no porque no quisieran, sino porque nadie les recordó. La segunda son los presupuestos que quedan abiertos: la mayoría no se pierde porque el paciente dijo que no, sino porque nadie volvió a preguntar.

El sistema hace las dos cosas solo, y además maneja la agenda por doctor, el odontograma, la historia clínica llenada antes de que el paciente llegue y el recordatorio del día previo.

Le preparé una demostración con el nombre de Centro de Odontología Dr. Horacio Villarreal. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/centro-de-odontologia-dr-horacio-villarreal.html

La implementación es de B/.800.00 y B/.70.00 mensuales, con sus tratamientos, precios y doctores configurados.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Brilliant Smile Dental Clinic" "50761224472" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para clínicas dentales en Panamá.

Le escribo por dos cosas concretas. La primera es el recordatorio automático de los seis meses: en cualquier clínica hay decenas de pacientes que se hicieron una limpieza y nunca volvieron, no porque no quisieran, sino porque nadie les recordó. La segunda son los presupuestos que quedan abiertos: la mayoría no se pierde porque el paciente dijo que no, sino porque nadie volvió a preguntar.

El sistema hace las dos cosas solo, y además maneja la agenda por doctor, el odontograma, la historia clínica llenada antes de que el paciente llegue y el recordatorio del día previo.

Le preparé una demostración con el nombre de Brilliant Smile Dental Clinic. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/brilliant-smile-dental-clinic.html

La implementación es de B/.800.00 y B/.70.00 mensuales, con sus tratamientos, precios y doctores configurados.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Clínica Dental Ibiza" "50763992698" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para clínicas dentales en Panamá.

Le escribo por dos cosas concretas. La primera es el recordatorio automático de los seis meses: en cualquier clínica hay decenas de pacientes que se hicieron una limpieza y nunca volvieron, no porque no quisieran, sino porque nadie les recordó. La segunda son los presupuestos que quedan abiertos: la mayoría no se pierde porque el paciente dijo que no, sino porque nadie volvió a preguntar.

El sistema hace las dos cosas solo, y además maneja la agenda por doctor, el odontograma, la historia clínica llenada antes de que el paciente llegue y el recordatorio del día previo.

Le preparé una demostración con el nombre de Clínica Dental Ibiza. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/clinica-dental-ibiza.html

La implementación es de B/.800.00 y B/.70.00 mensuales, con sus tratamientos, precios y doctores configurados.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Clínica Dental Smile Factory" "50761264253" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para clínicas dentales en Panamá.

Le escribo por dos cosas concretas. La primera es el recordatorio automático de los seis meses: en cualquier clínica hay decenas de pacientes que se hicieron una limpieza y nunca volvieron, no porque no quisieran, sino porque nadie les recordó. La segunda son los presupuestos que quedan abiertos: la mayoría no se pierde porque el paciente dijo que no, sino porque nadie volvió a preguntar.

El sistema hace las dos cosas solo, y además maneja la agenda por doctor, el odontograma, la historia clínica llenada antes de que el paciente llegue y el recordatorio del día previo.

Le preparé una demostración con el nombre de Clínica Dental Smile Factory. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/clinica-dental-smile-factory.html

La implementación es de B/.800.00 y B/.70.00 mensuales, con sus tratamientos, precios y doctores configurados.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Clínica Santísima Trinidad" "50766181809" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para clínicas dentales en Panamá.

Le escribo por dos cosas concretas. La primera es el recordatorio automático de los seis meses: en cualquier clínica hay decenas de pacientes que se hicieron una limpieza y nunca volvieron, no porque no quisieran, sino porque nadie les recordó. La segunda son los presupuestos que quedan abiertos: la mayoría no se pierde porque el paciente dijo que no, sino porque nadie volvió a preguntar.

El sistema hace las dos cosas solo, y además maneja la agenda por doctor, el odontograma, la historia clínica llenada antes de que el paciente llegue y el recordatorio del día previo.

Le preparé una demostración con el nombre de Clínica Santísima Trinidad. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/clinica-santisima-trinidad.html

La implementación es de B/.800.00 y B/.70.00 mensuales, con sus tratamientos, precios y doctores configurados.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Clínica Dental Santa Catarina" "50762064562" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para clínicas dentales en Panamá.

Le escribo por dos cosas concretas. La primera es el recordatorio automático de los seis meses: en cualquier clínica hay decenas de pacientes que se hicieron una limpieza y nunca volvieron, no porque no quisieran, sino porque nadie les recordó. La segunda son los presupuestos que quedan abiertos: la mayoría no se pierde porque el paciente dijo que no, sino porque nadie volvió a preguntar.

El sistema hace las dos cosas solo, y además maneja la agenda por doctor, el odontograma, la historia clínica llenada antes de que el paciente llegue y el recordatorio del día previo.

Le preparé una demostración con el nombre de Clínica Dental Santa Catarina. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/clinica-dental-santa-catarina.html

La implementación es de B/.800.00 y B/.70.00 mensuales, con sus tratamientos, precios y doctores configurados.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"

# ---------- BARBER ----------
enviar "Felix Barbería" "50768089482" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de reserva para barberías en Panamá.

Le hago una pregunta directa: ¿cuántos turnos se le caen al mes porque el cliente no llegó? A B/.18.00 cada uno, tres a la semana son más de B/.200.00 mensuales que no se recuperan, porque la silla ya estuvo vacía.

Lo que hago es una página de turnos con su marca: el cliente reserva en tres toques a cualquier hora, le llega recordatorio automático dos horas antes, y puede apartar con B/.5.00 por Yappy que se le descuentan del corte. Usted ve la producción de cada barbero y qué clientes dejaron de venir.

Le preparé una demostración con el nombre de Felix Barbería. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/felix-barberia.html

La implementación es de B/.400.00 y B/.35.00 mensuales, con sus barberos, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Barbería Machete" "50766383234" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de reserva para barberías en Panamá.

Le hago una pregunta directa: ¿cuántos turnos se le caen al mes porque el cliente no llegó? A B/.18.00 cada uno, tres a la semana son más de B/.200.00 mensuales que no se recuperan, porque la silla ya estuvo vacía.

Lo que hago es una página de turnos con su marca: el cliente reserva en tres toques a cualquier hora, le llega recordatorio automático dos horas antes, y puede apartar con B/.5.00 por Yappy que se le descuentan del corte. Usted ve la producción de cada barbero y qué clientes dejaron de venir.

Le preparé una demostración con el nombre de Barbería Machete. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/barberia-machete.html

La implementación es de B/.400.00 y B/.35.00 mensuales, con sus barberos, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Barbería Universidad Nacional" "50762044349" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de reserva para barberías en Panamá.

Le hago una pregunta directa: ¿cuántos turnos se le caen al mes porque el cliente no llegó? A B/.18.00 cada uno, tres a la semana son más de B/.200.00 mensuales que no se recuperan, porque la silla ya estuvo vacía.

Lo que hago es una página de turnos con su marca: el cliente reserva en tres toques a cualquier hora, le llega recordatorio automático dos horas antes, y puede apartar con B/.5.00 por Yappy que se le descuentan del corte. Usted ve la producción de cada barbero y qué clientes dejaron de venir.

Le preparé una demostración con el nombre de Barbería Universidad Nacional. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/barberia-universidad-nacional.html

La implementación es de B/.400.00 y B/.35.00 mensuales, con sus barberos, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "BLK Barber Shop" "50768823867" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de reserva para barberías en Panamá.

Le hago una pregunta directa: ¿cuántos turnos se le caen al mes porque el cliente no llegó? A B/.18.00 cada uno, tres a la semana son más de B/.200.00 mensuales que no se recuperan, porque la silla ya estuvo vacía.

Lo que hago es una página de turnos con su marca: el cliente reserva en tres toques a cualquier hora, le llega recordatorio automático dos horas antes, y puede apartar con B/.5.00 por Yappy que se le descuentan del corte. Usted ve la producción de cada barbero y qué clientes dejaron de venir.

Le preparé una demostración con el nombre de BLK Barber Shop. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/blk-barber-shop.html

La implementación es de B/.400.00 y B/.35.00 mensuales, con sus barberos, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Aldos Barber Shop" "50766542565" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de reserva para barberías en Panamá.

Le hago una pregunta directa: ¿cuántos turnos se le caen al mes porque el cliente no llegó? A B/.18.00 cada uno, tres a la semana son más de B/.200.00 mensuales que no se recuperan, porque la silla ya estuvo vacía.

Lo que hago es una página de turnos con su marca: el cliente reserva en tres toques a cualquier hora, le llega recordatorio automático dos horas antes, y puede apartar con B/.5.00 por Yappy que se le descuentan del corte. Usted ve la producción de cada barbero y qué clientes dejaron de venir.

Le preparé una demostración con el nombre de Aldos Barber Shop. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/aldos-barber-shop.html

La implementación es de B/.400.00 y B/.35.00 mensuales, con sus barberos, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Gaza Barbershop" "50762208312" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de reserva para barberías en Panamá.

Le hago una pregunta directa: ¿cuántos turnos se le caen al mes porque el cliente no llegó? A B/.18.00 cada uno, tres a la semana son más de B/.200.00 mensuales que no se recuperan, porque la silla ya estuvo vacía.

Lo que hago es una página de turnos con su marca: el cliente reserva en tres toques a cualquier hora, le llega recordatorio automático dos horas antes, y puede apartar con B/.5.00 por Yappy que se le descuentan del corte. Usted ve la producción de cada barbero y qué clientes dejaron de venir.

Le preparé una demostración con el nombre de Gaza Barbershop. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/gaza-barbershop.html

La implementación es de B/.400.00 y B/.35.00 mensuales, con sus barberos, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Jay's Barber Shop" "50765515326" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de reserva para barberías en Panamá.

Le hago una pregunta directa: ¿cuántos turnos se le caen al mes porque el cliente no llegó? A B/.18.00 cada uno, tres a la semana son más de B/.200.00 mensuales que no se recuperan, porque la silla ya estuvo vacía.

Lo que hago es una página de turnos con su marca: el cliente reserva en tres toques a cualquier hora, le llega recordatorio automático dos horas antes, y puede apartar con B/.5.00 por Yappy que se le descuentan del corte. Usted ve la producción de cada barbero y qué clientes dejaron de venir.

Le preparé una demostración con el nombre de Jay's Barber Shop. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/jay-s-barber-shop.html

La implementación es de B/.400.00 y B/.35.00 mensuales, con sus barberos, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Johny Barbería" "50767399874" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de reserva para barberías en Panamá.

Le hago una pregunta directa: ¿cuántos turnos se le caen al mes porque el cliente no llegó? A B/.18.00 cada uno, tres a la semana son más de B/.200.00 mensuales que no se recuperan, porque la silla ya estuvo vacía.

Lo que hago es una página de turnos con su marca: el cliente reserva en tres toques a cualquier hora, le llega recordatorio automático dos horas antes, y puede apartar con B/.5.00 por Yappy que se le descuentan del corte. Usted ve la producción de cada barbero y qué clientes dejaron de venir.

Le preparé una demostración con el nombre de Johny Barbería. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/johny-barberia.html

La implementación es de B/.400.00 y B/.35.00 mensuales, con sus barberos, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Barbería Bless4ever" "50766598694" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de reserva para barberías en Panamá.

Le hago una pregunta directa: ¿cuántos turnos se le caen al mes porque el cliente no llegó? A B/.18.00 cada uno, tres a la semana son más de B/.200.00 mensuales que no se recuperan, porque la silla ya estuvo vacía.

Lo que hago es una página de turnos con su marca: el cliente reserva en tres toques a cualquier hora, le llega recordatorio automático dos horas antes, y puede apartar con B/.5.00 por Yappy que se le descuentan del corte. Usted ve la producción de cada barbero y qué clientes dejaron de venir.

Le preparé una demostración con el nombre de Barbería Bless4ever. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/barberia-bless4ever.html

La implementación es de B/.400.00 y B/.35.00 mensuales, con sus barberos, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Alberto's Barbería" "50765001585" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de reserva para barberías en Panamá.

Le hago una pregunta directa: ¿cuántos turnos se le caen al mes porque el cliente no llegó? A B/.18.00 cada uno, tres a la semana son más de B/.200.00 mensuales que no se recuperan, porque la silla ya estuvo vacía.

Lo que hago es una página de turnos con su marca: el cliente reserva en tres toques a cualquier hora, le llega recordatorio automático dos horas antes, y puede apartar con B/.5.00 por Yappy que se le descuentan del corte. Usted ve la producción de cada barbero y qué clientes dejaron de venir.

Le preparé una demostración con el nombre de Alberto's Barbería. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/alberto-s-barberia.html

La implementación es de B/.400.00 y B/.35.00 mensuales, con sus barberos, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"

# ---------- SALON ----------
enviar "Maravilla Beauty Club" "50760109024" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para salones de belleza en Panamá.

Le escribo por algo que en este rubro se pierde todos los meses: la clienta de uñas o de color vuelve cada quince días, o se olvida y pasa un mes. Un recordatorio automático con el enlace para reservar es la forma más barata que existe de subir las ventas, y no requiere que nadie esté pendiente.

El sistema también guarda la ficha técnica de cada clienta, con la fórmula de color exacta que se le aplicó. Si la estilista no viene ese día, otra puede repetir el color; y si un día se va del salón, la fórmula se queda con usted.

Le preparé una demostración con el nombre de Maravilla Beauty Club. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/maravilla-beauty-club.html

La implementación es de B/.450.00 y B/.40.00 mensuales, con sus estilistas, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Beauty Hair Liss" "50767417496" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para salones de belleza en Panamá.

Le escribo por algo que en este rubro se pierde todos los meses: la clienta de uñas o de color vuelve cada quince días, o se olvida y pasa un mes. Un recordatorio automático con el enlace para reservar es la forma más barata que existe de subir las ventas, y no requiere que nadie esté pendiente.

El sistema también guarda la ficha técnica de cada clienta, con la fórmula de color exacta que se le aplicó. Si la estilista no viene ese día, otra puede repetir el color; y si un día se va del salón, la fórmula se queda con usted.

Le preparé una demostración con el nombre de Beauty Hair Liss. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/beauty-hair-liss.html

La implementación es de B/.450.00 y B/.40.00 mensuales, con sus estilistas, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Gaia Salón" "50765503850" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para salones de belleza en Panamá.

Le escribo por algo que en este rubro se pierde todos los meses: la clienta de uñas o de color vuelve cada quince días, o se olvida y pasa un mes. Un recordatorio automático con el enlace para reservar es la forma más barata que existe de subir las ventas, y no requiere que nadie esté pendiente.

El sistema también guarda la ficha técnica de cada clienta, con la fórmula de color exacta que se le aplicó. Si la estilista no viene ese día, otra puede repetir el color; y si un día se va del salón, la fórmula se queda con usted.

Le preparé una demostración con el nombre de Gaia Salón. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/gaia-salon.html

La implementación es de B/.450.00 y B/.40.00 mensuales, con sus estilistas, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Glamorium" "50769412588" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para salones de belleza en Panamá.

Le escribo por algo que en este rubro se pierde todos los meses: la clienta de uñas o de color vuelve cada quince días, o se olvida y pasa un mes. Un recordatorio automático con el enlace para reservar es la forma más barata que existe de subir las ventas, y no requiere que nadie esté pendiente.

El sistema también guarda la ficha técnica de cada clienta, con la fórmula de color exacta que se le aplicó. Si la estilista no viene ese día, otra puede repetir el color; y si un día se va del salón, la fórmula se queda con usted.

Le preparé una demostración con el nombre de Glamorium. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/glamorium.html

La implementación es de B/.450.00 y B/.40.00 mensuales, con sus estilistas, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Beauty Essence & Spa" "50767757145" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para salones de belleza en Panamá.

Le escribo por algo que en este rubro se pierde todos los meses: la clienta de uñas o de color vuelve cada quince días, o se olvida y pasa un mes. Un recordatorio automático con el enlace para reservar es la forma más barata que existe de subir las ventas, y no requiere que nadie esté pendiente.

El sistema también guarda la ficha técnica de cada clienta, con la fórmula de color exacta que se le aplicó. Si la estilista no viene ese día, otra puede repetir el color; y si un día se va del salón, la fórmula se queda con usted.

Le preparé una demostración con el nombre de Beauty Essence & Spa. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/beauty-essence-spa.html

La implementación es de B/.450.00 y B/.40.00 mensuales, con sus estilistas, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Akaneh Beauty Salón" "50762237804" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para salones de belleza en Panamá.

Le escribo por algo que en este rubro se pierde todos los meses: la clienta de uñas o de color vuelve cada quince días, o se olvida y pasa un mes. Un recordatorio automático con el enlace para reservar es la forma más barata que existe de subir las ventas, y no requiere que nadie esté pendiente.

El sistema también guarda la ficha técnica de cada clienta, con la fórmula de color exacta que se le aplicó. Si la estilista no viene ese día, otra puede repetir el color; y si un día se va del salón, la fórmula se queda con usted.

Le preparé una demostración con el nombre de Akaneh Beauty Salón. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/akaneh-beauty-salon.html

La implementación es de B/.450.00 y B/.40.00 mensuales, con sus estilistas, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Rocío Hair Center" "50767516061" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para salones de belleza en Panamá.

Le escribo por algo que en este rubro se pierde todos los meses: la clienta de uñas o de color vuelve cada quince días, o se olvida y pasa un mes. Un recordatorio automático con el enlace para reservar es la forma más barata que existe de subir las ventas, y no requiere que nadie esté pendiente.

El sistema también guarda la ficha técnica de cada clienta, con la fórmula de color exacta que se le aplicó. Si la estilista no viene ese día, otra puede repetir el color; y si un día se va del salón, la fórmula se queda con usted.

Le preparé una demostración con el nombre de Rocío Hair Center. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/rocio-hair-center.html

La implementación es de B/.450.00 y B/.40.00 mensuales, con sus estilistas, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Sala de Belleza Doralis" "50768871016" "Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para salones de belleza en Panamá.

Le escribo por algo que en este rubro se pierde todos los meses: la clienta de uñas o de color vuelve cada quince días, o se olvida y pasa un mes. Un recordatorio automático con el enlace para reservar es la forma más barata que existe de subir las ventas, y no requiere que nadie esté pendiente.

El sistema también guarda la ficha técnica de cada clienta, con la fórmula de color exacta que se le aplicó. Si la estilista no viene ese día, otra puede repetir el color; y si un día se va del salón, la fórmula se queda con usted.

Le preparé una demostración con el nombre de Sala de Belleza Doralis. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/sala-de-belleza-doralis.html

La implementación es de B/.450.00 y B/.40.00 mensuales, con sus estilistas, servicios y precios cargados por mí.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"

# ---------- TALLER ----------
enviar "Panamá Top Car" "50766756222" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de control de trabajos para talleres en Panamá.

Le escribo por la llamada que más se repite en un taller: \"¿ya está listo mi carro?\". Cada cliente llama tres o cuatro veces, y alguien tiene que soltar la herramienta para contestar.

Lo que hago es una orden de trabajo digital: el cliente sigue el estado de su vehículo desde un enlace y le llega el aviso solo en cada etapa. Aprueba la cotización desde el celular, con las fotos adentro. Y el sistema guarda el historial por placa y le avisa cuando al carro le toca el próximo mantenimiento, que es lo que convierte un trabajo suelto en un cliente que regresa.

Le preparé una demostración con el nombre de Panamá Top Car. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/panama-top-car.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y mecánicos de su taller.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Industrias Tuñon de Gracia" "50769971814" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de control de trabajos para talleres en Panamá.

Le escribo por la llamada que más se repite en un taller: \"¿ya está listo mi carro?\". Cada cliente llama tres o cuatro veces, y alguien tiene que soltar la herramienta para contestar.

Lo que hago es una orden de trabajo digital: el cliente sigue el estado de su vehículo desde un enlace y le llega el aviso solo en cada etapa. Aprueba la cotización desde el celular, con las fotos adentro. Y el sistema guarda el historial por placa y le avisa cuando al carro le toca el próximo mantenimiento, que es lo que convierte un trabajo suelto en un cliente que regresa.

Le preparé una demostración con el nombre de Industrias Tuñon de Gracia. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/industrias-tunon-de-gracia.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y mecánicos de su taller.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Autos La Guadalupe" "50764049150" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de control de trabajos para talleres en Panamá.

Le escribo por la llamada que más se repite en un taller: \"¿ya está listo mi carro?\". Cada cliente llama tres o cuatro veces, y alguien tiene que soltar la herramienta para contestar.

Lo que hago es una orden de trabajo digital: el cliente sigue el estado de su vehículo desde un enlace y le llega el aviso solo en cada etapa. Aprueba la cotización desde el celular, con las fotos adentro. Y el sistema guarda el historial por placa y le avisa cuando al carro le toca el próximo mantenimiento, que es lo que convierte un trabajo suelto en un cliente que regresa.

Le preparé una demostración con el nombre de Autos La Guadalupe. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/autos-la-guadalupe.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y mecánicos de su taller.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Taller Full Color" "50763785874" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de control de trabajos para talleres en Panamá.

Le escribo por la llamada que más se repite en un taller: \"¿ya está listo mi carro?\". Cada cliente llama tres o cuatro veces, y alguien tiene que soltar la herramienta para contestar.

Lo que hago es una orden de trabajo digital: el cliente sigue el estado de su vehículo desde un enlace y le llega el aviso solo en cada etapa. Aprueba la cotización desde el celular, con las fotos adentro. Y el sistema guarda el historial por placa y le avisa cuando al carro le toca el próximo mantenimiento, que es lo que convierte un trabajo suelto en un cliente que regresa.

Le preparé una demostración con el nombre de Taller Full Color. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/taller-full-color.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y mecánicos de su taller.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Kevin Car Shop" "50762756041" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de control de trabajos para talleres en Panamá.

Le escribo por la llamada que más se repite en un taller: \"¿ya está listo mi carro?\". Cada cliente llama tres o cuatro veces, y alguien tiene que soltar la herramienta para contestar.

Lo que hago es una orden de trabajo digital: el cliente sigue el estado de su vehículo desde un enlace y le llega el aviso solo en cada etapa. Aprueba la cotización desde el celular, con las fotos adentro. Y el sistema guarda el historial por placa y le avisa cuando al carro le toca el próximo mantenimiento, que es lo que convierte un trabajo suelto en un cliente que regresa.

Le preparé una demostración con el nombre de Kevin Car Shop. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/kevin-car-shop.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y mecánicos de su taller.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"
enviar "Cangas Trucks" "50762511782" "Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de control de trabajos para talleres en Panamá.

Le escribo por la llamada que más se repite en un taller: \"¿ya está listo mi carro?\". Cada cliente llama tres o cuatro veces, y alguien tiene que soltar la herramienta para contestar.

Lo que hago es una orden de trabajo digital: el cliente sigue el estado de su vehículo desde un enlace y le llega el aviso solo en cada etapa. Aprueba la cotización desde el celular, con las fotos adentro. Y el sistema guarda el historial por placa y le avisa cuando al carro le toca el próximo mantenimiento, que es lo que convierte un trabajo suelto en un cliente que regresa.

Le preparé una demostración con el nombre de Cangas Trucks. Puede abrirla desde el celular o desde la computadora, funciona de verdad:
https://tommyhanono.github.io/demos-panama/d/cangas-trucks.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios, precios y mecánicos de su taller.

Esta demostración está armada con datos de ejemplo y se puede ajustar por completo: los colores, los servicios, los precios y lo que haga falta. La idea es que vea lo que se puede hacer. Si hay algo que le gustaría distinto, o algo que necesita y no aparece ahí, me lo dice y lo exploramos.

Quedo atento a su respuesta. Gracias por su tiempo.

Tommy Hanono"

if [[ "$MODO" != "test" ]]; then
  launchctl load "$PLIST" 2>>"$LOG"
  echo "=== FIN $(date) ===" >> "$LOG"
  echo "Listo. $N mensajes. Log: $LOG"
fi

