#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Genera una demo personalizada por prospecto.
Cada negocio recibe su propio archivo con su nombre, sus iniciales y su zona,
para que ninguno vea el nombre de otro y la demo se sienta suya.

Uso:  python3 generar.py
Salida: d/<slug>.html  +  d/indice.md con la lista de URLs
"""
import re, unicodedata, pathlib

BASE = pathlib.Path(__file__).parent
PLANTILLAS = BASE / "plantillas"
SALIDA = BASE / "d"
URL = "https://tommyhanono.github.io/demos-panama/d"

# (nombre, sector, zona, corto, h, c, tema)
#   h    = matiz de marca 0-360   c = croma del acento   tema = claro | oscuro
#   La paleta se eligió por el nombre y el posicionamiento de cada negocio.
#   Cuando veas su logo real, cambias h y c aquí y se regenera.
NEGOCIOS = [
    # ---------- VETERINARIAS · claro, matices cálidos y de confianza ----------
    ("Mercy Veterinary Hospital",            "vet", "Pan Canal Plaza, Ancón",        "la clínica", 195, 0.085, "claro"),
    ("Veterinaria Lapenta",                  "vet", "Calle 23B Norte, Bethania",     "la clínica", 155, 0.080, "claro"),
    ("Panamá Pets Clínica Veterinaria",      "vet", "Calle 75 Este, Bethania",       "la clínica", 235, 0.080, "claro"),
    ("Mascota Consentida",                   "vet", "Av. Cincuentenario, San Francisco", "la clínica", 350, 0.075, "claro"),
    ("Fashion Pet",                          "vet", "Av. La Paz, Bethania",          "la clínica", 320, 0.080, "claro"),
    ("Patitas Market",                       "vet", "Calle 63 Oeste, Bethania",      "la clínica",  45, 0.090, "claro"),
    ("Clínica del Dr. Jorge Landires",       "vet", "Av. Ramón Arias, Bella Vista",  "la clínica", 250, 0.070, "claro"),
    ("Tomo Vet",                             "vet", "Corredor Sur, Tocumen",         "la clínica", 210, 0.085, "claro"),
    ("Dogland",                              "vet", "Calle Andrés Bello, Bella Vista","la clínica", 140, 0.095, "claro"),
    ("Pets Fashion",                         "vet", "Calle 75 Este, San Francisco",  "la clínica", 335, 0.085, "claro"),
    ("Kaspet",                               "vet", "Albrook Mall, Ancón",           "la clínica",  65, 0.085, "claro"),
    ("Clínica Veterinaria Andy's Pets",      "vet", "Terrazas de Albrook, Ancón",    "la clínica", 175, 0.085, "claro"),
    ("Consultoría Veterinaria de Panamá",    "vet", "Ciudad de Panamá",              "la clínica", 255, 0.075, "claro"),
    ("Asistencia Médica Animal",             "vet", "Ernesto Córdoba Campos",        "la clínica", 200, 0.080, "claro"),
    ("Veterinaria 24 de Diciembre",          "vet", "Vía Tocumen",                   "la clínica",  25, 0.085, "claro"),
    ("Veterinaria Chilibre",                 "vet", "Vía Transístmica, Chilibre",    "la clínica", 130, 0.085, "claro"),

    # ---------- CLÍNICAS DENTALES · claro, azules y verdes clínicos ----------
    ("Clínica Dental Tovar",                 "dental", "San Francisco",              "la clínica", 225, 0.080, "claro"),
    ("Dental Design",                        "dental", "Bella Vista",                "la clínica", 265, 0.070, "claro"),
    ("Clínica Dental City",                  "dental", "Bella Vista",                "la clínica", 240, 0.085, "claro"),
    ("Denti Club",                           "dental", "Bella Vista",                "la clínica", 190, 0.090, "claro"),
    ("Esthetic Dental Clinic",               "dental", "Bella Vista",                "la clínica", 300, 0.065, "claro"),
    ("Clínica Barnes Lam",                   "dental", "Bella Vista",                "la clínica", 215, 0.075, "claro"),
    ("Centro de Odontología Dr. Horacio Villarreal", "dental", "Bethania",           "el centro",  250, 0.075, "claro"),
    ("Brilliant Smile Dental Clinic",        "dental", "Bella Vista",                "la clínica", 205, 0.095, "claro"),
    ("Clínica Dental Ibiza",                 "dental", "Parque Lefevre",             "la clínica", 185, 0.095, "claro"),
    ("Clínica Dental Smile Factory",         "dental", "Juan Díaz",                  "la clínica", 170, 0.085, "claro"),
    ("Clínica Santísima Trinidad",           "dental", "Ancón",                      "la clínica", 275, 0.065, "claro"),
    ("Clínica Dental Santa Catarina",        "dental", "Calidonia",                  "la clínica", 160, 0.080, "claro"),

    # ---------- BARBERÍAS · oscuro, acentos de latón, cobre y ámbar ----------
    ("Mendoza Barbershop",                    "barber", "Vía Porras · 3 sedes",          "la barbería",  40, 0.120, "oscuro"),
    ("Felix Barbería",                       "barber", "Calle 62A Oeste, San Francisco", "la barbería",  70, 0.115, "oscuro"),
    ("Barbería Machete",                     "barber", "Calle Sur, San Francisco",      "la barbería",  35, 0.130, "oscuro"),
    ("Barbería Universidad Nacional",        "barber", "Vía Argentina, Bella Vista",    "la barbería", 240, 0.105, "oscuro"),
    ("BLK Barber Shop",                      "barber", "Av. 12 de Octubre, Pueblo Nuevo","la barbería",  85, 0.100, "oscuro"),
    ("Aldos Barber Shop",                    "barber", "Calle 9, Parque Lefevre",       "la barbería",  55, 0.120, "oscuro"),
    ("Gaza Barbershop",                      "barber", "Calle 93 Oeste, Río Abajo",     "la barbería", 150, 0.100, "oscuro"),
    ("Jay's Barber Shop",                    "barber", "Av. Central, Calidonia",        "la barbería",  25, 0.125, "oscuro"),
    ("Johny Barbería",                       "barber", "Calle 13 Oeste, Santa Ana",     "la barbería", 200, 0.105, "oscuro"),
    ("Barbería Bless4ever",                  "barber", "Av. José María Torrijos, Pedregal", "la barbería", 100, 0.105, "oscuro"),
    ("Alberto's Barbería",                   "barber", "Ernesto Córdoba Campos",        "la barbería",  15, 0.115, "oscuro"),

    # ---------- SALONES · claro, matices cálidos y sofisticados ----------
    ("Maravilla Beauty Club",                "salon", "Plaza Belén, San Francisco",     "el salón",  15, 0.090, "claro"),
    ("Beauty Hair Liss",                     "salon", "Vía Porras, San Francisco",      "el salón", 340, 0.085, "claro"),
    ("Gaia Salón",                           "salon", "Calle Las Acacias, Bella Vista", "el salón", 120, 0.080, "claro"),
    ("Glamorium",                            "salon", "Av. Samuel Lewis, Bella Vista",  "el salón", 310, 0.080, "claro"),
    ("Beauty Essence & Spa",                 "salon", "P.H. El Dorado, Bethania",       "el salón", 165, 0.075, "claro"),
    ("Akaneh Beauty Salón",                  "salon", "Av. Costanera, Don Bosco",       "el salón",  30, 0.095, "claro"),
    ("Rocío Hair Center",                    "salon", "Av. 1 B Norte, Bella Vista",     "el salón", 355, 0.080, "claro"),
    ("Sala de Belleza Doralis",              "salon", "Calle 75 I Oeste, Bethania",     "el salón", 295, 0.075, "claro"),

    # ---------- TALLERES · oscuro industrial, acentos de señalización ----------
    ("Panamá Top Car",                       "taller", "Av. La Paz, Bethania",          "el taller",  60, 0.135, "oscuro"),
    ("Industrias Tuñon de Gracia",           "taller", "Calle 80, Bethania",            "el taller",  30, 0.130, "oscuro"),
    ("Autos La Guadalupe",                   "taller", "Calle 4a, Parque Lefevre",      "el taller", 230, 0.115, "oscuro"),
    ("Taller Full Color",                    "taller", "Av. Ernesto T. Lefevre",        "el taller", 145, 0.120, "oscuro"),
    ("Kevin Car Shop",                       "taller", "Calle 19, Río Abajo",           "el taller",  20, 0.135, "oscuro"),
    ("Cangas Trucks",                        "taller", "Calle 57, Bella Vista",         "el taller",  85, 0.115, "oscuro"),

    # ---------- ALCANZABLES POR CORREO (tienen sitio web) ----------
    ("Vet4Pets",                             "vet", "Ciudad de Panamá",              "la clínica", 205, 0.090, "claro"),
    ("Veterinaria Knino",                    "vet", "Ciudad de Panamá",              "la clínica", 145, 0.090, "claro"),
    ("Veterinaria Mordisco",                 "vet", "Llano Bonito, Juan Díaz",       "la clínica",  35, 0.095, "claro"),
    ("Veterinaria Del Sur",                  "vet", "Ciudad de Panamá",              "la clínica", 190, 0.085, "claro"),
    ("Pet Club Veterinaria",                 "vet", "Altos de Bethania",             "la clínica", 260, 0.080, "claro"),
    ("Unident Panamá",                       "dental", "Royal Center, local 16",     "la clínica", 220, 0.085, "claro"),
    ("Clínica Dental Leay-Palacios",         "dental", "Galerías Obarrio",           "la clínica", 245, 0.075, "claro"),
    ("Clínica Dental Obarrio",               "dental", "Plaza Mont Blanc, Obarrio",  "la clínica", 195, 0.090, "claro"),
    ("Atelier Dental",                       "dental", "Edificio Le Blue, El Carmen","la clínica", 290, 0.070, "claro"),
    ("Centro Odontológico Paitilla",         "dental", "Centro Especializado Paitilla","el centro", 230, 0.080, "claro"),
    ("Clínica Dental San Antonio",           "dental", "Ciudad de Panamá",           "la clínica", 175, 0.085, "claro"),
]


def slug(texto: str) -> str:
    t = unicodedata.normalize("NFKD", texto).encode("ascii", "ignore").decode()
    t = re.sub(r"[^a-zA-Z0-9]+", "-", t).strip("-").lower()
    return t

def iniciales(nombre: str) -> str:
    # Ignora artículos y palabras de relleno para que el monograma diga algo
    stop = {"de","del","la","el","los","las","y","clinica","clínica","dr","dra","veterinaria",
            "hospital", "centro"}
    palabras = [p for p in re.findall(r"[A-Za-zÁÉÍÓÚÑáéíóúñ']+", nombre)
                if p.lower() not in stop]
    if not palabras:
        palabras = re.findall(r"[A-Za-zÁÉÍÓÚÑáéíóúñ']+", nombre)
    if len(palabras) == 1:
        # Una sola palabra útil: dos letras de esa palabra, no una suelta
        return palabras[0][:2].capitalize()
    ini = "".join(p[0].upper() for p in palabras[:2])
    return ini or nombre[:2].upper()

def main():
    SALIDA.mkdir(exist_ok=True)
    plantillas = {}
    indice = ["# Enlaces por prospecto\n"]
    hechos = 0

    for nombre, sector, zona, corto, h, c, tema in NEGOCIOS:
        ruta_p = PLANTILLAS / f"{sector}.html"
        if not ruta_p.exists():
            print(f"  falta plantilla: {sector}.html — se salta {nombre}")
            continue
        if sector not in plantillas:
            plantillas[sector] = ruta_p.read_text(encoding="utf-8")

        s = slug(nombre)
        paleta = f'<style>:root{{--h:{h};--c:{c}}}</style>'
        html = (plantillas[sector]
                .replace("</head>", paleta + "\n</head>")
                .replace('<body data-modo="movil">', f'<body data-modo="movil" data-tema="{tema}">')
                .replace("{{NEGOCIO}}", nombre)
                .replace("{{INICIALES}}", iniciales(nombre))
                .replace("{{ZONA}}", zona)
                .replace("{{CORTO}}", corto)
                .replace("{{SLUG}}", s))
        (SALIDA / f"{s}.html").write_text(html, encoding="utf-8")
        indice.append(f"- **{nombre}** — {URL}/{s}.html")
        hechos += 1

    (SALIDA / "indice.md").write_text("\n".join(indice) + "\n", encoding="utf-8")
    print(f"{hechos} demos generadas en {SALIDA}")

if __name__ == "__main__":
    main()
