# Objekte in R: Vektoren, Tibbles, Listen und mehr

In R ist alles, was du einem Namen zuweist, ein **Objekt**. Aber nicht alle Objekte sind gleich: Ein einzelner Wert, eine Tabelle mit 10.000 Zeilen und das Ergebnis einer Regression sind drei völlig verschiedene Dinge — und R behandelt sie unterschiedlich.

Diese Seite erklärt die Objekttypen, die du im Seminar regelmäßig begegnen wirst.

---

## Inhaltsverzeichnis

- [Vektoren — der Grundbaustein](#vektoren)
- [Tibbles und Data Frames — die Arbeitstabelle](#tibbles-und-data-frames)
- [Faktoren — geordnete Kategorien](#faktoren)
- [Listen — der Allzweckbehälter](#listen)
- [NULL und NA — Nichts und Fehlendes](#null-und-na)
- [Auf einen Blick: Vergleich der Typen](#auf-einen-blick)

---

## Vektoren

Ein Vektor ist eine **geordnete Folge von Werten desselben Typs**. Er ist der kleinste Baustein in R. Auch eine einzelne Zahl oder ein einzelnes Wort ist technisch gesehen ein Vektor der Länge 1.

```r
zahlen     <- c(0.31, 0.45, 0.58, 0.29)   # numerischer Vektor
laender    <- c("Germany", "Brazil", "Nigeria")  # Text-Vektor (character)
hat_daten  <- c(TRUE, FALSE, TRUE, TRUE)   # logischer Vektor (logical)
jahre      <- 1990:2020                    # ganzzahliger Vektor (integer)
```

### Die vier wichtigsten Vektortypen

| Typ | Enthält | Beispiel | Erkennbar an |
|-----|---------|---------|--------------|
| `numeric` (double) | Kommazahlen | `c(0.31, 0.45)` | `class()` → `"numeric"` |
| `integer` | Ganze Zahlen | `1:10`, `as.integer(3)` | `class()` → `"integer"` |
| `character` | Text (immer in `"..."`) | `c("Germany", "France")` | `class()` → `"character"` |
| `logical` | Wahrheitswerte | `c(TRUE, FALSE)` | `class()` → `"logical"` |

**Wichtige Regel:** Ein Vektor kann nur **einen** Typ enthalten. Wenn du verschiedene Typen mischst, wandelt R sie automatisch um — meistens nach `character` (der allgemeinste Typ):

```r
c(1, 2, "drei")
# "1" "2" "drei"  ← alle Zahlen wurden zu Text
```

### Was du mit Vektoren machst

```r
gini_werte <- c(0.31, 0.45, NA, 0.29)

length(gini_werte)           # Länge: 4
class(gini_werte)            # "numeric"
sum(is.na(gini_werte))       # 1 fehlender Wert

mean(gini_werte, na.rm = TRUE)  # Mittelwert ohne NA

# Einzelne Elemente per Index abrufen:
gini_werte[2]       # 0.45  (zweites Element)
gini_werte[c(1, 3)] # 0.31 NA  (erstes und drittes)
```

### Wann dir Vektoren begegnen

- Jede **Spalte** eines Tibbles ist ein Vektor.
- Das Ergebnis von `owid$gini` ist ein Vektor.
- Das erste Argument von `c()`, `mean()`, `filter()` ist fast immer ein Vektor.

---

## Tibbles und Data Frames

Ein **Tibble** ist eine Tabelle — Zeilen sind Beobachtungen, Spalten sind Variablen. Es ist das Objekt, mit dem du im Seminar am häufigsten arbeitest.

```r
# Ein Tibble entsteht typischerweise durch Einlesen:
owid <- read_csv(here("data", "owid_data.csv"))

# Oder manuell (selten, aber möglich):
mini <- tibble(
  land  = c("Germany", "Brazil"),
  jahr  = c(2015, 2015),
  gini  = c(0.31, 0.53)
)
```

### Tibble vs. Data Frame

Ein **Data Frame** (`data.frame`) ist das klassische R-Format. Ein **Tibble** (`tibble`) ist die modernisierte Version aus dem Tidyverse. Du kannst beide gleich benutzen; Tibbles zeigen etwas mehr Informationen beim Ausdrucken und verhalten sich in einigen Randfällen vorhersehbarer. Im Seminar arbeiten wir immer mit Tibbles.

```r
class(owid)
# "tbl_df"     "tbl"        "data.frame"   ← ist beides
```

### Ein Tibble erkunden

```r
owid            # druckt die ersten 10 Zeilen + Spaltentypen
glimpse(owid)   # alle Spalten untereinander mit Typ und ersten Werten
head(owid, 5)   # erste 5 Zeilen
nrow(owid)      # Anzahl Zeilen
ncol(owid)      # Anzahl Spalten
names(owid)     # Spaltennamen
```

### Spalten ansprechen

```r
owid$gini               # Spalte als Vektor (mit $)
owid[["gini"]]          # dasselbe, mit [[]]
owid |> select(gini)    # Spalte als Tibble (mit dplyr — behält Tabellenstruktur)
```

**Unterschied `$` vs. `select()`:** `owid$gini` gibt dir einen **Vektor** (die Werte ohne Tabellenstruktur). `select(owid, gini)` gibt dir einen **Tibble** mit einer Spalte. Für Berechnungen und `filter()` brauchst du meistens keines von beiden direkt — `dplyr`-Verben arbeiten direkt auf dem Tibble.

### Wann dir Tibbles begegnen

- Immer. Fast jede Funktion im Seminar gibt entweder ein Tibble zurück oder erwartet eines.
- `read_csv()` → Tibble
- `filter()`, `mutate()`, `group_by() |> summarise()` → Tibble
- `pivot_longer()` → Tibble

---

## Faktoren

Ein **Faktor** (`factor`) sieht aus wie ein Text-Vektor, hat aber eine **festgelegte Menge von erlaubten Werten** (die „Levels") — und diese Levels haben eine **Reihenfolge**.

```r
regionen <- factor(c("Europe", "Africa", "Asia", "Europe"))
levels(regionen)
# "Africa" "Asia" "Europe"  ← alphabetisch (Standard)
```

### Warum Faktoren wichtig sind

**In ggplot2** bestimmt die Reihenfolge der Levels, in welcher Reihenfolge Werte auf Achsen oder in Legenden erscheinen. Ohne `fct_reorder()` sind Balken und Kategorien **alphabetisch** sortiert — was selten das ist, was du willst.

```r
# Alphabetisch — wenig aussagekräftig
gini_region |>
  ggplot(aes(x = region, y = gini_mittel)) +
  geom_col()

# Nach Wert sortiert — viel besser
gini_region |>
  mutate(region = fct_reorder(region, gini_mittel)) |>
  ggplot(aes(x = region, y = gini_mittel)) +
  geom_col()
```

### Die wichtigsten Faktor-Funktionen

| Funktion | Was sie tut |
|----------|-------------|
| `factor()` | Text-Vektor in Faktor umwandeln |
| `levels()` | Levels eines Faktors anzeigen |
| `as.character()` | Faktor zurück in Text umwandeln |
| `fct_reorder(f, x)` | Levels nach einem anderen Vektor `x` sortieren |
| `fct_rev(f)` | Reihenfolge der Levels umkehren |
| `fct_lump_n(f, n)` | Die `n` häufigsten Levels behalten, Rest als „Other" |

### Wann dir Faktoren begegnen

- Immer wenn du `fct_reorder()` in einer Grafik verwendest.
- Wenn du `as.factor()` oder `factor()` explizit verwendest.
- `read_csv()` liest Textspalten als `character`, **nicht** als Faktor — du musst bei Bedarf selbst umwandeln.
- In Regressionen mit `lm()`: eine `character`-Spalte wird automatisch in einen Faktor umgewandelt (R erstellt dann Dummy-Variablen).

---

## Listen

Eine **Liste** (`list`) ist ein Behälter, der **beliebige Objekte** halten kann — auch unterschiedliche Typen und unterschiedliche Längen. Tibbles, Vektoren, andere Listen, Modelle: alles geht.

```r
meine_liste <- list(
  name    = "Gini-Analyse",
  jahre   = c(2000, 2010, 2020),
  daten   = owid_2015,          # ein ganzer Tibble
  ergebnis = 0.42
)
```

### Listen erkunden und ansprechen

```r
length(meine_liste)         # 4 Elemente
names(meine_liste)          # "name" "jahre" "daten" "ergebnis"

meine_liste$name            # "Gini-Analyse"  (mit $)
meine_liste[["jahre"]]      # c(2000, 2010, 2020)  (mit [[]])
meine_liste[[2]]            # dasselbe, per Position
```

**`[` vs. `[[`:** `meine_liste[2]` gibt eine **Liste** mit einem Element zurück. `meine_liste[[2]]` gibt das **Element selbst** zurück. In der Praxis fast immer `[[` verwenden.

### Wann dir Listen begegnen

Du wirst Listen selten selbst bauen, aber sie begegnen dir an mehreren Stellen:

- **Modell-Output:** `lm()` gibt eine Liste zurück — deshalb funktioniert `modell$coefficients` und `modell$residuals`.
- **`broom::tidy()` und `broom::glance()`** wandeln Listen-Output in Tibbles um (das ist ihr ganzer Zweck).
- **`purrr::map()`** gibt immer eine Liste zurück (`map_dfr()` direkt einen Tibble).
- Wenn du in der Konsole etwas siehst wie `$name` oder `[[1]]` — das ist eine Liste.

### Tipp: Unbekannte Ausgaben erkunden

Wenn du nicht weißt, was eine Funktion zurückgibt:

```r
x <- lm(gini ~ bip_pro_kopf, data = owid2015)
class(x)      # "lm"
typeof(x)     # "list"  ← intern ist es eine Liste
names(x)      # alle verfügbaren Elemente
str(x)        # vollständige Struktur
```

---

## NULL und NA

Diese beiden werden oft verwechselt, bedeuten aber völlig verschiedene Dinge.

### `NA` — fehlender Wert

`NA` steht für *Not Available*: **ein Wert existiert, ist aber unbekannt oder nicht gemessen**. Er sitzt in einem Vektor an einer bestimmten Position.

```r
gini <- c(0.31, NA, 0.45)
length(gini)         # 3  ← NA belegt einen Platz
is.na(gini)          # FALSE TRUE FALSE
sum(is.na(gini))     # 1  ← ein fehlender Wert
mean(gini)           # NA  ← muss na.rm = TRUE
mean(gini, na.rm = TRUE)  # 0.38
```

**NA „steckt an":** Fast jede Berechnung mit einem `NA`-Wert gibt wieder `NA` zurück — außer du setzt `na.rm = TRUE`.

### `NULL` — kein Objekt

`NULL` bedeutet: **dieses Objekt existiert gar nicht**. Es hat keine Länge und belegt keinen Platz. Es wird häufig als Rückgabewert für „nichts" oder als Standardwert für optionale Argumente verwendet.

```r
x <- NULL
length(x)    # 0  ← kein Platz belegt
is.null(x)   # TRUE

c(1, 2, NULL, 3)   # NULL wird einfach weggelassen → 1 2 3
```

### Unterschied auf einen Blick

| | `NA` | `NULL` |
|-|------|--------|
| Was es ist | Fehlender Wert **in** einem Vektor | Kein Objekt |
| Länge | 1 (belegt einen Platz) | 0 |
| Prüfen | `is.na()` | `is.null()` |
| Typischer Kontext | Fehlende Datenpunkte in einer Spalte | Optionale Argumente, leere Listen-Slots |
| Verhalten in `c()` | Bleibt als `NA` enthalten | Wird ignoriert |

---

## Auf einen Blick

| Typ | Was es ist | Erstellt mit | Typisches Vorkommen |
|-----|-----------|-------------|---------------------|
| `numeric`-Vektor | Folge von Zahlen | `c()`, `:`, `seq()` | Jede numerische Spalte in einem Tibble |
| `character`-Vektor | Folge von Texten | `c()`, `"..."` | Länder- und Regionsnamen |
| `logical`-Vektor | Folge von TRUE/FALSE | Vergleiche, `is.na()` | Ergebnis von `filter()`-Bedingungen |
| `factor` | Kategorien mit Reihenfolge | `factor()`, `fct_reorder()` | Achsenbeschriftungen in ggplot |
| `tibble` / `data.frame` | Rechteckige Tabelle | `read_csv()`, `tibble()` | Der Hauptdatensatz, fast überall |
| `list` | Behälter für beliebige Objekte | `list()` | Model-Output, `map()`-Ergebnis |
| `NA` | Fehlender Wert | automatisch | Fehlende Messwerte in Spalten |
| `NULL` | Kein Objekt | `NULL` | Optionale Argumente, leere Slots |
