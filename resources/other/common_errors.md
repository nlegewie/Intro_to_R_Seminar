# Häufige Fehler — Galerie mit Erklärungen

Diese Seite sammelt Fehler, die fast jeder R-Anfängerin und jedem R-Anfänger passieren. Für jeden Fehler zeigen wir: was du siehst, was die Ursache ist, und wie du ihn behebst.

Wenn du einen Fehler bekommst, der hier nicht steht: [Fehlerbehebung und Wiederherstellung](../troubleshooting/reset_and_recover.md)

Viele Fehler entstehen, weil ein Objekt einen anderen Typ hat als erwartet. Hintergrundwissen dazu: [Objekte in R: Vektoren, Tibbles, Listen und mehr](r_objekte.md)

---

## 1. Vergessene Klammer

**Was du siehst:**
```
> filter(owid_data, year == 2015
+
+
```
Die Console zeigt ein `+` statt eines `>`. R wartet auf den Rest des Befehls.

**Was passiert ist:** Du hast eine öffnende Klammer `(` nicht geschlossen.

**Lösung:** Drücke **Esc**, um den Befehl abzubrechen. Ergänze die fehlende Klammer und führe den Befehl erneut aus.

**Vorbeugung:** RStudio markiert zusammengehörige Klammern, wenn du den Cursor neben eine Klammer setzt. Wenn die Gegenstelle rot leuchtet, fehlt etwas.

---

## 2. Vergessenes Komma

**Was du siehst:**
```
Error: unexpected symbol in "filter(owid_data year"
```

**Was passiert ist:** Zwischen den Argumenten einer Funktion fehlt ein Komma.

**Falsch:**
```r
filter(owid_data year == 2015)
```

**Richtig:**
```r
filter(owid_data, year == 2015)
```

---

## 3. `=` statt `==` beim Vergleichen

**Was du siehst:**
```
Error in filter(...): Problem while computing `..1 = year = 2015`.
```

**Was passiert ist:** Du hast `=` (Zuweisung) statt `==` (Vergleich) verwendet.

**Falsch:**
```r
filter(owid_data, year = 2015)
```

**Richtig:**
```r
filter(owid_data, year == 2015)
```

**Merkregel:** `=` bedeutet „setze gleich" (Zuweisung). `==` bedeutet „ist gleich?" (Vergleich/Frage).

---

## 4. Anführungszeichen vergessen oder falsch

**Was du siehst:**
```
Error: object 'Germany' not found
```

**Was passiert ist:** R sucht nach einer Variable namens `Germany`, weil die Anführungszeichen fehlen. Textwerte (Strings) müssen immer in Anführungszeichen stehen.

**Falsch:**
```r
filter(owid_data, country == Germany)
```

**Richtig:**
```r
filter(owid_data, country == "Germany")
```

**Achtung:** Sogenannte „typografische" Anführungszeichen (`„Germany"` oder `"Germany"`) aus Word oder Google Docs funktionieren in R nicht. Verwende nur gerade Anführungszeichen (`"Germany"`).

---

## 5. Tippfehler im Variablen- oder Funktionsnamen

**Was du siehst:**
```
Error: object 'owid_dat' not found
```
oder:
```
Error in filer(...) : could not find function "filer"
```

**Was passiert ist:** Ein Buchstabe fehlt oder ist falsch. R unterscheidet Groß- und Kleinschreibung: `Year` ist nicht dasselbe wie `year`.

**Lösung:** Prüfe die Schreibweise. Nutze die **Tab-Vervollständigung**: Tippe die ersten Buchstaben und drücke Tab — RStudio schlägt Vervollständigungen vor.

---

## 6. Paket nicht geladen

**Was du siehst:**
```
Error in filter(...) : could not find function "filter"
Error in ggplot(...) : could not find function "ggplot"
```

**Was passiert ist:** Das Paket, das die Funktion enthält, wurde nicht mit `library()` geladen.

**Lösung:** Füge am Anfang deines Skripts hinzu:
```r
library(tidyverse)
```
und führe diese Zeile aus.

**Wichtig:** `library()` muss in jeder R-Sitzung und in jedem Skript erneut ausgeführt werden. Installation (`install.packages()`) ist einmalig — Laden ist jedes Mal.

---

## 7. Objekt nicht gefunden nach R-Neustart

**Was du siehst:**
```
Error: object 'owid_data' not found
```

**Was passiert ist:** Du hast R neu gestartet (oder RStudio geschlossen und wieder geöffnet). Der Arbeitsspeicher ist leer — alle Variablen sind weg.

**Lösung:** Führe dein Skript komplett von oben nach unten aus: Ctrl+Shift+Enter (Windows) / Cmd+Shift+Enter (macOS).

**Warum passiert das?** R speichert Variablen nur im Arbeitsspeicher, nicht auf der Festplatte. Nach einem Neustart muss das Skript alles neu berechnen. Das ist gewollt — es stellt sicher, dass dein Skript reproduzierbar ist.

---

## 8. Pipe-Operator falsch geschrieben

**Was du siehst:**
```
Error: unexpected '>' in "owid_data |>"
```

**Mögliche Ursachen:**
- Deine R-Version ist älter als 4.1 (der native Pipe `|>` wurde dort eingeführt)
- Du hast `|>` und `%>%` vermischt

**Lösung:** Verwende konsistent entweder `|>` (native Pipe, empfohlen) oder `%>%` (aus `magrittr`). Im Seminar verwenden wir `|>`.

Prüfe deine R-Version:
```r
R.version.string
```

---

## 9. Spalte existiert nicht (nach Umbenennung oder Tippfehler)

**Was du siehst:**
```
Error in `select()`:
! Can't subset columns that don't exist.
✖ Column `gdp_per_capita` doesn't exist.
```

**Was passiert ist:** Die Spalte heißt anders als du denkst. Vielleicht wurde sie umbenannt, oder der Originalname enthält Punkte statt Unterstriche.

**Lösung:** Schau dir die echten Spaltennamen an:
```r
names(owid_data)
```
oder:
```r
glimpse(owid_data)
```

---

## 10. `+` am Zeilenende vergessen (ggplot)

**Was du siehst:**
```r
ggplot(owid_data, aes(x = year, y = gini))
  geom_line()
```
```
Error: unexpected symbol in "  geom_line"
```

**Was passiert ist:** In `ggplot2` verbindet `+` die einzelnen Schichten. Wenn `+` am Ende der ersten Zeile fehlt, denkt R, der Befehl sei abgeschlossen.

**Falsch:**
```r
ggplot(owid_data, aes(x = year, y = gini))
  geom_line()
```

**Richtig:**
```r
ggplot(owid_data, aes(x = year, y = gini)) +
  geom_line()
```

**Tipp:** Das `+` muss immer am **Ende** der Zeile stehen, nicht am Anfang der nächsten.

---

## 11. Falsche Quotes nach Kopieren aus dem Internet

**Was du siehst:**
```
Error: unexpected input in ...
```

**Was passiert ist:** Du hast Code von einer Webseite, aus einem PDF oder aus Word kopiert. Dabei wurden gerade Anführungszeichen (`"`) durch typografische (`"` oder `„`) ersetzt, oder Bindestriche (`-`) durch lange Gedankenstriche (`—`).

**Lösung:** Lösche die Anführungszeichen im Code und tippe sie von Hand in RStudio ein. RStudio verwendet automatisch die richtigen Zeichen.

---

## 12. NA-Werte ignoriert

**Was du siehst:**
```r
mean(owid_data$gini)
```
```
[1] NA
```

**Was passiert ist:** Die Spalte enthält fehlende Werte (`NA`). Viele R-Funktionen geben `NA` zurück, sobald auch nur ein `NA`-Wert vorhanden ist.

**Lösung:** Setze `na.rm = TRUE`:
```r
mean(owid_data$gini, na.rm = TRUE)
```

Oder filtere vorher:
```r
owid_data |>
  filter(!is.na(gini)) |>
  summarise(mittelwert = mean(gini))
```

---

## 13. Datei nicht gefunden

> **Nachschlagewerk:** Eine vollständige Referenz aller häufigen Operatoren (`<-`, `==`, `|>`, `%in%`, …) und Basis-Funktionen (`is.na()`, `as.numeric()`, `mean()`, …) findest du in der [R-Referenz](../cheatsheets/r_referenz.md).



Siehe den ausführlichen Abschnitt in der [Fehlerbehebung](../troubleshooting/reset_and_recover.md#datei-nicht-gefunden) — die drei häufigsten Ursachen und ihre Lösungen sind dort Schritt für Schritt erklärt.
