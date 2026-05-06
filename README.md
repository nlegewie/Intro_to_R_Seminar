# Globale Ungleichheit — Eine Einführung in die statistische Datenauswertung mit R

Herzlich Willkommen im Seminar "Globale Ungleichheit – Eine Einführung in die statistische Datenauswertung mit R". Das Seminar führt in die statistische Datenanalyse mit der Programmiersprache R ein, anhand des Themas globale Ungleichheit. Als Datenbasis dient der [Our World in Data](https://ourworldindata.org)-Datensatz mit Daten zu fast 200 Ländern über mehrere Jahrzehnte.

Dieses GitHub-Repository ist deine zentrale Anlaufstelle für das gesamte Seminar. Hier findest du alle Materialien, die du brauchst: Installationsanleitungen für die nötige Software (R und RStudio), Sitzungsunterlagen, Datensätze, Übungen, Hausaufgaben und Referenzmaterialien. Ein GitHub-Repository ist nichts anderes als ein strukturierter Ordner im Internet, aus dem du Dateien herunterladen kannst.

Am Ende des Semesters wirst du in der Lage sein, echte Daten zu importieren, zu bereinigen, zu analysieren und zu visualisieren — und deine Ergebnisse in einem professionellen, reproduzierbaren Dokument zu präsentieren.

Du musst GitHub nicht kennen und kein Git benutzen. Alles funktioniert auch, wenn du die Dateien einfach herunterlädst.

**Etwas funktioniert nicht?** Direkt zur [Fehlerbehebung und Wiederherstellung](resources/troubleshooting/reset_and_recover.md) — diese Seite hilft dir bei den häufigsten Problemen, Schritt für Schritt.
Du hast einen Fehler entdeckt oder etwas funktioniert nicht im Repo (z.B. ein Link)? [Schreib mir kurz, was kaputt ist](https://github.com/nlegewie/Intro_to_R_Seminar/issues/new)

---

## Inhaltsverzeichnis

- [Hier geht's los — was du als Erstes tun solltest](#hier-gehts-los)
- [Wie du die Dateien herunterlädst](#wie-du-die-dateien-herunterlädst)
- [Aufbau des Repositorys](#aufbau-des-repositorys)
- [Weitere Referenzmaterialien](#weitere-referenzmaterialien)
- [Wie das Seminar funktioniert](#wie-das-seminar-funktioniert)
- [Kern- und Bonusaufgaben](#kern--und-bonusaufgaben)
- [Tastaturkürzel](#tastaturkürzel)
- [Zugänglichkeit: Hinweise für Studierende mit Legasthenie oder ähnlichen Bedingungen](#zugänglichkeit)
- [Hintergrundlektüre: Globale Ungleichheit](#hintergrundlektüre)
- [Fehlerbehebung](#fehlerbehebung)
- [Wer noch nicht genug hat: Datacamp](#wer-noch-nicht-genug-hat-datacamp)

---

## Hier geht's los

Mit den folgenden Schritten richtest du Software und Grundlagen ein — am besten vor der ersten Sitzung, in dieser Reihenfolge. Danach gilt der Ablauf in [sessions/README.md](sessions/README.md) für jede Woche. Auf geht's in dein Rbenteuer (get it? get it?).


> **Einrichtungsreihenfolge:**

> [1 · R installieren](setup/install_r.md) → [2 · RStudio installieren](setup/install_rstudio.md) → [3 · Dateien & Ordner verstehen](setup/working_with_files.md) → [4 · Tastenkürzel zur Hand nehmen](resources/cheatsheets/keyboard_shortcuts.md) → [5 · Ablauf der Sitzungen](sessions/README.md)


**Schritt 1 — R installieren**

R ist die Programmiersprache, die im Hintergrund läuft. Sie muss zuerst installiert werden, bevor du RStudio verwenden kannst.
→ [R installieren (Windows und macOS)](setup/install_r.md)

**Schritt 2 — RStudio installieren**

RStudio ist die Arbeitsoberfläche, in der du das gesamte Semester arbeitest. Setzt R (Schritt 1) voraus.
→ [RStudio installieren (Windows und macOS)](setup/install_rstudio.md)


**Schritt 3 — Dateien und Ordner verstehen**

Bevor du loslegst: Wo du Dateien speicherst und wie Pfade funktionieren, ist eine der häufigsten Fehlerquellen im Seminar. Dieser kurze Überblick spart später viel Frustration.
→ [Dateien und Ordner verstehen](setup/working_with_files.md)


**Schritt 4 — Tastaturkürzel und Paket-Cheatsheets zur Hand nehmen**

Tastaturkürzel sparen von Anfang an Zeit. Die Paket-Cheatsheets sind dein Nachschlagewerk für den Rest des Semesters.
→ [Tastaturkürzel](resources/cheatsheets/keyboard_shortcuts.md)
→ [Tidyverse-Cheatsheets (alle Pakete)](resources/cheatsheets/tidyverse_cheatsheets.md)
→ [R-Referenz: Operatoren, Basis- und Statistikfunktionen](resources/cheatsheets/r_referenz.md)


Wenn du bei einem Schritt nicht weiterkommst: [Fehlerbehebung](resources/troubleshooting/reset_and_recover.md)

Wenn du mit der Installation fertig bist, kannst du dir diese Startseite zu Ende durchlesen und schon mal den Rest des Repositorys durchstöbern.

---

## Wie du die Dateien herunterlädst

**Gesamte Kursmaterialien herunterladen**

1. Klicke oben auf der GitHub-Seite auf den grünen Button **„Code"**
2. Wähle **„Download ZIP"**
3. Entpacke die ZIP-Datei an einem sinnvollen Ort — Tipps dazu findest du in [Dateien und Ordner verstehen](setup/working_with_files.md)

Du musst Git nicht installieren. Du musst nichts eintippen. Der Download funktioniert wie jede andere Datei aus dem Internet.

**VORSICHT:** Wenn du das Repo vorher schon einmal heruntergeladen hast, Übungen oder Hausaufgaben dort bearbeitet hast und später den **kompletten** Ordner wieder durch eine neue ZIP vom gleichen Repo ersetzt, sind jene Arbeiten überschrieben. Sichere deine Arbeit (z.B. eigener Ordner kopieren), oder lade nur die **neue Sitzung** oder einzelne Dateien nach ([Anleitung Sitzungen](sessions/README.md)).

**Neue Sitzungsunterlagen (pro Woche)**

Jede Woche kommen Materialien unter `sessions/session_XX/` hinzu — mit Aufgabenblatt, Daten und Skript. So holst du dir nur einen Sitzungsordner als ZIP oder aktualisierst dein lokales Repo: Schritt für Schritt in [sessions/README.md](sessions/README.md) (ZIP über [download-directory](https://download-directory.github.io)).

**Mit Git arbeiten (optional, für Fortgeschrittene)**

Wenn du Git kennst, kannst du das Repository klonen und mit `git pull` neue Inhalte holen:

```
git clone https://github.com/nlegewie/Intro_to_R_Seminar.git
```
Das ist aber kein Muss. Alle Inhalte funktionieren ohne Git.

---

## Aufbau des Repositorys

```
/
├── README.md          ← diese Seite
├── setup/             ← Installation, Umgang mit Dateien und Pfaden — Start hier
├── sessions/          ← Material pro Sitzung (siehe unten und [sessions/README.md](sessions/README.md))
│   ├── session_01/
│   ├── session_02/
│   └── ...
├── full_data/         ← Vollständiger OWID-Datensatz (`owid_data.csv`) — ggf. in den `data/`‑Ordner der jeweiligen Sitzung kopieren
└── resources/         ← Referenzmaterialien, Hilfe
    ├── troubleshooting/
    ├── cheatsheets/
    └── other/
```

**Die wichtigsten Ordner**

| Ordner | Zweck |
|--------|-------|
| `setup/` | R und RStudio installieren, Dateien/Pfade verstehen |
| `sessions/session_XX/` | Pro Woche: `session_XX.Rproj`, **`README.md`** (Aufgabenblatt; auf GitHub unter der Ordnerliste sichtbar) oder bis zur Umstellung zusätzlich `*_uebungen.Rmd`/`*_hausaufgaben.*`, Daten in `data/`, dein Arbeitsskript in `scripts/` |
| `full_data/` | Zentrale Ablage des großen `owid_data.csv` — kopieren, wenn die Aufgaben ihn im Sitzungsordner erwarten |
| `resources/` | Troubleshooting, Tastenkürzel, Leitfäden (Interpretation, KI-Nutzung, Code-Stil, …) |

**So arbeitest du:** Übungen und Hausaufgaben stehen zusammen auf **einem Aufgabenblatt** als **`README.md`** im jeweiligen Sitzungsordner — auf GitHub wird es unter der Liste der Ordner und Dateien angezeigt (kein Extra-Klick). Ältere Sitzungen können zusätzlich `.Rmd`‑Dateien haben (zum Lesen ggf. knitten). Deinen Code schreibst du in **ein** Skript pro Sitzung — z.B. [`sessions/session_03/scripts/session_03_skript.R`](sessions/session_03/scripts/session_03_skript.R). Öffne **immer zuerst** die `session_XX.Rproj`‑Datei im Sitzungsordner, damit `here()` die richtigen Pfade findet.

Details, Download und Abgabe: **[Sitzungen — wie du mit den Unterlagen arbeitest](sessions/README.md)**.

Später im Semester kommen **R Markdown**, `source()` und ein **eigener Ordner für den Abschlussbericht** dazu — das wird im Kurs eingeführt, nicht von Anfang an vorausgesetzt.

---

## Weitere Referenzmaterialien

Im Ordner `resources/other/` findest du Leitfäden und Erklärungen, die im Laufe des Semesters relevant werden:

| Dokument | Inhalt |
|----------|--------|
| [Objekte in R](resources/other/r_objekte.md) | Was sind Vektoren, Tibbles, Faktoren, Listen, NA und NULL — und wann begegnet dir was? |
| [Häufige Fehler](resources/other/common_errors.md) | Galerie typischer Anfängerfehler mit Erklärungen und Lösungen |
| [Interpretation von Grafiken und Tabellen](resources/other/interpretation_workflow.md) | Schritt-für-Schritt-Anleitung: beschreiben → vergleichen → deuten → einordnen |
| [Code-Stil und Kommentare](resources/other/code_style.md) | Warum Code-Stil wichtig ist, wie du sinnvoll kommentierst, und wie `styler` automatisch formatiert |
| [Buddy-Leitfaden](resources/other/buddy_feedback_guide.md) | Wie das Buddy-System funktioniert und wie ihr euch gegenseitig am besten helft |
| [Verantwortungsvoller Umgang mit KI](resources/other/using_genai.md) | Was erlaubt ist, was nicht, und wie du KI sinnvoll zum Lernen einsetzt |
| [Zugänglichkeit](resources/other/accessibility.md) | Hinweise zu Schriftarten, Themes und Hilfsmitteln für Studierende mit Legasthenie |

---

## Wie das Seminar funktioniert

Jede Sitzung hat einen **eigenen analytischen Bogen**: Es gibt eine inhaltliche Frage, ihr lernt mit einem **Toy-Datensatz** die nötigen R-Schritte, und in der **Hausaufgabe** wendet ihr dasselbe am **vollen OWID-Datensatz** an. Am Anfang des Aufgabenblatts siehst du, **welches Ergebnis** ihr anstrebt (z.B. eine bestimmte Grafik).

Grober Ablauf pro Woche:

1. **Rückblick** (wie im Seminar vereinbart): offene Fragen zur Hausaufgabe oder zum letzten Stoff
2. **Sitzungsordner haben** (`sessions/session_XX/`) — entweder beim ersten Mal gesamtes Repo oder nur den neuen Unterordner heruntergeladen ([Anleitung](sessions/README.md))
3. **`session_XX.Rproj` öffnen** — Projekt aktivieren (oben rechts in RStudio der Sitzungsname)
4. **Aufgabenblatt lesen** — Sitzungsordner `sessions/session_XX/` auf GitHub öffnen; die **`README.md`** steht dort unterhalb der Liste (bei älteren Sitzungen ggf. `.Rmd` knitten zum Lesen)
5. **`SETUP` im Skript ausführen** — Libraries und Daten laden (steht immer ganz oben in `scripts/session_XX_skript.R`)
6. **Übungen** — Code in die markierten Abschnitte **ÜBUNGEN** schreiben
7. **Hausaufgaben** — zu Hause im selben Skript unter **HAUSAUFGABEN**, Abgabe wie im Aufgabenblatt beschrieben

Typischer Inhalt eines Sitzungsordners:

- `session_XX.Rproj`
- Haupt-Aufgabenblatt **`README.md`** (und bei älteren Sitzungen ggf. `*_uebungen.Rmd`/`*_hausaufgaben.Rmd`)
- `scripts/session_XX_skript.R` — deine eine Datei für Code diese Woche (bei älteren Sitzungen ggf. noch `*_template.R`)
- `data/` — Toy-Daten für die Übung; oft zusätzlich Anweisungen, wenn `owid_data.csv` aus `full_data/` kopiert werden soll

**Orientierung nachholen oder „von vorne" im Sitzungsordner:** Lade den betreffenden `session_XX`‑Ordner frisch vom Repository (oder aus dem Backup deiner Abgabe). Es gibt kein separates „Kernprojekt" und keine Snapshot-Ordner mehr — die Arbeitsweise ist bewusst schlank gehalten.

---

## Kern- und Bonusaufgaben

Ab Sitzung 7 ist jede Sitzung, jede Hausaufgabe und der Abschlussbericht in zwei Tracks unterteilt:

**Kernaufgaben** sind Pflicht — für alle Studierenden. Sie sind so konzipiert, dass du sie in der Sitzungszeit abschließen kannst, auch wenn dir der Stoff nicht so leicht fällt. Das erfolgreiche Abschließen der Kernaufgaben ist die Grundlage für die Benotung.

**Bonusaufgaben** sind freiwillig — für Studierende, die schneller durchkommen oder tiefer einsteigen wollen. Sie vertiefen das Verständnis, führen weiterführende Techniken ein oder stellen offenere Herausforderungen. Sie bereichern den Abschlussbericht, sind aber nicht Voraussetzung für eine gute Note.

Die Unterscheidung ist in jeder Sitzung, jeder Hausaufgabe und im Abschlussbericht klar gekennzeichnet.

---

## Tastaturkürzel

Tastaturkürzel sparen enorm viel Zeit und reduzieren Frustration. Wir empfehlen, die wichtigsten von Anfang an zu lernen.

Die vollständige Übersicht: [RStudio-Tastaturkürzel](resources/cheatsheets/keyboard_shortcuts.md) · [Tidyverse-Cheatsheets](resources/cheatsheets/tidyverse_cheatsheets.md) · [R-Referenz: Operatoren & Funktionen](resources/cheatsheets/r_referenz.md)

Die allerwichtigsten auf einen Blick:

| Aktion | Windows | macOS |
|--------|---------|-------|
| Ausgewähltes kopieren | Ctrl + C | Cmd + C |
| Ausgewähltes ausschneiden | Ctrl + X | Cmd + X |
| Ausgewähltes einfügen | Ctrl + V | Cmd + V |
| Rückgängig | Ctrl + Z | Cmd + Z |
| Rückgängig rückgänging machen | Ctrl + Shift + Z | Cmd + Shift + Z |
| Markierte Zeile ausführen | Ctrl + Enter | Cmd + Enter |
| Ganzes Skript ausführen (Source) | Ctrl + Shift + Enter | Cmd + Shift + Enter |
| R neu starten | Ctrl + Shift + F10 | Cmd + Shift + F10 |
| Kommentar ein/aus | Ctrl + Shift + C | Cmd + Shift + C |
| Code einrücken | Tab | Tab |
| Speichern | Ctrl + S | Cmd + S |
| Neues Skript | Ctrl + Shift + N | Cmd + Shift + N |

---

## Zugänglichkeit

RStudio lässt sich in Schriftart, Schriftgröße und Farbschema anpassen — das kann für Studierende mit Legasthenie oder ähnlichen Bedingungen einen großen Unterschied machen.

Konkrete Empfehlungen zu Schriftarten, Themes, Autovervollständigung und weiteren Hilfsmitteln: [Zugänglichkeit: Hinweise für Studierende mit Legasthenie](resources/other/accessibility.md)

Wenn du spezifische Schwierigkeiten hast oder Unterstützung brauchst, sprich mich direkt an.

---

## Hintergrundlektüre: Globale Ungleichheit

Für einen inhaltlichen Einstieg in das Thema des Seminars empfehle ich:

**World Inequality Report 2026 - Executive Summary** — Kostenfrei online, auch auf Deutsch verfügbar.
Der Report gibt einen umfassenden Überblick über die globale Einkommens- und Vermögensungleichheit, regionale Unterschiede, historische Trends und politische Dimensionen. Er verwendet viele der Indikatoren, die wir im Seminar analysieren werden.

- [Executive Summary (Deutsch)](https://wir2026.wid.world/download/) ← PDF auf Deutsch herunterladen
- [Interaktive Zusammenfassung (Englisch)](https://wir2026.wid.world/insight/executive-summary/)

Die Lektüre der Zusammenfassung (~15–20 Seiten) ist eine hilfreiche Vorbereitung auf das Seminar — sie liefert den inhaltlichen Hintergrund für die Daten, mit denen wir arbeiten.

---

## Fehlerbehebung

**Etwas funktioniert nicht?** Das ist normal. Fehler gehören zum Programmieren dazu — auch für erfahrene Entwickler*innen.

Das ausführliche Fehlerbehebungsdokument ist dein erster Anlaufpunkt bei Problemen:

**[Fehlerbehebung und Wiederherstellung](resources/troubleshooting/reset_and_recover.md)**

Es behandelt unter anderem:
- R oder RStudio starten nicht
- „Datei nicht gefunden"-Fehler
- Pakete lassen sich nicht installieren
- „Das hat letzte Woche noch funktioniert" — systematisches Debuggen
- R Markdown lässt sich nicht knitten (sobald ihr Rmd im Kurs nutzt)

Außerdem: Eine kompakte Galerie der häufigsten Anfängerfehler mit Erklärungen und Lösungen: [Häufige Fehler](resources/other/common_errors.md)

Der Link zu diesem Dokument steht auch in der [Sitzungsanleitung](sessions/README.md) und an passenden Stellen im Repository.

**Du kommst nicht weiter?** Tipps, wie du eine gute Frage stellst und wo du nach Lösungen suchen kannst: [Um Hilfe bitten — richtig und effektiv](resources/troubleshooting/asking_for_help.md)

**Buddy-System:** Im Seminar arbeitest du mit einer Buddy-Partner*in zusammen. Wenn du feststeckst, ist dein Buddy die erste Anlaufstelle. Wie das genau funktioniert und wie ihr euch gegenseitig am besten helft: [Buddy-Leitfaden](resources/other/buddy_feedback_guide.md)

**Im Seminar fragen:** Ich bin während der Sitzungen verfügbar und komme gerne vorbei, um bei Problemen zu helfen.

---

## Wer noch nicht genug hat: Datacamp

Wenn ihr noch mehr R lernen wollt oder andere Statistik-Softwares ausprobieren wollt, könnt ihr mal Datacamp ausprobieren. Datacamp ist eine Online-Plattform mit Lernkursen für Statistiksoftware wie R, Python, und vieles mehr. Ihr müsst keine Mitgliedschaft abschließen oder etwas kündigen, sondern könnt bei Interesse das Angebot testen — Details siehe Link. Benutzt einfach mit eurer Uni-Mailadresse folgenden Link:

https://www.datacamp.com/groups/shared_links/563eb7dbab6c6e6c10a5239f80e181718e3b46f94d548c257f7540fdf3b25e86

Das Buch [R for Data Science](https://r4ds.hadley.nz) ist auch eine super Quelle, um weiter in R einzusteigen. Es ist online umsonst verfügbar.