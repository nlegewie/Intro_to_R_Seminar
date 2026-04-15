# Code-Stil, Kommentare und automatische Formatierung

Gut geschriebener Code funktioniert nicht nur — er lässt sich auch lesen. Das klingt jetzt vielleicht abstrakt, aber schon nach wenigen Wochen wirst du eigenen Code von letzter Woche lesen und froh sein, wenn er ordentlich formatiert und kommentiert ist.

Dieses Dokument erklärt drei Dinge:
1. Wie man Code sinnvoll **kommentiert**
2. Welche **Stilregeln** guten R-Code ausmachen
3. Wie du mit dem Paket **`styler`** automatisch formatieren kannst

---

## Kommentare: Warum, nicht Was

### Was sind Kommentare?

Kommentare sind Zeilen in deinem Code, die mit `#` beginnen. R ignoriert sie komplett — sie sind nur für Menschen da.

```r
# Das ist ein Kommentar. R überspringt diese Zeile.
x <- 5  # Das hier ist ein Inline-Kommentar.
```

### Wann kommentieren?

Kommentare erklären das **Warum** — nicht das **Was**. Der Code selbst zeigt, *was* passiert. Ein Kommentar sagt, *warum* du diese Entscheidung getroffen hast.

### Gute vs. schlechte Kommentare

**Schlecht — restatet den Code:**
```r
# Filtere nach dem Jahr 2015
daten_2015 <- owid_data |>
  filter(year == 2015)
```
Dieser Kommentar sagt nichts, was der Code nicht schon sagt.

**Gut — erklärt das Warum:**
```r
# 2015 hat die beste Datenverfügbarkeit für den Gini-Koeffizienten (~178 Länder)
daten_2015 <- owid_data |>
  filter(year == 2015)
```
Jetzt versteht jeder, warum genau 2015 gewählt wurde.

**Schlecht — offensichtlich:**
```r
# Lade Tidyverse
library(tidyverse)
```

**Gut — nur wo nötig:**
```r
library(tidyverse)
library(here)
library(broom)  # für tidy() und glance() bei Regressionsmodellen
```
Der dritte Kommentar ist nützlich, weil `broom` nicht selbsterklärend ist.

### Abschnittsüberschriften

Verwende Kommentare, um dein Skript in Abschnitte zu gliedern. So findest du dich auch nach Wochen noch zurecht:

```r
# --- Pakete laden ---

library(tidyverse)
library(here)

# --- Daten einlesen und filtern ---

owid_data <- read_csv(here("data", "owid_data.csv"))

daten_modern <- owid_data |>
  filter(year >= 1990, year <= 2023)

# --- Zusammenfassung pro Region ---

regionale_mittelwerte <- daten_modern |>
  group_by(region) |>
  summarise(mittelwert_gini = mean(gini, na.rm = TRUE))
```

RStudio erkennt Kommentare im Format `# --- Titel ---` oder `# Titel ----` als **Abschnittsüberschriften** und zeigt sie im Dokumenten-Outline an (der Button rechts oben im Editor-Bereich). Das macht die Navigation in langen Skripten deutlich einfacher.

---

## Stilregeln: Der Tidyverse Style Guide in Kürze

Der [Tidyverse Style Guide](https://style.tidyverse.org/) ist ein Regelwerk für lesbaren R-Code. Du musst ihn nicht auswendig kennen — die wichtigsten Punkte:

### Leerzeichen

**Um Operatoren herum:** Setze Leerzeichen um `=`, `<-`, `==`, `+`, `-`, `|>`:

```r
# Gut
x <- 5
y == 10
daten |> filter(year >= 2000)

# Schlecht
x<-5
y==10
daten|>filter(year>=2000)
```

**Nach Kommas:** Leerzeichen nach dem Komma, nicht davor:

```r
# Gut
filter(owid_data, year == 2015, country == "Germany")

# Schlecht
filter(owid_data,year == 2015 ,country == "Germany")
```

### Einrückung

Verwende **2 Leerzeichen** pro Einrückungsebene (RStudio-Standard). Keine Tabs.

Bei langen Pipes und ggplot-Aufrufen rücke die Fortsetzungszeilen ein:

```r
# Gut
owid_data |>
  filter(year == 2015) |>
  group_by(region) |>
  summarise(mittelwert = mean(gini, na.rm = TRUE))

# Schlecht
owid_data |> filter(year == 2015) |> group_by(region) |> summarise(mittelwert = mean(gini, na.rm = TRUE))
```

### Zeilenlänge

Halte Zeilen unter **80 Zeichen**. RStudio kann eine Orientierungslinie einblenden: `Tools → Global Options → Code → Display → Show margin` (Wert: 80).

### Benennung

- **Variablen und Funktionen:** `snake_case` (Kleinbuchstaben, Wörter mit Unterstrich getrennt):
  ```r
  # Gut
  gini_mittelwert <- mean(daten$gini, na.rm = TRUE)
  daten_gefiltert <- filter(owid_data, year == 2015)
  
  # Schlecht
  GiniMittelwert <- mean(daten$gini, na.rm = TRUE)
  daten.gefiltert <- filter(owid_data, year == 2015)
  ```

- **Aussagekräftige Namen:** `daten_2015` statt `d2`, `gini_pro_region` statt `x`.

### Pipe-Operator

Setze `|>` immer ans **Ende** der Zeile, nie an den Anfang der nächsten:

```r
# Gut
owid_data |>
  filter(year == 2015) |>
  select(country, gini)

# Schlecht
owid_data
  |> filter(year == 2015)
  |> select(country, gini)
```

---

## `styler`: Automatische Formatierung

Du musst Stilregeln nicht manuell anwenden — das Paket **`styler`** macht das für dich. Es reformatiert deinen Code automatisch nach dem Tidyverse Style Guide.

### Installation (einmalig)

```r
install.packages("styler")
```

### Verwendung

**Option A — Über das RStudio-Menü (empfohlen):**

1. Öffne ein R-Skript
2. Klicke auf **Addins** (oben in der Menüleiste) → **Style active file**
3. Fertig — dein Skript ist formatiert

**Option B — Per Befehl:**

```r
library(styler)
styler::style_file("scripts/01_clean_data.R")
```

### Was `styler` macht

- Leerzeichen um Operatoren einfügen
- Einrückung korrigieren
- Überflüssige Leerzeichen entfernen
- Korrekte Zeilenumbrüche bei langen Ausdrücken

### Was `styler` nicht macht

- `styler` ändert keine Variablennamen
- `styler` schreibt keine Kommentare
- `styler` behebt keine logischen Fehler

**Faustregel:** `styler` macht guten Code lesbarer. Aber es kann schlechten Code nicht gut machen.

### Vorher / Nachher

**Vorher:**
```r
owid_data|>filter(year==2015,country=="Germany")|>select(country,gini,gdp_per_capita)|>mutate(gini_pct=gini*100)
```

**Nachher (nach `styler`):**
```r
owid_data |>
  filter(year == 2015, country == "Germany") |>
  select(country, gini, gdp_per_capita) |>
  mutate(gini_pct = gini * 100)
```

---

## Zusammenfassung

| Prinzip | Umsetzung |
|---------|-----------|
| Kommentare erklären *Warum*, nicht *Was* | Nur kommentieren, wenn es einen Grund gibt, der aus dem Code nicht hervorgeht |
| Abschnittsüberschriften nutzen | `# --- Titel ---` gliedert Skripte und erscheint im RStudio-Outline |
| Leerzeichen und Einrückung | Um Operatoren, nach Kommas, 2 Leerzeichen pro Ebene |
| Aussagekräftige Namen in `snake_case` | `daten_2015` statt `d2` |
| Zeilen kurz halten | Unter 80 Zeichen, Pipe-Operator am Zeilenende |
| `styler` regelmäßig nutzen | Addins → Style active file |
