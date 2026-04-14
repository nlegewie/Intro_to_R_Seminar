# R installieren

> **Einrichtungsschritt 1 von 5**
> **1 · R installieren** → [2 · RStudio installieren](install_rstudio.md) → [3 · Dateien & Ordner](working_with_files.md) → [4 · Projekt einrichten](project_setup.md) → [5 · Tastenkürzel zur Hand nehmen](../resources/cheatsheets/keyboard_shortcuts.md)

## Inhalt

[Was ist R?](#was-ist-r) · [Installation für Windows](#windows) · [Installation für macOS](#macos) · [FAQ](#faq)

---

## Was ist R?

R ist eine Programmiersprache für Datenanalyse und Statistik. Wenn du eine Tabelle mit Daten hast — z. B. Bevölkerungszahlen, Einkommen oder CO₂-Emissionen für verschiedene Länder — dann ist R das Werkzeug, mit dem du diese Daten einliest, bereinigst, analysierst und daraus Grafiken erstellst.

R ist kostenlos, wird weltweit in der Wissenschaft verwendet, und du brauchst keine Programmiererfahrung, um es zu lernen. Genau dafür ist dieses Seminar da.

**Wichtig:** R ist die Sprache, die im Hintergrund läuft — die „Rechenmaschine". Du wirst R aber fast nie direkt öffnen. Stattdessen arbeitest du mit RStudio, einer komfortablen Benutzeroberfläche. Trotzdem muss R zuerst installiert sein, weil RStudio darauf aufbaut.

**Analogie:** R ist der Motor. RStudio ist das Auto mit Lenkrad, Tacho und Sitzen. Du steigst ins Auto (RStudio), aber ohne Motor (R) fährt nichts.

---

## Windows

### Schritt 1 — Die Download-Seite öffnen

Öffne deinen Browser (z. B. Chrome, Firefox, Edge) und gehe auf:

> **https://cran.r-project.org/**

Die Seite sieht altmodisch aus — das ist normal. CRAN ist das offizielle Archiv für R.


### Schritt 2 — Den richtigen Download wählen

Klicke auf den Link:

> **Download R for Windows**

Auf der nächsten Seite klicke auf:

> **base**

Dann klicke auf den Link, der so ähnlich aussieht wie:

> **Download R-4.x.x for Windows**

(Die genaue Versionsnummer ändert sich — nimm immer die neueste.)

Eine `.exe`-Datei wird heruntergeladen. Warte, bis der Download abgeschlossen ist.


### Schritt 3 — Die Installation starten

1. Öffne die heruntergeladene Datei (normalerweise im Ordner `Downloads`). Doppelklicke darauf.
2. Windows fragt möglicherweise: *„Möchten Sie zulassen, dass diese App Änderungen an Ihrem Gerät vornimmt?"* → Klicke **Ja**.
3. Ein Installationsfenster öffnet sich.


### Schritt 4 — Durch die Installation klicken

Du wirst durch mehrere Fenster geführt. **Klicke bei jedem Fenster einfach auf „Weiter" (Next) bzw. „Fertigstellen" (Finish)**. Du musst nichts ändern — die Standardeinstellungen sind richtig.

Im Einzelnen:
- **Sprache wählen:** Deutsch oder Englisch — egal, das betrifft nur den Installer
- **Lizenzvereinbarung:** Auf „Weiter" klicken
- **Installationsort:** Nicht ändern, auf „Weiter" klicken
- **Komponenten:** Nicht ändern, auf „Weiter" klicken
- **Startmenü:** Nicht ändern, auf „Weiter" klicken
- **Zusätzliche Aufgaben:** Nicht ändern, auf „Weiter" klicken
- Am Ende: **„Fertigstellen"** klicken


### Schritt 5 — Überprüfen, ob es geklappt hat

Du musst R jetzt noch nicht öffnen. Es reicht, wenn du überprüfst, dass die Installation erfolgreich war:

1. Klicke unten links auf das Windows-Startmenü (das Windows-Symbol)
2. Tippe `R` ein
3. Es sollte ein Programm namens **„R x.x.x"** oder **„R for Windows"** auftauchen

Wenn du es siehst: Alles gut. Schließe es wieder — du wirst R nie direkt öffnen, sondern immer über RStudio arbeiten.

Wenn du es nicht siehst: Versuche die Installation erneut, oder schau in die [Fehlerbehebung](../resources/troubleshooting/reset_and_recover.md).

---

## macOS

### Schritt 1 — Die Download-Seite öffnen

Öffne deinen Browser (z. B. Safari, Chrome, Firefox) und gehe auf:

> **https://cran.r-project.org/**


### Schritt 2 — Den richtigen Download wählen

Klicke auf den Link:

> **Download R for macOS**

Auf der nächsten Seite siehst du mehrere `.pkg`-Dateien. **Welche du brauchst, hängt von deinem Mac ab:**

**Wie findest du heraus, welchen Mac du hast?**
1. Klicke oben links auf das Apple-Symbol → **„Über diesen Mac"**
2. Dort steht entweder:
   - **„Chip: Apple M1"** (oder M2, M3, M4) → du hast einen **Apple-Silicon-Mac**
   - **„Prozessor: Intel …"** → du hast einen **Intel-Mac**

**Dann wähle die richtige Datei:**
- Apple Silicon (M1/M2/M3/M4): Die Datei, die `arm64` im Namen hat
- Intel: Die Datei, die `x86_64` im Namen hat

Wenn du dir nicht sicher bist: Die Datei für Apple Silicon funktioniert auf neueren Macs (ab ca. 2020). Die Intel-Datei funktioniert auf älteren Macs.


### Schritt 3 — Die Installation starten

1. Öffne die heruntergeladene `.pkg`-Datei (normalerweise im Ordner `Downloads`). Doppelklicke darauf.
2. Ein Installationsfenster öffnet sich.


### Schritt 4 — Durch die Installation klicken

Klicke bei jedem Fenster auf **„Fortfahren" (Continue)** und am Ende auf **„Installieren" (Install)**. Du musst nichts ändern.

- macOS fragt nach deinem Passwort → Gib dein Mac-Anmeldepasswort ein und klicke auf **„Software installieren"**
- Am Ende: **„Schließen"** klicken
- macOS fragt möglicherweise, ob du das Installationsprogramm in den Papierkorb legen möchtest → Klicke **„In den Papierkorb legen"** — die Datei wird nicht mehr gebraucht


### Schritt 5 — Überprüfen, ob es geklappt hat

1. Öffne den **Finder**
2. Gehe zu **Programme** (Applications)
3. Dort sollte ein Ordner oder ein Programm namens **„R"** auftauchen

Wenn du es siehst: Alles gut. Du musst R nicht öffnen — du wirst es immer über RStudio verwenden.

Wenn du es nicht siehst: Versuche die Installation erneut, oder schau in die [Fehlerbehebung](../resources/troubleshooting/reset_and_recover.md).

---

## FAQ

**Muss ich für R bezahlen?**
Nein. R ist kostenlos und Open Source.

**Ich habe schon eine ältere Version von R. Muss ich updaten?**
Wenn deine Version 4.0 oder neuer ist, musst du nicht unbedingt updaten. Allerdings kann es sein, dass bestimmte Pakete[^1] nicht installiert werden können, wenn deine R-Version älter ist.

Wenn du dir unsicher bist, installiere einfach die neueste Version — sie wird neben der alten installiert und ersetzt sie nicht automatisch.

**Kann ich R auf einem Tablet oder Chromebook installieren?**
Nein, R läuft nur auf Windows, macOS und Linux. Du brauchst einen Laptop oder Desktop-Computer. Für die Teilnahme am Seminar ist ein Laptop erforderlich, da du sonst in den Sitzungen keine Aufgaben bearbeiten kannst.

**Der Download ist sehr langsam.**
CRAN hat „Spiegel" (Mirror-Server) in verschiedenen Ländern. Wenn der Download langsam ist, gehe zurück auf https://cran.r-project.org/ und wähle einen Spiegel in Deutschland oder einem Nachbarland.

---

[^1]: Pakete sind R-Komponenten, die wir zusätzlich installieren, um bestimmte Funktionen zu nutzen — zum Beispiel für Grafiken oder Datenbereinigung. Du lernst das im Seminar.

## Nächster Schritt

Weiter geht's mit: [RStudio installieren](install_rstudio.md)
