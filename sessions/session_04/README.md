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
  - [HA2 · Mit `filter()` Zeilen auswählen](#ha2)
  - [HA3 · Die Pipe (`|>`) kennenlernen](#ha3)
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
  30 |  ██████████████████████████████████████████
  20 |  █████████████████████████████████████████
  10 |  ████████████████████████████████████████
   0 +─────────────────────────────────────────────
     0%    20%    40%    60%    80%   100%
           Bevölkerungsanteil mit sicherem Wasserzugang
```

*Das hier ist nur eine Skizze, die die ungefähre Form zeigt — deine ggplot-Grafik wird deutlich schöner aussehen und muss ordentlich beschriftet sein.*

**Plot 2 — Linienplot:** Wie hat sich der Wasserzugang in ausgewählten Ländern seit 2000 entwickelt?

**Plot 3 — Streudiagramm:** Länder mit besserem Wasserzugang — leben ihre Einwohner:innen länger?



---

<h2 id="wo-du-arbeitest">Wo du arbeitest</h2>

Alle Code-Aufgaben bearbeitest du in **einem einzigen Skript**:

**`scripts/session_04_skript.R`**

### Schritt-für-Schritt: Wie lege ich los?

1. Lade den Session-Ordner für diese Woche runter (Session 4). Die Anleitung dazu findest du [hier](https://github.com/nlegewie/Intro_to_R_Seminar/tree/main/sessions).
2. Vergewissere dich, dass du das korrekte RStudio-Projekt geöffnet hast. Du findest die Datei im entsprechenden Session-Ordner. Für diese Woche brauchst du Session 4. Oben rechts in RStudio sollte der Projektname erscheinen. Wenn nicht: Öffne die `.Rproj`-Datei per Doppelklick.
3. Öffne das Skript `scripts/session_04_skript.R`.
4. **Führe zuerst den SETUP-Abschnitt aus** — er lädt die nötigen Pakete und den OWID-Datensatz.

   > **`owid_data.csv` liegt unter `full_data/`** in deinem Hauptordner. Wenn ein „Datei nicht gefunden"-Fehler erscheint, vergleiche deine Ordnerstruktur mit der im Repo und schau in den [häufigen Fehlern](../../resources/other/common_errors.md) nach.

5. Bearbeite die Hausaufgaben der Reihe nach.

> **Wichtig:** Schreibe deinen Code immer ins Skript, nicht in die Konsole. Nur so bleibt er gespeichert.

---

<h2 id="einleitung">Einleitung: Was ist ein Datensatz?</h2>

In Session 3 hast du einen Datensatz geladen und ein erstes Histogramm erstellt. Heute gehen wir einen Schritt zurück und fragen: **Was ist ein Datensatz in R überhaupt?** 

Das klingt technisch, ist aber der Unterschied zwischen einer Analyse, die funktioniert, und einer, die kryptische Fehler produziert.

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

`glimpse()` und `summary()` können auf den ganzen Datensatz oder auf eine einzelne Spalte angewendet werden. Für den gesamten Datensatz `owid_daten` nimmst du die Funktion (z.B. `glimpse()`), schreibst den Datensatz in die Klammer. Für einzelne Spalten musst du noch `$` und den Spaltennamen hinter den Datensatz hinzufügen.

Für die Kommentare gibt es keine einzig richtige Antwort — notiere, was du siehst und interessant findest.

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

<h3 id="ha2">HA2 · Mit `filter()` Zeilen auswählen</h3>

### Was macht `filter()`?

Ein Tibble wie `owid_daten` enthält viele Zeilen — für viele Länder und viele Jahre. Meist interessieren dich nicht alle auf einmal, sondern nur ein **Ausschnitt**: z. B. nur 2020, oder nur Länder mit sehr niedrigem Wasserzugang.

`filter()` wählt **Zeilen** aus, für die eine Bedingung **wahr** (`TRUE`) ist. Alle anderen Zeilen werden verworfen. Das Ergebnis ist wieder ein Tibble — nur kleiner.

| Bedingung | Bedeutung | Beispiel |
|-----------|-----------|----------|
| `==` | ist gleich | `year == 2020` |
| `>` / `<` | größer / kleiner | `access_to_water < 30` |
| `>=` / `<=` | größer-gleich / kleiner-gleich | `year >= 2000` |
| `&` | UND (beides muss gelten) | `year == 2020 & access_to_water < 50` |
| `%in%` | Wert ist in einer Liste | `country %in% c("Germany", "Nigeria")` |

**Beispiel:** Nur Länderjahre mit weniger als 30% Wasserzugang:

```r
filter(owid_daten, access_to_water < 30)
```

**Beispiel:** Nur Deutschland und Nigeria, ab dem Jahr 2000:

```r
filter(owid_daten, country %in% c("Germany", "Nigeria"),
                    year >= 2000
  )
```

Mehrere Bedingungen in `filter()` werden mit einem **Komma** getrennt — das bedeutet logisch **UND**: Beide müssen erfüllt sein. Ein `&` funktioniert auch.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **HA2** in `scripts/session_04_skript.R`.

a) Filtere `owid_daten` auf das Jahr 2015. Speichere das Ergebnis in `owid_daten_2015` und prüfe mit `nrow()`, wie viele Zeilen übrig sind.

b) Filtere auf alle Zeilen mit `access_to_water < 30` (weniger als 30 % der Bevölkerung mit sicherem Wasserzugang). Wie viele Zeilen ergeben sich? Was sagt dir diese Zahl über globale Ungleichheit?

c) Filtere auf die Länder **Germany**, **India** und **Nigeria** — und nur für Jahre ab 2000 (`year >= 2000`). Speichere das Ergebnis in `owid_drei_laender_seit_2000`.

d) Kombiniere zwei Bedingungen: Erstelle ein Tibble mit allen Zeilen für **2020**, in denen `access_to_water` **über 90** liegt. Speichere es als `owid_2020_hoher_wasserzugang`. Zähle die Zeilen mit `nrow()` und schreibe **1–2 Sätze** als Kommentar: Was für Länder könnten das sein?

<br>

<details>
<summary><strong>Tipp</strong></summary>

Zur Erinnerung: Du weist das Ergebnis eines Vorgangs (z.B. hier des Filterns) mit dem `<-` - Operator zu. Links davon steht der Name des Objekts, das du erschaffen möchtest (für die Aufgabe z.B. `owid_daten_2015`), rechts davon steht der Code für den Vorgang, den du durchführen möchtest (z.B. `filter(owid_daten, year == 2015)`).

Für Aufgabe b) musst du zwei Funktionen ineinander schachteln: `nrow(filter(...))`. Keine Sorge, wir lernen in der nächsten Übung einen viel bessereren Weg kennen, das zu schreiben.

Für Aufgabe d) brauchst du zwei Bedingungen in einem `filter()`-Aufruf — entweder mit Komma oder mit `&`:

```r
filter(owid_daten, year == 2020, access_to_water > 90)
```

Wenn du unsicher bist, ob dein Filter funktioniert hat: `glimpse()` oder `nrow()` direkt an die Pipe-Kette hängen.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# HA2 a
owid_2015 <- filter(owid_daten, year == 2015)

nrow(owid_2015)
# Ca. 215–220 Zeilen.

# HA2 b
nrow(filter(owid_daten, access_to_water < 30))
# Ca. 3.000–4.000 Zeilen (viele Länderjahre über die Zeit).
# Das zeigt: In einem erheblichen Teil der Weltbevölkerung hat ein großer
# Anteil keinen sicheren Zugang zu Trinkwasser — ein Kernmerkmal globaler Ungleichheit.

# HA2 c
drei_laender_seit_2000 <- filter(owid_daten,
    country %in% c("Germany", "India", "Nigeria"),
    year >= 2000
  )

drei_laender_seit_2000 |> glimpse()
# Ca. 60–75 Zeilen (3 Länder × ca. 20–25 Jahre).

# HA2 d
owid_2020_hoher_wasserzugang <- filter(owid_daten,
        year == 2020, 
        access_to_water > 90
        )

nrow(owid_2020_hoher_wasserzugang)
# Ca. 150–170 Zeilen.
# Das sind vor allem Länder mit sehr hohem Wasserzugang — oft wohlhabendere
# Staaten in Europa, Nordamerika und Teilen Asiens, in denen fast die gesamte
# Bevölkerung Zugang zu sicherem Trinkwasser hat.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha3">HA3 · Die Pipe (`|>`) kennenlernen</h3>

### Was ist die Pipe?

Bisher hast du Funktionen oft so aufgerufen: Zuerst der Datensatz, dann die Funktion in Klammern — `glimpse(owid_daten)`. Das funktioniert. Wird es aber komplizierter, d.h. willst du mehrere Arbeitsschritte hintereinander abwickeln, wird der Code schnell unübersichtlich und schwer zu verstehen.

Die **Pipe** (`|>`) verbindet Schritte wie Perlen auf einer Kette: Das Ergebnis links wird automatisch als **erstes Argument** an die Funktion rechts übergeben. Du liest den Code von **oben nach unten** — in der Reihenfolge, in der du denkst. Du kannst sie lesen als "und dann".

**Ohne Pipe** — alles in einer Zeile, von innen nach außen:

```r
filter(owid_daten, year == 2020)
```

**Mit Pipe** — Schritt für Schritt, von oben nach unten:

```r
owid_daten |>
  filter(year == 2020)
```

Das Beispiel mit Pipe kannst du lesen als: "Ich nehme den Datensatz `owid_daten` UND DANN filtere ich die Zeilen heraus, die das Jahr 2020 beschreiben."

Beide Varianten machen dasselbe: Sie filtern den Datensatz für das Jahr 2020. Die Pipe-Version ist leichter zu erweitern — du kannst unten einfach weitere Zeilen anhängen, z. B. `glimpse()` oder `summary()`.

> **Hinweis:** In älteren Skripten findest du manchmal `%>%` statt `|>`. Beide sind Pipes; wir nutzen `|>`, weil es in modernem R Standard ist.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **HA3** in `scripts/session_04_skript.R`.

a) Wende `glimpse()` auf `owid_daten` an — einmal **ohne** Pipe und einmal **mit** Pipe. Notiere als Kommentar: Ergeben beide Aufrufe dasselbe?

b) Nutze die Pipe, um zuerst auf das Jahr 2020 zu filtern und dann `glimpse()` auf das Ergebnis anzuwenden. Wie viele Zeilen siehst du?

c) Baue eine längere Pipe-Kette: Starte mit `owid_daten`, filtere auf `year == 2020`, zähle danach mit `nrow()`, wie viele Zeilen übrig bleiben und prüfe danach mit `class()`, welchen Typ der Output hat.

d) **Denk-Aufgabe:** Warum ist die Pipe besonders hilfreich, wenn du später mehrere Schritte hintereinander ausführst — z. B. filtern, fehlende Werte entfernen und dann plotten? Schreibe 2 Sätze als Kommentar.

<br>

<details>
<summary><strong>Tipp</strong></summary>

Jede Zeile in einer Pipe-Kette beginnt mit dem Ergebnis der Zeile darüber. Die Einrückung ist optional, macht den Code aber lesbarer:

```r
owid_daten |>
  filter(year == 2020) |>
  glimpse()
```

Wenn eine Zeile mit `|>` endet, kommt die nächste Funktion in der **nächsten** Zeile. Der letzte Schritt braucht kein `|>` mehr — dort steht die letzte Funktion (z. B. `nrow()` oder `glimpse()`).

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# HA3 a
glimpse(owid_daten)
owid_daten |> glimpse()
# Beide zeigen dieselbe kompakte Übersicht — nur die Schreibweise unterscheidet sich.

# HA3 b
owid_daten |>
  filter(year == 2020) |>
  glimpse()
# Deutlich weniger Zeilen als im Gesamtdatensatz — nur Beobachtungen für 2020.

# HA3 c
n_zeilen_2020 <- owid_daten |>
  filter(year == 2020) |>
  nrow() |>
  class()

# Es handelt sich um ein Objekt des Typs "integer", was eine ganze Zahl ist.

# HA3 d
# Die Pipe macht jeden Zwischenschritt sichtbar und erweiterbar.
# Statt verschachtelter Klammern liest man den Datenfluss wie einen Satz:
# „Nimm owid_daten UND DANN filtere UND DANN entferne NAs UND DANN plotte."
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha4">HA4 · Histogramm: Verteilung des Wasserzugangs</h3>

### Ziel

Du erstellst ein beschriftetes Histogramm des Wasserzugangs für das Jahr 2020. Die Verteilung hat eine charakteristische Form, welche uns einen wichtigen Einblick in das Phänomen bietet. 

### Aufgaben

Schreibe den Code in den Abschnitt **HA4** in `scripts/session_04_skript.R`.

Der Abschnitt enthält bereits diese vorbereitete Zeile — führe sie zuerst aus:

```r
owid_2020 <- owid_daten |>
  filter(year == 2020) |>
  distinct(country, .keep_all = TRUE)
```

> `filter()` hast du in HA2 kennengelernt — hier filterst du auf `year == 2020`. `distinct()` entfernt doppelte Ländereinträge, die im Rohdatensatz vorkommen können; diese Funktion lernst du in Session 5 ausführlich kennen. Die weiteren filter() Aufrufe entfernen Zeilen, die Werte für ganze Kontinente zusammenfassen.

#### HA4 A: Plausibilitätschecks

Führe aus und notiere deine Beobachtungen als Kommentar:

- `nrow(owid_2020)` — wie viele Länder für 2020?
- `summary(owid_2020$access_to_water)` — welche Werte siehst du? Wie viele Länder fehlen?

#### HA4 B: Histogramm erstellen und beschriften

Erstelle ein Histogramm von `access_to_water` mit `ggplot()` + `geom_histogram()`. Experimentiere mit `bins` (probiere 15, 25, 35) und wähle den Wert, der die Verteilung am klarsten zeigt. bin kannst du als Argument innerhalb von `geom_histogram()` hinzufugen, z.B. so: `geom_histogram(bins = 25)`

Füge mit `labs()` hinzu:

- `title` — einen informativen Titel
- `subtitle` — das Jahr und was gemessen wird
- `x` und `y` — sinnvolle Achsenbeschriftungen
- `caption` — Quellenangabe ("OWID")

Weise den Plot dem Objekt `water_histogram` zu und lass ihn dir auswerfen.

#### HA4 C: Farbe und Interpretation

Passe die Balkenfarbe an: `fill = "steelblue", color = "white"` im `geom_histogram()`-Aufruf. Mehrere Argumente (also hier `bins`, `fill` und `color`) werden mit Kommata getrennt. Probiere auch andere Farben — welche findest du für das Thema passend?

Schreibe **3–4 Sätze Interpretation** als Kommentar:

- Was sagt die Verteilung über globale Ungleichheit beim Wasserzugang?

#### HA4 D: Plot speichern

Kopiere den folgenden Code in das Skript und führe ihn aus. 

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
water_histogram <- owid_2020 |>
ggplot(aes(x = access_to_water)) +
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

# HA4 A
nrow(owid_2020)
summary(owid_2020$access_to_water)
sum(is.na(owid_2020$access_to_water))
# Ca. 215–220 Länder für 2020; wenige fehlende Werte.
# Werte reichen von unter 2% bis 100%; Median um 79%.

# HA4 B–C
water_histogram <- owid_2020 |>
ggplot(aes(x = access_to_water)) +
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

Ein Histogramm zeigt, wie eine Variable verteilt ist. Eben haben wir uns die Verteilung in einem bestimmten Jahr angeschaut (2020). Ein **Linienplot** zeigt, wie sich eine Variable über die Zeit verändert. 

### Was ist neu?

`geom_line()` verbindet Datenpunkte zu einer Linie — sinnvoll, wenn die x-Achse eine Zeitvariable ist. Wenn mehrere Gruppen (z. B. Länder) im Datensatz sind, sagt man ggplot2 mit `color = country`, dass jede Gruppe eine eigene Linie bekommt:

```r
ggplot(daten, aes(x = year, y = variable, color = country)) +
  geom_line()
```

### Aufgaben

Schreibe den Code in den Abschnitt **HA5** in `scripts/session_04_skript.R`.

Der Abschnitt enthält diese vorbereitete Zeile. Für sie aus, um das Objekt `fuend_laender` zu erstellen. 

```r
fuenf_laender <- owid_daten |>
  filter(
    country %in% c("Germany", "Brazil", "India", "Nigeria", "Bangladesh"),
    year >= 2000
  ) |>
  distinct(country, year, .keep_all = TRUE)
```

> `%in%` hast du in HA3 schon gesehen — hier prüfst du, ob `country` zu den fünf genannten Ländern gehört, und filterst die Zeilen heraus, für die das der Fall ist.

#### HA5 A: Plausibilitätschecks

Führe aus:

- `nrow(fuenf_laender)` — wie viele Zeilen?
- `summary(fuenf_laender$access_to_water)` — Wertebereiche? Fehlende Werte?

#### HA5 B: Linienplot erstellen

Erstelle einen Linienplot mit `year` auf der x-Achse, `access_to_water` auf der y-Achse, und einer Linie pro Land. Beschrifte den Plot vollständig mit `labs()`.

Benutze innerhalb von `geom_line()` das Argument `linewidth = 1`, welches die Linien etwas dicker und leichter lesbar macht.

Weise den Plot dem Objekt `water_lineplot` zu.

#### HA5 C: Plot speichern und interpretieren

Speichere den Plot, indem du den folgenden Code ins Skript kopierst und ausführst.

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
water_lineplot <- fuenf_laender |>
ggplot(aes(x = year, y = access_to_water, color = country)) +
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

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r

# HA5 A
nrow(fuenf_laender)
summary(fuenf_laender$access_to_water)

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
# Der Abstand zwischen Deutschland und Nigeria ist auch 2024 noch sehr groß.
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

Leben in Ländern mit besserem Wasserzugang die Einwohner:innen länger? Du erstellst ein Streudiagramm, das jeden Punkt als ein Land darstellt — und damit sichtbar macht, ob zwischen den beiden Variablen ein Zusammenhang besteht.

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

Nutze innerhalb von `geom_point()` das Argument `alpha = 0.5`. Das macht die Punkte leicht transparent, was dabei hilft Punkte sichtbar zu machen, die direkt oder teilweise übereinander liegen. Bei vielen Datenpunkten oder Datenpunkten mit ähnlichen Werten ist das oft ein sehr nützliches Mittel. 

Nutze als zweites Argument `size = 2.5`, welches die Punkte etwas größer und dadurch besser sichtbar macht.

Beschrifte den Plot vollständig. Weise ihn dem Objekt `water_scatter` zu.

#### HA6 C: Plot speichern und interpretieren

Kopiere den folgenden Code ins Skript und führe ihn aus:

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
water_scatter <- owid_2020_scatter |>
ggplot(aes(x = access_to_water, y = life_expectancy_birth, color = world_region)) +
  geom_point(alpha = 0.5, size = 2.5) +
  labs(
    title  = "...",
    x      = "...",
    y      = "...",
    color  = "Weltregion",
    caption = "Quelle: Our World in Data"
  )

water_scatter
```


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

<br>

<details>
<summary><strong>Tipp</strong></summary>

`owid_2020` hast du in HA4 gebaut — er enthält bereits je Land eine Zeile für 2020. Du kannst die drei Kennzahlen direkt auf die Spalte anwenden:

```r
mean(owid_2020$access_to_water, na.rm = TRUE)
median(owid_2020$access_to_water, na.rm = TRUE)
sd(owid_2020$access_to_water, na.rm = TRUE)
```

Optional: Speichere die Werte in Objekten (`mean_water` usw.), damit du sie leichter im Kommentar vergleichen kannst.

Bei deiner Einordnung hilft das Histogramm aus HA4: Eine **bimodale** Verteilung zieht Mittelwert und Median oft auseinander.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
mean_water <- mean(owid_2020$access_to_water, na.rm = TRUE)
median_water <- median(owid_2020$access_to_water, na.rm = TRUE)
sd_water <- sd(owid_2020$access_to_water, na.rm = TRUE)

mean_water
median_water
sd_water
# Mittelwert und Median liegen typischerweise nicht exakt gleich: Der Median ist
# der „mittlere“ Wert beim Sortieren — der Mittelwert reagiert empfindlich auf
# viele sehr niedrige oder sehr hohe Beobachtungen. Bei bimodal verteiltem
# Wasserzugang (viele Länder mit niedrigem und viele mit hohem Zugang) ziehen
# die extremen Gruppen den Mittelwert; der Median markiert eher die „Mitte“ der
# sortierten Länderliste. Die Standardabweichung beschreibt die Streuung um
# den Mittelwert: Ein großer Wert bedeutet große Unterschiede zwischen den
# Ländern — passend zur globalen Ungleichheit beim Zugang zu sauberem Wasser.
```

</details>

<br>

---

### B-HA2 ⚠️ · Trendlinie im Streudiagramm

Füge dem Streudiagramm aus HA6 glatte Trendlinien für die Kontinentalgruppen hinzu:

```r
water_scatter +
  geom_smooth(method = "loess", se = FALSE)
```

- Was zeigen die Kurven — ist der Zusammenhang linear?
- Gibt es Wertbereiche oder Kontinente, in denen die Lebenserwartung mit dem Wasserzugang besonders stark steigt?
- Schreibe 3–4 Sätze Kommentar.

<br>

<details>
<summary><strong>Tipp</strong></summary>

`water_scatter` nutzt bereits `color = world_region` in `aes()`. **Jede Farbe** ist damit eine eigene Gruppe — `geom_smooth()` berechnet für jede Weltregion eine eigene LOESS-Kurve, wenn du ihn so anhängst.

Falls eine Meldung zu „fewer than n unique points“ erscheint: Manche Regionen haben nur wenige Länder — die Kurve wird dann unsicher oder entfällt teilweise.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
water_scatter +
  geom_smooth(method = "loess", se = FALSE)

# Die Kurven sind meist keine perfekten Geraden — LOESS passt eine glatte,
# lokale Kurve an. Der Zusammenhang wirkt überwiegend positiv, kann aber in
# einzelnen Bereichen flacher oder steiler sein (z. B. starker Anstieg der
# Lebenserwartung bei niedrigem bis mittlerem Wasserzugang, dann abflachend).
# Unterschiede zwischen den Regionen zeigen, dass der Zusammenhang nicht für
# alle Kontinente gleich verläuft — institutionelle Faktoren und Gesundheitssysteme
# erklären weiter Varianz jenseits des Wasserzugangs.
```

</details>

<br>

---

### B-HA3 ⚠️ · Eigene Länderauswahl für den Linienplot

Wähle 4–6 Länder deiner Wahl und erstelle einen eigenen Linienplot der Wasserzugangsentwicklung seit 2000. Begründe als Kommentar, warum du genau diese Länder gewählt hast — und was der Vergleich zeigt.

<br>

<details>
<summary><strong>Tipp</strong></summary>

Orientiere dich an der Pipeline aus HA5: `filter()` mit `country %in% c("...", ...)` und `year >= 2000`, dann `distinct(country, year, .keep_all = TRUE)` gegen doppelte Zeilen.

Achte darauf, dass die Ländernamen **exakt** so geschrieben sind wie im Datensatz (Großbuchstaben, Leerzeichen) — bei Unsicherheit: `sort(unique(owid_daten$country))` oder `filter(owid_daten, country == "…")` testen.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# Beispiel — ersetze die Länder durch deine eigene Auswahl und Begründung.
eigene_laender <- owid_daten |>
  filter(
    country %in% c("Ethiopia", "Vietnam", "Mexico", "Sweden"),
    year >= 2000
  ) |>
  distinct(country, year, .keep_all = TRUE)

eigenes_wasserplot <- ggplot(eigene_laender, aes(x = year, y = access_to_water, color = country)) +
  geom_line(linewidth = 1) +
  labs(
    title   = "Wasserzugang: eigener Ländervergleich seit 2000",
    x       = "Jahr",
    y       = "Bevölkerungsanteil mit sicherem Wasserzugang (%)",
    color   = "Land",
    caption = "Quelle: Our World in Data / WHO–UNICEF JMP"
  )

eigenes_wasserplot

# Auswahlbeispiel: ein Land in Ostafrika, ein Aufstiegsland in Asien,
# ein lateinamerikanischer Staat und ein hocheinkommensnahes Nordland.
# Alle zeigen Aufwärtstrends, aber auf sehr unterschiedlichem Niveau;
# die Lücke zwischen Schweden (~100 %) und Äthiopien bleibt groß — das illustriert,
# dass globale Ungleichheit beim Wasserzugang auch nach zwei Jahrzehnten bestehen bleibt.
```

</details>

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
