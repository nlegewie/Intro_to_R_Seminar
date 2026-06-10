# Session 6 — Bildungsungleichheiten

**Seminar:** Globale Ungleichheit · Wintersemester 2025/26

---

## Inhaltsverzeichnis

- [Dein Endprodukt](#endprodukt)
- [Wo du arbeitest](#wo-du-arbeitest)
- [Einleitung](#einleitung)
- [Hausaufgaben](#hausaufgaben)
  - [Ü1 · Verteilung der Bildungsjahre nach Weltregion](#ue1)
  - [Ü2 · Analphabetismus nach Weltregion — ein Balkendiagramm](#ue2)
  - [Ü3 · Entwicklung von Analphabetismus über die Zeit](#ue3)
  - [Ü4 · Die Bildungsschere: Frauen in tertiärer Bildung](#ue4)
  - [Ü5 · Trend: Tertiäre Bildungsbeteiligung über die Zeit](#ue5)
- [Bonus-Aufgaben](#bonus-aufgaben)
  - [B-Ü6 · Demokratie und Bildungsausgaben](#b-ue6)
  - [B-Ü7 · Zahlt Bildungsinvestition sich aus?](#b-ue7)
- [Abgabe](#abgabe)

---

<h2 id="endprodukt">Dein Endprodukt</h2>

**Frage dieser Session:** Wie ungleich ist Bildungszugang weltweit verteilt — und welche Muster zeigen sich nach Region, Geschlecht und Ausgaben?

Am Ende dieser Hausaufgaben wirst du fünf Plots erstellt und im Ordner `output/` gespeichert haben:

| Plot | Dateiname | Was er zeigt |
|------|-----------|--------------|
| **Plot 1 — Facettiertes Histogramm** | `plot_bildungsjahre.png` | Wie sind lernbereinigte Bildungsjahre (2020) nach Weltregion verteilt? |
| **Plot 2 — Balkendiagramm** | `plot_bar_illiteracy.png` | Wie unterscheidet sich die Analphabetismusrate je Weltregion (2016)? |
| **Plot 3 — Geglättete Trendlinien** | `plot_smooth_illiteracy.png` | Wie hat sich Analphabetismus seit 1901 je Weltregion entwickelt? |
| **Plot 4 — Streudiagramm mit Regression** | `plot_gdp_gender_gap.png` | Gibt es einen Zusammenhang zwischen BIP und Gender-Gap in der tertiären Bildung? |
| **Plot 5 — Linienplot** | `plot_tertiaer_trend.png` | Wie hat sich die Beteiligung an tertiärer Bildung in ausgewählten Ländern seit 2000 entwickelt? |

Die Bonus-Aufgaben (B-Ü6 und B-Ü7) enthalten zusätzliche explorative Visualisierungen, die du ebenfalls speichern solltest, wenn du die Übungen bearbeiten solltest.

---

<h2 id="wo-du-arbeitest">Wo du arbeitest</h2>

Alle Code-Aufgaben bearbeitest du in **einem einzigen Skript**:

**`scripts/session_06_skript.R`**

Führe zuerst den **SETUP-Abschnitt** aus — er lädt die nötigen Pakete und den OWID-Datensatz.

---

<h2 id="einleitung">Einleitung: Bildung als Dimension globaler Ungleichheit</h2>

Bildung ist eine der folgenreichsten Dimensionen globaler Ungleichheit. Sie beeinflusst, welche Chancen Menschen haben, wie hoch ihr Einkommen sein wird, wie ihre Gesundheit sich entwickelt und welchen Einfluss sie auf politische und wirtschaftliche Entscheidungen haben. Aber Bildung ist nicht gleich Bildung: In manchen Ländern verbringen Kinder viele Jahre in der Schule, lernen aber wenig; in anderen ist der Zugang zu weiterführender und universitärer Bildung stark vom Geschlecht abhängig; und manche Regierungen investieren kaum öffentliche Mittel in Bildung.

In den folgenden Übungen untersuchen wir fünf Variablen, die verschiedene Dimensionen von Bildungszugang abbilden:

| Variable | Was sie misst |
|----------|--------------|
| `years_of_schooling` | Lernbereinigte Bildungsjahre bei Kindern — kombiniert Quantität und Qualität der Schulbildung |
| `illiterate_rate` | Anteil der Erwachsenen, die nicht lesen und schreiben können |
| `tertiary_enrollment_rate` | Anteil der Altersgruppe, der tertiäre Bildung (Hochschule o.ä.) besucht |
| `girls_in_tertiary` / `boys_in_tertiary` | Anteil der Mädchen/Jungen der entsprechenden Altersgruppe, die in tertiäre Bildung eingeschrieben sind |
| `edu_spending_gdp` | Anteil des Bruttoinlandsprodukts, der für Bildung aufgewendet wird |

---

<h2 id="aufgaben">Aufgaben</h2>

---

<h3 id="ue1">Ü1 · Verteilung der Bildungsjahre nach Weltregion</h3>

### Hintergrund

Die Variable `years_of_schooling` misst nicht einfach, wie viele Jahre Kinder in der Schule verbringen — sie ist _lernbereinigt_, das heißt, sie berücksichtigt auch, wie viel dabei gelernt wird. Ein Land, in dem Kinder acht Jahre zur Schule gehen, aber wenig lernen, schneidet schlechter ab als eines, in dem sechs intensive Schuljahre viel bewirken. Der Wert gibt also Auskunft über Quantität _und_ Qualität von Schulbildung zugleich.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **Ü1** in `scripts/session_06_skript.R`.

**a)** Filtere `owid_daten` auf das Jahr 2020 und entferne Zeilen mit fehlenden Werten in `years_of_schooling` und `world_region`. Speichere das Ergebnis als `owid_2020_bildung`.

Führe einen kurzen Plausibilitätscheck durch: Wie viele Länder bleiben übrig? Welche Weltregionen sind im Datensatz vertreten? Um dir die verschiedenen Weltregionen anzeigen zu lassen, benutze die Funktion `unique()`.

**b)** Erstelle ein Histogramm von `years_of_schooling` — **facettiert nach `world_region`** mit `facet_wrap()`. `facet_wrap(~ world_region)` erzeugt für jede Ausprägung von `world_region` ein eigenes Teildiagramm. Die Tilde `~` ist dabei wichtig — sie sagt ggplot2, nach welcher Variable aufgeteilt werden soll.

Beschrifte den Plot vollständig und weise ihn dem Objekt `plot_bildungsjahre` zu.

**c)** Schreibe **4–5 Sätze Interpretation** als Kommentar:
- In welchen Regionen sind die Werte hoch, in welchen niedrig?
- Gibt es Regionen mit besonders breiter Streuung — also großen Unterschieden _innerhalb_ der Region?
- Was sagt das über globale Bildungsungleichheit aus?

**d)** Speichere den Plot:

```r
ggsave(
  here("output", "plot_bildungsjahre.png"),
  plot   = plot_bildungsjahre,
  width  = 10,
  height = 7
)
```

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü1 a**

- Mehrere `!is.na()`-Bedingungen kombinierst du in einem einzigen `filter()`. Trenne sie durch Kommas (= logisches UND).
- `unique(datensatz$spalte)` zeigt alle verschiedenen Werte in einer Spalte — nützlich, um zu prüfen, welche Weltregionen überhaupt vorhanden sind.
- Mit `nrow()` zählst du, wie viele Länder nach dem Filtern übrig bleiben.

**Ü1 b**

- `facet_wrap(~ world_region)` hängst du als eigenen Layer an den Plot — genau wie `geom_histogram()`. Die Tilde `~` ist dabei Pflicht.
- Die Achsen aller Teildiagramme sind standardmäßig gleich skaliert (`scales = "fixed"`). Das ist hier sinnvoll, weil du Regionen direkt vergleichen möchtest.
- Wähle `bins` so, dass die Form der Verteilung erkennbar ist, ohne dass einzelne Balken zu schmal werden — probiere Werte zwischen 10 und 20.
- Weise den fertigen Plot mit `<-` dem Objekt `plot_bildungsjahre` zu, bevor du `ggsave()` ausführst.

**Ü1 c**

- Schau dir die Lage (wo häufen sich die Werte) und die Breite (wie weit streuen sie) der Verteilung in jedem Teildiagramm an.
- Regionen mit vielen Ländern in einem engen Wertebereich zeigen wenig interne Ungleichheit; ein breites, flaches Histogramm zeigt große Unterschiede innerhalb der Region.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# Ü1 a
owid_2020_bildung <- owid_daten |>
  filter(year == 2020,
         !is.na(years_of_schooling),
         !is.na(world_region))

nrow(owid_2020_bildung)
# 172 Länder
unique(owid_2020_bildung$world_region)

# Ü1 b
plot_bildungsjahre <- owid_2020_bildung |>
  ggplot(aes(x = years_of_schooling)) +
  geom_histogram(bins = 15, fill = "steelblue", color = "white") +
  facet_wrap(~ world_region) +
  labs(
    title    = "Lernbereinigte Bildungsjahre nach Weltregion, 2020",
    subtitle = "Jedes Teildiagramm zeigt die Verteilung innerhalb einer Region",
    x        = "Lernbereinigte Bildungsjahre",
    y        = "Anzahl Länder",
    caption  = "Quelle: Our World in Data / World Bank"
  )

plot_bildungsjahre

# Ü1 c
# Europa häuft sich im oberen Bereich (8–12 Jahre);
# die Verteilung ist eng und rechtslastig — kaum Länder mit niedrigen Werten.
# Afrika und Asien zeigen die breiteste Streuung. Afrika zeigt eine
# Häufung im unteren Bereich. 
# Nordamerika, Ozeanien und Südamerika streuen vor allem im mittleren Bereich.
# Die Facettierung macht deutlich, dass globale Bildungsungleichheit nicht nur
# zwischen reichen und armen Ländern verläuft — auch innerhalb von Weltregionen
# gibt es z.T. dramatische Unterschiede.

# Ü1 d

ggsave(
  here("output", "plot_bildungsjahre.png"),
  plot   = plot_bildungsjahre,
  width  = 10,
  height = 7
)
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue2">Ü2 · Analphabetismus nach Weltregion — ein Balkendiagramm</h3>

### Hintergrund

Analphabetismus ist ungleich auf der Welt verteilt. Bevor wir einen Trend über die Zeit anschauen, wollen wir zuerst ein aktuelles Querschnittsbild erstellen: Wie hoch ist die durchschnittliche Analphabetismusrate je Weltregion im aktuellsten Jahr mit ausreichend Daten?

### Deine Aufgaben

Schreibe den Code in den Abschnitt **Ü2** in `scripts/session_06_skript.R`.

**a)** Prüfe, in welchem Jahr seit 2016 (also der letzten 10 Jahre) die meisten Datenpunkte vorhanden sind für die Variable `illiterate_rate`. Schreibe die Antwort kurz auf.


**b)** Erstelle einen Datensatz, der (1) Zeilen mit fehlenden Werte auf der Variable `illiterate_rate` ausschließt, (2) auf das Jahr 2016 fokussiert, und (3) die Variablen `country`, `world_region` und `illiterate_rate` auswählt.


**c)** Lasse dir die 10 Länder mit der höchsten und die 10 Länder mit der niedrigsten Analphabetismusrate anzeigen.


**d)** Erstelle ein Balkendiagramm, das die Analphabetismusrate je `world_region` anzeigt. Überlege, wie du den Datensatz `owid_illiterate_2016` bearbeiten musst, bevor du das Balkendiagramm erstellen kannst. Weise den Plot dem Objekt `bar_plot_illiteracy` zu.


**e)** Füge dem Plot eine  Überschrift und Unterüberschrift sowie sinnvolle Labels für die X- und Y-Achse hinzu. Außerdem drehe die Achsen um, so dass die Balken von links nach rechts liegen statt von unten nach oben. Dazu kannst du `[DEIN PLOT] + coord_flip()` nutzen. `coord_flip()` ist nützlich, wenn die Labels auf der X-Achse relativ lange Wörter sind. Speichere das Ergebnis als `bar_plot_illiteracy_pretty` ab.


**f)** Interpretiere kurz das Ergebnis


**g)** Speichere den finalen Plot ab, indem du den folgenden Code ausführst:


```r
ggsave(
  here("output", "plot_bar_illiteracy.png"),
  plot   = bar_plot_illiteracy_pretty,
  width  = 6,
  height = 4
)
```


<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü2 a**

- Du willst pro Jahr zählen, wie viele Zeilen in `illiterate_rate` **keinen** fehlenden Wert haben. Das Muster dafür ist: `summarize(non_na = sum(!is.na(illiterate_rate)))`.
- `filter(year >= 2016)` grenzt den Suchbereich ein, `group_by(year)` teilt nach Jahr auf, `arrange(desc(...))` bringt das Jahr mit den meisten Datenpunkten nach oben.

**Ü2 b**

- Reihenfolge in der Pipe spielt eine Rolle: zuerst mit `!is.na(illiterate_rate)` fehlende Werte ausschließen, dann auf `year == 2016` filtern, dann `select()`. So arbeitest du schon früh mit einem kleineren Datensatz.
- Speichere das Ergebnis in `owid_illiterate_2016` — du brauchst dieses Objekt in c) und d).

**Ü2 c**

- `arrange(desc(...)) |> head(10)` für die höchsten Werte, `arrange(desc(...)) |> tail(10)` für die niedrigsten.
- Du kannst alternativ `slice_head(n = 10)` und `slice_tail(n = 10)` verwenden — beide Varianten funktionieren.

**Ü2 d**

- Für ein Balkendiagramm nach Region brauchst du **eine Zeile pro Region** mit einem zusammengefassten Wert — also zuerst `group_by(world_region) |> summarize(mean_illiterate_rate = mean(..., na.rm = TRUE))`.
- Dann: `ggplot(aes(x = world_region, y = mean_illiterate_rate, fill = world_region))` + `geom_col()`.
- `geom_col()` erwartet, dass die Höhe der Balken bereits im Datensatz steht (als `y`); `geom_bar()` würde dagegen selbst zählen — hier brauchst du `geom_col()`.

**Ü2 e**

- `coord_flip()` hängst du einfach mit `+` an den bestehenden Plot `bar_plot_illiteracy` an — du musst den Plot nicht neu erstellen.
- Speichere das Ergebnis in `bar_plot_illiteracy_pretty`, damit du dieses Objekt in `ggsave()` benutzen kannst.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r

# Ü2 a

owid_daten |> 
  filter(year >= 2016) |> 
  group_by(year) |> 
  summarize(non_na = sum(!is.na(illiterate_rate))) |> 
  arrange(desc(non_na))

# Das Jahr 2016 zeigt die meisten Beobachtungen (n = 42)


# Ü2 b
  
owid_illiterate_2016 <- owid_daten |>
  filter(!is.na(illiterate_rate)) |>
  filter(year == 2016) |>
  select(country, world_region, illiterate_rate)

 
# Ü2 c

 owid_illiterate_2016 |>
  arrange(desc(illiterate_rate)) |>
  head(10)

# Von den 10 Ländern mit der höchsten Verbreitung von Analphabetismus sind 7 aus Afrika und drei aus Asien.
# Den höchsten Anteil Analphabetismus zeigt Chad mit über 78%. 
# Die Spannbreite in den 10 Ländern mit der höchsten Verbreitung von Analphabetismus ist mit 78% (Benin) - 27% (Bangladesh) = 51 hoch.


owid_illiterate_2016 |>
  arrange(desc(illiterate_rate)) |>
  tail(10)

# Die 10 Länder sind gemischt. Auffällig ist allerdings, dass es nur drei Länder mit einer Analphabetismusquote von 0 gibt: Armenien, Azerbaijan und Uzbekistan. Die Vermutung liegt nahe, dass für viele Europäische Länder in diesem Jahr keine Informationen vorlagen.

# Ü2 d

bar_plot_illiteracy <- owid_illiterate_2016 |>
  group_by(world_region) |>
  summarize(mean_illiterate_rate = mean(illiterate_rate, na.rm = TRUE)) |>
  ggplot(aes(x = world_region, y = mean_illiterate_rate, fill = world_region)) +
  geom_col()


# Ü2 e

bar_plot_illiteracy_pretty <- bar_plot_illiteracy +
  labs(title = "Durchschnittliche Analphabetenquote je Weltregion",
       subtitle = "Jahr: 2016",
       x = "Weltregion",
       y = "Durchschnittliche Analphabetenquote") +
  coord_flip()


# Ü2 f

# Africa hat im Jahr 2016 mit Abstand die höchste Analphabetenrate, mit knapp 40%. Darauf folgen Asien (10%) und Nordamerika (knapp 10%). Europa zeigt die geringste Analphabetenrate.

```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue3">Ü3 · Entwicklung von Analphabetismus über die Zeit</h3>

### Hintergrund

Schau dir die Entwicklung von `illiterate_rate` seit Anfang des 20. Jahrhunderts je `world_region` an.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **Ü3** in `scripts/session_06_skript.R`.

**a)** Erstelle einen Datensatz für die Aufgabe basierend auf `owid_daten`: (1) Schließe Zeilen mit fehlenden Werten in `illiterate_rate` oder `world_region` aus; (2) fokussiere auf alle Jahre ab 1901; gruppiere nach `world_region` und `year`; (3) fasse den Datensatz zusammen, indem du den Median von `illiterate_rate` bildest. Weise das Ergebnis dem Objekt `owid_illiterate_trend` zu. 

**b)** Überprüfe den Output, indem du dir die ersten und letzten 10 Zeilen des neuen Datensatzes anzeigen lässt. Sind die Zahlen prinzipiell plausibel?

**c)** Erstelle einen Plot mit geglätteten Trendlinien je `world_region`. Nutze dazu `geom_smooth()` mit `method = "loess", se = FALSE`. Füge wieder eine Überschrift und Unterüberschrift sowie sinnvolle Labels für die X- und Y-Achse hinzu. Weise den Plot dem Objekt `smooth_plot_illiteracy` zu.

**d)** Interpretiere den Plot. Was zeigt der allgemeine Trend? Welche Unterschiede zeigen sich zwischen Weltregionen?

**e)** Speichere den finalen Plot ab, indem du den folgenden Code ausführst:


```r
ggsave(
  here("output", "plot_smooth_illiteracy.png"),
  plot   = smooth_plot_illiteracy,
  width  = 6,
  height = 4
)
```


<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü3 a**

- Du willst Zeilen ausschließen, bei denen **eine der beiden** Variablen fehlt — also `!is.na(illiterate_rate)` **und** `!is.na(world_region)`. Trenne die Bedingungen durch ein Komma in `filter()`.
- Filtere mit `year > 1900`, um das 20. und 21. Jahrhundert abzudecken.
- Danach: `group_by(year, world_region)` — du brauchst **beide** Variablen im `group_by()`, damit pro Jahr und pro Region zusammengefasst wird.
- `summarize(... = median(..., na.rm = TRUE))` — `na.rm = TRUE` ist hier gute Praxis, auch wenn du vorher schon gefiltert hast.

**Ü3 b**

- `head(10)` und `tail(10)` zeigen dir Anfang und Ende des neuen Datensatzes — prüfe: Liegen die Werte zwischen 0 und 100? Gibt es mehr als eine Region pro Jahr?

**Ü3 c**

- Die Datenquelle für den Plot ist `owid_illiterate_trend` — nicht der rohe `owid_daten`.
- `geom_smooth(method = "loess", se = FALSE)` glättet die Zeitreihe ohne Konfidenzband.
- Mit `color = world_region` in `aes()` erhält jede Region automatisch eine eigene Farbe — und `geom_smooth()` zeichnet pro Region eine eigene Linie.
- Weise den Plot `smooth_plot_illiteracy` zu, bevor du `ggsave()` ausführst.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r

# Ü3 a

owid_illiterate_trend <- owid_daten |>
  filter(!is.na(illiterate_rate), !is.na(world_region)) |>
  filter(year > 1900) |>
  group_by(year, world_region) |>
  summarize(mean_illiterate_rate = median(illiterate_rate, na.rm = TRUE))


# Ü3 b

owid_illiterate_trend |>
  head(10)

owid_illiterate_trend |>
  tail(10)

# Die Werte variieren zwischen 0 und 100, was wir erwarten würden bei prozentuellen Angabe zur Verbreitung von Analphabetismus.

  
# Ü3 c

  smooth_plot_illiteracy <- owid_illiterate_trend |>
  ggplot(aes(x = year, y = mean_illiterate_rate, color = world_region)) +
  geom_smooth(method = "loess", se = FALSE) +
  labs(title = "Geglättete Zeittrends von Analphabetismus nach Weltregion",
       subtitle = "1901 bis 2024",
       x = "Jahr",
       y = "Durchschnittlicher Analphabetismus")


# Ü3 d

# Alle Trendlinien zeigen seit 1901 klar nach unten, das heißt Analphabetismus ist stark zurück gegangen.
# Die Weltregionen hatten sehr unterschiedlich Start- und Endpunkte. 
# Afrika und Asien starteten bei über 75%, während Europa Südamerika und Nordamerika bei unter 50% starteten.
# Außer Afrika landen alle Weltregionen bei unter 10% Analphabetismus. In Europa liegt die Quite nahe 0%. In Afrika liegt sie auch im Jahr 2023 noch bei nahe 40%.


```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>


---

<h3 id="ue4">Ü4 · Die Bildungsschere: Frauen in tertiärer Bildung</h3>

### Hintergrund

Weltweit haben Frauen insgesamt weniger Zugang zu Hochschulbildung als Männer, aber in manchen Regionen hat sich das Bild seit einiger Zeit umgekehrt. In anderen besteht weiterhin eine erhebliche Lücke zuungunsten von Frauen. Diese Aufgabe macht diese Unterschiede sichtbar.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **Ü4** in `scripts/session_06_skript.R`.

**a)** Filtere `owid_daten` auf 2021, das aktuellste Jahr mit verfügbaren Daten. Entferne fehlende Werte in `girls_in_tertiary`, `boys_in_tertiary` und `world_region`. Speichere das Ergebnis als `owid_gender`.

**b)** Berechne eine neue Variable `gender_gap`, die die Differenz aus `girls_in_tertiary` minus `boys_in_tertiary` angibt. Speichere das Ergebnis als `owid_gender_mutated`. Was bedeutet ein positiver Wert, was bedeutet ein negativer Wert der neuen Variable?

**c)** Erstelle eine Grafik, die den Zusammenhang von `gender_gap` und `gdp` zeigt. Nutze ein Streudiagramm und lineare Regressionslinien.
- Punkte und Regressionslinien nach `world_region` eingefärbt
- Eine **horizontale Linie bei 0** mit `geom_hline(yintercept = 0, color = "white", linewidth = 3)`
- Beschrifte vollständig (Titel, Untertitel, Achsen) und weise den Plot `plot_gender_gap` zu.

**d)** Schreibe **4–5 Sätze Interpretation** als Kommentar:
- Wie hängen `gdp` und `gender_gap` zusammen?
- Gibt es Unterschiede zwischen den Regionen im Zusammenhang von `gdp` und `gender_gap`?

**e)** Speichere den Plot:

```r
ggsave(
  here("output", "plot_gdp_gender_gap.png"),
  plot   = plot_gdp_gender_gap,
  width  = 9,
  height = 6
)
```

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü4 b — `mutate()`**

Das Muster für `mutate()` ist hier:

```r
mutate([NEUE_VARIABLE] = [VARIABLE 1] - [VARIABLE2])
```

Die eckigen Klammern zeigen an, dass es sich um Platzhalter handelt. Im eigentlichen Code haben sie nichts verloren.

**Ü4 c — Streudiagramm mit Regressionslinien**

- Plot-Datenquelle: `owid_gender_mutated` aus Ü4 b — nicht `owid_daten` oder `owid_gender`.
- Grundmuster wie in Session 5 (Ü7): `ggplot(..., aes(x = ..., y = ..., color = ...))`; x = Wirtschaftsentwicklung, y = deine neue Lücke, Farbe = Region.
- **Reihenfolge der Schichten:** zuerst die horizontale Null-Linie (`geom_hline(...)`), dann die Punkte (`geom_point(...)`), dann die Trendlinien (`geom_smooth(...)`). So liegen Punkte und Linien *über* der Referenzlinie.
- `geom_hline(yintercept = 0, ...)` markiert „keine Lücke“ zwischen Mädchen- und Jungenanteil — positiv darüber, negativ darunter.
- `color = world_region` in `aes()` sorgt nicht nur für farbige Punkte, sondern auch dafür, dass **`geom_smooth()` pro Region** eine eigene Linie zeichnet.
- `method = "lm"` und `se = FALSE` in `geom_smooth()` wie in der Aufgabenstellung; `se = FALSE` blendet das Konfidenzband aus.
- Damit überlappende Punkte lesbar bleiben (Overplotting): `alpha = 0.6` (und optional etwas größere Punktgröße).
- Beschriftung mit `labs()` (Titel, Untertitel, x, y, ggf. Legende für `color`, Quelle im `caption`).
- Gesamten Plot `plot_gdp_gender_gap` zuweisen (`<-`), dann anzeigen — erst danach `ggsave()` aus Ü3 e).

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# Ü4 a
owid_gender <- owid_daten |>
  filter(year == 2021,
         !is.na(girls_in_tertiary),
         !is.na(boys_in_tertiary),
         !is.na(world_region))


# Ü4 b

owid_gender_mutated <- owid_gender |>
  mutate(gender_gap = girls_in_tertiary - boys_in_tertiary)

# Ein positiver Wert bedeutet: Mehr Frauen als Männer sind eingeschrieben. 
# Ein negativer Wert bedeutet das Gegenteil.

# Ü4 c

plot_gdp_gender_gap <– owid_gender_mutated %>% 
  ggplot(aes(x = gdp, y = gender_gap, color = world_region)) +
    geom_hline(yintercept = 0, color = "white", linewidth = 3) +
    geom_point(alpha = 0.6, size = 2.5) +
    geom_smooth(method = "lm", se = FALSE) +
  labs(
    title    = "GDP und Bildungsschere in tertiärer Bildung nach Weltregion",
    subtitle = "Differenz Mädchen- minus Jungenanteil (positiv = mehr Frauen eingeschrieben)",
    x        = "GDP",
    y        = "Gender-Gap (Prozentpunkte)",
    caption  = "Quelle: Our World in Data / UNESCO / World Bank"
  )


# Ü4 d
# Insgesamt gibt es im Jahr in den meisten Ländern ein Gender Gap in der Einschreibequote im tertiären Bildungsbereich: Mehr Frauen als Männer sind in tertiärer Bildung. 
# In allen Regionen außer Europa liegt ein positiver Zusammenhang zwischen `gdp` und `gender_gap` vor: Je höher das GDP der Länder, desto größer die Gender Gap.  Der Zusammenhang ist am stärksten in Südamerika und Afrika.
# In Europa ist der Zusammenhang leicht negativ. Allerdings scheint das vor allem von zwei Beobachtungen getrieben zu sein

```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue5">Ü5 · Trend: Tertiäre Bildungsbeteiligung über die Zeit</h3>

### Hintergrund

Der Zugang zu Hochschulbildung hat sich in den letzten Jahrzehnten weltweit stark ausgeweitet — aber nicht gleichmäßig. In manchen Ländern hat sich die Beteiligung vervielfacht, in anderen stagniert sie. Ein Linienplot macht diese Dynamik sichtbar.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **Ü5** in `scripts/session_06_skript.R`.

**a)** Wähle **6 Länder** und erstelle einen gefilterten Datensatz für diese Länder ab dem Jahr 2000. Die Länder sollen bewusst gewählt sein: aus verschiedenen Weltregionen, auf unterschiedlichen GDP-Niveaus, oder mit einer für dich inhaltlich interessanten Kombination. Entferne Zeilen mit fehlenden Werten in `tertiary_enrollment_rate`.

Du kannst bei deiner Auswahl der Länder z.B. arme und reiche Länder vergleichen, verschiedene Länder der gleichen `world_region` (z.B. Thailan, Kambodscha, Malaysia, ...), oder Länder aus verschiedenen Weltregionen.

Notiere als Kommentar: **Warum hast du genau diese Länder gewählt?**

**b)** Erstelle einen Linienplot mit:
- `year` auf der x-Achse
- `tertiary_enrollment_rate` auf der y-Achse
- einer Linie pro Land, eingefärbt nach `country`
- `linewidth = 1` in `geom_line()`

Beschrifte vollständig und weise den Plot `plot_tertiaer_trend` zu.

**c)** Schreibe **4–5 Sätze Interpretation** als Kommentar:
- Welches Land zeigt den stärksten Anstieg?
- Gibt es Länder, bei denen du einen stärkeren Anstieg erwartet hättest?
- Was sagen die absoluten Niveaus über Chancenungleichheit aus?
- Gibt es einen Einbruch oder eine Stagnation, den du dir erklären kannst?

**d)** Speichere den Plot:

```r
ggsave(
  here("output", "plot_tertiaer_trend.png"),
  plot   = plot_tertiaer_trend,
  width  = 9,
  height = 5
)
```

<br>

<details>
<summary><strong>Tipp zu Ü5</strong></summary>

**Ü5 a**

- Ländernamen müssen **exakt** so geschrieben sein wie im Datensatz — auch Groß-/Kleinschreibung und Sonderzeichen. Im Zweifel prüfst du mit:
  ```r
  sort(unique(owid_daten$country))
  ```
- Um mehrere Länder auf einmal zu filtern, nutzt du `%in%` mit einem Vektor:
  ```r
  filter(country %in% c("Land A", "Land B", "Land C", ...))
  ```
- Kombiniere die Länderbedingung in einem `filter()` zusammen mit `year >= 2000` und `!is.na(tertiary_enrollment_rate)`.

**Ü5 b**

- Ein Linienplot verwendet `geom_line()` statt `geom_point()` — aber die `aes()`-Struktur ist dieselbe: `x = year`, `y = tertiary_enrollment_rate`, `color = country`.
- Mit `color = country` in `aes()` zeichnet ggplot2 automatisch eine eigene Linie pro Land.
- `linewidth = 1` gehört als Argument **in** `geom_line()`, nicht in `aes()`, weil es für alle Linien gelten soll (kein Mapping auf eine Variable).
- Vergiss `labs()` nicht — und weise den Plot mit `<-` dem Objekt `plot_tertiaer_trend` zu, bevor du `ggsave()` nutzt.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# HA5 a — Beispielauswahl; eigene Länder und Begründung sind erwünscht

# Ich wähle Südkorea, Brasilien, Äthiopien, Frankreich und Pakistan, um Länder aus verschiedenen Kontinenten abzubilden.

laender_tertiaer <- owid_daten |>
  filter(
    country %in% c("South Korea", "Brazil", "Ethiopia", "France", "Pakistan"),
    year >= 2000,
    !is.na(tertiary_enrollment_rate)
  )

# HA5 b
plot_tertiaer_trend <- laender_tertiaer |>
  ggplot(aes(x = year, y = tertiary_enrollment_rate, color = country)) +
  geom_line(linewidth = 1) +
  labs(
    title   = "Beteiligung an tertiärer Bildung seit 2000",
    x       = "Jahr",
    y       = "Brutto-Einschreibungsrate (%)",
    color   = "Land",
    caption = "Quelle: Our World in Data / UNESCO"
  )

plot_tertiaer_trend

# HA5 c
# Südkorea zeigt schon zu Beginn eine sehr hohe Beteiligung (75%) und stieg
# bis auf über 100% — ein Zeichen, dass auch ältere Jahrgänge die Hochschule besuchen.
# Brasilien zeigt weniger Daten. Ab 2012 stieg die Einschreibequote von knapp 50% auf ca. 60%.
# Äthiopien und Pakistan zeigen beide eine insgesamt niedrige Quote und langsamen Anstieg, von knapp über 0% auf etwa 12%. Die Lücke zu Südkorea ist sehr groß.
# Frankreich bewegte sich zwischen 2000 und 2010 stabil bei 50% und stieg dann ähnlich stark wie Brasilien an, allerdings auf höherem Niveau. 2023 stand es bei knapp 75% Beteiligungsrate.

```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h2 id="bonus-aufgaben">Bonus-Aufgaben</h2>

Diese Aufgaben sind freiwillig und stellen etwas höhere Anforderungen. Schau mal, ob du Zeit und Lust hast, einen Versuch zu starten.

---

<h3 id="b-ue6">B-Ü6 ⚠️ · Demokratie und Bildungsausgaben</h3>

**a)** Geben demokratischere Länder anteilig am Bruttoinlandsprodukt mehr für Bildung aus als nicht-demokratische Länder? Die Variable `democracy_score` kann Werte von 0 (geschlossene Autokratie) bis 3 (liberale Demokratie) annehmen. Überlege dir, wie du diese Frage beantworten kannst. Nutze das Jahr 2017 für deine Analyse. Erstelle ein Balkendiagramm, weise den Plot dem Objekt `plot_democracy_spending` zu und interpretiere die Ergebnisse kurz.

Speichere den Plot:

```r
ggsave(
  here("output", "plot_democracy_spending.png"),
  plot   = plot_democracy_spending,
  width  = 8,
  height = 5
)
```

**b)** Welche Länder haben `democracy_score == 3`? Schreibe Code, der alle diese Länder ausgibt. Sind die Ergebnisse aus a) dadurch leichter oder schwerer zu interpretieren?

**c)** Hängen Bildungsausgaben anteilig am Bruttoinlandsprodukt zusammen mit der Höhe des Bruttoinlandsprodukts — und unterscheidet sich dieser Zusammenhang nach Weltregion? Nutze wieder das Jahr 2017. Erstelle dazu ein Streudiagramm mit linearen Trendlinien, weise den Plot dem Objekt `plot_gdp_edu_spending` zu und interpretiere die Ergebnisse kurz.

Speichere den Plot:

```r
ggsave(
  here("output", "plot_gdp_edu_spending.png"),
  plot   = plot_gdp_edu_spending,
  width  = 9,
  height = 6
)
```

<br>

<details>
<summary><strong>Tipp zu B-Ü6</strong></summary>

**B-Ü6 a**

- Du willst für jeden Wert von `democracy_score` (0, 1, 2, 3) einen zusammengefassten Wert der Bildungsausgaben zeigen. Nutze dafür eine Pipeline aus `group_by()`, `summarize()` und `geom_col()`.
- Filtere vorher auf `year == 2017` und schließe fehlende Werte auf beiden Variablen aus.
- `democracy_score` kommt auf die x-Achse; der zusammengefasste Wert (z.B. Median) auf die y-Achse.
- Weise den Plot `plot_democracy_spending` zu, bevor du `ggsave()` ausführst.

**B-Ü6 b**

- `filter(year == 2017, democracy_score == 3)` grenzt den Datensatz auf liberale Demokratien ein.
- `pull(country)` gibt nur die Ländernamen-Spalte als Vektor aus — nützlich, wenn du nur eine Liste von Namen sehen willst.

**B-Ü6 c**

- Streudiagramm-Grundmuster: `ggplot(aes(x = [ABHÄNGIGE VAR], y = [UNABHÄNGIGE VAR], color = [VERGLEICHSVAR]))` + `geom_point()` + `geom_smooth(method = "lm", se = FALSE)`.
- `color = ...` in `aes()` sorgt dafür, dass auch die Trendlinie pro Gruppe getrennt berechnet wird.
- Schließe fehlende Werte auf beiden Variablen aus, bevor du den Plot erstellst.
- Weise den Plot `plot_gdp_edu_spending` zu, bevor du `ggsave()` ausführst.

</details>

<br>

<details>
<summary><strong>Lösung zu B-Ü6</strong></summary>

```r
# B-Ü6 a
plot_democracy_spending <- owid_daten |>
  filter(!is.na(democracy_score), !is.na(edu_spending_gdp)) |>
  filter(year == 2017) |>
  group_by(democracy_score) |>
  summarize(median_spending = median(edu_spending_gdp, na.rm = TRUE)) |>
  ggplot(aes(x = democracy_score, y = median_spending)) +
  geom_col() +
  labs(
    title    = "Bildungsausgaben und Demokratie",
    subtitle = "Median des Bildungsanteils am BIP nach Regimetyp, 2017",
    x        = "Demokratie-Score (0 = geschlossene Autokratie, 3 = liberale Demokratie)",
    y        = "Median: Bildungsausgaben (% des BIP)"
  )

plot_democracy_spending

ggsave(
  here("output", "plot_democracy_spending.png"),
  plot   = plot_democracy_spending,
  width  = 8,
  height = 5
)

# Die Bildungsausgabe anteilig am Bruttoinlandsprodukt steigen mit dem `democracy_score` stetig an.


# B-Ü6 b
owid_daten |>
  filter(year == 2017, democracy_score == 3) |>
  pull(country)

# Liberale Demokratien sind vor allem westliche, wohlhabende Länder (z.B. Deutschland,
# Schweden, Australien). Der höhere Bildungsausgabenanteil könnte also auch durch
# das höhere BIP erklärt sein — nicht allein durch das Regime.


# B-Ü6 c
plot_gdp_edu_spending <- owid_daten |>
  filter(year == 2017) |>
  filter(!is.na(gdp), !is.na(edu_spending_gdp)) |>
  ggplot(aes(x = gdp, y = edu_spending_gdp, color = world_region)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title    = "BIP und Bildungsausgaben",
    subtitle = "Staatlicher Bildungsanteil am BIP und Bruttoinlandsprodukt pro Kopf, 2017",
    x        = "BIP pro Kopf (KKP, konstante internationale $)",
    y        = "Bildungsausgaben (% des BIP)",
    color    = "Weltregion"
  )

plot_gdp_edu_spending

ggsave(
  here("output", "plot_gdp_edu_spending.png"),
  plot   = plot_gdp_edu_spending,
  width  = 9,
  height = 6
)

# Insgesamt kein klarer positiver Zusammenhang zwischen BIP und Bildungsausgabenanteil.
# In manchen Regionen ist der Trend leicht negativ, in anderen positiv. Die Streuung ist groß, was auf starke
# länderspezifische Faktoren hindeutet.
```

</details>

<br>

---

<h3 id="b-ue7">B-Ü7 ⚠️ · Zahlt Bildungsinvestition sich aus? Eine "time lag"-Analyse</h3>

**Analytisches Ziel:** Hängen höhere staatliche Bildungsausgaben eines Jahres mit mehr Schulbildung zusammen — gemessen in Schuljahren — ein Jahrzehnt später? Das ist eine klassische Frage der empirischen Bildungsforschung. Investitionen in Bildung wirken sich naturgemäß nicht sofort aus: Kinder, die 2007 eingeschult werden, sind 2017 erst am Ende ihrer Schulzeit. Um diese Zeitverzögerung abzubilden, kombinieren wir Ausgabedaten aus **2007** mit Schuljahresdaten aus **2017**.

> **Wichtiger Hinweis zur Interpretation:** Ein Zusammenhang in einem Streudiagramm oder einer Regression bedeutet nicht automatisch *Kausalität*. Viele andere Faktoren (Ausgangsniveau der Bildung, BIP, politische Stabilität) hängen sowohl mit Ausgaben als auch mit Schuljahren zusammen. Was wir hier berechnen, ist eine **Korrelation mit Zeitverzögerung** — ein erster Hinweis, aber kein Beweis.

**a)** Erstelle zwei Teildatensätze:

- `spending_2007`: filtere auf das Jahr 2007, schließe fehlende Werte auf `edu_spending_gdp` aus, behalte nur `country` und `edu_spending_gdp`.
- `schooling_2017`: filtere auf das Jahr 2017, schließe fehlende Werte auf `years_of_schooling` aus, behalte nur `country` und `years_of_schooling`.

Verbinde dann beide Datensätze mit `spending_2007 |> inner_join(schooling_2017, by = "country")` und speichere das Ergebnis als `lagged_edu`. Wie viele Länder bleiben übrig?

**b)** Erstelle ein Streudiagramm mit `edu_spending_gdp` auf der x-Achse und `years_of_schooling` auf der y-Achse. Füge eine lineare Trendlinie hinzu und beschrifte den Plot vollständig. Weise den Plot dem Objekt `plot_lagged_edu` zu.

Speichere den Plot:

```r
ggsave(
  here("output", "plot_lagged_edu.png"),
  plot   = plot_lagged_edu,
  width  = 9,
  height = 6
)
```

**c)** Berechne eine einfache lineare Regression. Du kannst dazu folgenden Code als Ausgangspunkt verwenden:

```r
install.packages("broom")  # einmalig installieren, falls noch nicht vorhanden
library(broom)              # Paket laden
lm(years_of_schooling ~ edu_spending_gdp, data = lagged_edu) |>
  tidy(conf.int = TRUE, conf.level = 0.95)
```

Was hier passiert, Schritt für Schritt:

- **`lm(...)`** — berechnet eine **lineare Regression** (*linear model*). Die Formel `years_of_schooling ~ edu_spending_gdp` bedeutet: „Erkläre `years_of_schooling` durch `edu_spending_gdp`." Links vom `~` steht die **abhängige Variable** (was erklärt werden soll), rechts die **unabhängige Variable** (der Erklärungsfaktor). `data = lagged_edu` sagt R, in welchem Datensatz die Spalten gesucht werden sollen.
- **`tidy()`** — aus dem Paket `broom`. Es wandelt den technischen Regressions-Output von R in ein übersichtliches Tibble um: eine Zeile pro Koeffizient, mit Spalten für Schätzer (`estimate`), Standardfehler (`std.error`), t-Statistik (`statistic`) und p-Wert (`p.value`).
- **`conf.int = TRUE`** — fügt zwei weitere Spalten hinzu: `conf.low` und `conf.high`. Das ist das **95-%-Konfidenzintervall** des Koeffizienten — der Bereich, in dem der „wahre" Effekt mit 95 % Wahrscheinlichkeit liegt. Schließt das Intervall die Null nicht ein, gilt der Effekt als statistisch signifikant.

Schreibe danach **4–5 Sätze Interpretation** als Kommentar: Ist der Zusammenhang positiv oder negativ? Ist er statistisch signifikant? Was bedeutet der Koeffizient inhaltlich? Warum lässt sich aus dieser Analyse keine Kausalaussage ableiten?


<br>

<details>
<summary><strong>Tipp zu B-Ü7</strong></summary>

**B-Ü7 a**

- Für `spending_2007` und `schooling_2017` brauchst du jeweils eine kurze Pipe mit `filter()`, `!is.na()` und `select()` — wie in früheren Aufgaben.
- `inner_join(by = "country")` behält nur Länder, die **in beiden Datensätzen** vorhanden sind. Das ist hier gewünscht: nur Länder, für die wir sowohl Ausgaben 2007 als auch Schuljahre 2017 kennen. Wenn du dich näher mit Join-Befehle beschäftigen möchtest (sehr nützliche Funktionen!), kannst du entweder Googeln, ein LLM benutzen, oder in RSTudio `?inner_join()` eingeben
- Mit `nrow(lagged_edu)` kannst du prüfen, wie viele Länder übrig bleiben.

**B-Ü7 b**

- Die Datenquelle für den Plot ist `lagged_edu` — nicht `owid_daten`.
- Streudiagramm-Grundstruktur: `ggplot(aes(x = ..., y = ...))` + `geom_point(alpha = 0.6)` + `geom_smooth(method = "lm", se = FALSE)`.
- Vergiss `labs()` nicht und weise den Plot dem Objekt `plot_lagged_edu` zu, bevor du `ggsave()` ausführst.

**B-Ü7 c**

- Du musst den `lm()`-Code nicht selbst schreiben — er steht oben. Führe ihn aus und schau, was der Output für den Term `edu_spending_gdp` in den Spalten `estimate`, `p.value`, `conf.low` und `conf.high` anzeigt.
- `estimate`: Wie viele Schuljahre mehr sind mit einem Prozentpunkt mehr Bildungsausgaben verbunden?
- `p.value`: Ist der Effekt statistisch signifikant (üblicherweise p < 0.05)?
- Denke an die Kausalitäts-Einschränkung: Reiche Länder geben vielleicht mehr aus *und* haben mehr Schuljahre — beides könnte dieselbe Ursache haben (z.B. BIP).

</details>

<br>

<details>
<summary><strong>Lösung zu B-Ü7</strong></summary>

```r
# B-Ü7 a
spending_2007 <- owid_daten |>
  filter(year == 2007, !is.na(edu_spending_gdp)) |>
  select(country, edu_spending_gdp)

schooling_2017 <- owid_daten |>
  filter(year == 2017, !is.na(years_of_schooling)) |>
  select(country, years_of_schooling)

lagged_edu <- spending_2007 |>
  inner_join(schooling_2017, by = "country")

nrow(lagged_edu)
# Ca. 80–90 Länder bleiben übrig, da für beide Variablen Daten vorliegen müssen.


# B-Ü7 b
plot_lagged_edu <- lagged_edu |>
  ggplot(aes(x = edu_spending_gdp, y = years_of_schooling)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "steelblue") +
  labs(
    title    = "Bildungsausgaben 2007 und Schuljahre 2017",
    subtitle = "Hängen höhere Ausgaben mit mehr Schulbildung 10 Jahre später zusammen?",
    x        = "Bildungsausgaben in % des BIP (2007)",
    y        = "Lernbereinigte Schuljahre (2017)",
    caption  = "Quelle: Our World in Data / World Bank / UNESCO"
  )

plot_lagged_edu

ggsave(
  here("output", "plot_lagged_edu.png"),
  plot   = plot_lagged_edu,
  width  = 9,
  height = 6
)


# B-Ü7 c
library(broom)
lm(years_of_schooling ~ edu_spending_gdp, data = lagged_edu) |>
  tidy(conf.int = TRUE, conf.level = 0.95)

# Der Koeffizient für edu_spending_gdp ist positiv: Länder, die 2007 mehr für
# Bildung ausgaben, hatten 2017 im Schnitt mehr lernbereinigte Schuljahre.
# Der Effekt ist statistisch signifikant (p < 0.05) und das Konfidenzintervall
# schließt die Null nicht ein.
# Vorsicht bei der Interpretation: Kausalität lässt sich hier nicht belegen.
# Wohlhabendere Länder investieren tendenziell mehr in Bildung *und* haben längere
# Schulbildungszeiten — beides könnte von einem dritten Faktor (BIP) abhängen.
# Die Zeitverzögerung macht die Korrelation plausibler, aber nicht kausal.
```

</details>

<br>

---

<h2 id="abgabe">Abgabe</h2>

Wenn du fertig bist:

1. Speichere das Skript `scripts/session_06_skript.R`.
2. Stelle sicher, dass alle fünf Pflicht-Plots im Ordner `output/` gespeichert wurden:
   - `plot_bildungsjahre.png` (Ü1)
   - `plot_bar_illiteracy.png` (Ü2)
   - `plot_smooth_illiteracy.png` (Ü3)
   - `plot_gdp_gender_gap.png` (Ü4)
   - `plot_tertiaer_trend.png` (Ü5)

   **Optional (Bonus-Aufgaben):** Wenn du B-Ü6 oder B-Ü7 bearbeitet hast, kannst du zusätzlich diese Plots speichern — sie sind für die Abgabe nicht verpflichtend:
   - `plot_democracy_spending.png` (B-Ü6 a)
   - `plot_gdp_edu_spending.png` (B-Ü6 c)
   - `plot_lagged_edu.png` (B-Ü7 b)

3. Reiche auf Learnweb ein:
   - `scripts/session_06_skript.R`
   - die fünf Pflicht-Plots aus `output/`
   - optional: Bonus-Plots, falls du die Bonus-Aufgaben bearbeitet hast

> **Falls etwas nicht klappt:** Lies zuerst die Fehlermeldung, frage deine Buddy-Partner:in oder schau in den [häufigen Fehlern](../../resources/other/common_errors.md) nach.

---

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>
