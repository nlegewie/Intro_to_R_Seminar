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
2. Die URL kopierst. Entweder navigierst du zum Ordern der aktuellen Session und gehst dort oben im Browser ins Fenster für die URL-Eingabe, und kopierst den Link. Alternativ kannst du auch diesen Link hier kopieren und am Ende die Nummer für die aktuelle Sitzung eingeben: https://github.com/nlegewie/Intro_to_R_Seminar/tree/main/sessions/session_XX. Beachte, dass einstellige Zahlen im Format "0X" (also für Session 3: 03) auftauchen.
3. Diesen Link hier klickst: https://download-directory.github.io
4. Dort die URL des Sessionordners einfügst 
5. Auf ENTER drückst. Der Ordner wird dann als ZIP heruntergeladen
6. Die ZIP-Datei in deinen Seminar-Ordner in den Sessions-Ordner verschiebst
7. Die ZIP-Datei dort entpackst.
8. Die ZIP-Datei löschst.

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

- Im geknitteten Übungsdokument sind zu jeder Übung ein Tip und die Lösung verfügbar. Scrolle einfach zum Ende der Übung und klicke darauf, wenn du nicht weiterkommen solltest.

---

## Ablauf der Hausaufgaben

Hausaufgaben erledigst du **zu Hause, in deinem eigenen Kernprojekt** — nicht im Sitzungsordner.

---

### Schritt 1 · Hausaufgabenblatt knitten

Öffne die .RProj-Datei im sessions Ordner, öffne dann `session_XX_hausaufgaben.Rmd` und klicke auf **Knit**. Hier kannst du die Aufgaben durchlesen um zu wissen, was zu tun ist.

---

### Schritt 2 · In deinem Kernprojekt arbeiten

Wechsle dann zu **deinem eigenen Kernprojekt** (dem Ordner, den du zu Beginn des Semesters einmalig eingerichtet hast — außerhalb des Repo-Ordners).

> **Warum?** Die Sitzungsordner in diesem Repository werden regelmäßig aktualisiert. Alles, was du dort speicherst, kann beim nächsten Download des Repos überschrieben werden. Dein Kernprojekt ist dein dauerhafter Arbeitsplatz, daher sollte es nicht mit gelöscht werden. Daher der separate Ordner.

- Öffne im Kernprojekt-Ordner zuerst die .Rproj-Datei.
- Öffne dann die drei Skripte im scripts-Ordner des Kernprojekts
- Führe die library()-Befehle am Anfang des `01_homework_clean_data.R`-Skripts aus (markieren und dann `Strg+ENTER/Cmd+ENTER` drücken)
- Bearbeite die Aufgaben, indem du in den Skripten Code hinzufügst. In den Aufgaben steht jeweils, in welchem Skript du Code hinzufügen sollst, um die Aufgabe zu lösen.

→ Wie du dein Kernprojekt eingerichtet hast: [Projekteinrichtung](../setup/project_setup.md)
→ Etwas durcheinander geraten? [Kernprojekt aus einem Snapshot wiederherstellen](../resources/troubleshooting/reset_and_recover.md)

---

### Schritt 3 · Abgabe

Wenn du mit den Hausaufgaben fertig bist, gehst du wie folgt vor: 
- Öffne das `core_project.Rmd` Dokument in RStudio.
- Knitte das Dokument in deinem Kernprojekt zu HTML. Wenn du alles richtig gemacht hast, sollte es durchlaufen und ein neues Fenster mit der HTML-Datei sollte sich öffnen.
- Reiche die HTML-Datei auf Learnweb ein. Du findest die HTML-Datei in deinem Kernprojekt-Ordner.

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
