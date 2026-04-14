# Dateien und Ordner verstehen

> **Einrichtungsschritt 3 von 5**
> [1 · R installieren](install_r.md) → [2 · RStudio installieren](install_rstudio.md) → **3 · Dateien & Ordner** → [4 · Projekt einrichten](project_setup.md) → [5 · Tastenkürzel zur Hand nehmen](../resources/cheatsheets/keyboard_shortcuts.md)

## Inhalt 

[Warum ist das wichtig?](#warum-ist-das-wichtig) · [Dateien und Ordner](#grundlagen-was-sind-dateien-und-ordner) · [Was ist ein Pfad?](#was-ist-ein-pfad) · [Dateiendungen sichtbar machen](#dateiendungen-sichtbar-machen) · [Wo soll ich den Ordner ablegen?](#wo-soll-ich-den-kurs-ordner-ablegen) · [Zwei Ordner im Seminar](#zwei-ordner-die-du-im-seminar-brauchst)

---

Diese Seite erklärt, wie Dateien und Ordner auf deinem Computer organisiert sind — und warum das fürs Programmieren eine größere Rolle spielt, als du vielleicht denkst.

Wenn du dich mit Dateien und Ordnern schon gut auskennst, kannst du direkt zum Abschnitt [Wo soll ich den Kurs-Ordner ablegen?](#wo-soll-ich-den-kurs-ordner-ablegen) springen.

---

## Warum ist das wichtig?

Beim Programmieren sagst du dem Computer ständig: *„Öffne diese Datei"*, *„Lese diese Tabelle ein"*, *„Speichere diese Grafik dort"*. Damit das funktioniert, muss der Computer wissen, **wo** sich die Datei befindet oder er die Grafik speichern soll.

Wenn du eine Word-Datei per Doppelklick öffnest, erledigt Windows oder macOS das für dich — du merkst nichts davon. In R musst du den Ort (den sogenannten **Pfad**) selber angeben. Und wenn der Pfad falsch ist, bekommst du eine Fehlermeldung.

Die gute Nachricht: Wenn du ein paar Grundprinzipien verstehst und deine Ordner sauber organisierst, treten diese Fehler fast nie auf.

---

## Grundlagen: Was sind Dateien und Ordner?

**Dateien** sind einzelne Dokumente auf deinem Computer. Sie haben einen Namen und eine Endung, die sagt, um was für eine Art Datei es sich handelt. Für die Arbeit im Seminar wirst du es vor allem mit folgenden Endungen zu tun bekommen:

| Endung | Was ist das? | Beispiel |
|--------|-------------|----------|
| `.R` | Ein R-Skript (Code) | `analyse.R` |
| `.Rmd` | Ein R-Markdown-Dokument (Code + Text) | `bericht.Rmd` |
| `.csv` | Eine Datentabelle (Comma-Separated Values) | `daten.csv` |
| `.rds` | Ein R-Datensatz (gespeichertes R-Objekt) | `gefiltert.rds` |
| `.Rproj` | Eine RStudio-Projektdatei | `mein_projekt.Rproj` |
| `.html` | Ein HTML-Dokument (z. B. ein fertiger Bericht) | `bericht.html` |

**Ordner** (auch „Verzeichnisse" genannt) sind Container, die Dateien und andere Ordner enthalten. Stell sie dir wie Schubladen vor: Eine Schublade kann Papiere enthalten, und sie kann auch kleinere Boxen (=weitere Ordner) enthalten, in denen wiederum Papiere liegen.

---

## Was ist ein „Pfad"?

Ein **Pfad** ist die Adresse einer Datei oder eines Ordners auf deinem Computer — wie eine Postadresse, nur für Dateien.

**Beispiel Windows:**
```
C:\Users\maria\Documents\Seminar_R\daten\owid.csv
```

**Beispiel macOS:**
```
/Users/maria/Documents/Seminar_R/daten/owid.csv
```

Lies den Pfad von links nach rechts: Du startest beim Laufwerk (Windows: `C:\`) oder beim Systemstamm (macOS: `/`), gehst durch jeden Ordner, und kommst schließlich bei der Datei an.

**Windows** trennt Ordner mit einem **Backslash:** `\`
**macOS** trennt Ordner mit einem **Slash:** `/`

Du musst dir die Pfade nicht merken — RStudio und das RStudio-Projekt-System (dazu gleich mehr) nehmen dir die meiste Arbeit ab. Aber es hilft enorm, das Prinzip zu verstehen, damit du Fehlermeldungen deuten kannst und Ordner am richtigen Ort auf deiner Festplatte ablegst.

---

## Dateiendungen sichtbar machen

Standardmäßig verstecken Windows und macOS die Dateiendungen. Das heißt, du siehst `analyse` statt `analyse.R` — und kannst nicht unterscheiden, ob eine Datei ein R-Skript, ein Textdokument oder etwas anderes ist.

Für das Seminar ist es wichtig, die Endungen zu sehen. So schaltest du sie ein:

### Windows

1. Öffne einen beliebigen Ordner im **Datei-Explorer**
2. Klicke oben auf **Ansicht** (View)
3. Setze das Häkchen bei **Dateinamenerweiterungen** (File name extensions)

### macOS

1. Öffne den **Finder**
2. Klicke in der Menüleiste auf **Finder → Einstellungen** (Finder → Settings)
3. Wechsle zum Tab **Erweitert** (Advanced)
4. Setze das Häkchen bei **Alle Dateinamensuffixe einblenden** (Show all filename extensions)

---

## Wo soll ich den Kurs-Ordner ablegen?

Wenn du die Kursmaterialien aus dem Repository als ZIP heruntergeladen hast, musst du sie an einem sinnvollen Ort entpacken. Hier sind die wichtigsten Tipps:

### Gut: Diese Orte funktionieren

- **Dokumente-Ordner:** `Dokumente/Seminar_R/` (Windows: `Documents\Seminar_R\`)
- **Desktop:** `Desktop/Seminar_R/` — funktioniert, aber wird schnell unübersichtlich
- **Ein eigener Uni-Ordner:** z. B. `Dokumente/Uni/SoSe2026/Seminar_R/`

### Schlecht: Diese Orte verursachen Probleme

| Ort | Warum nicht? |
|-----|-------------|
| **OneDrive / iCloud / Google Drive / Dropbox** | Cloud-Dienste synchronisieren Dateien im Hintergrund. Das kann dazu führen, dass R Dateien nicht findet, weil sie gerade „in der Cloud" sind, oder dass Dateien unerwartet überschrieben werden. |
| **Downloads-Ordner** | Wird schnell unübersichtlich. Dateien können versehentlich gelöscht werden. |
| **USB-Stick** | Pfade ändern sich je nach Computer. RStudio-Projekte funktionieren nicht zuverlässig. |
| **Ordner mit Leerzeichen oder Sonderzeichen im Pfad** | Pfade wie `C:\Mein Studium\Seminar R!!\Daten` können zu Fehlern führen. Verwende keine Leerzeichen, Umlaute oder Sonderzeichen in Ordnernamen — oder höchstens Unterstriche: `Seminar_R` |

### Die goldene Regel

> Lege den Ordner in deinen **Dokumente-Ordner** (oder einen Unterordner davon), verwende nur **Buchstaben, Zahlen und Unterstriche** im Namen, und halte den Pfad kurz.

**Gutes Beispiel:**
- Windows: `C:\Users\maria\Documents\Seminar_R\`
- macOS: `/Users/maria/Documents/Seminar_R/`

**Schlechtes Beispiel:**
- `C:\Users\maria\OneDrive\Uni Köln\Sommersemester 2026\Einführung in R (Seminar)\Materialien & Daten\`

---

## Zwei Ordner, die du im Seminar brauchst

Im Seminar arbeitest du mit zwei separaten Ordnern. Es ist wichtig, sie nicht durcheinanderzubringen:

### 1. Der Kursmaterialien-Ordner

Das ist der Ordner, den du aus dem GitHub-Repository heruntergeladen hast. Er enthält Sitzungsunterlagen, Übungsdaten, Referenzmaterialien und Anleitungen.

Während der Sitzungen arbeitest du direkt in den Sitzungsordnern (`sessions/session_XX/`). Das ist ausdrücklich vorgesehen — Sitzungsübungen sind kurzlebige Scratch-Arbeit, die du danach nicht mehr brauchst. Wenn du den Ordner irgendwann neu herunterlädst, werden diese Übungen überschrieben. Das ist kein Problem.

Was du hier **nicht** ablegen solltest: alles, was du langfristig behalten willst. Hausaufgaben, laufende Analysen und der Abschlussbericht gehören ins Arbeitsprojekt.

Vorgeschlagener Ort: `Dokumente/Seminar_R/kursmaterialien/`


### 2. Dein Arbeitsprojekt

Das ist der Ordner für deine gesamte dauerhafte Arbeit: Hausaufgaben, laufende Analysen und der Abschlussbericht. Du richtest ihn einmalig ein und arbeitest das ganze Semester darin. Er liegt bewusst außerhalb des Kursmaterialien-Ordners, damit ein Neu-Download der Kursmaterialien ihn nie berührt.

Vorgeschlagener Ort: `Dokumente/Seminar_R/mein_projekt/`

Wie du dein Arbeitsprojekt einrichtest, erklärt der nächste Schritt: [Projekteinrichtung](project_setup.md).

---

## Zusammenfassung

| Prinzip | Warum? |
|---------|--------|
| Ordner in `Dokumente/` ablegen | Zuverlässig, einfach zu finden |
| Keine Cloud-Ordner | Synchronisation verursacht schwer zu findende Fehler |
| Keine Leerzeichen oder Sonderzeichen in Ordnernamen | Manche Programme stolpern über Sonderzeichen in Pfaden |
| Dateiendungen sichtbar machen | Du musst sehen können, ob eine Datei `.R`, `.Rmd` oder `.csv` ist |
| Kursmaterialien und Arbeitsprojekt getrennt halten | Beim Aktualisieren der Materialien bleibt dein Arbeitsprojekt unberührt |

---

**Nächster Schritt:** [Dein Arbeitsprojekt einrichten](project_setup.md)
