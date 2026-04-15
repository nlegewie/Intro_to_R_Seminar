# Globale Ungleichheit — Eine Einführung in die statistische Datenauswertung mit R

Herzlich Willkommen im Seminar "Globale Ungleichheit – Eine Einführung in die statistische Datenauswertung mit R". Das Seminar führt in die statistische Datenanalyse mit der Programmiersprache R ein, anhand des Themas globale Ungleichheit.

Dieses Repository ist deine zentrale Anlaufstelle für das gesamte Seminar. Hier findest du alle Materialien, die du brauchst: Installationsanleitungen für die nötige Software (R und RStudio), Sitzungsunterlagen, Datensätze, Übungen, Hausaufgaben und Referenzmaterialien.

Du musst GitHub nicht kennen und kein Git benutzen. Alles funktioniert auch, wenn du die Dateien einfach herunterlädst.

**Etwas funktioniert nicht?** Direkt zur [Fehlerbehebung und Wiederherstellung](resources/troubleshooting/reset_and_recover.md) — diese Seite hilft dir bei den häufigsten Problemen, Schritt für Schritt.

---

## Inhaltsverzeichnis

- [Hier geht's los — was du als Erstes tun solltest](#start-hier)
- [Was ist dieses Repository?](#was-ist-dieses-repository)
- [Wie du die Dateien herunterlädst](#wie-du-die-dateien-herunterlädst)
- [Aufbau des Repositorys](#aufbau-des-repositorys)
- [Weitere Referenzmaterialien](#weitere-referenzmaterialien)
- [Wie das Seminar funktioniert](#wie-das-seminar-funktioniert)
- [Kern- und Bonusaufgaben](#kern--und-bonusaufgaben)
- [Tastaturkürzel](#tastaturkürzel)
- [Zugänglichkeit: Hinweise für Studierende mit Legasthenie oder ähnlichen Bedingungen](#zugänglichkeit)
- [Hintergrundlektüre: Globale Ungleichheit](#hintergrundlektüre)
- [Fehlerbehebung](#fehlerbehebung)

---

## Hier geht's los

Für den Einstieg gibt es fünf Einrichtungsschritte, die du einmalig in dieser Reihenfolge durchführst. Danach kannst du losziehen in dein Rbenteuer (get it? get it?).


> **Einrichtungsreihenfolge:**

> [1 · R installieren](setup/install_r.md) → [2 · RStudio installieren](setup/install_rstudio.md) → [3 · Dateien & Ordner verstehen](setup/working_with_files.md) → [4 · Projekt einrichten](setup/project_setup.md) → [5 · Tastenkürzel zur Hand nehmen](resources/cheatsheets/keyboard_shortcuts.md)


**Schritt 1 — R installieren**

R ist die Programmiersprache, die im Hintergrund läuft. Sie muss zuerst installiert werden, bevor du RStudio verwenden kannst.
→ [R installieren (Windows und macOS)](setup/install_r.md)

**Schritt 2 — RStudio installieren**

RStudio ist die Arbeitsoberfläche, in der du das gesamte Semester arbeitest. Setzt R (Schritt 1) voraus.
→ [RStudio installieren (Windows und macOS)](setup/install_rstudio.md)


**Schritt 3 — Dateien und Ordner verstehen**

Bevor du loslegst: Wo du Dateien speicherst und wie Pfade funktionieren, ist eine der häufigsten Fehlerquellen im Seminar. Dieser kurze Überblick spart später viel Frustration.
→ [Dateien und Ordner verstehen](setup/working_with_files.md)


**Schritt 4 — Dein Arbeitsprojekt einrichten**

Du richtest einmalig dein eigenes RStudio-Projekt ein — der Ordner, in dem alle deine Analysen, Hausaufgaben und der Abschlussbericht entstehen. Sitzungsübungen machst du in den Sitzungsordnern (`sessions/session_XX/`), alles Eigene im Arbeitsprojekt.
→ [Projekt einrichten](setup/project_setup.md)


**Schritt 5 — Tastaturkürzel und Paket-Cheatsheets zur Hand nehmen**

Tastaturkürzel sparen von Anfang an Zeit. Die Paket-Cheatsheets sind dein Nachschlagewerk für den Rest des Semesters.
→ [Tastaturkürzel](resources/cheatsheets/keyboard_shortcuts.md)
→ [Tidyverse-Cheatsheets (alle Pakete)](resources/cheatsheets/tidyverse_cheatsheets.md)


Wenn du bei einem Schritt nicht weiterkommst: [Fehlerbehebung](resources/troubleshooting/reset_and_recover.md)

---

## Was ist dieses Repository?

Ein GitHub-Repository ist nichts anderes als ein strukturierter Ordner im Internet, aus dem du Dateien herunterladen kannst. Du musst nicht verstehen, wie GitHub funktioniert. Du musst keine Befehle eintippen. Du lädst die Dateien herunter — fertig.

Dieses Repository enthält alle Materialien für das Seminar. Als Datenbasis dient der [Our World in Data](https://ourworldindata.org)-Datensatz mit Daten zu fast 200 Ländern über mehrere Jahrzehnte.

Am Ende des Semesters wirst du in der Lage sein, echte Daten zu importieren, zu bereinigen, zu analysieren und zu visualisieren — und deine Ergebnisse in einem professionellen, reproduzierbaren Dokument zu präsentieren.

---

## Wie du die Dateien herunterlädst

Bevor du etwas herunterlädst: Eine wichtige Unterscheidung, die du von Anfang an verstehen solltest.

Dieses Repository enthält die **Kursmaterialien** — Sitzungsunterlagen, Codebeispiele, Referenzdokumente. Du arbeitest in den Sitzungen direkt in den Sitzungsordnern (`sessions/session_XX/`). Das ist in Ordnung, weil Übungen kurzlebige Scratch-Arbeit sind — du brauchst sie danach nicht mehr.

Was du hier **nicht** ablegen solltest: alles, was du langfristig behalten willst. Hausaufgaben, laufende Analysen und der Abschlussbericht gehören in dein separates Arbeitsprojekt, das du einmalig an einem anderen Ort einrichtest. Die Anleitung dafür findest du unter [Projekteinrichtung](setup/project_setup.md).

Diese Trennung ist wichtig, weil die Kursmaterialien im Laufe des Semesters wöchentlich ergänzt werden. Wenn du den Ordner neu herunterlädst, werden Änderungen in Sitzungsordnern überschrieben — dein Arbeitsprojekt an einem anderen Ort bleibt davon unberührt.

**Gesamte Kursmaterialien herunterladen**

1. Klicke oben auf der GitHub-Seite auf den grünen Button **„Code"**
2. Wähle **„Download ZIP"**
3. Entpacke die ZIP-Datei an einem sinnvollen Ort — Tipps dazu findest du in [Dateien und Ordner verstehen](setup/working_with_files.md)

Du musst Git nicht installieren. Du musst nichts eintippen. Der Download funktioniert wie jede andere Datei aus dem Internet.

**Neue Sitzungsunterlagen aufrufen**

Jede Woche kommen neue Sitzungsmaterialien hinzu. Du hast zwei Möglichkeiten:

*Einfacher Weg:* Der Dozent teilt zu Beginn jeder Sitzung einen direkten Link zum Sitzungsordner auf GitHub. Du kannst Anweisungen und Codebeispiele direkt im Browser lesen — ohne herunterzuladen.

*Wenn du offline arbeiten möchtest:* Lade das vollständige ZIP erneut herunter und entpacke es in deinen Kursmaterialien-Ordner (aber nicht in dein Arbeitsprojekt). Da jede Sitzung einen eigenen nummerierten Ordner hat, überschreibt nichts, was schon da war.

**Mit Git arbeiten (optional, für Fortgeschrittene)**

Wenn du Git kennst, kannst du das Repository klonen und mit `git pull` jede Woche automatisch aktualisieren:
```
git clone https://github.com/[dozent/repo-name].git
```
Das ist aber kein Muss. Alle Inhalte funktionieren ohne Git.

---

## Aufbau des Repositorys

```
/
├── README.md                    ← du bist hier
├── syllabus/                    ← Syllabus und Kursübersicht
├── setup/                       ← Installation und Einrichtung (hier starten!)
├── sessions/                    ← Unterlagen für jede Sitzung
│   ├── session_01/
│   ├── session_02/
│   └── ...
├── homework/                    ← Hausaufgaben
│   ├── hw_01/
│   └── ...
├── final_report/                ← Anleitung und Vorlage für den Abschlussbericht
├── core_project/                ← Projektvorlage: einmalig kopieren, dann außerhalb des Repo-Ordners arbeiten
├── core_project_snapshots/      ← Rettungsanker: vollständige Versionen nach jeder Sitzung
└── resources/                   ← Referenzmaterialien, Hilfe, Nachschlagen
    ├── troubleshooting/         ← Fehlerbehebung (bei Problemen hier suchen)
    ├── cookbooks/               ← Rezeptbücher: Codebeispiele zum Nachschlagen
    ├── cheatsheets/             ← Kurzübersichten: Tastaturkürzel + alle Tidyverse-Pakete
    └── other/                   ← Leitfäden, Erklärungen, Code-Stil, KI-Nutzung
```

**Die wichtigste Unterscheidung:**

| Ordner | Zweck |
|--------|-------|
| `sessions/` | Sitzungsunterlagen mit Übungen und Beispieldatensätzen — hier arbeitest du während der Sitzung; Übungen sind kurzlebig und müssen nicht aufbewahrt werden |
| `core_project/` | Vorlage für dein Arbeitsprojekt — du kopierst diesen Ordner einmalig an einen anderen Ort und arbeitest dort |
| `core_project_snapshots/` | Vollständige, funktionierende Versionen des Projekts nach jeder Sitzung — als Rettungsanker |

**Das Wichtigste:** Deine eigene Arbeit findet nicht in diesem heruntergeladenen Ordner statt, sondern in deiner eigenen Kopie des Projekts, die du separat auf deinem Computer einrichtest. Die [Projekteinrichtung](setup/project_setup.md) führt dich Schritt für Schritt durch diesen Prozess.

---

## Weitere Referenzmaterialien

Im Ordner `resources/other/` findest du Leitfäden und Erklärungen, die im Laufe des Semesters relevant werden:

| Dokument | Inhalt |
|----------|--------|
| [Häufige Fehler](resources/other/common_errors.md) | Galerie typischer Anfängerfehler mit Erklärungen und Lösungen |
| [Interpretation von Grafiken und Tabellen](resources/other/interpretation_workflow.md) | Schritt-für-Schritt-Anleitung: beschreiben → vergleichen → deuten → einordnen |
| [Code-Stil und Kommentare](resources/other/code_style.md) | Warum Code-Stil wichtig ist, wie du sinnvoll kommentierst, und wie `styler` automatisch formatiert |
| [Buddy-Leitfaden](resources/other/buddy_feedback_guide.md) | Wie das Buddy-System funktioniert und wie ihr euch gegenseitig am besten helft |
| [Verantwortungsvoller Umgang mit KI](resources/other/using_genai.md) | Was erlaubt ist, was nicht, und wie du KI sinnvoll zum Lernen einsetzt |
| [Zugänglichkeit](resources/other/accessibility.md) | Hinweise zu Schriftarten, Themes und Hilfsmitteln für Studierende mit Legasthenie |

---

## Wie das Seminar funktioniert

Jede Sitzung folgt demselben Grundprinzip:

1. **Besprechung Hausaufgaben**: Hier besprechen wir mögliche Schwierigkeiten, die ihr mit Übungen der letzten Sitzung hattet
2. **Sitzungsordner öffnen** (`sessions/session_XX/`) — dort findest du Anweisungen und Übungen für die jeweilige Sitzung
3. **Übungen durchführen** — mit einem kleinen, übersichtlichen Datensatz direkt im Sitzungsordner
4. **Analyse im Kernprojekt** — das Gelernte auf den echten OWID-Datensatz anwenden
5. **Hausaufgaben** — die Analyse zu Hause fertigstellen und einreichen

Jede Sitzung enthält:
- `instructions.md` — Schritt-für-Schritt-Anleitung für die Sitzung
- `exercises.md` — Übungsaufgaben
- `scripts/` — R-Skripte für die Sitzung
- `data/` — der Übungsdatensatz für diese Sitzung
- `solutions_optional/` — optionale Musterlösungen (werden nach der Sitzung oder nach der Abgabefrist veröffentlicht)

**Wenn du eine Sitzung verpasst hast oder etwas nicht funktioniert:** Im Ordner `core_project_snapshots/` findest du vollständige, funktionierende Versionen des Kernprojekts nach jeder Woche. Du kannst damit jederzeit dort weitermachen, wo du sein solltest — ohne den verpassten Stoff manuell nacharbeiten zu müssen.

---

## Kern- und Bonusaufgaben

Ab Sitzung 7 ist jede Sitzung, jede Hausaufgabe und der Abschlussbericht in zwei Tracks unterteilt:

**Kernaufgaben** sind Pflicht — für alle Studierenden. Sie sind so konzipiert, dass du sie in der Sitzungszeit abschließen kannst, auch wenn dir der Stoff nicht so leicht fällt. Das erfolgreiche Abschließen der Kernaufgaben ist die Grundlage für die Benotung.

**Bonusaufgaben** sind freiwillig — für Studierende, die schneller durchkommen oder tiefer einsteigen wollen. Sie vertiefen das Verständnis, führen weiterführende Techniken ein oder stellen offenere Herausforderungen. Sie bereichern den Abschlussbericht, sind aber nicht Voraussetzung für eine gute Note.

Die Unterscheidung ist in jeder Sitzung, jeder Hausaufgabe und im Abschlussbericht klar gekennzeichnet.

---

## Tastaturkürzel

Tastaturkürzel sparen enorm viel Zeit und reduzieren Frustration. Wir empfehlen, die wichtigsten von Anfang an zu lernen.

Die vollständige Übersicht: [RStudio-Tastaturkürzel](resources/cheatsheets/keyboard_shortcuts.md)

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
- Kernprojekt aus einem Snapshot wiederherstellen

Außerdem: Eine kompakte Galerie der häufigsten Anfängerfehler mit Erklärungen und Lösungen: [Häufige Fehler](resources/other/common_errors.md)

Der Link zu diesem Dokument steht auch in jeder Sitzungsanleitung und im Kernprojekt.

**Du kommst nicht weiter?** Tipps, wie du eine gute Frage stellst und wo du nach Lösungen suchen kannst: [Um Hilfe bitten — richtig und effektiv](resources/troubleshooting/asking_for_help.md)

**Buddy-System:** Im Seminar arbeitest du mit einer Buddy-Partner*in zusammen. Wenn du feststeckst, ist dein Buddy die erste Anlaufstelle. Wie das genau funktioniert und wie ihr euch gegenseitig am besten helft: [Buddy-Leitfaden](resources/other/buddy_feedback_guide.md)

**Im Seminar fragen:** Ich bin während der Sitzungen verfügbar und komme gerne vorbei, um bei Problemen zu helfen.
