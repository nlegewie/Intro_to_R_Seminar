# Hausaufgaben Session 5 — Daten transformieren und zusammenfassen

**Seminar:** Globale Ungleichheit · Wintersemester 2025/26

---

## Inhaltsverzeichnis

- [Dein Endprodukt](#endprodukt)
- [Wo du arbeitest](#wo-du-arbeitest)
- [Neue Werkzeuge dieser Session](#neue-werkzeuge)
- [Hausaufgaben](#hausaufgaben)
  - [HA1 · Analyse-Datensatz erstellen](#ha1)
  - [HA2 · Weltbevölkerung: zusammenfassen und visualisieren](#ha2)
  - [HA3 · CO₂-Emissionen: Verteilung und Gruppenvergleich](#ha3)
  - [HA4 · Pro-Kopf-Emissionen mit `mutate()` berechnen](#ha4)
  - [HA5 · Pro-Kopf-Emissionen über die Zeit](#ha5)
  - [HA6 · Plastikmüll: eine Querschnittsanalyse](#ha6)
  - [Bonus-Hausaufgaben](#bonus-hausaufgaben)
- [Abgabe](#abgabe)

---

<h2 id="endprodukt">Dein Endprodukt</h2>

**Fragen dieser Session:**

- Wie hat sich die Weltbevölkerung seit 1950 entwickelt — und welche Regionen treiben das Wachstum?
- Welche Länder und Regionen stoßen den größten Anteil der globalen CO₂-Emissionen aus?
- Wenn wir nach Bevölkerungsgröße normieren — ändert sich das Bild?

Am Ende dieser Hausaufgaben wirst du vier Plots und mehrere Zusammenfassungstabellen erstellt haben.

**Plot 1 — Linienplot:** Weltbevölkerung seit 1950 nach Region

```
Milliarden Menschen
  4 |   █████████████████████████████████████████████ Asia
    |   ███████████████████████████████████████████
  3 |   ███████████████████████████████████████
    |   ██████████████████████████████████
  2 |   █████████████████████████████   Africa
    |   ██████████████              Europe ────────
  1 |   █████████
    |   ██████
  0 +──────────────────────────────────────────
    1950   1970   1990   2010   2023
```

**Plot 2 — Histogramm:** Verteilung der CO₂-Anteile nach Ländern (2022)

**Plot 3 — Linienplot:** Pro-Kopf-CO₂-Emissionen in ausgewählten Ländern seit 1950

**Plot 4 — Streudiagramm:** Plastikmüllaufkommen und CO₂ pro Kopf (2010)

*Die ASCII-Skizze zeigt nur die ungefähre Form.*

---

<h2 id="wo-du-arbeitest">Wo du arbeitest</h2>

Alle Code-Aufgaben bearbeitest du in:

**`scripts/session_05_skript.R`**

Führe zuerst den **SETUP-Abschnitt** aus — er lädt die Pakete und den Rohdatensatz.

> **`owid_data.csv` liegt unter `full_data/`** im Hauptordner des Repos. Wenn ein „Datei nicht gefunden"-Fehler erscheint, vergleiche deine Ordnerstruktur mit der im Repo.

---

<h2 id="neue-werkzeuge">Neue Werkzeuge dieser Session</h2>

Bevor du mit den Hausaufgaben beginnst, lies diesen Abschnitt durch. Er erklärt alle neuen Funktionen, die du heute brauchst. Du kannst jederzeit hierher zurückblättern.

---

### `arrange()` und `desc()` — Zeilen sortieren

`arrange()` sortiert den Datensatz nach einer oder mehreren Spalten — standardmäßig aufsteigend (kleinste Werte zuerst):

```r
mein_tibble |>
  arrange(bevoelkerung)   # kleinste Population zuerst
```

Mit `desc()` (*descending*) wird absteigend sortiert — also größte Werte zuerst:

```r
mein_tibble |>
  arrange(desc(bevoelkerung))   # größte Population zuerst
```

Das ist besonders nützlich, um schnell die „Top 10" oder „Bottom 10" eines Datensatzes zu sehen.

---

### `slice_head()` — Die ersten n Zeilen

`slice_head(n = 10)` zeigt nur die ersten 10 Zeilen — praktisch nach `arrange()`, um die größten oder kleinsten Werte zu sehen:

```r
mein_tibble |>
  arrange(desc(co2)) |>
  slice_head(n = 10)
```

> **Kombination ist die Stärke:** `arrange()` + `slice_head()` = "Zeig mir die Top 10 nach diesem Kriterium". Das ist eine der häufigsten Operationen in der explorativen Datenanalyse.

---

### `group_by()` + `summarize()` — Gruppen zusammenfassen

Das ist das mächtigste Werkzeug dieser Session. Die Idee:

1. **`group_by(gruppe)`** teilt den Datensatz gedanklich in Gruppen auf — z. B. eine Gruppe pro Region.
2. **`summarize()`** berechnet dann einen Wert *für jede Gruppe* — z. B. die Summe oder den Mittelwert.

```r
mein_tibble |>
  group_by(region) |>
  summarize(
    mittlere_co2 = mean(co2, na.rm = TRUE),
    anzahl_laender = n()
  )
```

Das Ergebnis ist ein neues Tibble mit einer Zeile pro Gruppe. `n()` ist eine Hilfsfunktion, die die Anzahl der Zeilen in jeder Gruppe zählt.

Wenn du `group_by()` nach einem `summarize()` weiterbenutzen möchtest, füge `.groups = "drop"` hinzu, um die Gruppierung aufzuheben:

```r
... |>
  group_by(region) |>
  summarize(gesamt_pop = sum(population, na.rm = TRUE), .groups = "drop")
```

---

### `mutate()` — Neue Spalten berechnen

`mutate()` fügt dem Datensatz eine neue Spalte hinzu, die aus bestehenden Spalten berechnet wird:

```r
mein_tibble |>
  mutate(co2_pro_kopf = co2 / bevoelkerung)
```

Der ursprüngliche Datensatz bekommt die neue Spalte hinzu — alle anderen Spalten bleiben erhalten. Du kannst mehrere neue Spalten auf einmal erstellen:

```r
mein_tibble |>
  mutate(
    co2_pro_kopf      = co2 / bevoelkerung,
    pop_in_millionen  = bevoelkerung / 1e6
  )
```

---

### `geom_smooth()` — Trendlinie hinzufügen

`geom_smooth()` fügt einem `ggplot`-Streudiagramm eine Trendlinie hinzu. Mit `method = "lm"` wird eine lineare Regressionsgerade berechnet, `se = FALSE` unterdrückt das Konfidenzband:

```r
ggplot(daten, aes(x = x_variable, y = y_variable)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "black")
```

Die Linie zeigt die allgemeine Richtung des Zusammenhangs — ohne dass du Statistik beherrschen musst. Du siehst: positiver Zusammenhang, negativer Zusammenhang, oder keiner.

---

<h2 id="Übungen">Übungen</h2>

<h3 id="üb1">Ü1 · Analyse-Datensatz erstellen</h3>

### Ziel

Für diese Session erstellst du deinen Übungs-Datensatz selbst! 🔥😱💪 Dazu brauchst du neben `filter()` aus der letzten Woche auch `select()`.

`select()` erlaubt dir, Spalten (=Variablen) auszuwählen. Datensätze haben oft Dutzende Spalten, von denen du nur wenige brauchst. `select()` wählt genau die Spalten aus, die du behalten möchtest — alles andere wird weggelassen:

```r
owid_daten |>
  select(country, year, child_mortality_rate)
```

Das Ergebnis ist ein neues Tibble mit nur diesen drei Spalten: `country`, `year`, `child_mortality_rate`. Die ursprünglichen Daten bleiben unverändert — du musst das Ergebnis mit `<-` speichern, wenn du es weiterbenutzen möchtest:

```r
owid_daten_child_mortality <- owid_daten |>
  select(country, year, child_mortality_rate)
```

Für die heutige Session und die dazu gehörigen Hausaufgaben brauchen wir die Variablen `country`, `year`, `population`, `share_global_co2`, `cumulative_co2`, `plastic_waste_generation` und `plastic_waste_exports`. Diese müssen wir per `select()` auswählen. Außerdem fokussieren wir uns auf die Zeit seit 1950. Dafür nutzen wir `filter()`. Der komplette Befehl sieht folgendermaßen aus:

```r
session_daten <- owid_daten |>
  filter(year >= 1950) |>
  select(country, world_region, year, population, share_global_co2,
         cumulative_co2, plastic_waste_generation, plastic_waste_exports) 

```

> **Was passiert hier?**
> - `filter(year >= 1950)` — nur Daten seit 1950. `>=` stellt sicher, dass 1950 mit eingeschlossen ist. Würden wir `>` nutzen, wäre 1950 ausgeschlossen und wir hätten nur Daten ab 1951.
> - `select(...)` — wählt nur die für diese Session relevanten Spalten.

`select` hat noch einige weitere praktische Möglichkeiten, wie z.B. alle Variablen auswählen mit einem bestimmten Wort im Namen. Mit `owid_daten %>% select(starts_with("headcount"))` wählen wir zum Beispiel alle Variablen aus, die das Wort "headcount" als Teil ihres Namens haben.


### Deine Aufgaben

Schreibe den Code in den Abschnitt **HA1** in `scripts/session_05_skript.R`.

a) Kopiere den Code ins Skript und führe ihn aus. Wende dann `glimpse()` auf `session_daten` an. Notiere als Kommentar: Wie viele Zeilen und Spalten hat der neue Datensatz?

b) Wende `summary()` auf `session_daten` an. Welche Variable hat die meisten fehlenden Werte — und warum könnte das so sein? (1–2 Sätze als Kommentar)

c)  Nutze `select(starts_with())` um aus dem vollen Datensatz `owid_daten` alle Variablen auszuwählen, deren Name mit "co2" anfängt. Du brauchst kein neues Objekt zu erschaffen, schreib den Code einfach ins Dokument und führe ihn aus. Wie viele Variablen werden ausgewählt?


<br>

<details>
<summary><strong>Tipp</strong></summary>

`glimpse()` und `summary()` kennst du schon aus Session 4 — wende sie einfach auf `session_daten` an. 

Für c): Stell sicher, dass du "co2" auch im Befehl in Anfürungszeichen gesetzt hast.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# a)
glimpse(session_daten)
# Ca. 30.000 Zeilen, 8 Spalten

#b)
summary(session_daten)
# plastic_waste_generation hat mit Abstand die meisten NAs — diese Variable
# wurde nur für das Jahr 2010 erhoben, nicht als Zeitreihe.

# c)
owid_daten %>% select(starts_with("co2"))

# Fünf Spalten werden durch starts_with("co2") angwählt.

```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha2">HA2 · Daten sortieren und hohe/niedrige Werte anzeigen</h3>




a) Verwende `arrange()` und `slice_head()`, um die 10 Länder mit der höchsten Bevölkerungszahl im Jahr 2023 anzuzeigen. Nutze dazu die bekannte `filter()`-Funktion. Notiere als Kommentar: Welche Regionen sind unter den Top-10-bevölkerungsreichsten Ländern vertreten?

b) 


session_daten |>
  filter(year == 2023, !is.na(population)) |>
  arrange(desc(population)) |>
  slice_head(n = 10)

# Unter den Top 10 dominieren Asien (Indien, China, Pakistan, Bangladesh,
# Indonesien, Japan) und Afrika (Nigeria, Äthiopien). USA und Brasilien
# vertreten Nord- und Südamerika.



---

<h3 id="ha2">HA2 · Weltbevölkerung: zusammenfassen und visualisieren</h3>

### Ziel

Wie hat sich die Weltbevölkerung seit 1950 entwickelt? Und welche Regionen treiben das Wachstum? Du lernst, Daten nach Gruppen zusammenzufassen und das Ergebnis zu visualisieren.

### Hintergrund

Unser `session_daten` enthält 140 Länder — aber nicht alle Länder der Welt. Die Bevölkerungssummen, die du gleich berechnen wirst, decken daher nur einen Teil der echten Weltbevölkerung ab (ungefähr 68%). Das ist wichtig für die Interpretation: Du siehst echte Muster und Trends — aber absolute Zahlen sind etwas niedriger als die tatsächlichen Weltzahlen.

### Schritt-für-Schritt-Erklärung: Bevölkerung summieren

Um die Gesamtbevölkerung über alle Länder pro Jahr zu berechnen, nutzen wir `group_by()` + `summarize()`:

```r
welt_pop <- session_daten |>
  group_by(year) |>
  summarize(gesamt_pop = sum(population, na.rm = TRUE), .groups = "drop")
```

Das ergibt einen neuen Tibble mit genau einer Zeile pro Jahr — und einer Spalte `gesamt_pop`, die die Summe über alle 140 Länder enthält.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **HA2** in `scripts/session_05_skript.R`.

#### HA2 A: Aktuelle Gesamtbevölkerung

Berechne die Gesamtbevölkerung der 140 Länder im Jahr 2023:

```r
session_daten |>
  filter(year == 2023) |>
  summarize(gesamt_pop = sum(population, na.rm = TRUE))
```

Notiere als Kommentar: In welcher Größenordnung liegt das Ergebnis? (Die tatsächliche Weltbevölkerung 2023 lag bei ca. 8,1 Milliarden — was erklärt die Differenz?)

#### HA2 B: Gesamtbevölkerung nach Weltregion (2023)

Erweitere die Berechnung auf Regionenebene. Füge `group_by(world_region)` vor `summarize()` ein und sortiere das Ergebnis absteigend:

```r
session_daten |>
  filter(year == 2023) |>
  group_by(world_region) |>
  summarize(gesamt_pop = sum(population, na.rm = TRUE), .groups = "drop") |>
  arrange(desc(gesamt_pop))
```

Notiere als Kommentar: Welche Region hat die größte Bevölkerung?

#### HA2 C: Bevölkerungswachstum über die Zeit — Daten vorbereiten

Erstelle den Tibble `pop_pro_jahr_region`:

```r
pop_pro_jahr_region <- session_daten |>
  group_by(year, world_region) |>
  summarize(gesamt_pop = sum(population, na.rm = TRUE), .groups = "drop")
```

Wende `glimpse()` auf das Ergebnis an. Was ist jetzt eine Zeile im Datensatz?

#### HA2 D: Linienplot nach Region

Erstelle einen Linienplot mit `year` auf der x-Achse, `gesamt_pop` auf der y-Achse, und je einer Linie pro Region (über `color = world_region`). Beschrifte den Plot vollständig.

Weise den Plot dem Objekt `pop_lineplot` zu und speichere ihn:

```r
ggsave(here("output", "pop_wachstum_region.png"), plot = pop_lineplot, width = 9, height = 5)
```

Schreibe **3–4 Sätze Interpretation** als Kommentar: Welche Region wächst am stärksten? Welche stagniert? Was bedeutet das für zukünftige globale Ungleichheit?

<br>

<details>
<summary><strong>Tipp zu HA2 D</strong></summary>

Das Grundmuster kennst du aus Session 4:

```r
pop_lineplot <- ggplot(pop_pro_jahr_region, aes(x = year, y = gesamt_pop, color = world_region)) +
  geom_line(linewidth = 1) +
  labs(
    title   = "...",
    x       = "Jahr",
    y       = "...",
    color   = "Region",
    caption = "Quelle: Our World in Data"
  )
```

Wenn die y-Achse sehr große Zahlen anzeigt (Milliarden), kannst du `gesamt_pop / 1e9` in `aes()` verwenden, um in Milliarden zu plotten.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# HA2 A
session_daten |>
  filter(year == 2023) |>
  summarize(gesamt_pop = sum(population, na.rm = TRUE))
# Ca. 5,5 Milliarden. Die Differenz zu 8,1 Mrd. liegt daran, dass unser
# Datensatz nur 140 der ~195 Länder der Welt abdeckt — bevölkerungsreiche
# Länder wie China sind zwar dabei, aber viele kleinere fehlen.

# HA2 B
session_daten |>
  filter(year == 2023) |>
  group_by(world_region) |>
  summarize(gesamt_pop = sum(population, na.rm = TRUE), .groups = "drop") |>
  arrange(desc(gesamt_pop))
# Asien hat mit Abstand die größte Bevölkerung (über 3 Milliarden im Datensatz).

# HA2 C
pop_pro_jahr_region <- session_daten |>
  group_by(year, world_region) |>
  summarize(gesamt_pop = sum(population, na.rm = TRUE), .groups = "drop")

glimpse(pop_pro_jahr_region)
# Jetzt ist eine Zeile = ein Jahr + eine Region. Statt 10.600 Länder-Jahr-Zeilen
# haben wir ca. 450 Region-Jahr-Zeilen (6 Regionen × ~75 Jahre).

# HA2 D
pop_lineplot <- ggplot(pop_pro_jahr_region, aes(x = year, y = gesamt_pop / 1e9, color = world_region)) +
  geom_line(linewidth = 1) +
  labs(
    title   = "Bevölkerungswachstum nach Weltregion seit 1950",
    x       = "Jahr",
    y       = "Bevölkerung (Milliarden)",
    color   = "Region",
    caption = "Quelle: Our World in Data / UN Population Division"
  )

pop_lineplot

ggsave(here("output", "pop_wachstum_region.png"), plot = pop_lineplot, width = 9, height = 5)

# Asien und Afrika wachsen am stärksten — Afrika zeigt dabei den steilsten
# Anstieg ab ca. 1980. Europa stagniert seit den 1990ern.
# Das bedeutet: Der globale Schwerpunkt der Weltbevölkerung verschiebt sich
# weiter nach Süden und Osten — mit weitreichenden Konsequenzen für
# Ressourcennutzung, Emissionen und Entwicklungspolitik.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha3">HA3 · CO₂-Emissionen: Verteilung und Gruppenvergleich</h3>

### Ziel

Wer ist verantwortlich für den globalen CO₂-Ausstoß? Du untersuchst die Verteilung des CO₂-Anteils über Länder und Regionen — erst durch ein Histogramm, dann durch Gruppenstatistiken.

### Hintergrund zur Variable

`share_global_co2` gibt an, welchen Prozentsatz der weltweiten CO₂-Emissionen ein Land in einem Jahr ausgestoßen hat. Ein Wert von `28.9` bedeutet: Dieses Land war für 28,9 % der globalen Emissionen verantwortlich. Da unser Datensatz nur 140 Länder enthält, summieren sich alle Werte auf etwa 41 % — der Rest entfällt auf Länder außerhalb unseres Datensatzes sowie auf Bunkerbrennstoff-Emissionen im internationalen Schiffs- und Flugverkehr.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **HA3** in `scripts/session_05_skript.R`.

#### HA3 A: Überblick verschaffen

Filtere auf das Jahr 2022 und speichere das Ergebnis in `co2_2022`:

```r
co2_2022 <- session_daten |>
  filter(year == 2022) |>
  filter(!is.na(share_global_co2))
```

Führe aus:
- `nrow(co2_2022)` — wie viele Länder?
- `summary(co2_2022$share_global_co2)` — was fällt dir auf?

Notiere als Kommentar: Warum ist der Median so viel kleiner als der Mittelwert?

#### HA3 B: Histogramm der CO₂-Verteilung

Erstelle ein Histogramm von `share_global_co2` aus `co2_2022`. Beschrifte den Plot vollständig. Speichere ihn als `co2_histogram` und als PNG.

Schreibe **2–3 Sätze Interpretation**: Was sagt die Form der Verteilung über die Ungleichheit bei CO₂-Emissionen?

#### HA3 C: Zusammenfassung nach Weltregion

Berechne für das Jahr 2022 nach Weltregion:

- die Summe der CO₂-Anteile (`sum_co2`)
- den Mittelwert über Länder (`mean_co2`)
- die Anzahl der Länder (`n_laender = n()`)

Sortiere das Ergebnis nach `sum_co2` absteigend.

```r
session_daten |>
  filter(year == 2022, !is.na(share_global_co2)) |>
  group_by(world_region) |>
  summarize(
    sum_co2    = sum(share_global_co2, na.rm = TRUE),
    mean_co2   = mean(share_global_co2, na.rm = TRUE),
    n_laender  = n(),
    .groups    = "drop"
  ) |>
  arrange(desc(sum_co2))
```

Notiere als Kommentar: Welche Region emittiert am meisten? Verändert sich das Bild, wenn du `sum_co2` durch `mean_co2` ersetzt — und was erklärt das?

#### HA3 D: Top-10-Emittenten 2022

Verwende `arrange()` und `slice_head()`, um die 10 Länder mit dem höchsten CO₂-Anteil im Jahr 2022 zu finden. Zeige dabei `country`, `world_region` und `share_global_co2`.

Schreibe 2–3 Sätze: Welche Länder dominieren — und überrascht dich etwas?

<br>

<details>
<summary><strong>Tipp zu HA3 B</strong></summary>

`geom_histogram()` kennst du aus Session 4. Experimentiere mit `bins`. Die Verteilung wird sehr rechtsschief sein — die meisten Länder emittieren wenig, wenige sehr viel.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# HA3 A
co2_2022 <- session_daten |>
  filter(year == 2022) |>
  filter(!is.na(share_global_co2))

nrow(co2_2022)   # ca. 139 Länder
summary(co2_2022$share_global_co2)
# Median ist sehr klein (ca. 0.05%), Mittelwert viel größer (ca. 0.3%).
# Das liegt daran, dass die Verteilung stark rechtsschief ist: Wenige große
# Emittenten heben den Mittelwert deutlich an, während die meisten Länder
# einen winzigen Anteil haben.

# HA3 B
co2_histogram <- ggplot(co2_2022, aes(x = share_global_co2)) +
  geom_histogram(bins = 30, fill = "#c0392b", color = "white") +
  labs(
    title    = "Verteilung der CO₂-Anteile nach Ländern (2022)",
    subtitle = "Anteil an globalen CO₂-Emissionen in Prozent",
    x        = "Anteil an globalen CO₂-Emissionen (%)",
    y        = "Anzahl Länder",
    caption  = "Quelle: Our World in Data / Global Carbon Project"
  )

co2_histogram
ggsave(here("output", "co2_histogramm_2022.png"), plot = co2_histogram, width = 8, height = 5)

# Die Verteilung ist extrem rechtsschief: Fast alle Länder emittieren unter 1%,
# während ein Handvoll Länder Anteile von 5–30% aufweisen.
# Das zeigt eine massive Ungleichheit beim CO₂-Ausstoß.

# HA3 C
session_daten |>
  filter(year == 2022, !is.na(share_global_co2)) |>
  group_by(world_region) |>
  summarize(
    sum_co2   = sum(share_global_co2, na.rm = TRUE),
    mean_co2  = mean(share_global_co2, na.rm = TRUE),
    n_laender = n(),
    .groups   = "drop"
  ) |>
  arrange(desc(sum_co2))

# Asien emittiert mit Abstand am meisten (sum_co2). Nach Mittelwert pro Land
# verschiebt sich das Bild etwas: Ozeanien und Europa haben höhere Mittelwerte
# als Afrika, weil sie weniger, aber größere Emittenten enthalten.
# Der Unterschied zeigt: Regionale Summen hängen stark von der Anzahl großer
# Länder ab — nicht nur von der durchschnittlichen Emissionsintensität.

# HA3 D
co2_2022 |>
  select(country, world_region, share_global_co2) |>
  arrange(desc(share_global_co2)) |>
  slice_head(n = 10)

# Die Top-Emittenten sind China, USA, Russland, India, Japan, Deutschland —
# also die größten Volkswirtschaften. Überraschend: Obwohl Afrika die
# zweitgrößte Bevölkerung hat, erscheint kein afrikanisches Land in den Top 10.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha4">HA4 · Pro-Kopf-Emissionen mit `mutate()` berechnen</h3>

### Ziel

Ein Land mit 1,4 Milliarden Einwohner:innen (China) und ein Land mit 80 Millionen (Deutschland) sind schwer direkt zu vergleichen. Pro-Kopf-Werte normieren nach Bevölkerungsgröße — und können das Bild erheblich verändern.

In dieser Aufgabe berechnest du mit `mutate()` zwei neue Variablen: den CO₂-Anteil pro Kopf und die kumulierten Emissionen pro Kopf.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **HA4** in `scripts/session_05_skript.R`.

#### HA4 A: Pro-Kopf-Variablen berechnen

Füge dem Datensatz `session_daten` zwei neue Spalten hinzu und speichere das Ergebnis als `session_daten` (überschreibe den bisherigen Datensatz):

```r
session_daten <- session_daten |>
  mutate(
    co2_pro_kopf          = share_global_co2 / population * 1e6,
    kumulativ_co2_pro_kopf = cumulative_co2   / population * 1e6
  )
```

> **Warum `* 1e6`?** `share_global_co2` ist in Prozent, `population` in absoluten Zahlen. Die Multiplikation mit 1.000.000 skaliert das Ergebnis in eine interpretierbare Einheit: Prozentpunkte globaler Emissionen pro Million Einwohner:innen. Das klingt technisch — für den Plot ist es wichtig, dass du die Achsenbeschriftung entsprechend formulierst.

#### HA4 B: Plausibilitätscheck

Führe für das Jahr 2022 aus:

```r
session_daten |>
  filter(year == 2022) |>
  select(country, world_region, share_global_co2, population, co2_pro_kopf) |>
  arrange(desc(co2_pro_kopf)) |>
  slice_head(n = 10)
```

Notiere als Kommentar: Welche Länder erscheinen jetzt in den Top 10 — und unterscheidet sich das von den Top-10-Emittenten aus HA3 D? Was erklärt den Unterschied?

#### HA4 C: Zusammenfassung nach Region (pro Kopf)

Berechne den **Mittelwert von `co2_pro_kopf`** nach Weltregion für 2022:

```r
session_daten |>
  filter(year == 2022, !is.na(co2_pro_kopf)) |>
  group_by(world_region) |>
  summarize(mittleres_co2_pro_kopf = mean(co2_pro_kopf, na.rm = TRUE), .groups = "drop") |>
  arrange(desc(mittleres_co2_pro_kopf))
```

Notiere als Kommentar: Hat sich die Rangfolge der Regionen im Vergleich zu HA3 C verändert? Was bedeutet das?

<br>

<details>
<summary><strong>Tipp</strong></summary>

Wenn `co2_pro_kopf` nach `mutate()` nur `NA` enthält, liegt es meist daran, dass entweder `share_global_co2` oder `population` für diese Zeilen NA ist — das ist normal und kein Fehler.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# HA4 A
session_daten <- session_daten |>
  mutate(
    co2_pro_kopf           = share_global_co2 / population * 1e6,
    kumulativ_co2_pro_kopf = cumulative_co2   / population * 1e6
  )

# HA4 B
session_daten |>
  filter(year == 2022) |>
  select(country, world_region, share_global_co2, population, co2_pro_kopf) |>
  arrange(desc(co2_pro_kopf)) |>
  slice_head(n = 10)

# Pro Kopf erscheinen jetzt vor allem kleine, ressourcenreiche Länder:
# z. B. Trinidad & Tobago, Kasachstan, Australien, Russland.
# China und Indien — absolute Top-Emittenten — verschwinden aus den Top 10,
# weil ihre riesige Bevölkerung die Emissionen pro Kopf stark drückt.
# Das zeigt: Die Frage "Wer emittiert am meisten?" hängt stark davon ab,
# ob man absolut oder pro Kopf misst.

# HA4 C
session_daten |>
  filter(year == 2022, !is.na(co2_pro_kopf)) |>
  group_by(world_region) |>
  summarize(mittleres_co2_pro_kopf = mean(co2_pro_kopf, na.rm = TRUE), .groups = "drop") |>
  arrange(desc(mittleres_co2_pro_kopf))

# Pro Kopf rückt Ozeanien (Australien dominiert die Region) nach oben,
# Afrika fällt weiter zurück. Asien bleibt hoch, ist aber nicht mehr
# so dominant wie bei der absoluten Summe. Das verschiebt die normative
# Frage: Wer trägt historisch und individuell Verantwortung für den Klimawandel?
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha5">HA5 · Pro-Kopf-Emissionen über die Zeit</h3>

### Ziel

Du visualisierst, wie sich `co2_pro_kopf` in fünf ausgewählten Ländern seit 1950 entwickelt hat — und kombinierst dabei `filter()`, `geom_line()` und vollständige Beschriftung.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **HA5** in `scripts/session_05_skript.R`.

#### HA5 A: Datensatz filtern

```r
laender_co2 <- session_daten |>
  filter(
    country %in% c("Germany", "China", "United States", "Nigeria", "Brazil"),
    !is.na(co2_pro_kopf)
  )
```

Führe `glimpse(laender_co2)` aus. Wie viele Zeilen hat dieser Datensatz, und warum?

#### HA5 B: Linienplot erstellen

Erstelle einen Linienplot mit `year` auf der x-Achse, `co2_pro_kopf` auf der y-Achse, einer Linie pro Land. Beschrifte vollständig und weise dem Plot das Objekt `co2_lineplot` zu.

Speichere den Plot:

```r
ggsave(here("output", "co2_pro_kopf_verlauf.png"), plot = co2_lineplot, width = 9, height = 5)
```

#### HA5 C: Interpretation

Schreibe **4–5 Sätze** als Kommentar:

- Welches Land hatte historisch die höchsten Pro-Kopf-Emissionen?
- Was passiert mit der Kurve der USA seit den 1970ern?
- China wächst stark — aber auf welchem Niveau verglichen mit den USA?
- Was sagt das über die historische Verantwortung für den Klimawandel?

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# HA5 A
laender_co2 <- session_daten |>
  filter(
    country %in% c("Germany", "China", "United States", "Nigeria", "Brazil"),
    !is.na(co2_pro_kopf)
  )

glimpse(laender_co2)
# Ca. 350 Zeilen: 5 Länder × ~70 Jahre, aber nicht alle Jahre haben co2-Daten.

# HA5 B
co2_lineplot <- ggplot(laender_co2, aes(x = year, y = co2_pro_kopf, color = country)) +
  geom_line(linewidth = 1) +
  labs(
    title   = "CO₂-Emissionen pro Kopf seit 1950",
    subtitle = "Anteil an globalen Emissionen pro Million Einwohner:innen",
    x       = "Jahr",
    y       = "CO₂-Anteil pro Million Einwohner:innen (%)",
    color   = "Land",
    caption = "Quelle: Our World in Data / Global Carbon Project"
  )

co2_lineplot
ggsave(here("output", "co2_pro_kopf_verlauf.png"), plot = co2_lineplot, width = 9, height = 5)

# Die USA hatten historisch mit Abstand die höchsten Pro-Kopf-Emissionen.
# Seit dem Peak in den 1970ern sind sie zurückgegangen — durch Deindustrialisierung
# und Energieeffizienz, aber auch durch Verlagerung emissionsintensiver Produktion.
# China wächst stark seit den 2000ern, liegt aber immer noch deutlich unter dem
# US-Niveau. Nigeria und Brasilien liegen die ganze Zeit sehr niedrig.
# Das zeigt das Dilemma der Klimapolitik: Die historisch größten Verursacher
# stehen heute anderen unter Druck, ihre Entwicklung einzuschränken.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha6">HA6 · Plastikmüll: eine Querschnittsanalyse</h3>

### Ziel

`plastic_waste_generation` misst, wie viel Plastikmüll ein Land pro Jahr produziert — in Tonnen. Die Variable existiert nur für das Jahr 2010. Das macht eine Zeitreihenanalyse unmöglich — aber ein aussagekräftiges Querschnitts-Streudiagramm ist trotzdem möglich.

Du wirst Plastikmüll pro Kopf berechnen, gegen CO₂ pro Kopf plotten, und eine Trendlinie ergänzen.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **HA6** in `scripts/session_05_skript.R`.

#### HA6 A: Datensatz für 2010 vorbereiten

```r
plastik_2010 <- session_daten |>
  filter(year == 2010) |>
  filter(!is.na(plastic_waste_generation), !is.na(co2_pro_kopf), !is.na(population)) |>
  mutate(plastik_pro_kopf = plastic_waste_generation / population)
```

Führe aus:
- `nrow(plastik_2010)` — für wie viele Länder haben wir alle drei Variablen?
- `summary(plastik_2010$plastik_pro_kopf)` — in welchem Wertebereich liegt die Variable?

#### HA6 B: Streudiagramm mit Trendlinie

Erstelle ein Streudiagramm mit:
- `co2_pro_kopf` auf der x-Achse
- `plastik_pro_kopf` auf der y-Achse
- `color = world_region` für Farbcodierung nach Region
- eine lineare Trendlinie mit `geom_smooth(method = "lm", se = FALSE, color = "black")`

Weise den Plot dem Objekt `plastik_scatter` zu, beschrifte vollständig und speichere ihn:

```r
ggsave(here("output", "plastik_co2_scatter.png"), plot = plastik_scatter, width = 9, height = 6)
```

#### HA6 C: Interpretation

Schreibe **4–5 Sätze** als Kommentar:

- Gibt es einen Zusammenhang zwischen CO₂-Emissionen und Plastikmüll pro Kopf?
- In welche Richtung geht er?
- Welche Region fällt besonders auf — positiv oder negativ?
- Was sagt das über den Zusammenhang zwischen wirtschaftlicher Entwicklung und Umweltbelastung?

<br>

<details>
<summary><strong>Tipp zu HA6 B</strong></summary>

Grundmuster:

```r
plastik_scatter <- ggplot(plastik_2010,
    aes(x = co2_pro_kopf, y = plastik_pro_kopf, color = world_region)) +
  geom_point(alpha = 0.7, size = 2.5) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(
    title   = "...",
    x       = "...",
    y       = "Plastikmüll pro Kopf (Tonnen / Person)",
    color   = "Region",
    caption = "Quelle: Our World in Data"
  )
```

`alpha = 0.7` macht Punkte leicht transparent — gut für überlappende Werte. `geom_smooth()` kennst du aus dem Abschnitt „Neue Werkzeuge".

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# HA6 A
plastik_2010 <- session_daten |>
  filter(year == 2010) |>
  filter(!is.na(plastic_waste_generation), !is.na(co2_pro_kopf), !is.na(population)) |>
  mutate(plastik_pro_kopf = plastic_waste_generation / population)

nrow(plastik_2010)   # ca. 100–107 Länder
summary(plastik_2010$plastik_pro_kopf)

# HA6 B
plastik_scatter <- ggplot(plastik_2010,
    aes(x = co2_pro_kopf, y = plastik_pro_kopf, color = world_region)) +
  geom_point(alpha = 0.7, size = 2.5) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(
    title    = "CO₂-Emissionen und Plastikmüll pro Kopf (2010)",
    subtitle = "Zusammenhang zwischen zwei Dimensionen des Ressourcenverbrauchs",
    x        = "CO₂-Anteil pro Million Einwohner:innen (%)",
    y        = "Plastikmüll pro Kopf (Tonnen / Person)",
    color    = "Region",
    caption  = "Quelle: Our World in Data / Global Carbon Project / Jambeck et al."
  )

plastik_scatter
ggsave(here("output", "plastik_co2_scatter.png"), plot = plastik_scatter, width = 9, height = 6)

# Es gibt einen positiven Zusammenhang: Länder mit höheren Pro-Kopf-Emissionen
# produzieren tendenziell auch mehr Plastikmüll pro Kopf.
# Europa und Ozeanien liegen oft oben rechts — hohe Emissionen, viel Plastik.
# Afrika liegt unten links — wenig Emissionen, wenig Plastik.
# Das deutet auf einen gemeinsamen Treiber hin: wirtschaftliche Entwicklung
# und Konsumniveau erhöhen beide Umweltbelastungen gleichzeitig.
# Ein Ausreißer verdient Aufmerksamkeit: Deutschland produziert viel Plastikmüll,
# aber vergleichsweise weniger CO₂ als manche anderen europäischen Länder.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h2 id="bonus-hausaufgaben">Bonus-Hausaufgaben</h2>

Diese Aufgaben sind freiwillig. Sie geben dir mehr Freiheit bei der Exploration — aber jede hat ein klares analytisches Ziel, das du am Ende beantworten sollst.

---

### B-HA1 · Kumulierte historische Emissionen

**Analytisches Ziel:** Wer hat historisch am meisten zur CO₂-Konzentration in der Atmosphäre beigetragen?

`cumulative_co2` misst die gesamten CO₂-Emissionen eines Landes seit Beginn der Industrialisierung (in Millionen Tonnen). Du hast `kumulativ_co2_pro_kopf` bereits in `session_daten` berechnet.

a) Finde die 10 Länder mit dem höchsten `kumulativ_co2_pro_kopf` im Jahr 2022.

b) Erstelle ein Histogramm der Verteilung von `cumulative_co2` über Länder (2022). Was fällt dir an der Form auf?

c) Schreibe 3–4 Sätze: Wie verändert die historische Perspektive (kumulierte Emissionen) die Debatte darüber, welche Länder Verantwortung für den Klimawandel tragen?

---

### B-HA2 ⚠️ · Plastikexporte: Wer exportiert wohin?

**Analytisches Ziel:** Wohin fließt der Plastikmüll wohlhabender Länder?

`plastic_waste_exports` misst in Tonnen, wie viel Plastikmüll ein Land pro Jahr exportiert — also ins Ausland verschifft. Die Variable hat Jahresdaten seit 1988.

a) Berechne die Top-10-Exporteure im Jahr 2019 (nach `plastic_waste_exports`).

b) Erstelle einen Linienplot der Plastikexporte für Deutschland, USA, Japan, China und Australien seit 2000. Was passiert nach 2018? (Hinweis: China hat 2018 seinen Plastikimport stark eingeschränkt — siehst du das im Plot?)

c) Berechne mit `mutate()` die Plastikexporte pro Kopf für 2019. Welche Länder exportieren pro Kopf am meisten?

d) Schreibe 3–4 Sätze: Was sagt die Plastikexport-Statistik über das globale Abfallsystem — und wessen Problem ist Plastikmüll wirklich?

---

### B-HA3 ⚠️⚠️ · Freie Exploration: Deine eigene Frage

**Analytisches Ziel:** Du formulierst eine eigene Forschungsfrage und beantwortest sie mit den Werkzeugen dieser Session.

Wähle zwei Variablen aus `session_daten`, die dich inhaltlich interessieren. Formuliere eine Frage wie: *„Haben Länder mit höherer Bevölkerung einen größeren Anteil der Plastikexporte — oder sind es eher kleine, reiche Länder?"*

Erstelle mindestens einen Plot und eine Zusammenfassungstabelle mit `group_by()` + `summarize()`. Schreibe 4–5 Sätze, die deine Frage beantworten — oder erklären, warum die Daten keine eindeutige Antwort erlauben.

> Es gibt keine vorgegebene Lösung für diese Aufgabe — sie ist die Vorbereitung für deinen Abschlussbericht.

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h2 id="abgabe">Abgabe</h2>

Wenn du fertig bist:

1. Speichere das Skript `scripts/session_05_skript.R`.
2. Stelle sicher, dass alle vier Plots im Ordner `output/` liegen:
   - `pop_wachstum_region.png`
   - `co2_histogramm_2022.png`
   - `co2_pro_kopf_verlauf.png`
   - `plastik_co2_scatter.png`
3. Reiche auf Learnweb ein:
   - `scripts/session_05_skript.R`
   - alle vier Plot-Dateien

> **Falls etwas nicht funktioniert:** Lies die Fehlermeldung, frage deine Buddy-Partner:in oder melde dich im Kurs-Forum.

---

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>
