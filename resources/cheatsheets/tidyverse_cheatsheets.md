# Cheatsheets

Für jedes Paket, das wir im Seminar verwenden, gibt es eine offizielle Kurzreferenz — gepflegt von Posit, dem Unternehmen hinter RStudio. Die Seiten enthalten kompakte Übersichten aller wichtigen Funktionen mit Beispielen.

**Tipp:** Du musst diese Seiten nicht auswendig lernen. Nutze sie zum Nachschlagen, wenn du weißt, was du tun willst, aber nicht mehr genau wie.

---

## Kernpakete

Diese Pakete werden im Seminar regelmäßig verwendet. Alle sind Teil des Tidyverse und werden mit `library(tidyverse)` geladen.

### RStudio IDE
**[→ Cheatsheet öffnen](https://rstudio.github.io/cheatsheets/html/rstudio-ide.html)**

Übersicht über die RStudio-Benutzeroberfläche: alle Bereiche, Buttons und Menüs erklärt. Nützlich besonders am Anfang, wenn du dich in RStudio noch nicht vollständig auskennst. Enthält auch eine vollständige Liste der Tastaturkürzel.

---

### Daten einlesen (`readr`)
**[→ Cheatsheet öffnen](https://rstudio.github.io/cheatsheets/html/data-import.html)**

`readr` liest Datensätze in R ein. Im Seminar verwenden wir hauptsächlich `read_csv()` für den OWID-Datensatz. Das Cheatsheet zeigt alle Einleseoptionen: Spaltentypen, fehlende Werte, Trennzeichen, und wie man nur bestimmte Spalten oder Zeilen einliest.

---

### Daten transformieren (`dplyr`)
**[→ Cheatsheet öffnen](https://rstudio.github.io/cheatsheets/html/data-transformation.html)**

`dplyr` ist das Hauptwerkzeug für Datentransformationen. Im Seminar verwenden wir es für alles: Zeilen filtern (`filter()`), Spalten auswählen (`select()`), neue Variablen berechnen (`mutate()`), nach Gruppen zusammenfassen (`group_by()` + `summarise()`), sortieren (`arrange()`). Das Cheatsheet gibt eine Übersicht aller Funktionen mit kompakten Beispielen.

---

### Daten umstrukturieren (`tidyr`)
**[→ Cheatsheet öffnen](https://rstudio.github.io/cheatsheets/html/tidyr.html)**

`tidyr` bringt Daten in das sogenannte „tidy"-Format: eine Zeile pro Beobachtung, eine Spalte pro Variable. Im Seminar verwenden wir vor allem `pivot_longer()` (mehrere Spalten in eine zusammenführen) und `pivot_wider()` (umgekehrt), sowie `drop_na()` für fehlende Werte.

---

### Visualisieren (`ggplot2`)
**[→ Cheatsheet öffnen](https://rstudio.github.io/cheatsheets/html/data-visualization.html)**

`ggplot2` ist das Visualisierungspaket des Tidyverse. Alle Grafiken im Seminar werden damit erstellt: Liniendiagramme, Streudiagramme, Balkendiagramme, facettierte Plots. Das Cheatsheet zeigt alle `geom_*`-Typen, `aes()`-Mappings, Themes, Skalen und Farbpaletten auf einen Blick.

---

### Faktoren und Kategorien (`forcats`)
**[→ Cheatsheet öffnen](https://rstudio.github.io/cheatsheets/html/factors.html)**

`forcats` vereinfacht die Arbeit mit kategorialen Variablen (sogenannten Faktoren). Im Seminar ist es vor allem nützlich, um in Grafiken die Reihenfolge von Ländern oder Regionen zu steuern — z. B. mit `fct_reorder()`, damit Balken nach Wert und nicht alphabetisch sortiert sind. Ohne `forcats` sehen viele Grafiken unübersichtlich aus.

---

### Datumswerte (`lubridate`)
**[→ Cheatsheet öffnen](https://rstudio.github.io/cheatsheets/html/lubridate.html)**

`lubridate` vereinfacht die Arbeit mit Datums- und Zeitangaben. Im Seminar ist es vor allem dann nützlich, wenn Jahreszahlen als Datumsspalten vorliegen oder wenn du Zeitintervalle berechnen willst. Das Cheatsheet zeigt, wie man Datumsstrings parst, Komponenten (Jahr, Monat, Tag) extrahiert und Datumsarithmetik betreibt.

---

### R Markdown (`rmarkdown`)
**[→ Cheatsheet öffnen](https://rstudio.github.io/cheatsheets/html/rmarkdown.html)**

R Markdown ist das Format, in dem du deinen Abschlussbericht schreibst: Code, Text und Ergebnisse in einem Dokument, das du zu HTML oder PDF rendern kannst. Das Cheatsheet zeigt die YAML-Kopfzeile, Textformatierung (Überschriften, Listen, fett, kursiv), Code-Chunk-Optionen und Inline-Code.

---

## Bonuspakete

Diese Pakete werden im Seminar nicht vorausgesetzt, sind aber nützlich für Bonusaufgaben oder wer tiefer einsteigen will.

### Text verarbeiten (`stringr`)
**[→ Cheatsheet öffnen](https://rstudio.github.io/cheatsheets/html/strings.html)**

`stringr` bietet Funktionen für die Arbeit mit Zeichenketten (Text): Suchen, Ersetzen, Extrahieren, Trimmen. Im Seminar könnte es nützlich sein, wenn Ländernamen inkonsistent geschrieben sind oder wenn du Textspalten bereinigen musst.

---

### Funktionale Programmierung (`purrr`)
**[→ Cheatsheet öffnen](https://rstudio.github.io/cheatsheets/html/purrr.html)**

`purrr` ermöglicht es, Funktionen systematisch auf viele Elemente anzuwenden — z. B. dieselbe Analyse für jedes Land in einer Liste automatisch durchzuführen. Das ist fortgeschrittenes Tidyverse und wird im Seminar nicht vorausgesetzt. Für alle, die repetitiven Code elegant strukturieren wollen.

---

## Alle Cheatsheets auf einen Blick

Die vollständige Sammlung aller Posit-Cheatsheets (inkl. PDF-Downloads) findest du hier:

**[→ posit.co/resources/cheatsheets](https://posit.co/resources/cheatsheets/)**

Dort gibt es auch übersetzte Versionen (Deutsch, Spanisch, Portugiesisch u. a.) für viele Pakete.
