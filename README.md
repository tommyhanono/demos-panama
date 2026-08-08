# Demos de venta — por qué cada uno se ve como se ve

4 demostraciones funcionales, un archivo HTML cada una, sin dependencias. Se abren en cualquier celular, funcionan sin internet una vez cargadas y no requieren build.

| Archivo | Producto | Sectores que cubre | Prospectos que desbloquea |
|---|---|---|---|
| `vetcard.html` | VetCard | Veterinarias, grooming, hotel de mascotas | **28** |
| `reservafacil.html` | ReservaFácil | Barberías, salones, uñas, spas | **40** |
| `citaclinica.html` | CitaClínica | Dental, estética, fisioterapia, nutrición | **19** |
| `menuvivo.html` | MenuVivo | Restaurantes, cafés, panaderías | **8 ya contactados** |
| `index.html` | Portafolio | — | Tu página, para mandar una sola vez |

**Cobertura total: 95 de los 105 prospectos de la Fase 15 con una sola de estas cuatro.**

---

## Cómo se usan

1. **No mandes el enlace de entrada.** Manda un **video vertical de 35 segundos** grabando la pantalla del celular mientras haces la reserva o el pedido. El video no le exige nada al otro; el enlace sí.
2. El enlace se manda **cuando contesten**, no antes.
3. **El momento que cierra la venta** es cuando aparece el mensaje de WhatsApp simulado. En la reunión, cállate ahí y deja que lo vea.
4. Los negocios son ficticios a propósito: *Clínica Veterinaria Aurora*, *Barbería Nueve*, *Mesa Nueve*, *Clínica Dental Meridiano*. Ninguno existe, así que no estás usando el nombre de nadie ni insinuando que es tu cliente. **Nunca digas que son clientes tuyos.**
5. Para una demo a medida: cambias nombre, servicios, precios y colores. **Son 30 a 45 minutos por negocio.**

---

## Las decisiones de diseño, y por qué

Cada sector convierte por razones distintas. Estas no son preferencias mías: salen de investigación de lo que funciona en cada vertical.

### VetCard — veterinarias

| Decisión | Por qué |
|---|---|
| **Barra roja de emergencia fija arriba, siempre visible** | El dueño de una mascota en crisis no navega de la portada a "contacto". Si el teléfono de emergencia no está a la vista en todo momento, llama a otra clínica |
| **Elegir al veterinario por nombre** | Poder escoger al doctor aumenta que el cliente vuelva. La relación es con la persona, no con la clínica |
| **El carnet de vacunas como pieza central, no como extra** | El recordatorio de vacuna es el mensaje con más apertura de todo el sector veterinario. Es la función que se paga sola |
| **Semáforo de colores en las vacunas** | El dueño entiende en un segundo que su perro tiene algo vencido. Esa es la conversión |
| **Paleta verde y crema, formas redondeadas** | El sector es emocional y familiar. Nada clínico ni frío |

### ReservaFácil — barberías y salones

| Decisión | Por qué |
|---|---|
| **Oscuro con dorado** | Es la convención estética del rubro. Una barbería con página blanca y azul se ve como consultorio |
| **Tres toques hasta la hora** | 82% de las reservas de este rubro se hacen desde el celular, y cada paso extra es fuga |
| **Reseñas visibles antes de reservar** | El cliente móvil se apoya en prueba social antes de comprometerse |
| **Anticipo de $5 por Yappy, con botón alternativo sin anticipo** | El anticipo mata el no-show, pero forzarlo espanta. Se ofrecen los dos caminos |
| **"Ya te conocemos: tu última visita fue fade bajo y barba"** | Es el detalle que enamora al barbero cuando ve la demo. Le muestra que el sistema recuerda lo que él recuerda |
| **Producción por barbero en el panel** | Es lo primero que pregunta el dueño de barbería. Nada más |

### CitaClínica — dental y salud

| Decisión | Por qué |
|---|---|
| **Credenciales arriba de todo: idoneidad, años, convenios** | En salud, la señal de confianza va antes que el diseño. El paciente evalúa riesgo, no estética |
| **Azules suaves, mucho aire, esquinas redondeadas** | Es la paleta que convierte en clínicas. Calma, no urgencia |
| **Historia clínica llenada antes de llegar** | Ahorra entre 5 y 8 minutos de sillón por paciente. Se lo dices en dólares |
| **El recall de los 6 meses como pestaña propia** | Es la función que más ingreso genera y la que ninguna competencia le está vendiendo |
| **Espacio de urgencias reservado a diario en la agenda** | Lo hacen todas las clínicas y ninguna lo tiene en su sistema. Verlo reflejado genera credibilidad instantánea |

### MenuVivo — restaurantes

| Decisión | Por qué |
|---|---|
| **Fotos grandes en cada plato** | Las fotos suben la conversión y el ticket promedio. Sin fotos, es una lista de texto |
| **"Los más pedidos" arriba** | Destacar populares guía la decisión y acelera el pedido |
| **Pedido completo en menos de 2 minutos, sin pasos de más** | Cada toque extra es fuga de conversión |
| **Zona de entrega con tarifa propia** | Es lo que le demuestra al dueño que controla su reparto, no una app |
| **Calculadora de comisión en vivo** | **Es la pieza de venta más fuerte del catálogo.** El dueño mueve la barra hasta sus ventas reales y ve el número él mismo. Nunca le des tú la cifra: que la vea aparecer |
| **El pedido llegando por WhatsApp ya escrito** | Es el "ajá" del restaurantero: nadie transcribió nada |

---

## Lo que TODAS comparten

1. **Vista del cliente y vista del dueño en la misma demo.** El dueño necesita ver las dos: qué siente su cliente y qué controla él.
2. **El mensaje de WhatsApp simulado.** Aparece escribiéndose, con doble check. Es lo que hace que la demo se sienta real en vez de una maqueta.
3. **Yappy visible.** Es la marca que da confianza en Panamá y la que separa esto de cualquier plantilla extranjera.
4. **Un número en dólares en cada demo.** "Tres turnos botados son $216 al mes." Sin cifra, la demo es bonita pero no vende.
5. **Ancho máximo de 430px.** Están hechas para verse en la mano, no en pantalla grande. 73% de las transacciones en Panamá son móviles.
6. **Cero dependencias externas.** Ni fuentes de Google, ni librerías, ni imágenes remotas. Cargan al instante incluso con mala señal, que es la condición real de un dueño mirando el celular en su local.

---

## Para publicarlas

Cualquiera de estas dos sirve, y las dos son gratis:

```bash
# GitHub Pages
cd ~/demos-panama && git init && git add . && git commit -m "demos"
# crear repo y hacer push, luego activar Pages

# Vercel
cd ~/demos-panama && vercel --prod
```

Que queden en un dominio tuyo, no en un subdominio genérico. `demos.tudominio.com/vetcard` se ve serio; un enlace de plataforma gratuita, no.

---

## Lo que falta

- **TallerTrack** (talleres mecánicos, 18 prospectos): estado del vehículo en línea y recordatorio del próximo servicio.
- **CanchaLibre** (canchas por hora): calendario en vivo con anticipo.
- **MatrículaYa** (academias y preescolares): inscripción y cobro de mensualidad.

Ninguno hace falta para las rondas 2 a 5. Se construyen cuando toque ese sector.
