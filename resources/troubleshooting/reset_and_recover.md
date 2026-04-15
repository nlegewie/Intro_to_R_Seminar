# Fehlerbehebung und Wiederherstellung

Hier bist du richtig, wenn etwas nicht funktioniert. Such dir dein Problem in der Tabelle unten, springe zum passenden Abschnitt und folge der Anleitung.

**Wichtig:** Die meisten Fehler lassen sich lösen. Frustration ist normal — auch erfahrene Programmierer*innen verbringen Zeit mit Fehlersuche. Das gehört dazu.

---

## Schnellnavigation

| Was passiert? | Direkt zur Sektion |
|---------------|--------------------|
| R oder RStudio starten nicht | [→ Installation und Start](#r-oder-rstudio-startet-nicht) |
| RStudio findet R nicht | [→ R nicht gefunden](#rstudio-findet-r-nicht) |
| „Datei nicht gefunden" oder `cannot open file` | [→ Datei nicht gefunden](#datei-nicht-gefunden) |
| `could not find function` | [→ Funktion nicht gefunden](#could-not-find-function) |
| `object not found` | [→ Objekt nicht gefunden](#object-not-found) |
| Paket lässt sich nicht installieren | [→ Paketprobleme](#paket-lässt-sich-nicht-installieren) |
| `library()` schlägt fehl | [→ Paketprobleme](#paket-lässt-sich-nicht-installieren) |
| Code hat letzte Woche funktioniert, heute nicht mehr | [→ Umgebung zurücksetzen](#code-hat-letzte-woche-funktioniert-heute-nicht) |
| R Markdown lässt sich nicht knitten | [→ Knit-Fehler](#r-markdown-lässt-sich-nicht-knitten) |
| Projekt ist kaputt — ich will von vorne anfangen | [→ Snapshot wiederherstellen](#kernprojekt-aus-snapshot-wiederherstellen) |

---

## R oder RStudio startet nicht

### Windows

1. Klicke unten links auf das **Startmenü** und tippe `RStudio` in das Suchfenster ein.
2. Wenn RStudio nicht erscheint: Öffne den **Datei-Explorer** → navigiere zu `C:\Programme\RStudio\bin\` → doppelklicke `rstudio.exe`
3. Wenn das auch nicht funktioniert: Deinstalliere RStudio über **Einstellungen → Apps** und installiere es neu: [RStudio installieren](../../setup/install_rstudio.md)

### macOS

1. Öffne **Finder → Programme** → doppelklicke **RStudio**
2. Wenn macOS meldet, dass die App beschädigt ist oder nicht geöffnet werden kann: Gehe zu **Systemeinstellungen → Datenschutz & Sicherheit** → scrolle nach unten → klicke **„Trotzdem öffnen"**
3. Wenn das nicht hilft: Ziehe RStudio aus dem Programme-Ordner in den Papierkorb und installiere es neu: [RStudio installieren](../../setup/install_rstudio.md)

---

## RStudio findet R nicht

**Symptom:** Beim Start von RStudio erscheint eine Meldung wie *„R not found"*, *„Unable to locate R installation"* oder die Console bleibt leer und zeigt kein `>`.

**Ursache:** R ist entweder nicht installiert, oder es wurde an einem ungewöhnlichen Ort installiert.

**Lösung:**

1. Prüfe, ob R installiert ist:
   - Windows: Startmenü → tippe `R` → siehst du „R for Windows"?
   - macOS: Finder → Programme → siehst du einen Ordner oder eine App namens „R"?

2. Wenn R nicht erscheint: Installiere R neu: [R installieren](../../setup/install_r.md)

3. Wenn R installiert ist, aber RStudio es trotzdem nicht findet:
   - Windows: Öffne RStudio → `Tools → Global Options → General → R version` → klicke **Change** → wähle die installierte Version
   - macOS: RStudio sollte R automatisch finden — wenn nicht, deinstalliere R und installiere es erneut

---

## Datei nicht gefunden

**Symptome:** Eine der folgenden Fehlermeldungen:
```
Error in file(con, "r") : cannot open the connection
Error: cannot open file 'data/owid_data.csv': No such file or directory
Warning message: In read.csv(...) : file not found
```

Das ist einer der häufigsten Fehler — und er hat fast immer eine von drei Ursachen. Die Lösung hängt davon ab, wo du gerade arbeitest: in den **Sitzungsübungen** (im Kursmaterialien-Ordner) oder in deinem **Arbeitsprojekt** (für Hausaufgaben und den Abschlussbericht).

### Ursache 1: Du hast eine .R-Datei direkt geöffnet, ohne den zugehörigen Ordner als Kontext zu setzen

**Test:** Schau in die obere rechte Ecke von RStudio. Steht dort `Project: (None)`?

Wenn ja, weiß RStudio nicht, von wo aus es relative Pfade wie `data/owid_data.csv` auflösen soll.

**Wenn du gerade Sitzungsübungen machst:**
1. Schließe RStudio
2. Navigiere im Datei-Explorer (Windows) oder Finder (macOS) zum Sitzungsordner, z. B. `kursmaterialien/sessions/session_03/`
3. Öffne dort die Skriptdatei — RStudio startet ohne Projektzugehörigkeit, aber du kannst das Arbeitsverzeichnis manuell setzen:
```r
setwd("pfad/zum/sitzungsordner")
```
Oder noch besser: Nutze direkt den **Files-Browser** in RStudio (unten rechts), navigiere zum Sitzungsordner, und klicke auf **More → Set As Working Directory**.

**Wenn du im Arbeitsprojekt arbeitest:**
1. Schließe RStudio
2. Navigiere zu deinem Projektordner (`mein_projekt/` oder wie du ihn benannt hast)
3. Doppelklicke auf die **`.Rproj`-Datei** — RStudio öffnet sich mit dem richtigen Kontext

### Ursache 2: Die Datei liegt nicht dort, wo der Code sie erwartet

**Test:** Führe in der Console aus:
```r
list.files("data")
```
Siehst du die erwartete Datei in der Ausgabe? Wenn nicht, stimmt entweder der Ordnername oder der Dateiname nicht.

**Lösung:**
- Öffne den **Files-Browser** in RStudio (unten rechts) und prüfe, ob die Datei im richtigen Unterordner liegt
- Bei Sitzungsübungen: Die Datei sollte in `sessions/session_XX/data/` liegen
- Im Arbeitsprojekt: Die Datei sollte in `mein_projekt/data/` liegen
- Wenn die Datei woanders liegt: Kopiere sie in den richtigen Ordner

### Ursache 3: `here()` wird nicht geladen (nur im Arbeitsprojekt relevant)

Im Arbeitsprojekt verwenden wir `here()` für Dateipfade. Dafür muss das Paket geladen sein. Stelle sicher, dass am Anfang deines Skripts steht:
```r
library(here)
```
Ohne diesen Befehl kennt R die Funktion `here()` nicht. In Sitzungsübungen verwenden wir `here()` nicht — dort werden Pfade direkt relativ zum Sitzungsordner angegeben.

---

## `could not find function`

**Symptom:**
```
Error in ...: could not find function "filter"
Error in ...: could not find function "ggplot"
Error in ...: could not find function "read_csv"
```

**Ursache:** Das Paket, das diese Funktion enthält, wurde nicht geladen.

**Lösung:**

1. Stelle sicher, dass am Anfang deines Skripts steht:
```r
library(tidyverse)
```

2. Führe diese Zeile aus (markieren + Enter, oder Cursor in die Zeile + Ctrl/Cmd + Enter)

3. Falls `library(tidyverse)` selbst einen Fehler wirft: Schau in den Abschnitt [Paketprobleme](#paket-lässt-sich-nicht-installieren)

**Häufige Verwechslung:** `read_csv()` (aus `readr`, Teil des Tidyverse) vs. `read.csv()` (aus Basis-R). Wenn du `read_csv` nicht findest, aber `library(tidyverse)` geladen hast: Prüfe die Schreibweise.

---

## `object not found`

**Symptom:**
```
Error: object 'owid_data' not found
Error: object 'mein_plot' not found
```

**Ursache:** Die Variable wurde noch nicht erstellt — entweder wurde die entsprechende Zeile nicht ausgeführt, oder R wurde neu gestartet und der Speicher wurde geleert.

**Lösung:**

1. **R neu starten und Skript komplett von oben ausführen:**
   - R neu starten: Ctrl+Shift+F10 (Windows) / Cmd+Shift+F10 (macOS)
   - Dann: Ctrl+Shift+Enter (Windows) / Cmd+Shift+Enter (macOS) — führt das gesamte Skript aus

2. Wenn der Fehler dann immer noch auftritt: Die Variable wird nirgends in deinem Skript definiert. Schau, wo die Variable erstellt werden sollte, und stelle sicher, dass diese Zeile fehlerfrei ausgeführt wird.

**Merkregel:** R weiß nur, was es in der aktuellen Sitzung ausgeführt hat. Nach einem Neustart ist der Speicher leer — das Skript muss von vorne laufen.

---

## Paket lässt sich nicht installieren

### Fehlermeldung beim `install.packages()`

**Häufige Fehlermeldungen und ihre Bedeutung:**

| Fehlermeldung | Bedeutung | Lösung |
|---------------|-----------|--------|
| `Warning: unable to access index for repository` | Keine Internetverbindung oder CRAN nicht erreichbar | Internetverbindung prüfen; anderen CRAN-Spiegel wählen |
| `installation of package ... had non-zero exit status` | Installation fehlgeschlagen, oft fehlende Systemabhängigkeiten | Siehe unten |
| `package ... is not available for R version ...` | R-Version zu alt | R auf neueste Version aktualisieren: [R installieren](../../setup/install_r.md) |
| `Error in loadNamespace(...)` | Abhängiges Paket fehlt oder ist inkompatibel | Paket deinstallieren und neu installieren |

### Wenn die Installation abbricht (Windows)

Manchmal schlägt die Installation unter Windows fehl, weil Pakete C++-Compiler brauchen.

**Lösung:** Installiere **Rtools**:
1. Gehe auf https://cran.r-project.org/bin/windows/Rtools/
2. Lade die Version für deine R-Version herunter und installiere sie
3. Versuche danach `install.packages("tidyverse")` erneut

### Wenn `library()` nach erfolgreicher Installation fehlschlägt

```
Error in library(tidyverse) : there is no package called 'tidyverse'
```

Das Paket wurde möglicherweise in einer anderen R-Version installiert. Versuche:
```r
install.packages("tidyverse")
```
und dann erneut `library(tidyverse)`.

---

## Code hat letzte Woche funktioniert, heute nicht

Das ist der klassische „es hat doch letzte Woche noch geklappt"-Fehler. Ursache ist fast immer eine **"verschmutzte" R-Umgebung**: Variablen oder Pakete aus einer früheren Sitzung sind noch im Speicher und verbergen das eigentliche Problem.

**Standard-Lösung: R neu starten und Skript komplett (oder bis zu dem Punkt, an dem du gerade warst) ausführen**

1. R-Sitzung komplett neu starten:
   - **Ctrl+Shift+F10** (Windows) / **Cmd+Shift+F10** (macOS)
   - Oder: Session → Restart R

2. Gesamtes Skript von oben nach unten (oder bis zur Stelle, an der du gerade arbeitest) ausführen:
   - Gesamtes Skript: **Ctrl+Shift+Enter** (Windows) / **Cmd+Shift+Enter** (macOS)
   - Bis zu bestimmter Stelle: Markiere allen Text im Skript von der Stelle, an der du gerade Arbeitest bis oben zum Anfang des Skripts, und drücke dann **Ctrl+Enter** (Windows) bzw. **CMD + Enter** (macOS)

3. Wenn ein Fehler auftritt: Lies die Fehlermeldung genau. Sie sagt dir, in welcher Zeile das Problem liegt.

**Warum passiert das?** Wenn du Code stückweise ausführst (Zeile für Zeile), können Variablen aus einer früheren Sitzung im Speicher bleiben und deinen Code „zufällig" zum Laufen bringen — obwohl dein Skript eigentlich unvollständig ist. Ein Neustart deckt solche Probleme auf.

**Langfristige Lösung:** Teste dein Skript regelmäßig mit einem frischen Neustart, bevor du es abgibst.

---

## R Markdown lässt sich nicht knitten

### Fehlermeldung im Knit-Fenster

Wenn du auf **Knit** klickst und ein Fehler auftritt, erscheint unten in RStudio ein rotes Fenster mit der Fehlermeldung.

**Wichtig:** Der Knit-Prozess läuft in einer komplett neuen, leeren R-Sitzung. Das bedeutet: Alles, was dein Dokument braucht (Pakete, Daten, Variablen), muss im Dokument selbst definiert sein bzw. durch `source()` im Setup-Chunk ausgewführt werden.

**Häufige Ursachen:**

| Problem | Lösung |
|---------|--------|
| Paket nicht geladen | `library(tidyverse)` oder anderes benötigtes Paket am Anfang eines Code-Chunks einfügen |
| Datei nicht gefunden | Sicherstellen, dass du das Projekt (`.Rproj`) geöffnet hast und `here()` verwendest |
| Objekt nicht gefunden | Sicherstellen, dass die Variable in einem Chunk vor ihrer Verwendung definiert wird |
| Syntaxfehler im Code | Den Chunk einzeln ausführen, um den Fehler zu lokalisieren |

**Vorgehen bei unklaren Fehlern:**

1. Führe jeden Code-Chunk einzeln aus (Klick auf den grünen Pfeil rechts im Chunk), bis du den fehlerhaften findest
2. Lies die Fehlermeldung im fehlerhaften Chunk
3. Behebe das Problem und versuche erneut zu knitten

---

## Kernprojekt aus Snapshot wiederherstellen

Wenn dein Kernprojekt so kaputt ist, dass du nicht weißt, wo du anfangen sollst, kannst du es aus einem Snapshot wiederherstellen. Snapshots sind vollständige, funktionierende Versionen des Projekts nach jeder Sitzung — sie befinden sich im Ordner `kursmaterialien/core_project_snapshots/`.

**Schritt 1 — Den richtigen Snapshot finden**

Öffne `kursmaterialien/core_project_snapshots/` und wähle den Ordner für die letzte Sitzung, nach der dein Projekt noch funktioniert hat.

**Schritt 2 — Deine eigene Arbeit sichern (optional)**

Kopiere deine eigenen Dateien (z. B. angepasste Skripte oder Daten) aus dem kaputten Projekt an einen sicheren Ort, bevor du weitermachst.

**Schritt 3 — Snapshot kopieren**

1. Navigiere im Datei-Explorer (Windows) oder Finder (macOS) zum Snapshot-Ordner
2. Kopiere den gesamten Inhalt (alle Ordner und Dateien)
3. Öffne deinen Projektordner (`mein_projekt/`)
4. Füge die kopierten Dateien ein — bestehende Dateien werden überschrieben

**Schritt 4 — Eigene Arbeit zurückkopieren**

Falls du in Schritt 2 eigene Dateien gesichert hast, kopiere sie zurück in die richtigen Ordner.

**Schritt 5 — Projekt neu öffnen**

Doppelklicke auf die `.Rproj`-Datei und prüfe, ob alles wieder funktioniert.

---

## Allgemeine Debugging-Strategie

Wenn du nicht weißt, wo das Problem liegt, gehe systematisch vor. Schau außerdem in die [Galerie häufiger Fehler](../other/common_errors.md) — dort sind die typischsten Anfängerfehler mit Erklärungen und Lösungen gesammelt.

1. **Fehlermeldung lesen** — Lies sie komplett, auch wenn sie kryptisch wirkt. Sie sagt fast immer, welche Zeile das Problem verursacht (`Error in ... at line X`).

2. **Laut vorlesen** — Lies die Fehlermeldung laut vor, Wort für Wort. Das hilft, den entscheidenden Hinweis zu finden.

3. **R neu starten** — Ctrl+Shift+F10 / Cmd+Shift+F10. Dann Skript von oben ausführen.

4. **Isolieren** — Führe nur die fehlerhafte Zeile aus. Funktioniert sie allein?

5. **Vereinfachen** — Ersetze komplexe Ausdrücke durch einfache. Läuft `filter(daten, land == "Germany")` ohne Fehler? Was, wenn du `daten` durch einen Mini-Datensatz ersetzt?

6. **Buddy fragen** — Erkläre deinem Buddy, was du gemacht hast und was passiert. Das alleine löst oft das Problem (sogenanntes „Rubber-Duck-Debugging").

7. **Fehlermeldung googeln** — Kopiere den Kerntext der Fehlermeldung (ohne spezifische Variablennamen) in eine Suchmaschine. Du bist fast garantiert nicht die erste Person mit diesem Problem.

8. **K Ifragen**: Kopiere die Fehlermeldung und einen Teil Output, der deine Datenstruktur zeigt, in ein LLM deines Vertrauens und bitte es, dir die Fehlermeldung zu erklären. **Empfehlung**: Bitte die KI nur um eine Erklärung des Fehler und verbiete ihr explizit, dir die Lösung zu sagen. So kannst du selber knobeln und wirst im Laufe des Semesters sehr viel mehr lernen.

9. **Dozenten fragen** — mit einer konkreten Fehlermeldung und einer Beschreibung, was du bereits versucht hast.

Ausführliche Tipps dazu, wie du eine gute Frage formulierst und wo du nach Lösungen suchen kannst: [Um Hilfe bitten — richtig und effektiv](asking_for_help.md)
