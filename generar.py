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

# (nombre, sector, zona, corto)  — corto = como se le dice al panel
NEGOCIOS = [
    # ---------- VETERINARIAS ----------
    ("Mercy Veterinary Hospital",            "vet", "Pan Canal Plaza, Ancón",        "la clínica"),
    ("Veterinaria Lapenta",                  "vet", "Calle 23B Norte, Bethania",     "la clínica"),
    ("Panamá Pets Clínica Veterinaria",      "vet", "Calle 75 Este, Bethania",       "la clínica"),
    ("Mascota Consentida",                   "vet", "Av. Cincuentenario, San Francisco", "la clínica"),
    ("Fashion Pet",                          "vet", "Av. La Paz, Bethania",          "la clínica"),
    ("Patitas Market",                       "vet", "Calle 63 Oeste, Bethania",      "la clínica"),
    ("Clínica del Dr. Jorge Landires",       "vet", "Av. Ramón Arias, Bella Vista",  "la clínica"),
    ("Tomo Vet",                             "vet", "Corredor Sur, Tocumen",         "la clínica"),
    ("Dogland",                              "vet", "Calle Andrés Bello, Bella Vista","la clínica"),
    ("Pets Fashion",                         "vet", "Calle 75 Este, San Francisco",  "la clínica"),
    ("Kaspet",                               "vet", "Albrook Mall, Ancón",           "la clínica"),
    ("Clínica Veterinaria Andy's Pets",      "vet", "Terrazas de Albrook, Ancón",    "la clínica"),
    ("Consultoría Veterinaria de Panamá",    "vet", "Ciudad de Panamá",              "la clínica"),
    ("Asistencia Médica Animal",             "vet", "Ernesto Córdoba Campos",        "la clínica"),
    ("Veterinaria 24 de Diciembre",          "vet", "Vía Tocumen",                   "la clínica"),
    ("Veterinaria Chilibre",                 "vet", "Vía Transístmica, Chilibre",    "la clínica"),
    # ---------- CLÍNICAS DENTALES ----------
    ("Clínica Dental Tovar",                 "dental", "San Francisco",              "la clínica"),
    ("Dental Design",                        "dental", "Bella Vista",                "la clínica"),
    ("Clínica Dental City",                  "dental", "Bella Vista",                "la clínica"),
    ("Denti Club",                           "dental", "Bella Vista",                "la clínica"),
    ("Esthetic Dental Clinic",               "dental", "Bella Vista",                "la clínica"),
    ("Clínica Barnes Lam",                   "dental", "Bella Vista",                "la clínica"),
    ("Centro de Odontología Dr. Horacio Villarreal", "dental", "Bethania",           "el centro"),
    ("Brilliant Smile Dental Clinic",        "dental", "Bella Vista",                "la clínica"),
    ("Clínica Dental Ibiza",                 "dental", "Parque Lefevre",             "la clínica"),
    ("Clínica Dental Smile Factory",         "dental", "Juan Díaz",                  "la clínica"),
    ("Clínica Santísima Trinidad",           "dental", "Ancón",                      "la clínica"),
    ("Clínica Dental Santa Catarina",        "dental", "Calidonia",                  "la clínica"),
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

    for nombre, sector, zona, corto in NEGOCIOS:
        ruta_p = PLANTILLAS / f"{sector}.html"
        if not ruta_p.exists():
            print(f"  falta plantilla: {sector}.html — se salta {nombre}")
            continue
        if sector not in plantillas:
            plantillas[sector] = ruta_p.read_text(encoding="utf-8")

        s = slug(nombre)
        html = (plantillas[sector]
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
