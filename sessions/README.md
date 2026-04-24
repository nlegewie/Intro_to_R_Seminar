# Sitzungsunterlagen — Wie du damit arbeitest

Dieser Ordner enthält die Materialien für jede Sitzung des Seminars. Jede Sitzung hat einen eigenen Unterordner (`session_01/`, `session_02/`, …).

---

## Ablauf jeder Sitzung

Folge diesen Schritten der Reihe nach. Du brauchst nicht alles auswendig wissen — lies einfach diese Seite zu Beginn jeder Sitzung kurz durch.

---

### Schritt 1 · Materialien herunterladen

Stelle sicher, dass du die aktuellen Sitzungsunterlagen hast.

Neue Materialien werden jede Woche hinzugefügt. Du kannst diese neuen Unterlagen herunterladen, indem du: 

1. hier auf GitHub in den entsprechenden Sitzungsordner gehst
2. Die URL kopierst
3. Diesen Link hier klickst: https://download-directory.github.io
4. Dort die URL des Sessionordners einfügst 
5. Auf ENTER drückst. Der Ordner wird dann als ZIP heruntergeladen
6. Die ZIP-Datei in deinen Seminar-Ordner in den Sessions-Ordner verschiebst
7. Die ZIP-Datei dort entpackst.

---

### Schritt 2 · Sitzungsordner in RStudio öffnen

Öffne den Ordner der aktuellen Sitzung (`sessions/session_XX/`). Darin findest du:

| Datei / Ordner | Was drin ist |
|----------------|-------------|
| `session_XX.Rproj` | RStudio-Projektdatei — öffne immer zuerst diese |
| `session_XX_uebungen.Rmd` | Übungsblatt für die Sitzung |
| `session_XX_hausaufgaben.Rmd` | Hausaufgaben für zu Hause |
| `scripts/` | R-Skripte (falls vorhanden — nicht in jeder Sitzung) |
| `data/` | Datensätze für die Sitzung (falls vorhanden) |

> **Wichtig:** Doppelklicke auf die `.Rproj`-Datei, um den Sitzungsordner als aktives Projekt in RStudio zu öffnen. So sind alle Pfade automatisch richtig.

---

### Schritt 3 · Übungsblatt knitten

Öffne `session_XX_uebungen.Rmd` und klicke auf **Knit** (oder drücke `Ctrl+Shift+K` / `Cmd+Shift+K`).

Das erzeugt eine HTML-Datei im selben Ordner. Diese kannst du im Browser lesen — alle Aufgaben, Hinweise und Code-Felder sind darin sichtbar.

> Du arbeitest aber weiterhin im `.Rmd`-Dokument selbst, nicht im HTML. Das HTML ist nur zur Übersicht.

---

### Schritt 4 · Skripte öffnen (falls vorhanden)

Schau im Unterordner `scripts/` nach. Wenn dort `.R`-Dateien liegen, werden sie in der Aufgabenstellung erwähnt — öffne sie dann zusätzlich zum Übungsblatt.

In den ersten Sitzungen gibt es noch keine Skripte (der ganze Code steht direkt im `.Rmd`). Ab Session 8 lernst du, wie du deinen Code sinnvoll in Skripte auslagert.

---

### Schritt 5 · Übungen bearbeiten

Arbeite die Aufgaben von oben nach unten durch.

- **Solange es keine Skripte gibt**: Füge deinen Code direkt in die vorbereiteten Code-Blöcke im `.Rmd`-Dokument ein und führe sie mit `Ctrl+Enter` / `Cmd+Enter` aus.
- **Sobald Skripte eingeführt werden**: Du arbeitest hauptsächlich in den `.R`-Skripten im Ordner `scripts/`. Das Übungsblatt beschreibt, welches Skript du wann öffnen und ausführen sollst.

**Kernaufgaben** — alle bearbeiten.
**Bonusaufgaben** — freiwillig, für alle die mehr entdecken wollen.

Wenn du nicht weiterkommst:

- Probiere zuerst selbst — Fehlermeldungen lesen, Code anpassen.
- Frage deine Buddy-Partner:in.
- Schlage in den [häufigen Fehlern](../resources/other/common_errors.md) nach.
- Frage im Seminar.

### Wo finde ich die Lösungen?

- **In-class-Lösungen** werden (wenn freigegeben) direkt im jeweiligen Sitzungsordner veröffentlicht, meist als `session_XX_uebungen_loesung.Rmd` (und ggf. als HTML-Version).
- **Hausaufgaben-Lösungen** lade ich immer am Donnerstag auf Learnweb hoch.

---

## Ablauf der Hausaufgaben

Hausaufgaben erledigst du **zu Hause, in deinem eigenen Kernprojekt** — nicht im Sitzungsordner.

---

### Schritt 1 · Hausaufgabenblatt knitten

Öffne `session_XX_hausaufgaben.Rmd` im Sitzungsordner und klicke auf **Knit**. Lies die Aufgaben durch.

---

### Schritt 2 · In deinem Kernprojekt arbeiten

Wechsle dann zu **deinem eigenen Kernprojekt** (dem Ordner, den du zu Beginn des Semesters einmalig eingerichtet hast — außerhalb des Repo-Ordners).

> **Warum?** Die Sitzungsordner in diesem Repository werden regelmäßig aktualisiert. Alles, was du dort speicherst, kann beim nächsten Download des Repos überschrieben werden. Dein Kernprojekt ist dein dauerhafter Arbeitsplatz, daher sollte es nicht mit gelöscht werden. Daher der separate Ordner.

Im Kernprojekt findest du passende Vorlagen für jede Hausaufgabe. Kopiere den Code aus dem Hausaufgabenblatt in die entsprechende Datei deines Kernprojekts, und arbeite dort weiter.

→ Wie du dein Kernprojekt eingerichtet hast: [Projekteinrichtung](../setup/project_setup.md)
→ Etwas durcheinander geraten? [Kernprojekt aus einem Snapshot wiederherstellen](../resources/troubleshooting/reset_and_recover.md)

---

### Schritt 3 · Abgabe

Wenn du mit den Hausaufgaben fertig bist, knitte das Dokument in deinem Kernprojekt zu HTML und reiche die HTML-Datei wie angegeben ein.

---

## Kurzübersicht

```
Sitzung:
  1. Materialien herunterladen
  2. session_XX.Rproj doppelklicken → RStudio öffnet sich
  3. session_XX_uebungen.Rmd knitten → HTML zur Orientierung
  4. scripts/ öffnen, falls vorhanden
  5. Aufgaben im .Rmd bearbeiten

Hausaufgaben (zu Hause):
  1. session_XX_hausaufgaben.Rmd knitten → Aufgaben lesen
  2. Zu eigenem Kernprojekt wechseln
  3. Dort arbeiten und am Ende knitten → HTML abgeben
```

---

Probleme? → [Fehlerbehebung](../resources/troubleshooting/reset_and_recover.md) · [Häufige Fehler](../resources/other/common_errors.md) · [Um Hilfe bitten](../resources/troubleshooting/asking_for_help.md)
