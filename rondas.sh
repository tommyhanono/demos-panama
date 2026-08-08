#!/bin/zsh
# ============================================================
#  PROSPECCIÓN POR RONDAS — Tommy Hanono
#  Uso:  ./rondas.sh 2        (envía la ronda 2)
#        ./rondas.sh 2 test   (imprime los mensajes SIN enviar)
#  Envía 1 mensaje cada 2 minutos. Máximo 8 por día.
# ============================================================
set -u
RONDA="${1:-}"
MODO="${2:-real}"
WACLI="$HOME/bin/wacli"
PLIST="$HOME/Library/LaunchAgents/com.tommyhanono.wacli-sync.plist"
LOG="$HOME/demos-panama/envios/ronda${RONDA}.log"
mkdir -p "$HOME/demos-panama/envios"

if [[ -z "$RONDA" ]]; then echo "Uso: ./rondas.sh <numero_de_ronda> [test]"; exit 1; fi

D="https://tommyhanono.github.io/demos-panama"
FIRMA=$'\n\nQuedo atento a su respuesta. Gracias por su tiempo.\n\nTommy Hanono'

# ---------- PLANTILLAS POR SECTOR ----------
vet(){ cat <<EOF
Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de agenda y recordatorios para clínicas veterinarias en Panamá.

Le escribo por algo concreto: en toda clínica hay pacientes con la vacuna vencida que no han vuelto, no por descuido del dueño, sino porque avisarle a cada uno a mano es imposible.

Lo que hago es un carnet digital de vacunas. El dueño lo abre desde un enlace y el sistema le escribe solo por WhatsApp cuando a su mascota le toca. Además separa la agenda entre consulta, grooming y cirugía.

Puede verlo funcionando aquí, es una demostración real:
$D/vetcard.html

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios y precios de $1.

Si le interesa, con gusto le preparo la demostración con el nombre de su clínica, sin costo ni compromiso.$FIRMA
EOF
}

dental(){ cat <<EOF
Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para clínicas dentales en Panamá.

Le escribo por una función concreta: el recordatorio automático de los seis meses. En cualquier clínica hay decenas de pacientes que se hicieron una limpieza y nunca volvieron, no porque no quisieran, sino porque nadie les recordó. Cada uno de esos es una cita de B/.45.00 que ya estaba ganada.

El sistema los detecta solo y les escribe por WhatsApp. Además maneja la agenda por doctor y tratamiento, el recordatorio del día previo y la historia clínica llenada antes de que el paciente llegue.

Puede verlo funcionando aquí:
$D/citaclinica.html

La implementación es de B/.800.00 y B/.70.00 mensuales, con la configuración de sus tratamientos y precios incluida.

Si le interesa, con gusto le preparo la demostración con el nombre de $1, sin costo ni compromiso.$FIRMA
EOF
}

barber(){ cat <<EOF
Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de reserva para barberías en Panamá.

Le hago una pregunta directa: ¿cuántos turnos se le caen al mes porque el cliente no llegó? A B/.18.00 cada uno, tres a la semana son más de B/.200.00 mensuales que no se recuperan, porque la silla ya estuvo vacía.

Lo que hago es una página de turnos con su marca: el cliente reserva en tres toques a cualquier hora, le llega recordatorio automático dos horas antes, y puede apartar con B/.5.00 por Yappy que se le descuentan del corte. Usted ve la producción de cada barbero.

Puede probarlo aquí, funciona de verdad:
$D/reservafacil.html

La implementación es de B/.400.00 y B/.35.00 mensuales, con sus barberos, servicios y precios cargados por mí.

Si le interesa, se lo dejo montado con el nombre de $1 para que lo pruebe, sin costo ni compromiso.$FIRMA
EOF
}

salon(){ cat <<EOF
Buenas tardes. Mi nombre es Tommy Hanono y desarrollo sistemas de citas para salones de belleza en Panamá.

Le escribo por algo que en este rubro se pierde todos los meses: la clienta de uñas o de color vuelve cada quince días, o se olvida y pasa un mes. Un recordatorio automático a los doce días con el enlace para reservar es la forma más barata que existe de subir las ventas, y no requiere que nadie esté pendiente.

El sistema también maneja la agenda por estilista, el recordatorio del día previo y la ficha de cada clienta con la fórmula de color que se le aplicó la última vez.

Puede probarlo aquí, funciona de verdad:
$D/reservafacil.html

La implementación es de B/.450.00 y B/.40.00 mensuales, con sus servicios y precios cargados por mí.

Si le interesa, se lo dejo montado con el nombre de $1 para que lo pruebe, sin costo ni compromiso.$FIRMA
EOF
}

taller(){ cat <<EOF
Buenos días. Mi nombre es Tommy Hanono y desarrollo sistemas de control de trabajos para talleres en Panamá.

Le escribo por la llamada que más se repite en un taller: "¿ya está listo mi carro?". Cada cliente llama tres o cuatro veces, y alguien tiene que dejar lo que está haciendo para contestar.

Lo que hago es una orden de trabajo digital: el cliente sigue el estado de su vehículo desde un enlace, recibido, en diagnóstico, en reparación y listo, y le llega el aviso automático cuando cambia. Además el sistema guarda el historial por placa y le recuerda al cliente el próximo servicio, que es lo que convierte un trabajo suelto en cliente que regresa.

La implementación es de B/.600.00 y B/.50.00 mensuales, e incluye que yo lo monte con los servicios de $1.

Si le interesa, con gusto le envío más información y le preparo una demostración funcional, sin costo ni compromiso.$FIRMA
EOF
}

# ---------- ENVÍO ----------
enviar(){
  local nombre="$1" numero="$2" msg="$3"
  if [[ "$MODO" == "test" ]]; then
    echo "\n=============== $nombre  ($numero) ==============="
    echo "$msg"
    return
  fi
  echo "--- [$(date +%H:%M:%S)] $nombre ($numero)" >> "$LOG"
  "$WACLI" send text --to "$numero" --message "$msg" >> "$LOG" 2>&1 \
    && echo "OK: $nombre" >> "$LOG" || echo "FALLO: $nombre" >> "$LOG"
}

lote(){   # lote <fn_plantilla> <nombre>|<numero> ...
  local fn="$1"; shift
  local primero=1
  for par in "$@"; do
    local nom="${par%%|*}" num="${par##*|}"
    [[ $primero -eq 0 && "$MODO" != "test" ]] && sleep 120
    primero=0
    enviar "$nom" "$num" "$($fn "$nom")"
  done
}

if [[ "$MODO" != "test" ]]; then
  echo "=== RONDA $RONDA — INICIO $(date) ===" > "$LOG"
  launchctl unload "$PLIST" 2>>"$LOG"; sleep 5
fi

case "$RONDA" in
  2) # VETERINARIAS
    lote vet \
      "Mercy Veterinary Hospital|50765141701" \
      "Veterinaria Lapenta|50765155908" \
      "Panamá Pets Clínica Veterinaria|50762071805" \
      "Mascota Consentida|50767442777" \
      "Fashion Pet|50762009830" \
      "Patitas Market|50761173841" \
      "la clínica del Dr. Jorge Landires|50766724092" \
      "Tomo Vet|50769806018" ;;

  3) # CLÍNICAS DENTALES
    lote dental \
      "Clínica Dental Tovar|50766717699" \
      "Dental Design|50766755062" \
      "Clínica Dental City|50766754222" \
      "Denti Club|50762715353" \
      "Esthetic Dental Clinic|50769494350" \
      "Clínica Barnes Lam|50766740005" \
      "el centro del Dr. Horacio Villarreal|50766185475" \
      "Brilliant Smile Dental Clinic|50761224472" ;;

  4) # BARBERÍAS
    lote barber \
      "Felix Barbería|50768089482" \
      "Barbería Machete|50766383234" \
      "Barbería Universidad Nacional|50762044349" \
      "BLK Barber Shop|50768823867" \
      "Aldos Barber Shop|50766542565" \
      "Gaza Barbershop|50762208312" \
      "Jay's Barber Shop|50765515326" \
      "Johny Barbería|50767399874" ;;

  5) # SALONES DE BELLEZA
    lote salon \
      "Maravilla Beauty Club|50760109024" \
      "Beauty Hair Liss|50767417496" \
      "Gaia Salón|50765503850" \
      "Glamorium|50769412588" \
      "Beauty Essence & Spa|50767757145" \
      "Akaneh Beauty Salón|50762237804" \
      "Rocío Hair Center|50767516061" \
      "Sala de Belleza Doralis|50768871016" ;;

  6) # VETERINARIAS — segunda tanda
    lote vet \
      "Dogland|50767702910" \
      "Pets Fashion|50769671859" \
      "Kaspet|50766729280" \
      "Clínica Veterinaria Andy's Pets|50762570925" \
      "Consultoría Veterinaria de Panamá|50768486747" \
      "Asistencia Médica Animal|50768745363" \
      "Veterinaria 24 de Diciembre|50766555070" \
      "Veterinaria Chilibre|50767802795" ;;

  7) # TALLERES + 2 DENTALES
    lote taller \
      "Panamá Top Car|50766756222" \
      "Industrias Tuñon de Gracia|50769971814" \
      "Autos La Guadalupe|50764049150" \
      "Taller Full Color|50763785874" \
      "Kevin Car Shop|50762756041" \
      "Cangas Trucks|50762511782"
    [[ "$MODO" != "test" ]] && sleep 120
    lote dental \
      "Clínica Dental Ibiza|50763992698" \
      "Clínica Dental Smile Factory|50761264253" ;;

  *) echo "Ronda no definida. Válidas: 2 a 7."; exit 1 ;;
esac

if [[ "$MODO" != "test" ]]; then
  launchctl load "$PLIST" 2>>"$LOG"
  echo "=== FIN $(date) ===" >> "$LOG"
  echo "Ronda $RONDA enviada. Log: $LOG"
fi
