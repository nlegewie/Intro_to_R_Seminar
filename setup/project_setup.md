# Dein Arbeitsprojekt einrichten

> **Einrichtungsschritt 4 von 5**
> [1 · R installieren](install_r.md) → [2 · RStudio installieren](install_rstudio.md) → [3 · Dateien & Ordner](working_with_files.md) → **4 · Projekt einrichten** → [5 · Tastenkürzel zur Hand nehmen](../resources/cheatsheets/keyboard_shortcuts.md)

#3 Inhalt 

[Was ist ein RStudio-Projekt?](#was-ist-ein-rstudio-projekt) · [Schritt 1 · Ort vorbereiten](#schritt-1--den-richtigen-ort-vorbereiten) · [Schritt 2 · Vorlage kopieren](#schritt-2--die-projektvorlage-kopieren) · [Schritt 3 · In RStudio öffnen](#schritt-3--das-projekt-in-rstudio-öffnen) · [Schritt 4 · Testen](#schritt-4--testen-ob-alles-funktioniert) · [Schritt 5 · here einrichten](#schritt-5--hereherekennenlernen) · [Ordnerstruktur](#was-bedeuten-die-ordner) · [Häufige Fragen](#faq)

---

In dieser Anleitung richtest du das RStudio-Projekt ein, in dem du das gesamte Semester arbeiten wirst: Hausaufgaben, Analysen und den Abschlussbericht. Das dauert etwa 10 Minuten und muss nur einmal gemacht werden.

**Voraussetzungen:**
- R ist installiert → [R installieren](install_r.md)
- RStudio ist installiert → [RStudio installieren](install_rstudio.md)
- Du hast die Kursmaterialien heruntergeladen und entpackt → [README](../README.md#wie-du-die-dateien-herunterlädst)

---

## Was ist ein RStudio-Projekt?

Ein RStudio-Projekt ist ein Ordner auf deinem Computer, der eine spezielle Datei enthält (Endung `.Rproj`). Wenn du diese Datei öffnest, startet RStudio und „weiß" automatisch, wo es sich befindet. Das bedeutet:

- Du musst R nie sagen, wo deine Dateien oder Unterordner liegen — es findet sie von selbst
- Dateipfade funktionieren auf jedem Computer gleich (egal ob Windows oder macOS)
- Du kannst deinen Ordner auf einen anderen Computer kopieren und alles funktioniert weiterhin

Ohne ein Projekt müsstest du jedes Mal manuell den richtigen Ordner einstellen — eine häufige Fehlerquelle, die wir so komplett vermeiden.

Ein weiterer Vorteil ist, dass die Datei sich merkt, welche Skripte du geöffnet hast, wenn du RStudio schließt. Beim nächsten Öffnen ist alles gleich wieder so, wie du es "zurückgelassen" hast. 

---

## Schritt 1 — Den richtigen Ort vorbereiten

Bevor du das Projekt kopierst, erstelle einen Ordner für das Seminar (falls du noch keinen hast):

### Windows

1. Öffne den **Datei-Explorer** (das gelbe Ordnersymbol in der Taskleiste)
2. Navigiere zu **Dokumente** (Documents)
3. Rechtsklick → **Neu → Ordner**
4. Nenne den Ordner: **Seminar_R_Projekt**

Dein Ordner liegt jetzt hier: `C:\Users\[dein_name]\Documents\Seminar_R_Projekt\`

### macOS

1. Öffne den **Finder**
2. Navigiere zu **Dokumente** (Documents)
3. Rechtsklick (oder Ctrl+Klick) → **Neuer Ordner**
4. Nenne den Ordner: **Seminar_R**

Dein Ordner liegt jetzt hier: `/Users/[dein_name]/Documents/Seminar_R_Projekt/`

**Erinnerung:** Verwende keine Leerzeichen, Umlaute oder Sonderzeichen im Ordnernamen. `Seminar_R_Projekt` ist gut. `Seminar R!` ist schlecht. Mehr dazu in [Dateien und Ordner verstehen](working_with_files.md).

---

## Schritt 2 — Die Projektvorlage kopieren

In den heruntergeladenen Kursmaterialien gibt es einen Ordner namens `core_project/`. Das ist deine Vorlage — ein fertig eingerichtetes RStudio-Projekt mit der richtigen Ordnerstruktur.

**So kopierst du es:**

### Windows

1. Öffne den Ordner mit den Kursmaterialien (dort, wo du die ZIP-Datei entpackt hast)
2. Finde den Ordner **`core_project`**
3. Rechtsklick auf `core_project` → **Kopieren**
4. Navigiere in deinen neuen Ordner `Dokumente\Seminar_R_Projekt\`
5. Rechtsklick → **Einfügen**
6. **Benenne den kopierten Ordner um:** Rechtsklick → Umbenennen → Nenne ihn z. B. **`mein_projekt`**

### macOS

1. Öffne den Ordner mit den Kursmaterialien im Finder
2. Finde den Ordner **`core_project`**
3. Rechtsklick (oder Ctrl+Klick) auf `core_project` → **Kopieren**
4. Navigiere zu deinem neuen Ordner `Dokumente/Seminar_R_Projekt/`
5. Rechtsklick → **Objekt einsetzen**
6. **Benenne den kopierten Ordner um:** Rechtsklick → Umbenennen → Nenne ihn z. B. **`mein_projekt`**

**Was du jetzt haben solltest:**

```
Dokumente/
└── Seminar_R/
    └── mein_projekt/
        ├── mein_projekt.Rproj      ← die Projektdatei
        ├── README_project.md
        ├── data/
        ├── scripts/
        │   ├── 01_clean_data.R
        │   ├── 02_analysis.R
        │   └── 03_helpers.R
        ├── reports/
        │   └── analysis_report.Rmd
        └── output/
            ├── figures/
            └── tables/
```

Die `.Rproj`-Datei heißt möglicherweise noch `intro-to-r.Rproj` — du kannst sie umbenennen (z. B. in `[dein name]_projekt.Rproj`), das hat keinen Einfluss auf die Funktion.

---

## Schritt 3 — Das Projekt in RStudio öffnen

Jetzt öffnest du das Projekt zum ersten Mal:

### Variante A — Über den Datei-Explorer / Finder (empfohlen)

1. Navigiere im Datei-Explorer (Windows) oder Finder (macOS) zu deinem Projektordner
2. Doppelklicke auf die Datei **`[dein name]_projekt.Rproj`** (oder wie auch immer die `.Rproj`-Datei heißt)
3. RStudio öffnet sich automatisch — und zeigt in der oberen rechten Ecke den Projektnamen an

### Variante B — Über RStudio

1. Öffne RStudio
2. Klicke auf **File → Open Project…** (oder **Datei → Projekt öffnen…**)
3. Navigiere zu `Dokumente/Seminar_R/mein_projekt/`
4. Wähle die `.Rproj`-Datei aus und klicke **Open**

### Woher weißt du, dass du im richtigen Projekt bist?

Schau in die **obere rechte Ecke** von RStudio. Dort steht der Name deines Projekts (z. B. `[dein name]_projekt`). Wenn dort `Project: (None)` steht, bist du in keinem Projekt — öffne die `.Rproj`-Datei erneut. Wenn du später „Datei nicht gefunden"-Fehler bekommst, ist das fast immer die Ursache: [Fehlerbehebung](../resources/troubleshooting/reset_and_recover.md#datei-nicht-gefunden)

Außerdem: Im Bereich **Files** (unten rechts) siehst du genau die Dateien und Ordner, die in deinem Projektordner liegen. Wenn du dort `scripts/`, `data/`, `reports/` usw. siehst, bist du richtig.

---

## Schritt 4 — Testen, ob alles funktioniert

Lass uns überprüfen, dass die Projektstruktur richtig eingerichtet ist.

1. Klicke in der Console (unten links) und tippe:

```r
getwd()
```

Drücke **Enter**. Das Ergebnis sollte der Pfad zu deinem Projektordner sein, z. B.:
- Windows: `"C:/Users/maria/Documents/Seminar_R_Projekt/[dein name]_projekt"`
- macOS: `"/Users/maria/Documents/Seminar_R_Projekt/[dein name]_projekt"`

Wenn der Pfad stimmt: Alles funktioniert. Das Projekt weiß, wo es ist.

2. Jetzt testen wir, ob die Ordnerstruktur da ist. Tippe in die Console:

```r
list.files()
```

Du solltest etwas sehen wie:
```
[1] "data"       "mein_projekt.Rproj"  "output"
[4] "README_project.md"  "reports"    "scripts"
```

Wenn die Ordner `data`, `scripts`, `reports` und `output` auftauchen: Alles ist an seinem Platz.

---

## Schritt 5 — here::here() kennenlernen

Im Seminar verwenden wir ein kleines, aber sehr nützliches Paket namens `here`. Es sorgt dafür, dass Dateipfade immer relativ zum Projekt-Hauptordner angegeben werden — unabhängig davon, wo auf dem Computer das Projekt liegt.

Installiere das Paket einmalig, indem du in die Console tippst:

```r
install.packages("here")
```

Drücke **Enter** und warte, bis die Installation abgeschlossen ist (es erscheinen einige Meldungen — das ist normal).

Dann teste es:

```r
library(here)
here()
```

Das Ergebnis sollte der gleiche Pfad sein wie bei `getwd()` — dein Projektordner.

**Warum ist das wichtig?** Im Laufe des Semesters wirst du Daten einlesen, z. B.:

```r
library(readr)
library(here)
daten <- read_csv(here("data", "owid_data.csv"))
```

Dieser Code funktioniert auf jedem Computer, egal ob Windows oder macOS, egal wo der Ordner liegt — solange du das RStudio-Projekt geöffnet hast. Das ist der Grund, warum du immer über die `.Rproj`-Datei arbeitest und nie einfach ein einzelnes Skript öffnest.

---

## Ab jetzt: Projekt immer über die .Rproj-Datei öffnen

Jedes Mal, wenn du am Projekt weiterarbeiten willst (z.B. für Hausaufgaben):

1. Navigiere zu `Dokumente/Seminar_R_Projekt/[dein name]_projekt/`
2. Doppelklicke auf die **`.Rproj`-Datei**

Das öffnet RStudio mit dem richtigen Arbeitsverzeichnis, den richtigen Dateien und dem richtigen Kontext.

**Öffne R-Skripte nie per Doppelklick.** Wenn du eine `.R`-Datei direkt öffnest (statt über das Projekt), weiß RStudio nicht, wo sich die anderen Dateien befinden, und Befehle wie `here("data", "owid.csv")` funktionieren nicht.

---

## Was bedeuten die Ordner?

| Ordner | Was kommt rein? |
|--------|----------------|
| `data/` | Datensätze: die OWID-Daten und ggf. eigene gefilterte Versionen |
| `scripts/` | R-Skripte für Datenbereinigung und Analyse |
| `reports/` | R-Markdown-Dokumente, z. B. der Analysebericht und später der Abschlussbericht |
| `output/figures/` | Grafiken, die dein Code erzeugt |
| `output/tables/` | Tabellen, die dein Code erzeugt |

Die genaue Verwendung lernst du Sitzung für Sitzung näher kennen. Am Anfang brauchst du nur `data/` und `scripts/`.

---

## Zusammenfassung

| Was | Wie |
|-----|-----|
| Projekt öffnen | Immer über die `.Rproj`-Datei |
| Dateien referenzieren | Mit `here("ordner", "datei.csv")` — nie mit absoluten Pfaden |
| Neues Skript erstellen | In RStudio: File → New File → R Script, dann speichern in `scripts/` |
| Prüfen, ob du im richtigen Projekt bist | Obere rechte Ecke in RStudio zeigt den Projektnamen |

---

## FAQ

**Kann ich den Projektordner umbenennen?**
Ja. Benenne den Ordner und die `.Rproj`-Datei einfach gleich um (z. B. beide in `mein_projekt`). Danach öffnest du die umbenannte `.Rproj`-Datei.

**Kann ich den Projektordner an einen anderen Ort verschieben?**
Ja. Solange du danach die `.Rproj`-Datei am neuen Ort öffnest, funktioniert alles wie vorher.

**Was passiert, wenn ich ein Skript direkt per Doppelklick öffne?**
RStudio öffnet sich, aber ohne Projekt-Kontext. Das erkennst du daran, dass oben rechts `Project: (None)` steht. In diesem Fall: Schließe RStudio und öffne stattdessen die `.Rproj`-Datei.

**Muss ich das Projekt jedes Mal neu einrichten?**
Nein. Du richtest es genau einmal ein. Danach öffnest du nur noch die `.Rproj`-Datei.

---

**Fast geschafft!** Dein Arbeitsprojekt ist eingerichtet. Ab jetzt arbeitest du hier weiter, wenn es um Hausaufgaben geht.

**Nächster Schritt:** [Tastenkürzel zur Hand nehmen](../resources/cheatsheets/keyboard_shortcuts.md)

Zurück zur [Startseite](../README.md)
