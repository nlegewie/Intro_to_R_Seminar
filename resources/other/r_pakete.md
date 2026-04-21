# Nützliche R-Pakete: Ein Überblick

Das Tidyverse ist der Kern unseres Seminars — aber es gibt viele weitere Pakete, die deine Arbeit erheblich erleichtern können. Diese Seite stellt eine Auswahl vor, gegliedert nach dem, wofür du sie brauchst.

> **Wie installierst du ein Paket?**
> ```r
> install.packages("paketname")   # einmalig installieren
> library(paketname)              # in jeder Session laden
> ```
> Du installierst ein Paket nur einmal auf deinem Computer. Laden musst du es jedes Mal, wenn du es brauchst.

---

## Inhaltsverzeichnis

- [Projektstruktur & Pfade](#projektstruktur--pfade)
- [Datencleaning & Überblick](#datencleaning--überblick)
- [Fehlende Werte](#fehlende-werte)
- [Modelle & Statistik](#modelle--statistik)
- [Visualisierung](#visualisierung)
- [Tabellen & Berichte](#tabellen--berichte)
- [Datei-Import & Export](#datei-import--export)
- [Zeitreihen & rollierende Berechnungen](#zeitreihen--rollierende-berechnungen)
- [Auf einen Blick](#auf-einen-blick)

---

## Projektstruktur & Pfade

### `here`

**Was es tut:** `here()` baut Dateipfade relativ zum Wurzelverzeichnis deines RStudio-Projekts (`.Rproj`-Datei). Das macht deinen Code portabel — er funktioniert auf deinem Computer, auf dem meines und auf dem Server, ohne dass du Pfade anpassen musst.

```r
library(here)

# Statt:
read_csv("/irgend/ein/pfad/zur/datei/data/owid.csv")

# Einfach:
read_csv(here("data", "owid_data.csv"))
```

**Wann du es brauchst:** Ab dem Moment, wo du Dateien einliest. Im Seminar verwenden wir `here()` in allen Sessions ab Session 3.

**Im Seminar:** Bereits in `demo_endgame.Rmd` eingesetzt.

---

## Datei-Import & Export

### `haven`

**Was es tut:** `haven` liest Dateiformate aus Stata (`.dta`), SPSS (`.sav`, `.por`) und SAS (`.sas7bdat`) direkt in Tibbles ein. Besonders nützlich, wenn du Daten aus anderen sozialwissenschaftlichen Kontexten weiterverarbeitest.

```r
library(haven)

# Stata-Datei einlesen
daten <- read_dta(here("data", "survey_data.dta"))

# SPSS-Datei einlesen
daten <- read_sav(here("data", "umfrage.sav"))

# Als Stata-Datei speichern
write_dta(meine_daten, here("output", "ergebnisse.dta"))
```

**Wann du es brauchst:** Wenn du Datensätze bekommst, die nicht als `.csv` vorliegen — z.B. aus der amtlichen Statistik, dem SOEP oder anderen Umfrageprogrammen.

---

## Datencleaning & Überblick

### `janitor`

**Was es tut:** `janitor` hilft bei der Bereinigung roher Daten. Die wichtigste Funktion: `clean_names()` wandelt alle Spaltennamen in konsistentes `snake_case` um (keine Leerzeichen, keine Sonderzeichen, nur Kleinbuchstaben und Unterstriche).

```r
library(janitor)

# Originale Spaltennamen: "Country Name", "GDP per Capita (USD)", "Year"
owid_roh |>
  clean_names()
# → country_name, gdp_per_capita_usd, year
```

Weitere nützliche Funktionen:

```r
tabyl(owid, world_region)          # schnelle Häufigkeitstabelle mit Prozenten
get_dupes(owid, country, year)     # doppelte Zeilen finden
remove_empty(owid, which = "cols") # leere Spalten entfernen
```

**Wann du es brauchst:** Immer wenn du rohe Daten erhältst, deren Spaltennamen uneinheitlich oder schwer zu tippen sind. Auch für schnelle explorative Tabellen.

---

## Fehlende Werte

### `naniar`

**Was es tut:** `naniar` macht fehlende Werte sichtbar — numerisch und grafisch. Es arbeitet direkt mit Tibbles und ggplot2 zusammen.

```r
library(naniar)

# Überblick: Wie viele NAs gibt es je Spalte?
miss_var_summary(owid)
# → Tabelle mit n_miss, pct_miss je Variable

# Grafische Übersicht
gg_miss_var(owid)

# Welche Variablen fehlen gemeinsam?
gg_miss_upset(owid)

# NA-Muster: Heatmap aller Spalten
vis_miss(owid)
```

**Wann du es brauchst:** Sobald du einen neuen Datensatz explorierst. Fehlende Werte sind in Realdaten die Regel, nicht die Ausnahme — und sie müssen vor Analysen verstanden werden.

---

## Modelle & Statistik

### `broom`

**Was es tut:** `broom` verwandelt den rohen Output von Modellen (`lm`, `glm`, etc.) in aufgeräumte Tibbles. Das Ergebnis eines `lm()`-Aufrufs ist intern eine Liste — `broom` macht daraus eine Tabelle, mit der du weiterarbeiten kannst.

```r
library(broom)

modell <- lm(life_expectancy_birth ~ bip_pro_kopf, data = owid_2015)

tidy(modell)     # Koeffizienten als Tibble (mit p-Werten, Standardfehlern)
glance(modell)   # Modellgüte (R², AIC, …) als einzeilige Zeile
augment(modell)  # Originalwerte + Residuen + Fitted-Werte als Tibble
```

**Wann du es brauchst:** Sobald du Regressionen auswertest und die Ergebnisse in eine Tabelle oder Grafik überführen willst.

**Im Seminar:** In `r_objekte.md` erwähnt; relevant ab dem Moment, wo ihr Regressionen rechnet.

---

### `infer`

**Was es tut:** `infer` macht statistische Inferenz (Hypothesentests, Konfidenzintervalle) im Tidyverse-Stil verständlicher. Es trennt die vier Schritte explizit: `specify()` → `hypothesize()` → `generate()` → `calculate()`.

```r
library(infer)

# Gibt es einen Unterschied in der Lebenserwartung zwischen Regionen?
owid_2015 |>
  specify(response = life_expectancy_birth, explanatory = world_region) |>
  hypothesize(null = "independence") |>
  generate(reps = 1000, type = "permute") |>
  calculate(stat = "F") |>
  visualize()
```

**Wann du es brauchst:** Wenn du Hypothesentests oder Bootstrap-Konfidenzintervalle berechnen willst und dabei verstehen möchtest, was R eigentlich rechnet.

---

## Visualisierung

### `patchwork`

**Was es tut:** `patchwork` kombiniert mehrere ggplot2-Grafiken zu einem Layout — nebeneinander, übereinander oder in komplexen Grids — mit einer einfachen Syntax.

```r
library(patchwork)

p1 <- ggplot(owid_2015, aes(x = bip_pro_kopf, y = life_expectancy_birth)) +
  geom_point()

p2 <- ggplot(owid_2015, aes(x = world_region, y = gini)) +
  geom_boxplot()

# Nebeneinander:
p1 + p2

# Übereinander:
p1 / p2

# Mit Beschriftung:
(p1 + p2) +
  plot_annotation(title = "Zwei Perspektiven auf globale Ungleichheit, 2015")
```

**Wann du es brauchst:** Für Berichte, wo du zwei thematisch zusammengehörige Grafiken nebeneinander zeigen willst.

---

### `ggthemr`

**Was es tut:** `ggthemr` bietet fertige visuelle Themes für ggplot2-Grafiken, die über `theme_minimal()` etc. hinausgehen — mit aufeinander abgestimmten Farbpaletten und Hintergründen.

```r
# Installation von GitHub (nicht auf CRAN):
# remotes::install_github("Mikata-Project/ggthemr")

library(ggthemr)

ggthemr("flat")   # Theme aktivieren — gilt für alle folgenden Grafiken

ggplot(owid_2015, aes(x = world_region, y = gini, fill = world_region)) +
  geom_boxplot()

ggthemr_reset()   # zurück zum Standard-ggplot2-Theme
```

Verfügbare Themes: `"flat"`, `"flat dark"`, `"earth"`, `"fresh"`, `"chalk"`, `"dust"`, `"sea"`, `"sky"`, u.a.

**Hinweis:** `ggthemr` ist nicht auf CRAN — du brauchst das Paket `remotes` zur Installation.

**Wann du es brauchst:** Wenn du eine Grafik schnell einheitlich stylen willst, ohne jedes `theme()`-Element selbst zu setzen.

---

## Tabellen & Berichte

### `kableExtra`

**Was es tut:** `kableExtra` erweitert `knitr::kable()` um Formatierungsoptionen für HTML- und PDF-Tabellen: Spaltenbreiten, Zellen-Highlighting, Zeilenfarben, Gruppierungsköpfe und mehr.

```r
library(kableExtra)
library(knitr)

owid_2015 |>
  slice_max(gini, n = 5) |>
  select(Land = country, Region = world_region, Gini = gini) |>
  kable(digits = 3, caption = "Top 5 Länder nach Gini-Koeffizient, 2015") |>
  kable_styling(bootstrap_options = c("striped", "hover", "condensed")) |>
  row_spec(1, bold = TRUE, color = "white", background = "#E07B39")
```

**Wann du es brauchst:** Im Abschlussbericht, wenn `kable()` allein nicht ausreicht und du professionell wirkende Tabellen erzeugen willst.

---

## Zeitreihen & rollierende Berechnungen

### `slider`

**Was es tut:** `slider` berechnet **rollierende (gleitende) Statistiken** — Mittelwerte, Summen oder beliebige Funktionen über ein Zeitfenster. Es ist flexibler als `zoo::rollapply()` und arbeitet nahtlos mit `mutate()` zusammen.

```r
library(slider)

owid |>
  filter(country == "Germany") |>
  arrange(year) |>
  mutate(
    gini_5j_mittel = slide_dbl(gini, mean, na.rm = TRUE, .before = 2, .after = 2)
  )
```

Das Argument `.before = 2, .after = 2` erzeugt ein zentriertes 5-Jahres-Fenster. Mit `.before = 4, .after = 0` erhältst du ein nachlaufendes Fenster (nur Vergangenheit).

**Wann du es brauchst:** Wenn du Zeitreihendaten glättest oder den Trend eines Indikators über mehrere Jahre hinweg sichtbar machen willst.

---

## Weitere empfehlenswerte Pakete

Diese Pakete gehen etwas über den Seminarstoff hinaus, sind aber einen Blick wert:

| Paket | Wofür |
|-------|-------|
| `scales` | Achsenbeschriftungen formatieren: `dollar_format()`, `percent_format()`, `comma_format()` — bereits im Tidyverse enthalten |
| `gt` | Professionelle Tabellen mit vollständiger Kontrolle über Layout und Stil; Alternative zu `kableExtra` |
| `ggrepel` | Beschriftungen in ggplot2-Grafiken automatisch so platzieren, dass sie sich nicht überlappen (`geom_label_repel()`) |
| `countrycode` | Ländernamen, ISO-Codes und Regionen automatisch übersetzen und ergänzen — hilfreich beim Zusammenführen verschiedener Datensätze |
| `modelsummary` | Regressionstabellen im Publikationsstil für mehrere Modelle gleichzeitig |
| `quarto` | Reproduzierbare Berichte erstellen — `quarto` ist die modernere Nachfolgeversion zu rmarkdown |

---

## Auf einen Blick

| Paket | Kategorie | Kernfunktion(en) | Wann relevant |
|-------|-----------|-----------------|---------------|
| `here` | Pfade | `here()` | Ab Session 3, immer |
| `janitor` | Cleaning | `clean_names()`, `tabyl()` | Rohdaten-Import |
| `naniar` | Fehlende Werte | `miss_var_summary()`, `vis_miss()` | Datenexploration |
| `broom` | Modelle | `tidy()`, `glance()`, `augment()` | Regressionsauswertung |
| `infer` | Statistik | `specify()` → `generate()` → `calculate()` | Hypothesentests |
| `patchwork` | Visualisierung | `+`, `/`, `plot_annotation()` | Mehrere Grafiken kombinieren |
| `ggthemr` | Visualisierung | `ggthemr("flat")` | Schnelles einheitliches Styling |
| `kableExtra` | Tabellen | `kable_styling()`, `row_spec()` | Abschlussbericht |
| `haven` | Import | `read_dta()`, `read_sav()` | Stata/SPSS-Dateien |
| `slider` | Zeitreihen | `slide_dbl()` | Rollierende Statistiken |
| `gt` | Tabellen | `gt()`, `fmt_number()` | Publikationsreife Tabellen |
| `ggrepel` | Visualisierung | `geom_label_repel()` | Überlappende Labels vermeiden |
| `countrycode` | Datenpflege | `countrycode()` | Länderdaten zusammenführen |
| `WDI` | Daten-API | `WDI()` | Weltbank-Daten direkt laden |
| `modelsummary` | Modelle | `modelsummary()` | Vergleich mehrerer Modelle |
