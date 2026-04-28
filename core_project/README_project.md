# Dein Arbeitsprojekt

Das ist dein persönliches RStudio-Projekt für das gesamte Semester. Hier entstehen deine Analysen, Hausaufgaben und später der Abschlussbericht.

**Etwas funktioniert nicht?** → [Fehlerbehebung und Wiederherstellung](../resources/troubleshooting/reset_and_recover.md)

---

## Wo bin ich?

```
Du bist hier:
                                              ┌──────────────────┐
                                              │ Dein Arbeits-    │
Kursmaterialien         Sitzungsordner        │ projekt          │
(heruntergeladen)  ──→  (Übungen in der  ──→  │ (Hausaufgaben,   │ ← DU BIST HIER
                         Sitzung)             │  Analysen,       │
                                              │  Abschlussbericht│
                                              └──────────────────┘
```

- **Sitzungsübungen** machst du in den Sitzungsordnern (`kursmaterialien/sessions/session_XX/`) — kurzlebige Scratch-Arbeit
- **Alles Dauerhafte** machst du hier — Hausaufgaben, laufende Analysen, Abschlussbericht
- Diese beiden Orte sind voneinander getrennt. Vermische sie nicht.

---

## Ordnerstruktur

```
mein_projekt/
├── intro-to-r.Rproj              ← Immer über diese Datei öffnen!
├── README_project.md             ← Übersicht und Erklärungen (hier bist du gerade)
├── core_project.Rmd              ← Interpretationen & Knit zeigt Outputs aus scripts/
├── data/                         ← Datensätze
├── scripts/                      ← R-Skripte (Hausaufgaben-Code)
│   ├── 01_homework_clean_data.R  ← Daten einlesen und bereinigen
│   ├── 02_homework_analysis.R    ← Analyse und Visualisierung
│   └── 03_homework_helpers.R     ← Hilfsfunktionen (brauchst du erst später)
├── final_report/                 ← Semesterbericht (Anleitung + Rmd)
│   ├── final_report_instructions.md
│   └── final_report.Rmd
└── output/                       ← Ergebnisse, die dein Code erzeugt
    ├── figures/                  ← Grafiken
    └── tables/                   ← Tabellen
```

---

## Die wichtigsten Regeln

### 1. Immer über die .Rproj-Datei öffnen

Doppelklicke auf `intro-to-r.Rproj` (oder wie du die Datei umbenannt hast). Nur so weiß RStudio, wo sich dein Projekt befindet, und Dateipfade mit `here()` funktionieren korrekt.

Ob du im richtigen Projekt bist, siehst du oben rechts in RStudio — dort steht der Projektname. Wenn dort `Project: (None)` steht, hast du die .Rproj-Datei nicht geöffnet.


### 2. Ein Skript = ein Zweck

| Skript | Was gehört rein? |
|--------|-----------------|
| `01_homework_clean_data.R` | Daten einlesen, filtern, bereinigen, umstrukturieren |
| `02_homework_analysis.R` | Zusammenfassungen, Grafiken, statistische Auswertungen |
| `03_homework_helpers.R` | Wiederverwendbare Funktionen (erst ab Semestermitte relevant) |

Schreibe nicht alles in ein einziges Skript. Die Trennung hilft dir, den Überblick zu behalten, und macht Fehler leichter auffindbar.

**Interpretationen und Fließtext** zur Hausaufgabe schreibst du in **`core_project.Rmd`** (nicht als lange Kommentarblöcke in den Skripten).


### 3. Dateipfade immer mit here()

Wenn du eine Datei einliest oder speicherst, verwende immer `here()`:

```r
# So:
daten <- read_csv(here("data", "owid_data.csv"))

# Nicht so:
daten <- read_csv("C:/Users/maria/Documents/Seminar_R/mein_projekt/data/owid_data.csv")
```

`here()` sorgt dafür, dass der Pfad relativ zum Projekt-Hauptordner aufgelöst wird — unabhängig von deinem Betriebssystem oder dem Ort auf deiner Festplatte. Das macht die Sache nicht nur für dich übersichtlicher, sondern vereinfacht es auch, Projekte mit anderen zu teilen (z.B. wenn du deinen Abschlussbericht einreichst).


### 4. Skripte von oben nach unten ausführbar halten

Dein Skript sollte jederzeit komplett von oben nach unten durchlaufen können. Teste das regelmäßig: R neu starten (Ctrl+Shift+F10 / Cmd+Shift+F10), dann das Skript ausführen (Ctrl+Shift+Enter / Cmd+Shift+Enter). Wenn dabei ein Fehler auftritt, fehlt etwas im Skript.

---

## Typischer Arbeitsablauf

Im Laufe des Semesters baust du dieses Projekt schrittweise auf. Der typische Ablauf in einer Sitzung:

1. **Besprechung der letzten Hausaufgabe**
2. **Sitzungsübungen** in `kursmaterialien/sessions/session_XX/` — neue Konzepte mit Spielzeugdaten lernen
3. **Besprechung der Sitzungsübungen**
4. **Zum Arbeitsprojekt wechseln** — das Gelernte auf den echten OWID-Datensatz anwenden
5. **Hausaufgaben fertigstellen** — Code in `scripts/`, Texte in `core_project.Rmd`, dann `core_project.Rmd` knitten

---

## Wenn etwas schiefgeht

**Skript funktioniert nicht mehr?**
1. R neu starten: Ctrl+Shift+F10 (Windows) / Cmd+Shift+F10 (macOS)
2. Skript von oben nach unten erneut ausführen
3. Fehlermeldung lesen — sie sagt dir meistens, in welcher Zeile das Problem liegt

**Alles kaputt?**
Im Ordner `kursmaterialien/core_project_snapshots/` findest du vollständige, funktionierende Versionen des Projekts nach jeder Sitzung. Kopiere den passenden Snapshot und arbeite damit weiter.

Ausführliche Hilfe: [Fehlerbehebung und Wiederherstellung](../resources/troubleshooting/reset_and_recover.md)
