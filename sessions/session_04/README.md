# Hausaufgaben Session 4 — Datenstrukturen, Variablentypen und fehlende Werte

**Seminar:** Globale Ungleichheit · Wintersemester 2025/26

> **Hinweis:** Diese Woche findet keine Sitzung statt — die Hausaufgaben sind dein eigenständiger Einstieg in das Thema dieser Session. Lies alles sorgfältig und arbeite Schritt für Schritt. Du schaffst das!

---

## Inhaltsverzeichnis

- [Dein Endprodukt](#endprodukt)
- [Wo du arbeitest](#wo-du-arbeitest)
- [Einleitung](#einleitung)
- [Hausaufgaben](#hausaufgaben)
  - [HA1 · Den Datensatz systematisch erkunden](#ha1)
  - [HA2 · Variablentypen und ihre Tücken](#ha2)
  - [HA3 · Fehlende Werte untersuchen](#ha3)
  - [HA4 · Histogramm: Verteilung des Wasserzugangs](#ha4)
  - [HA5 · Linienplot: Entwicklung über die Zeit](#ha5)
  - [HA6 · Streudiagramm: Wasserzugang und Lebenserwartung](#ha6)
  - [Bonus-Hausaufgaben](#bonus-hausaufgaben)
- [Abgabe](#abgabe)

---

<h2 id="endprodukt">Dein Endprodukt</h2>

**Frage dieser Session:** Wie ist der Zugang zu sauberem Trinkwasser weltweit verteilt — und hängt das mit der Lebenserwartung zusammen?

Am Ende dieser Hausaufgaben wirst du drei Plots erstellt haben:

**Plot 1 — Histogramm:** Wie ist der Wasserzugang 2020 weltweit verteilt?

```
Anzahl Länder
  50 |  ██
  40 |  ████
  30 |  ████                                  ████
  20 |  ████                             ████████
  10 |  ████               ██       ████████████
   0 +─────────────────────────────────────────────
     0%    20%    40%    60%    80%   100%
           Bevölkerungsanteil mit sicherem Wasserzugang
```

**Plot 2 — Linienplot:** Wie hat sich der Wasserzugang in ausgewählten Ländern seit 2000 entwickelt?

**Plot 3 — Streudiagramm:** Länder mit besserem Wasserzugang — leben ihre Einwohner:innen länger?

*Die ASCII-Skizzen zeigen nur die ungefähre Form — deine ggplot-Grafiken werden deutlich schöner aussehen und müssen beschriftet sein.*

---

<h2 id="wo-du-arbeitest">Wo du arbeitest</h2>

Alle Code-Aufgaben bearbeitest du in **einem einzigen Skript**:

**`scripts/session_04_skript.R`**

### Schritt-für-Schritt

1. Vergewissere dich, dass du das korrekte RStudio-Projekt geöffnet hast. Oben rechts in RStudio sollte der Projektname erscheinen. Wenn nicht: Öffne die `.Rproj`-Datei per Doppelklick.
2. Öffne das Skript `scripts/session_04_skript.R`.
3. **Führe zuerst den SETUP-Abschnitt aus** — er lädt die nötigen Pakete und den OWID-Datensatz.

   > **`owid_data.csv` liegt unter `full_data/`** im Hauptordner des Repos. Wenn ein „Datei nicht gefunden"-Fehler erscheint, vergleiche deine Ordnerstruktur mit der im Repo und schau in den [häufigen Fehlern](../../resources/other/common_errors.md) nach.

4. Bearbeite die Hausaufgaben der Reihe nach.

> **Wichtig:** Schreibe deinen Code immer ins Skript, nicht in die Konsole. Nur so bleibt er gespeichert.

---

<h2 id="einleitung">Einleitung: Was steckt eigentlich in einem Datensatz?</h2>

In Session 3 hast du einen Datensatz geladen und ein erstes Histogramm erstellt. Heute gehen wir einen Schritt zurück und fragen: **Was ist ein Datensatz in R überhaupt?** Welche Arten von Variablen gibt es — und warum spielt das eine Rolle? Und was passiert, wenn Werte fehlen?

Das klingt technisch, ist aber der Unterschied zwischen einer Analyse, die funktioniert, und einer, die einen kryptischen Fehler produziert.

Unser inhaltlicher Fokus: **Zugang zu sauberem Trinkwasser** (`access_to_water`). Der Datensatz misst den Anteil der Bevölkerung, der Zugang zu sicher aufbereitetem Trinkwasser hat — von unter 2 % bis fast 100 %. Hinter diesen Zahlen steckt eine der grundlegendsten Dimensionen globaler Ungleichheit: Ob man sich darauf verlassen kann, dass das Wasser, das man trinkt, nicht krank macht.

---

<h2 id="hausaufgaben">Hausaufgaben</h2>

<h3 id="ha1">HA1 · Den Datensatz systematisch erkunden</h3>

### Was ist ein Tibble?

Wenn du Daten mit `read_csv()` lädst, bekommst du kein gewöhnliches R-Objekt — du bekommst ein **Tibble**. Ein Tibble ist die tidyverse-Version eines klassischen `data.frame`. Es verhält sich fast gleich, gibt aber deutlich bessere Fehlermeldungen und zeigt beim Ausdrucken nur die ersten Zeilen und Spalten — kein Endlos-Output, der deine Konsole füllt.

Zwei Funktionen helfen dir, einen Tibble systematisch kennen zu lernen:

| Funktion | Was sie zeigt |
|----------|--------------|
| `glimpse(datensatz)` | Kompakte Übersicht: Spaltennamen, Typen, erste Werte — alles auf einen Blick |
| `summary(datensatz)` | Für numerische Spalten: Min, Max, Mittelwert, Median — und die Anzahl der fehlenden Werte (`NA's`) |

### Deine Aufgaben

Schreibe den Code in den Abschnitt **HA1** in `scripts/session_04_skript.R`.

a) Wende `glimpse()` auf den OWID-Datensatz an. Notiere als Kommentar im Skript: Wie viele Zeilen und Spalten hat der Datensatz?

b) Wende `summary()` auf den gesamten Datensatz an. Schau dir die Ausgabe für `access_to_water` an: Was sind Minimum, Maximum und Median?

c) Wende `summary()` gezielt auf **eine einzige Spalte** an — nutze dafür `$`:

```r
summary(owid_daten$access_to_water)
```

Notiere als Kommentar: Was fällt dir an den Werten auf?

d) Schreibe 2–3 Sätze als Kommentar: Was sagt der Wertebereich von `access_to_water` über globale Ungleichheit aus?

<br>

<details>
<summary><strong>Tipp</strong></summary>

`glimpse()` und `summary()` können auf den ganzen Datensatz oder auf eine einzelne Spalte angewendet werden:

```r
glimpse(owid_daten)           # ganzer Datensatz
summary(owid_daten$access_to_water)  # nur eine Spalte
```

Für die Kommentare gibt es keine einzig richtige Antwort — schreib, was du siehst.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
glimpse(owid_daten)
# Der Datensatz hat ca. 75.000 Zeilen und 77 Spalten (je nach Version leicht abweichend).

summary(owid_daten)
# access_to_water: Min ~1%, Median ~79%, Max 100%

summary(owid_daten$access_to_water)

# access_to_water reicht von gut 1% bis 100%. Das heißt: In manchen Ländern
# hat fast die gesamte Bevölkerung sicheres Trinkwasser — in anderen weniger
# als 2 von 100 Menschen. Das ist ein extremes Ausmaß globaler Ungleichheit,
# das eine fundamentale Grundbedingung des Lebens betrifft.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha2">HA2 · Variablentypen und ihre Tücken</h3>

### Was ist neu?

Jede Spalte in einem Tibble hat einen **Typ**. Der Typ bestimmt, was R damit machen kann — und was nicht:

| Typ | Abkürzung in `glimpse()` | Beispiel |
|-----|--------------------------|---------|
| Ganze Zahlen | `<int>` | `2015`, `42` |
| Dezimalzahlen | `<dbl>` | `72.3`, `0.04` |
| Text | `<chr>` | `"Germany"`, `"Asia"` |
| Kategorien (geordnet) | `<fct>` | `"niedrig"`, `"mittel"`, `"hoch"` |
| Wahr/Falsch | `<lgl>` | `TRUE`, `FALSE` |

Mit `class()` kannst du den Typ einer einzelnen Spalte abfragen:

```r
class(owid_daten$country)            # "character"
class(owid_daten$access_to_water)    # "numeric"
```

Warum ist das wichtig? Weil R Fehlermeldungen produziert, wenn du Funktionen auf den falschen Typ anwendest — und weil ggplot2 Variablen je nach Typ anders darstellt. `year` als Zahl ergibt eine kontinuierliche Achse; `year` als Faktor ergibt diskrete Gruppen.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **HA2** in `scripts/session_04_skript.R`.

a) Bestimme den Typ dieser Variablen mit `class()`:

- `country`
- `year`
- `world_region`
- `access_to_water`
- `democracy_score_string`

b) **Debugging-Aufgabe:** Der folgende Code erzeugt einen Fehler. Führe ihn aus, lies die Fehlermeldung genau und erkläre im Kommentar, was das Problem ist — und wie man es beheben würde:

```r
mean(owid_daten$world_region)
```

c) **Denk-Aufgabe (kein Code nötig):** `year` hat den Typ `integer` (ganze Zahl). In einem Linienplot wäre das sinnvoll — R behandelt es als fortlaufende Zeitachse. Aber was würde passieren, wenn `year` fälschlicherweise als `character` gespeichert wäre? Schreibe 2 Sätze als Kommentar.

<br>

<details>
<summary><strong>Tipp zu b)</strong></summary>

Lies die Fehlermeldung: Was sagt R über den Typ des Arguments? `mean()` braucht Zahlen. `world_region` enthält Text. Das ist der Konflikt — kein Tippfehler, sondern ein Typ-Fehler.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
class(owid_daten$country)               # "character"
class(owid_daten$year)                  # "integer"
class(owid_daten$world_region)          # "character"
class(owid_daten$access_to_water)       # "numeric"
class(owid_daten$democracy_score_string) # "character"

mean(owid_daten$world_region)
# Fehlermeldung: argument is not numeric or logical: returning NA
# Problem: world_region ist Text ("Africa", "Europe", ...). Den Mittelwert
# von Regionsnamen zu berechnen ergibt keinen Sinn. Man müsste eine
# numerische Variable wählen, z. B.: mean(owid_daten$access_to_water, na.rm = TRUE)

# Wenn year als character gespeichert wäre, würde R es nicht als Zeitachse
# behandeln — ggplot würde jeden Jahreswert als separate Kategorie darstellen,
# was den Linienplot zerstören oder komplett unlesbar machen würde.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha3">HA3 · Fehlende Werte untersuchen</h3>

### Was ist neu?

Fehlende Werte heißen in R `NA` (*Not Available*). Sie entstehen, weil Daten nicht für jedes Land und jedes Jahr erhoben wurden. Das ist normal — aber `NA` ist ansteckend: Fast jede Berechnung mit einem `NA` gibt wieder `NA` zurück:

```r
mean(c(10, 20, NA))               # ergibt: NA
mean(c(10, 20, NA), na.rm = TRUE) # ergibt: 15
```

`na.rm = TRUE` weist R an, `NA`-Werte vor der Berechnung zu entfernen (*remove*). Das ist oft nötig — aber du solltest wissen, wie viele Werte dabei wegfallen.

Nützliche Funktionen:

```r
is.na(spalte)                    # TRUE/FALSE für jeden Wert
sum(is.na(spalte))               # Anzahl fehlender Werte
sum(is.na(spalte)) / nrow(datensatz) * 100  # Prozentanteil
```

### Deine Aufgaben

Schreibe den Code in den Abschnitt **HA3** in `scripts/session_04_skript.R`.

#### HA3 A: Fehlende Werte zählen

Berechne die Anzahl fehlender Werte für diese drei Variablen:

- `access_to_water`
- `life_expectancy_birth`
- `gini`

Speichere jedes Ergebnis in einem sinnvoll benannten Objekt (z. B. `n_miss_water`).

#### HA3 B: Prozentanteile berechnen

Berechne den prozentualen Anteil fehlender Werte für jede der drei Variablen.

#### HA3 C: Mittelwert mit und ohne `na.rm`

Berechne den Mittelwert von `access_to_water`:

1. Ohne `na.rm = TRUE` — was liefert R?
2. Mit `na.rm = TRUE` — was ist der Wert?

Schreibe einen Kommentar, der den Unterschied erklärt.

#### HA3 D: Interpretieren

Schreibe **3–4 Sätze** als Kommentar:

- Welche der drei Variablen hat die meisten fehlenden Werte?
- Was könnte der Grund dafür sein? (Tipp: Wofür braucht man Haushaltsbefragungen — und wer hat die Kapazitäten, diese regelmäßig durchzuführen?)
- Was bedeutet das für eine Analyse, die diese Variable verwendet?

<br>

<details>
<summary><strong>Tipp</strong></summary>

Schema für alle drei Variablen:

```r
n_miss_water <- sum(is.na(owid_daten$access_to_water))
pct_miss_water <- n_miss_water / nrow(owid_daten) * 100
```

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# HA3 A
n_miss_water <- sum(is.na(owid_daten$access_to_water))
n_miss_le    <- sum(is.na(owid_daten$life_expectancy_birth))
n_miss_gini  <- sum(is.na(owid_daten$gini))

# HA3 B
pct_miss_water <- n_miss_water / nrow(owid_daten) * 100
pct_miss_le    <- n_miss_le    / nrow(owid_daten) * 100
pct_miss_gini  <- n_miss_gini  / nrow(owid_daten) * 100

# HA3 C
mean(owid_daten$access_to_water)             # NA
mean(owid_daten$access_to_water, na.rm = TRUE) # ca. 70
# Ohne na.rm = TRUE "infiziert" ein einziges NA das gesamte Ergebnis —
# R gibt NA zurück, weil es nicht sicher sein kann, wie der fehlende Wert
# das Ergebnis beeinflusst hätte. Mit na.rm = TRUE werden NAs ignoriert
# und der Mittelwert aus den verfügbaren Werten berechnet.

# HA3 D
# gini hat mit Abstand die meisten fehlenden Werte. Der Gini-Koeffizient
# erfordert repräsentative Haushaltsbefragungen — ein aufwändiges und teures
# Verfahren, das viele Länder nicht jedes Jahr durchführen können.
# Reichere Länder haben dafür häufiger die Kapazität. Das bedeutet: Wenn wir
# nur Länder mit vollständigen gini-Daten analysieren, schauen wir
# möglicherweise nur auf einen wohlhabenden Ausschnitt der Welt.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha4">HA4 · Histogramm: Verteilung des Wasserzugangs</h3>

### Ziel

Du erstellst ein beschriftetes Histogramm des Wasserzugangs für das Jahr 2020. Die Verteilung hat eine charakteristische Form — sie ist nicht einfach schief, sondern zeigt zwei Häufungspunkte, sogenannte **Bimodalität**: Eine Gruppe von Ländern mit sehr niedrigem Wasserzugang und eine große Gruppe mit sehr hohem. Das ist kein statistisches Artefakt — es ist eine Aussage über die Welt.

### Aufgaben

Schreibe den Code in den Abschnitt **HA4** in `scripts/session_04_skript.R`.

Der Abschnitt enthält bereits diese vorbereitete Zeile — führe sie zuerst aus:

```r
owid_2020 <- owid_daten |>
  filter(year == 2020) |>
  distinct(country, .keep_all = TRUE)
```

> `filter()` wählt nur Zeilen mit `year == 2020`. `distinct()` entfernt doppelte Ländereinträge, die im Rohdatensatz vorkommen können. Beide Funktionen lernst du in Session 5 ausführlich kennen — hier nutzt du sie als Vorgabe.

#### HA4 A: Plausibilitätschecks

Führe aus und notiere deine Beobachtungen als Kommentar:

- `nrow(owid_2020)` — wie viele Länder für 2020?
- `summary(owid_2020$access_to_water)` — welche Werte siehst du?
- `sum(is.na(owid_2020$access_to_water))` — wie viele Länder fehlen?

#### HA4 B: Histogramm erstellen und beschriften

Erstelle ein Histogramm von `access_to_water` mit `ggplot()` + `geom_histogram()`. Experimentiere mit `bins` (probiere 15, 25, 35) und wähle den Wert, der die Verteilung am klarsten zeigt.

Füge mit `labs()` hinzu:

- `title` — einen informativen Titel
- `subtitle` — das Jahr und was gemessen wird
- `x` und `y` — sinnvolle Achsenbeschriftungen
- `caption` — Quellenangabe

Vergib dem Plot das Objekt `water_histogram` und gib ihn aus.

#### HA4 C: Farbe und Interpretation

Passe die Balkenfarbe an: `fill = "steelblue", color = "white"` im `geom_histogram()`-Aufruf. Probiere auch andere Farben — welche findest du für das Thema passend?

Schreibe **3–4 Sätze Interpretation** als Kommentar:

- Siehst du die zwei Häufungspunkte?
- Was bedeutet die Lücke dazwischen?
- Was sagt die Verteilung über globale Ungleichheit beim Wasserzugang?

#### HA4 D: Plot speichern

```r
dir.create(here("output"), showWarnings = FALSE)

ggsave(
  here("output", "water_histogram_2020.png"),
  plot   = water_histogram,
  width  = 8,
  height = 5
)
```

<br>

<details>
<summary><strong>Tipp</strong></summary>

Grundmuster:

```r
water_histogram <- ggplot(owid_2020, aes(x = access_to_water)) +
  geom_histogram(bins = 25, fill = "steelblue", color = "white") +
  labs(
    title    = "...",
    subtitle = "...",
    x        = "...",
    y        = "...",
    caption  = "Quelle: Our World in Data / WHO–UNICEF JMP"
  )

water_histogram
```

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
owid_2020 <- owid_daten |>
  filter(year == 2020) |>
  distinct(country, .keep_all = TRUE)

# HA4 A
nrow(owid_2020)
summary(owid_2020$access_to_water)
sum(is.na(owid_2020$access_to_water))
# Ca. 215–220 Länder für 2020; wenige fehlende Werte.
# Werte reichen von unter 2% bis 100%; Median um 79%.

# HA4 B–C
water_histogram <- ggplot(owid_2020, aes(x = access_to_water)) +
  geom_histogram(bins = 25, fill = "steelblue", color = "white") +
  labs(
    title    = "Zugang zu sauberem Trinkwasser weltweit",
    subtitle = "Anteil der Bevölkerung mit sicher aufbereitetem Wasser, 2020",
    x        = "Bevölkerungsanteil mit sicherem Wasserzugang (%)",
    y        = "Anzahl Länder",
    caption  = "Quelle: Our World in Data / WHO–UNICEF Joint Monitoring Programme"
  )

water_histogram

# Die Verteilung ist bimodal: Es gibt eine Häufung von Ländern mit sehr niedrigem
# Wasserzugang (unter 30%) und eine viel größere Häufung nahe 100%.
# Der breite leere Bereich dazwischen zeigt, dass es kaum "mittelmäßigen"
# Wasserzugang gibt — die Welt ist in diesem Bereich tatsächlich zweigeteilt.
# Das spiegelt eine fundamentale globale Ungleichheit wider: Sauberes Wasser
# ist in reichen Ländern eine Selbstverständlichkeit, in armen oft unerreichbar.

dir.create(here("output"), showWarnings = FALSE)

ggsave(
  here("output", "water_histogram_2020.png"),
  plot   = water_histogram,
  width  = 8,
  height = 5
)
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha5">HA5 · Linienplot: Entwicklung über die Zeit</h3>

### Ziel

Ein Histogramm zeigt, wie eine Variable zu einem Zeitpunkt verteilt ist. Ein **Linienplot** zeigt, wie sie sich über die Zeit verändert. Du wirst sehen, dass Länder mit niedrigem Wasserzugang zwar Fortschritte machen — aber die Lücke zu den reichen Ländern riesig bleibt.

### Was ist neu?

`geom_line()` verbindet Datenpunkte zu einer Linie — sinnvoll, wenn die x-Achse eine Zeitvariable ist. Wenn mehrere Gruppen (z. B. Länder) im Datensatz sind, sagt man ggplot2 mit `color = country`, dass jede Gruppe eine eigene Linie bekommt:

```r
ggplot(daten, aes(x = year, y = variable, color = country)) +
  geom_line()
```

### Aufgaben

Schreibe den Code in den Abschnitt **HA5** in `scripts/session_04_skript.R`.

Der Abschnitt enthält diese vorbereitete Zeile:

```r
fuenf_laender <- owid_daten |>
  filter(
    country %in% c("Germany", "Brazil", "India", "Nigeria", "Bangladesh"),
    year >= 2000
  ) |>
  distinct(country, year, .keep_all = TRUE)
```

> `%in%` prüft, ob ein Wert in einem Vektor enthalten ist — hier: ob `country` zu den fünf genannten Ländern gehört. Auch das lernst du in Session 5 ausführlich.

#### HA5 A: Plausibilitätschecks

Führe aus:

- `nrow(fuenf_laender)` — wie viele Zeilen?
- `summary(fuenf_laender$access_to_water)` — Wertebereiche?
- `sum(is.na(fuenf_laender$access_to_water))` — fehlende Werte?

#### HA5 B: Linienplot erstellen

Erstelle einen Linienplot mit `year` auf der x-Achse, `access_to_water` auf der y-Achse, und einer Linie pro Land. Beschrifte den Plot vollständig mit `labs()`.

Weise den Plot dem Objekt `water_lineplot` zu.

#### HA5 C: Plot speichern und interpretieren

Speichere den Plot:

```r
ggsave(
  here("output", "water_lineplot.png"),
  plot   = water_lineplot,
  width  = 9,
  height = 5
)
```

Schreibe **3–4 Sätze Interpretation** als Kommentar:

- Welches Land hat den niedrigsten Wasserzugang — und hat er sich verbessert?
- Welches Land zeigt den stärksten Anstieg?
- Was fällt dir am Abstand zwischen den Ländern auf?

<br>

<details>
<summary><strong>Tipp</strong></summary>

Grundmuster für den Linienplot:

```r
water_lineplot <- ggplot(fuenf_laender, aes(x = year, y = access_to_water, color = country)) +
  geom_line(linewidth = 1) +
  labs(
    title   = "...",
    x       = "Jahr",
    y       = "...",
    color   = "Land",
    caption = "Quelle: Our World in Data"
  )

water_lineplot
```

`linewidth = 1` macht die Linien etwas dicker und leichter lesbar.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
fuenf_laender <- owid_daten |>
  filter(
    country %in% c("Germany", "Brazil", "India", "Nigeria", "Bangladesh"),
    year >= 2000
  ) |>
  distinct(country, year, .keep_all = TRUE)

# HA5 A
nrow(fuenf_laender)
summary(fuenf_laender$access_to_water)
sum(is.na(fuenf_laender$access_to_water))

# HA5 B
water_lineplot <- ggplot(fuenf_laender, aes(x = year, y = access_to_water, color = country)) +
  geom_line(linewidth = 1) +
  labs(
    title   = "Entwicklung des Wasserzugangs seit 2000",
    x       = "Jahr",
    y       = "Bevölkerungsanteil mit sicherem Wasserzugang (%)",
    color   = "Land",
    caption = "Quelle: Our World in Data / WHO–UNICEF JMP"
  )

water_lineplot

# Nigeria hat mit Abstand den niedrigsten Wasserzugang — unter 30% im Jahr 2000,
# mit nur langsamen Fortschritten seither.
# Indien zeigt den stärksten Aufwärtstrend: von ~38% auf über 70% in 20 Jahren.
# Deutschland liegt die ganze Zeit nahe 100% und ist kaum von der Stelle gerückt —
# weil es nichts mehr zu verbessern gibt.
# Der Abstand zwischen Deutschland und Nigeria ist 2024 fast genauso groß wie 2000.
# Das zeigt: Selbst wenn ärmere Länder Fortschritte machen, bleibt die absolute
# Lücke dramatisch groß.

ggsave(
  here("output", "water_lineplot.png"),
  plot   = water_lineplot,
  width  = 9,
  height = 5
)
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha6">HA6 · Streudiagramm: Wasserzugang und Lebenserwartung</h3>

### Ziel

Länder mit besserem Wasserzugang — leben ihre Einwohner:innen auch länger? Du erstellst ein Streudiagramm, das jeden Punkt als ein Land darstellt — und damit sichtbar macht, ob zwischen den beiden Variablen ein Zusammenhang besteht.

### Was ist neu?

`geom_point()` zeichnet einen Punkt pro Zeile im Datensatz. Mit `aes(x = ..., y = ...)` legst du die beiden Achsen fest. Optional kannst du mit `color = world_region` die Punkte nach Region einfärben — dann siehst du, ob der Zusammenhang innerhalb von Weltregionen anders aussieht.

### Aufgaben

Schreibe den Code in den Abschnitt **HA6** in `scripts/session_04_skript.R`.

Der Abschnitt enthält diese vorbereitete Zeile:

```r
owid_2020_scatter <- owid_daten |>
  filter(year == 2020) |>
  distinct(country, .keep_all = TRUE) |>
  filter(!is.na(access_to_water), !is.na(life_expectancy_birth))
```

> `!is.na()` bedeutet: "ist **nicht** NA" — also: behalte nur Zeilen, in denen der Wert vorhanden ist. Das ist die saubere Variante, NA-Probleme beim Plotten zu vermeiden.

#### HA6 A: Plausibilitätschecks

- `nrow(owid_2020_scatter)` — für wie viele Länder haben wir beide Variablen?
- Schreibe als Kommentar: Was würde passieren, wenn wir die NAs nicht entfernen würden — würde der Plot trotzdem funktionieren? (Hinweis: Probiere es aus, wenn du möchtest.)

#### HA6 B: Streudiagramm erstellen

Erstelle ein Streudiagramm mit:

- `access_to_water` auf der x-Achse
- `life_expectancy_birth` auf der y-Achse
- `color = world_region`, um Punkte nach Region einzufärben

Beschrifte den Plot vollständig. Weise ihn dem Objekt `water_scatter` zu.

#### HA6 C: Plot speichern und interpretieren

```r
ggsave(
  here("output", "water_scatter.png"),
  plot   = water_scatter,
  width  = 9,
  height = 6
)
```

Schreibe **4–5 Sätze Interpretation** als Kommentar:

- Gibt es einen erkennbaren Zusammenhang zwischen Wasserzugang und Lebenserwartung?
- In welche Richtung geht er?
- Gibt es Ausreißer — Länder, die nicht ins Muster passen?
- Welche Weltregionen fallen besonders auf?

<br>

<details>
<summary><strong>Tipp</strong></summary>

Grundmuster:

```r
water_scatter <- ggplot(owid_2020_scatter, aes(x = access_to_water, y = life_expectancy_birth, color = world_region)) +
  geom_point(alpha = 0.7, size = 2.5) +
  labs(
    title  = "...",
    x      = "...",
    y      = "...",
    color  = "Weltregion",
    caption = "Quelle: Our World in Data"
  )

water_scatter
```

`alpha = 0.7` macht die Punkte leicht durchsichtig — so sieht man überlappende Punkte besser. `size = 2.5` macht sie etwas größer.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
owid_2020_scatter <- owid_daten |>
  filter(year == 2020) |>
  distinct(country, .keep_all = TRUE) |>
  filter(!is.na(access_to_water), !is.na(life_expectancy_birth))

# HA6 A
nrow(owid_2020_scatter)
# Wenn wir NAs nicht entfernen würden, würde ggplot2 die Punkte mit NA in
# einer der beiden Variablen einfach weglassen und eine Warnung ausgeben
# ("Rows containing missing values removed"). Der Plot würde funktionieren,
# aber es wäre unklar, wie viele Länder fehlen — explizites Entfernen
# ist transparenter.

# HA6 B
water_scatter <- ggplot(owid_2020_scatter,
    aes(x = access_to_water, y = life_expectancy_birth, color = world_region)) +
  geom_point(alpha = 0.7, size = 2.5) +
  labs(
    title   = "Wasserzugang und Lebenserwartung im Jahr 2020",
    x       = "Bevölkerungsanteil mit sicherem Wasserzugang (%)",
    y       = "Lebenserwartung bei Geburt (Jahre)",
    color   = "Weltregion",
    caption = "Quelle: Our World in Data / WHO–UNICEF JMP / UN"
  )

water_scatter

# Es gibt einen klaren positiven Zusammenhang: Länder mit höherem Wasserzugang
# haben tendenziell auch eine höhere Lebenserwartung.
# Die afrikanischen Länder (rot) häufen sich unten links — niedriger Wasserzugang,
# niedrige Lebenserwartung. Europäische Länder liegen oben rechts.
# Es gibt einige Ausreißer: Länder mit hohem Wasserzugang aber eher mittlerer
# Lebenserwartung — möglicherweise wegen anderer Faktoren wie Ernährung oder
# Gesundheitsversorgung.
# Der Zusammenhang zeigt, dass Wasserzugang und Gesundheit eng verknüpft sind —
# aber Kausalität lässt sich aus einem Streudiagramm allein nicht ableiten.

ggsave(
  here("output", "water_scatter.png"),
  plot   = water_scatter,
  width  = 9,
  height = 6
)
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h2 id="bonus-hausaufgaben">Bonus-Hausaufgaben</h2>

Diese Aufgaben sind freiwillig. Sie vertiefen das Thema und können Grundlage für den späteren Abschlussbericht sein.

---

### B-HA1 · Mittlere, Median und Streuung vergleichen

Berechne für `access_to_water` im Datensatz `owid_2020`:

- Mittelwert (`mean(..., na.rm = TRUE)`)
- Median (`median(..., na.rm = TRUE)`)
- Standardabweichung (`sd(..., na.rm = TRUE)`)

Schreibe 3–4 Sätze Kommentar: Warum weichen Mittelwert und Median voneinander ab — und was sagt die Standardabweichung über die Ungleichheit des Wasserzugangs aus?

---

### B-HA2 ⚠️ · Trendlinie im Streudiagramm

Füge dem Streudiagramm aus HA6 eine glatte Trendlinie hinzu:

```r
water_scatter +
  geom_smooth(method = "loess", color = "black", se = FALSE)
```

- Was zeigt die Kurve — ist der Zusammenhang linear?
- Gibt es Bereiche, in denen die Lebenserwartung mit dem Wasserzugang besonders stark steigt?
- Schreibe 3–4 Sätze Kommentar.

---

### B-HA3 ⚠️ · Eigene Länderauswahl für den Linienplot

Wähle 4–6 Länder deiner Wahl und erstelle einen eigenen Linienplot der Wasserzugangsentwicklung seit 2000. Begründe als Kommentar, warum du genau diese Länder gewählt hast — und was der Vergleich zeigt.

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h2 id="abgabe">Abgabe</h2>

Wenn du fertig bist:

1. Speichere das Skript `scripts/session_04_skript.R` (`Ctrl+S` / `Cmd+S`).
2. Stelle sicher, dass alle drei Plots im Ordner `output/` gespeichert wurden:
   - `water_histogram_2020.png`
   - `water_lineplot.png`
   - `water_scatter.png`
3. Reiche auf Learnweb ein:
   - `scripts/session_04_skript.R`
   - alle drei Plot-Dateien aus `output/`

> **Falls etwas nicht funktioniert:** Lies zuerst die Fehlermeldung, frage deine Buddy-Partner:in, schau in den [häufigen Fehlern](../../resources/other/common_errors.md) nach oder melde dich im Kurs-Forum.

---

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>
