# Sitzungsunterlagen — Wie du damit arbeitest

Dieser Ordner enthält die Materialien für jede Sitzung des Seminars. Jede Sitzung hat einen eigenen Unterordner (`session_01/`, `session_02/`, …).

---

## Ablauf jeder Sitzung

Folge diesen Schritten der Reihe nach. Du brauchst nicht alles auswendig zu wissen — lies diese Seite zu Beginn jeder Sitzung kurz durch.

---

### Schritt 1 · Materialien herunterladen

Neue Materialien werden jede Woche hinzugefügt. So bekommst du die aktuellen Unterlagen:

1. Navigiere hier auf GitHub in den Ordner der aktuellen Sitzung.
2. Kopiere die URL. Du kannst auch diesen Link anpassen: `https://github.com/nlegewie/Intro_to_R_Seminar/tree/main/sessions/session_XX` — ersetze `XX` durch die aktuelle Sitzungsnummer (einstellige Zahlen im Format `0X`, also z. B. `03` für Session 3).
3. Öffne diesen Link: [https://download-directory.github.io](https://download-directory.github.io)
4. Füge die kopiierte URL dort ein und drücke **Enter**. Der Sitzungsordner wird als ZIP heruntergeladen.
5. Verschiebe die ZIP-Datei in deinen Seminar-Ordner.
6. Entpacke die ZIP-Datei dort.
7. Lösche die ZIP-Datei.

---

### Schritt 2 · Sitzungsordner öffnen

Doppelklicke auf die Datei `session_XX.Rproj` im Sitzungsordner. RStudio öffnet sich und stellt den Sitzungsordner als aktives Projekt ein.

> **Warum .Rproj?** Mit der `.Rproj`-Datei sind alle Dateipfade automatisch richtig gesetzt. Wenn oben rechts in RStudio `session_XX` steht, bist du im richtigen Projekt.

Jeder Sitzungsordner enthält:

| Datei / Ordner | Inhalt |
|----------------|--------|
| `session_XX.Rproj` | RStudio-Projektdatei — immer zuerst öffnen |
| `session_XX.md` | Aufgabenblatt mit Übungen und Hausaufgaben — lies es hier auf GitHub |
| `scripts/session_XX_skript.R` | Das Skript, in dem du deinen Code schreibst |
| `data/` | Datensätze für die Sitzung |

---

### Schritt 3 · Aufgabenblatt lesen

Öffne `session_XX.md` direkt hier auf GitHub (klicke im Sitzungsordner auf die Datei). Das Dokument enthält:

- Das **Endprodukt** der Sitzung — damit weißt du von Anfang an, worauf du hinarbeitest.
- Alle **Übungen** für die Sitzung.
- Alle **Hausaufgaben**.
- Tipps und Lösungen als aufklappbare Abschnitte direkt unterhalb jeder Aufgabe.

> Du arbeitest nicht in dieser Datei. Das Aufgabenblatt ist deine Anleitung — dein Code gehört ins Skript.

---

### Schritt 4 · SETUP-Abschnitt ausführen

Öffne das Skript `scripts/session_XX_skript.R`. Ganz oben findest du einen Abschnitt **SETUP — ZUERST AUSFÜHREN!**.

Markiere alle Zeilen dieses Abschnitts und drücke `Ctrl+Enter` / `Cmd+Enter`.

Der SETUP-Abschnitt lädt:
- die benötigten Pakete (`library(...)`)
- den vollständigen OWID-Datensatz (`owid_daten`)
- den Toy-Datensatz für die Übungen (`session_XX_daten`)

> Führe den SETUP-Abschnitt **jedes Mal** aus, wenn du eine neue RStudio-Sitzung startest.

---

### Schritt 5 · Übungen bearbeiten

Bearbeite die Aufgaben der Reihe nach, wie im Aufgabenblatt beschrieben. Schreibe deinen Code in die markierten Abschnitte im Skript `scripts/session_XX_skript.R` — nicht in die Konsole.

**Kernaufgaben** — alle bearbeiten.
**Bonusaufgaben** — freiwillig, für alle, die mehr entdecken wollen.

Wenn du nicht weiterkommst:

- Probiere zuerst selbst — Fehlermeldungen lesen, Code anpassen.
- Frage deine Buddy-Partner:in.
- Schlage in den [häufigen Fehlern](../resources/other/common_errors.md) nach.
- Frage im Seminar.

---

## Ablauf der Hausaufgaben

Die Hausaufgaben sind im selben Aufgabenblatt (`session_XX.md`) wie die Übungen — im Abschnitt **Hausaufgaben**. Du bearbeitest sie zu Hause im selben Skript `scripts/session_XX_skript.R`, im Abschnitt **HAUSAUFGABEN**.

---

### Schritt 1 · Aufgabenblatt nochmals lesen

Öffne `session_XX.md` auf GitHub und lies den Hausaufgaben-Abschnitt durch, um zu wissen, was zu tun ist.

---

### Schritt 2 · Sitzungsordner öffnen und SETUP ausführen

Öffne `session_XX.Rproj` in RStudio. Führe den SETUP-Abschnitt im Skript aus.

---

### Schritt 3 · Hausaufgaben bearbeiten

Schreibe deinen Code in den Abschnitt **HAUSAUFGABEN** im Skript. Interpretationen und Beobachtungen hältst du als Kommentare (`#`) im Skript fest.

---

### Schritt 4 · Abgabe

Wenn du fertig bist:

1. Speichere das Skript (`Ctrl+S` / `Cmd+S`).
2. Reiche auf Learnweb ein, was im Aufgabenblatt unter **Abgabe** angegeben ist — in der Regel das Skript und eventuell exportierte Grafiken.

---

## Kurzübersicht

```
Sitzung:
  1. Materialien herunterladen
  2. session_XX.Rproj doppelklicken → RStudio öffnet sich
  3. session_XX.md auf GitHub lesen — Endprodukt und Aufgaben verstehen
  4. SETUP-Abschnitt im Skript ausführen
  5. Übungen im Skript bearbeiten

Hausaufgaben (zu Hause):
  1. session_XX.md auf GitHub lesen — Hausaufgaben-Abschnitt
  2. session_XX.Rproj öffnen, SETUP ausführen
  3. Hausaufgaben im Skript bearbeiten und Ergebnisse als Kommentare festhalten
  4. Skript (und ggf. Grafiken) auf Learnweb einreichen
```

---

Probleme? → [Fehlerbehebung](../resources/troubleshooting/reset_and_recover.md) · [Häufige Fehler](../resources/other/common_errors.md) · [Um Hilfe bitten](../resources/troubleshooting/asking_for_help.md)
