# RStudio installieren & einrichten

> **Einrichtungsschritt 2 von 5**
> [1 · R installieren](install_r.md) → **2 · RStudio installieren** → [3 · Dateien & Ordner](working_with_files.md) → [4 · Projekt einrichten](project_setup.md) → [5 · Tastenkürzel zur Hand nehmen](../resources/cheatsheets/keyboard_shortcuts.md)

## Inhalt 

[Was ist RStudio?](#was-ist-rstudio) · [Windows](#windows) · [macOS](#macos) · [Erste Einstellungen](#rstudio-beim-ersten-start-einrichten) · [Die vier Bereiche](#die-vier-bereiche-von-rstudio) · [Pakete installieren](#pakete-installieren) · [FAQ](#faq)

---

## Was ist RStudio?

RStudio ist die Arbeitsoberfläche, in der du das gesamte Seminar über arbeiten wirst. Es ist ein so genanntes Integrated Development Environment (IDE); ein Programm, das speziell dafür entwickelt wurde, zu Programmieren und Skripte auszuführen. RStudio ist speziell dafür da, die Arbeit mit R komfortabler zu machen.

Ohne RStudio müsstest du deinen R-Code in einem einfachen Textfenster eintippen und könntest weder Grafiken sehen noch Dateien durchsuchen noch Hilfe abrufen — alles gleichzeitig jedenfalls nicht. RStudio gibt dir ein übersichtliches Fenster mit mehreren Bereichen: links schreibst du Code, rechts siehst du Grafiken, Dateien, Hilfe und deine Daten.

**Zur Erinnerung:** R ist der Motor, RStudio ist das Auto. Du hast den Motor (R) bereits installiert. Jetzt installierst du das Auto, in dem du den Rest des Semesters fahren wirst.

**Wichtig:** RStudio funktioniert nur, wenn R bereits installiert ist. Falls du R noch nicht installiert hast, gehe zuerst zu [R installieren](install_r.md).

---

## Windows

### Schritt 1 — Die Download-Seite öffnen

Öffne deinen Browser und gehe auf:

> **https://posit.co/download/rstudio-desktop/**

Posit ist die Firma, die RStudio entwickelt. Die kostenlose Version heißt **„RStudio Desktop (Free)"** — mehr brauchst du nicht.


### Schritt 2 — Den Download starten

Die Seite erkennt normalerweise automatisch dein Betriebssystem. Du siehst einen großen Button wie:

> **Download RStudio Desktop for Windows**

Klicke darauf. Eine `.exe`-Datei wird heruntergeladen.

Falls die Seite dein Betriebssystem nicht automatisch erkennt: Scrolle nach unten zur Tabelle mit allen Versionen und wähle die Zeile **Windows 10/11** aus.


### Schritt 3 — Die Installation starten

1. Öffne die heruntergeladene `.exe`-Datei (normalerweise im Ordner `Downloads`). Doppelklicke darauf.
2. Windows fragt möglicherweise: *„Möchten Sie zulassen, dass diese App Änderungen an Ihrem Gerät vornimmt?"* → Klicke **Ja**.


### Schritt 4 — Durch die Installation klicken

Klicke bei jedem Fenster auf **„Weiter" (Next)** und am Ende auf **„Installieren" (Install)** und dann **„Fertigstellen" (Finish)**.

Du musst nichts ändern. Die Standardeinstellungen sind richtig.


### Schritt 5 — RStudio zum ersten Mal öffnen

1. Klicke unten links auf das Windows-Startmenü
2. Tippe **RStudio** ein
3. Klicke auf **RStudio**, um es zu öffnen

RStudio sollte sich öffnen und ungefähr so aussehen:

```
┌──────────────────────────────────────────────────┐
│  Menüleiste  (File, Edit, Code, View, ...)       │
├────────────────────────┬─────────────────────────┤
│                        │  Environment / History   │
│  Console               │  (hier erscheinen deine │
│  (hier tippst du       │   Variablen und Daten)  │
│   Code ein und siehst  ├─────────────────────────┤
│   Ergebnisse)          │  Files / Plots / Help   │
│                        │  (Dateien, Grafiken,    │
│                        │   Hilfe-Seiten)         │
└────────────────────────┴─────────────────────────┘
```

Wenn du drei oder vier Bereiche siehst: Alles hat funktioniert.


### Schritt 6 — Testen, ob R richtig verbunden ist

In der **Console** (der Bereich unten links) sollte etwas stehen wie:

```
R version 4.x.x (2025-xx-xx) -- "..."
...
>
```

Das `>` ist die Eingabeaufforderung. Tippe folgendes ein und drücke **Enter**:

```r
1 + 1
```

Wenn die Antwort `[1] 2` erscheint: R und RStudio funktionieren zusammen. Yay!

Wenn stattdessen eine Fehlermeldung kommt oder die Console leer ist: Schau in die [Fehlerbehebung](../resources/troubleshooting/reset_and_recover.md).

---

## macOS

### Schritt 1 — Die Download-Seite öffnen

Öffne deinen Browser und gehe auf:

> **https://posit.co/download/rstudio-desktop/**


### Schritt 2 — Den Download starten

Die Seite erkennt normalerweise automatisch dein Betriebssystem. Du siehst einen großen Button wie:

> **Download RStudio Desktop for macOS**

Klicke darauf. Eine `.dmg`-Datei wird heruntergeladen.

Falls die Seite dein System nicht erkennt: Scrolle nach unten zur Tabelle und wähle die richtige macOS-Version.

**Keine Chip-Auswahl nötig:** Anders als bei R musst du hier nicht zwischen Apple Silicon (M1/M2/M3/M4) und Intel unterscheiden. RStudio wird als sogenanntes „Universal Binary" ausgeliefert, das auf beiden Chip-Typen nativ läuft. Es gibt nur eine Datei für macOS — die richtige ist also automatisch die, die du herunterlädst.


### Schritt 3 — Die Installation durchführen

1. Öffne die heruntergeladene `.dmg`-Datei (Doppelklick)
2. Ein Fenster öffnet sich, das das RStudio-Symbol und einen „Programme"-Ordner (Applications) zeigt
3. **Ziehe das RStudio-Symbol auf den Programme-Ordner** — das ist die gesamte Installation

Wenn macOS fragt, ob du die Datei wirklich öffnen möchtest (weil sie aus dem Internet stammt) → Klicke **„Öffnen"**.


### Schritt 4 — RStudio zum ersten Mal öffnen

1. Öffne den **Finder** → **Programme** (Applications)
2. Doppelklicke auf **RStudio**

Beim ersten Öffnen fragt macOS möglicherweise erneut, ob du die App öffnen möchtest → Klicke **„Öffnen"**.

RStudio sollte sich öffnen und ungefähr so aussehen:

```
┌──────────────────────────────────────────────────┐
│  Menüleiste  (File, Edit, Code, View, ...)       │
├────────────────────────┬─────────────────────────┤
│                        │  Environment / History   │
│  Console               │  (hier erscheinen deine │
│  (hier tippst du       │   Variablen und Daten)  │
│   Code ein und siehst  ├─────────────────────────┤
│   Ergebnisse)          │  Files / Plots / Help   │
│                        │  (Dateien, Grafiken,    │
│                        │   Hilfe-Seiten)         │
└────────────────────────┴─────────────────────────┘
```

Wenn du drei oder vier Bereiche siehst: Alles hat funktioniert.


### Schritt 5 — Testen, ob R richtig verbunden ist

In der **Console** (unten links) sollte die R-Version angezeigt werden. Tippe ein:

```r
1 + 1
```

Drücke **Enter**. Wenn `[1] 2` erscheint: Alles funktioniert.

---

## RStudio beim ersten Start einrichten

Bevor du mit dem Seminar loslegst, empfehlen wir eine einzige Einstellung zu ändern. Sie verhindert eine der häufigsten Fehlerquellen im gesamten Kurs:

### Workspace nicht automatisch speichern und laden

Standardmäßig speichert RStudio beim Schließen alle Variablen und Daten, die gerade im Speicher sind, und lädt sie beim nächsten Öffnen wieder. Das klingt praktisch, führt aber zu schwer nachvollziehbaren Fehlern: Dein Code funktioniert nur, weil alte Daten noch im Speicher liegen, nicht weil dein Skript korrekt ist.

**So änderst du die Einstellung:**

1. Öffne RStudio
2. Gehe zu **Tools → Global Options** (auf macOS: **RStudio → Preferences**)
3. Im Reiter **General → Basic:**
   - Setze **„Save workspace to .RData on exit"** auf **Never**
   - Entferne das Häkchen bei **„Restore .RData into workspace at startup"**
4. Klicke **OK** oder **Apply**

Das war's. Diese Einstellung stellt sicher, dass dein Code jedes Mal von Null startet — genau so, wie es für reproduzierbare Analysen sein soll.

RStudio lässt sich auch in Schriftart, Schriftgröße und Farbschema anpassen — das kann für Studierende mit Legasthenie oder ähnlichen Bedingungen einen großen Unterschied machen. Konkrete Empfehlungen zu Schriftarten, Themes, Autovervollständigung und weiteren Hilfsmitteln: [Zugänglichkeit: Hinweise für Studierende mit Legasthenie](resources/other/accessibility.md). Wenn du spezifische Schwierigkeiten hast oder Unterstützung brauchst, sprich mich direkt an.

---

## Die vier Bereiche von RStudio

Wenn du RStudio öffnest, siehst du standardmäßig drei Bereiche. Sobald du eine Datei öffnest (z. B. ein Skript), erscheint ein vierter. Hier eine Orientierung:

| Bereich | Position | Was passiert dort? |
|---------|----------|--------------------|
| **Source / Editor** | oben links | Hier schreibst du deine Skripte — das ist dein „Notizbuch" für Code |
| **Console** | unten links | Hier wird Code ausgeführt und Ergebnisse angezeigt |
| **Environment** | oben rechts | Zeigt alle Daten und Variablen, die gerade geladen sind |
| **Files / Plots / Help** | unten rechts | Dateibrowser, Grafiken, Hilfedokumentation |

Du wirst im Laufe des Semesters alle vier Bereiche kennenlernen. Am Anfang sind **Source** (oben links) und **Console** (unten links) am wichtigsten.

**Tipp:** Wenn der Source-Bereich (oben links) nicht sichtbar ist, öffne eine neue Datei: **File → New File → R Script** (oder drücke **Ctrl+Shift+N** auf Windows, **Cmd+Shift+N** auf macOS).

---

## Pakete installieren

R kommt mit einer Reihe von Grundfunktionen vorinstalliert — aber ein Großteil der Werkzeuge, die wir im Seminar verwenden, kommt aus sogenannten **Paketen**.

**Was ist ein Paket?**
Stell dir R wie ein Smartphone vor. Frisch aus der Schachtel kann es telefonieren und Nachrichten schicken — aber für alles andere installierst du Apps. Pakete sind diese Apps: Sie erweitern R um neue Funktionen, die nicht im Grundumfang enthalten sind. Das Paket `ggplot2` zum Beispiel fügt leistungsstarke Visualisierungsfunktionen hinzu. Das Paket `dplyr` macht das Filtern und Zusammenfassen von Daten viel einfacher.

Pakete werden einmalig installiert — ähnlich wie eine App. Danach müssen sie am Anfang jedes Skripts nur noch „aktiviert" werden (mit dem Befehl `library()`).

**Das Tidyverse**

Im Seminar arbeiten wir hauptsächlich mit dem **Tidyverse** — einer Sammlung von Paketen, die speziell für Datenanalyse entwickelt wurden und sehr gut zusammenarbeiten. Das Tidyverse enthält unter anderem:

| Paket | Wofür? |
|-------|--------|
| `dplyr` | Daten filtern, sortieren, zusammenfassen |
| `ggplot2` | Grafiken erstellen |
| `tidyr` | Daten umstrukturieren |
| `readr` | Daten einlesen (z. B. CSV-Dateien) |
| `stringr` | Mit Textvariablen arbeiten |
| `lubridate` | Mit Datumswerten arbeiten |

Um in R Pakete zu installieren, nutzen wir den Befehl `install.packages()`. Zum Beispiel kannst du mit `install.packages("tidyverse")` alle Tidyverse-Pakete auf einmal installieren.

**So installierst du das Tidyverse:**

1. Öffne RStudio
2. Klicke in die **Console** (unten links)
3. Tippe den folgenden Befehl und drücke **Enter**:

```r
install.packages("tidyverse")
```

4. R lädt nun alle nötigen Pakete herunter und installiert sie. Das kann **3–10 Minuten** dauern. Du siehst viele Zeilen Text — das ist normal. Warte, bis wieder das `>` erscheint.

5. Wenn die Installation abgeschlossen ist, teste sie:

```r
library(tidyverse)
```

Wenn keine Fehlermeldung erscheint (nur ein paar Hinweiszeilen, die mit `──` beginnen), hat die Installation funktioniert.

**Was bedeutet `library()`?**
`install.packages()` lädt ein Paket auf deinen Computer — das machst du einmalig. Du installierst die App, sozusagen. `library()` aktiviert es für die aktuelle Sitzung — das schreibst du an den Anfang jedes Skripts, das das Paket verwendet. So startest du die "App", um im Bild zu bleiben. Ohne `library()` weiß R nicht, dass es auf das Paket zugreifen soll, auch wenn es installiert ist.

**Wenn die Installation fehlschlägt:** Schau in die [Fehlerbehebung](../resources/troubleshooting/reset_and_recover.md). Häufige Ursachen sind eine zu alte R-Version oder fehlende Systemabhängigkeiten auf Windows.

---

## FAQ

**Muss ich für RStudio bezahlen?**
Nein. Die Version „RStudio Desktop (Free)" ist kostenlos. Es gibt kostenpflichtige Versionen für Unternehmen — die brauchst du nicht.

**Was ist der Unterschied zwischen R und RStudio?**
R ist die Programmiersprache und die Rechenmaschine. RStudio ist die Benutzeroberfläche, die du siehst und in der du arbeitest. Du brauchst beides, öffnest und arbeitest aber nur in RStudio.

**RStudio zeigt eine Fehlermeldung beim Start an.**
Wenn RStudio R nicht finden kann, erscheint eine Meldung wie *„R not found"* oder *„Unable to locate R"*. Das bedeutet, dass R entweder nicht installiert ist oder an einem unerwarteten Ort liegt. Installiere R erneut (siehe [R installieren](install_r.md)) und starte RStudio danach neu.

**Ich sehe nur drei Bereiche, nicht vier.**
Das ist normal. Der vierte Bereich (Source / Editor, oben links) erscheint erst, wenn du eine Datei öffnest oder ein neues Skript erstellst.

---

## Nächster Schritt 

[Dateien und Ordner verstehen](working_with_files.md)
