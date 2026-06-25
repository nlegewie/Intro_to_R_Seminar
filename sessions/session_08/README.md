# Session 8 — Zeitnutzung

**Seminar:** Globale Ungleichheit · Wintersemester 2025/26

---

## Inhaltsverzeichnis

- [Einleitung](#einleitung)
- [Dein Endprodukt](#endprodukt)
- [Neue Werkzeuge dieser Session](#neue-werkzeuge)
- [Wo du arbeitest](#wo-du-arbeitest)
- [Übungen](#aufgaben)
  - [Ü1 · Datenaufbereitung](#ue1)
  - [Ü2 · Beschreibung der Variablen](#ue2)
  - [Ü3 · Breite Vergleiche mit Heatmaps](#ue3)
  - [Ü4 · Entwicklung von Arbeitsstunden über die Zeit](#ue4)
  - [Ü5 · Zusammenhang von Zeitnutzung und BIP](#ue5)
  - [Ü6 · Code formatieren](#ue6)
  - [Ü7 · Markdown Bericht](#ue7)
- [Bonus-Aufgaben](#bonus-aufgaben)
  - [B-Ü1 · Work-Play-Verhältnis](#b-ue1)
  - [B-Ü2 · Deutschlandprofil](#b-ue2)
- [Abgabe](#abgabe)



---

<h2 id="einleitung">Einleitung: Zeitnuzung in globaler Perspektive</h2>

**Frage dieser Session:** Wie nutzen Menschen in verschiedenen Ländern ihre Zeit — und hängt das mit wirtschaftlicher Entwicklung zusammen?

Zeit ist eine der knappsten Ressourcen, die es gibt: Jeder Tag hat 24 Stunden, und wie sie aufgeteilt werden — zwischen Arbeit, Schlaf, Care, Freizeit — sagt viel darüber aus, wie Menschen leben. In dieser Session untersuchst du genau das mit Daten aus über 30 Ländern. Du erkundest Verteilungen und Muster, und fragst am Ende: Verbringen wohlhabendere Länder ihre Zeit anders?

---

<h2 id="endprodukt">Dein Endprodukt</h2>

Methodisch setzt du die Arbeit aus Session 7 fort: **Datenaufbereitung und Analyse bleiben getrennt**, und am Ende fasst du alles in einem **RMarkdown-Bericht** zusammen. Der inhaltliche rote Faden:

**aufbereiten → beschreiben → vergleichen → historisch einordnen → mit BIP verknüpfen → berichten**

Am Ende hast du Folgendes erstellt:

| Produkt | Datei / Objekt | Was es zeigt |
|---------|------------------|--------------|
| **Aufbereitungsskript** | `scripts/session_08_data_wrangling.r` | Lädt OWID-Daten, baut `time_use_daten_corrected` und `time_use_daten_long` |
| **Analyseskript** | `scripts/session_08_analysis.r` | Alle Visualisierungen und Interpretationen als Code |
| **Dichteplots** | `time_use_density_plots` | Wie verteilt sich Zeit pro Aktivität über alle Länder? |
| **Heatmap** | `time_use_heatmap_angled` | 32 Länder × 13 Aktivitäten auf einen Blick |
| **Arbeitsstunden-Trends** | `annual_wh_highlight_own`, `annual_wh_grouped` | Entwicklung der Jahresarbeitsstunden — einzelne Länder und Weltregionen |
| **BIP-Zusammenhang** | `time_use_lm_annotated` | Steigt oder sinkt Zeitaufwand mit wirtschaftlicher Entwicklung? |
| **Reproduzierbarer Bericht** | `session_08_report.Rmd` → `.html` | Plots, Interpretationen und Analyse-Narrativ in einem Dokument |

> Die Bonus-Aufgaben lassen dich eigene Fragen stellen — etwa das Verhältnis von „Arbeit" und „Freizeit" oder ein Deutschlandprofil im Ländervergleich.

Wenn du die Übungen durcharbeitest, wächst Schritt für Schritt ein vollständiges Bild: Erst lernst du die Daten kennen, dann findest du Muster, die Tabellen allein nicht zeigen, und am Ende erzählst du die Geschichte in einem Bericht, den du per Knopfdruck neu erzeugen kannst.


<h2 id="neue-werkzeuge">Neue Werkzeuge dieser Session</h2>

| Werkzeug / Konzept | Wofür |
|--------------------|-------|
| Breites vs. langes Format | Viele Spalten pro Land → eine Zeile pro Land und Kategorie; Grundlage für `facet_wrap()` |
| `pivot_longer()` | Breiten Datensatz ins lange Format umformen |
| `str_replace()` | Teile von Text in Spalten ersetzen oder entfernen (z. B. `"time_use_"` aus Kategorienamen) |
| `geom_tile()` | Heatmaps: Werte als farbige Kacheln darstellen |
| `fct_reorder()` | Kategorien nach Werten sortieren (z. B. Aktivitäten nach durchschnittlicher Minutenzahl) |
| ggplot-Themes (`theme_bw()`, `theme_ipsum()`) | Aussehen von Plots steuern (Hintergrund, Gitter, Schrift) |
| `gghighlight()` | Ausgewählte Länder oder Gruppen hervorheben, Rest ausgrauen |
| `styler` | Code automatisch nach dem Tidyverse Style Guide formatieren |

### Pakete installieren und laden

Diese Session nutzt ein paar **zusätzliche Pakete** neben `tidyverse`. Du musst jedes Paket **einmal installieren** und danach in deinen Skripten **laden**, wenn du es brauchst.

**Schritt 1 — Installieren (nur einmal, nur in der Konsole!)**

Tippe jeden Befehl **einmal** in die Konsole ein und drücke ENTER. Schreibe `install.packages(...)` **nicht** in deine Skripte — Installation gehört nicht in den Datenaufbereitungs- oder Analyse-Workflow.

```r
install.packages("viridis")
install.packages("gghighlight")
install.packages("hrbrthemes")
install.packages("styler")
```

**Schritt 2 — Laden (in den Skripten, jedes Mal beim Start)**

Nach der Installation aktivierst du Pakete mit `library()`. Diese Befehle gehören in den **SETUP-Abschnitt** deiner Skripte — dort, wo du auch `library(tidyverse)` stehen hast:

| Paket | Wofür in dieser Session | Wo laden |
|-------|-------------------------|----------|
| `viridis` | Farbskala für Heatmaps (`scale_fill_viridis()`) | `session_08_analysis.r` |
| `gghighlight` | Länder oder Regionen in Linienplots hervorheben | `session_08_analysis.r` |
| `hrbrthemes` | Theme `theme_ipsum()` | `session_08_analysis.r` |
| `styler` | Code formatieren (Ü6) | nur in der Konsole — kein `library()` nötig |

```r
library(viridis)
library(gghighlight)
library(hrbrthemes)
```

Führe den SETUP-Abschnitt aus, bevor du mit den Übungen beginnst. Wenn R meldet, dass ein Paket fehlt, installiere es zuerst in der Konsole und lade es danach mit `library()`.

---

<h2 id="wo-du-arbeitest">Wo du arbeitest</h2>

Führe zuerst den **SETUP-Abschnitt** im Skript `session_08_data_wrangling.R` aus — er lädt die nötigen Pakete und den OWID-Datensatz.

Alle Code-Aufgaben bearbeitest du in den folgenden Skripten: `session_08_data_wrangling.r`, `session_08_analysis.r` (beide im `scripts`-Ordner). Am Ende fügst du die Ergebnisse und Interpretationen in das Bericht-Dokument `session_08_report.Rmd` im `session_08`-Ordner ein.\

---

<h2 id="aufgaben">Übungen</h2>

---

<h3 id="ue1">Ü1 · Datenaufbereitung</h3>

### Ziel

Bevor du die Zeitnutzungsdaten analysieren kannst, musst du herausfinden, welches Jahr am besten geeignet ist, und einen sauberen Arbeitsdatensatz erstellen.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **Ü1** in `scripts/session_08_data_wrangling.r`.

**a)** Finde heraus, in welchem Jahr die meisten Länder Daten zur Variablen `time_use_paid_work` haben. Zähle dazu pro Jahr, wie viele Zeilen auf dieser Variable *keinen* fehlenden Wert haben, und sortiere das Ergebnis absteigend.

**b)** Erstelle einen Datensatz `time_use_daten`, der:
- nur das Jahr mit den meisten Datenpunkten enthält
- Zeilen mit fehlenden Werten auf `time_use_paid_work` ausschließt. (Da alle `time_use`-Variablen aus der selben Datenquelle kommen, deckt dieser Befehl dann alle relevanten Variablen ab.)
- nur die Variablen `country`, `world_region`, `gdp` und alle `time_use_*`-Variablen enthält

**c)** Prüfe den neuen Datensatz kurz: 
- Wie viele Länder bleiben übrig? 
- Welche Weltregionen sind vertreten?
- Welche Länder sind vertreten (nutze dazu `pull()`).

**d)** Zähle pro Weltregion, wie viele Länder in `time_use_daten` vorhanden sind. Könnte hier ein Problem liegen für spätere Analysen?

**e)** Es gibt ein paar fehlende Werte auf der Variable `world_region`. Schau nach, um welche Länder es sich handelt, und weise den Ländern die korrekten Werte auf `world_region` zu. Nutze für diese Korrektur für jedes Land eine Kombination aus `mutate()` und `if_else()`. Weise das Ergebnis dem neuen Objekt `time_use_daten_corrected` zu.

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü1 a**

- Das Muster kennst du bereits aus früheren Sessions: `group_by(year)` + `summarize()` + `arrange(desc(...))`.
- Um nicht-fehlende Werte zu zählen, nutzt du `sum(!is.na(variable))` innerhalb von `summarize()`.

**Ü1 b**

- Filtere zuerst auf das Jahr, das du in a) gefunden hast, dann schließe fehlende Werte aus.
- `starts_with("time_use")` in `select()` wählt alle Variablen aus, deren Name mit `time_use` beginnt — du musst sie nicht einzeln aufzählen.
- Weise das Ergebnis `time_use_daten` zu — du brauchst dieses Objekt in allen weiteren Übungen.

**Ü1 c**

- `nrow()` zählt die Zeilen, `unique(time_use_daten$world_region)` zeigt die vorhandenen Regionen. Für die Länderübersicht: Pipe `time_use_daten` in `pull(country)` — das liefert einen einfachen Vektor aller Ländernamen, den du schnell überfliegen kannst.

**Ü1 d**

- `count(world_region)` zeigt dir, wie viele Länder pro Region vorhanden sind. Nutze den Befehl in einer Pipe. Schau, ob alle Regionen vertreten sind und ob es fehlende Werte (`NA`) auf `world_region` gibt.

**Ü1 e**

- Filtere zuerst mit `filter(is.na(world_region))`, um die betroffenen Länder zu identifizieren.
- Korrigiere dann mit einer Kette von `mutate(world_region = if_else(country == "...", "...", world_region))` — einen Aufruf pro Land. Das `world_region` am Ende des `if_else` sorgt dafür, dass alle anderen Werte unverändert bleiben.


</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# Ü1 a
owid_daten |>
  group_by(year) |>
  summarize(non_na = sum(!is.na(time_use_paid_work))) |>
  arrange(desc(non_na))
# 2013 ist das einzige Jahr, in dem Daten vorliegen.

# Ü1 b
time_use_daten <- owid_daten |>
  filter(year == 2013) |>
  filter(!is.na(time_use_education)) |>
  select(country, world_region, gdp, starts_with("time_use"))

# Ü1 c
nrow(time_use_daten)
unique(time_use_daten$world_region)
time_use_daten |>
  pull(country)
# 32 Länder, 4 Weltregionen: Europa, Asien, Nordamerika, Ozeanien

# Ü1 d
time_use_daten |>
  count(world_region)
# Asien hat nur 4 Länder, Ozeanien und Nordamerika haben nur 2. Wenn wir später Weltregionen vergleichen sollten, werden die Daten zu diesen Region kaum belastbar sein, da viele Länder fehlen.


# Ü1 e
time_use_daten |>
  filter(is.na(world_region))

time_use_daten_corrected <- time_use_daten |>
  mutate(world_region = if_else(country == "USA", "North America", world_region),
  world_region = if_else(country == "Korea", "Asia", world_region),
  world_region = if_else(country == "UK", "Europe", world_region))


```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue2">Ü2 · Beschreibung der Variablen</h3>

### Ziel

Bevor du Zusammenhänge untersuchst, verschaffst du dir einen Überblick über die Verteilung der einzelnen Zeitnutzungs-Variablen. Dazu formst du den Datensatz vom breiten ins lange Format um. Das ist ein notwendiger Schritt, um mit einer einzigen ggplot-Pipeline viele Variablen gleichzeitig zu visualisieren.


### Daten umformen: `pivot_longer()`

In `time_use_daten_corrected` liegt jede Aktivität in einer **eigenen Spalte** — das nennt man **breites Format** (*wide data*). Pro Land gibt es genau **eine Zeile**, und die Spaltenüberschriften sind die Variablennamen.

Es gibt noch einen anderen Weg, die gleichen Daten darzustellen. Im **langen Format** (*long data*) steht jede Beobachtung in einer **eigenen Zeile**. Statt vieler Spalten für die Aktivitäten hast du zwei neue Spalten: eine für den **Namen** der Aktivität und eine für den **Wert**.

**Warum umformen?** Mit breiten Daten müsstest du für jede `time_use`-Variable einen eigenen Plot schreiben. Im langen Format kannst du alle Kategorien in **einer** ggplot-Pipeline darstellen — z. B. mit `facet_wrap(~kategorie)`. In anderen Situationen zeigst du vllt. die verschiedenen Kategorien als Farben im Plot.

Zum Verständnis: Hier ein kleiner Ausschnitt aus unseren Session-Daten (2013) — nur drei Länder und vier Aktivitäten:

**Breit** — eine Zeile pro Land, eine Spalte pro Aktivität:

| country | time_use_paid_work | time_use_sleep | time_use_sports | time_use_friends |
|---------|-------------------:|---------------:|----------------:|-----------------:|
| France  | 170 | 513 | 12 | 55 |
| Germany | 224 | 498 | 26 | 61 |
| Japan   | 326 | 442 | 10 | 17 |

**Lang** — dieselben Informationen, aber jede Kombination aus Land und Aktivität bekommt eine eigene Zeile:

| country | kategorie | minuten |
|---------|-----------|--------:|
| France  | paid_work | 170 |
| France  | sleep     | 513 |
| France  | sports    | 12 |
| France  | friends   | 55 |
| Germany | paid_work | 224 |
| Germany | sleep     | 498 |
| …       | …         | … |

Aus **3 Ländern × 4 Aktivitäten** werden **12 Zeilen** — und aus 4 Spalten werden 2 (`kategorie`, `minuten`).

`pivot_longer()` macht genau diese Umwandlung. Du gibst an, **welche Spalten** zusammengefasst werden sollen, und wie die neuen Spalten heißen:

```r
time_use_daten_long <- time_use_daten_corrected |>
  pivot_longer(
    cols = starts_with("time_use"),   # alle time_use_*-Spalten umformen
    names_to = "kategorie",           # alte Spaltennamen landen hier
    values_to = "minuten"             # die Werte landen hier
  )
```

- `cols` — welche Spalten breit → lang werden. `starts_with("time_use")` wählt alle Aktivitäten aus, ohne sie einzeln aufzuzählen.
- `names_to` — Name der neuen Spalte für die Variablennamen.
- `values_to` — Name der neuen Spalte für die eigentlichen Minutenwerte.

Spalten wie `country`, `world_region` und `gdp` bleiben unverändert — sie werden für jede neue Zeile einfach mitkopiert. So weiß jede Zeile im langen Datensatz weiterhin, zu welchem Land sie gehört.

### Wörter aus Variablen entfernen mit `str_replace()`

Nach `pivot_longer()` stehen in der Spalte `kategorie` noch die **ursprünglichen Spaltennamen** — also z. B. `"time_use_paid_work"` statt `"paid_work"`. Für Plots und Interpretationen sind die kürzeren Namen leichter lesbar.

`str_replace()` ersetzt **Teile eines Textes** in einer Spalte. Du sagst R: „Suche diesen Text — und tausche ihn gegen etwas anderes aus."

Die Grundidee in drei Argumenten:

```r
str_replace(text, "was_raus_soll", "was_stattdessen_reinkommt")
```

1. **text** — die Spalte (oder ein einzelner Text), die du bearbeiten willst  
2. **"was_raus_soll"** — der Teil, den du finden und ersetzen willst  
3. **"was_stattdessen_reinkommt"** — der neue Text; `""` (leerer Text) bedeutet: einfach löschen

**Einfaches Beispiel:** Stell dir vor, du hast eine Spalte `gruß`:

| gruß |
|------|
| Hallo Welt |
| Hallo R |
| Hallo Daten |

Du willst das Wort `"Hallo "` entfernen:

```r
gruß_tabelle |>
  mutate(gruß_kurz = str_replace(gruß, "Hallo ", ""))
```

| gruß | gruß_kurz |
|------|-----------|
| Hallo Welt | Welt |
| Hallo R | R |
| Hallo Daten | Daten |

`str_replace()` arbeitet **Zeile für Zeile** durch die Spalte.

**In unseren Session-Daten** sieht das nach `pivot_longer()` so aus:

| kategorie (vorher) | kategorie (nachher) |
|--------------------|---------------------|
| time_use_paid_work | paid_work |
| time_use_sleep | sleep |
| time_use_sports | sports |
| time_use_friends | friends |

Der gemeinsame Anfang `"time_use_"` kommt in jeder Zeile vor — den ersetzen wir durch nichts:

```r
time_use_daten_long <- time_use_daten_corrected |>
  pivot_longer(
    cols = starts_with("time_use"),
    names_to = "kategorie",
    values_to = "minuten"
  ) |>
  mutate(kategorie = str_replace(kategorie, "time_use_", ""))
```

- `mutate(...)` erzeugt (oder überschreibt) die Spalte `kategorie`.
- `"time_use_"` ist exakt der Text, den du entfernen willst — inklusive des Unterstrichs am Ende.
- `""` heißt: an dieser Stelle nichts einfügen; der Rest des Namens bleibt stehen.

> **Kleiner Tipp:** Achte auf exakte Schreibweise. `"time_use_"` ist nicht dasselbe wie `"Time_use_"`. Wenn das Muster nicht passt, bleibt der Text unverändert.

### Deine Aufgaben

Schreibe den Code zum Datenaufbereitungsschritt in **b)** in den Abschnitt **Ü2** in `scripts/session_08_data_wrangling.r`, und die Analyseschritte in **a)**, **b)** und **c)** in `scripts/session_08_analysis.r`. 

**a)** Schaue dir Zusammenfassungen aller `time_use`-Variablen an. In welchen drei Bereichen fällt am meisten Zeit an?


**b)** Wir wollen im nächsten Schritt mit wenig Aufwand viele Plots erstellen; einen für jede `time_use`-Variable. Dafür müssen wir den Datensatz umformen. Nutze `pivot_longer` auf alle `time_use`-Variablen. Gebe der Variablen-Spalte den Namen `kategorie` und der Werte-Spalte den Namen `minuten`. Entferne dann aus der `kategorie`-Spalte den Präfix `time_use` aus allen Zeilen, indem du `mutate()` und `str_replace()` einsetzt. Weise das Ergebnis dem Objekt `time_use_daten_long` zu. Denke daran, als Ausgangspunkt `time_use_daten_corrected` zu nutzen. 

**c)** Erstelle einen Dichte-Plot für jede `time_use`-Variable mit nur einer Pipeline. Nutze dazu `facet_wrap` und füge das Argument `scales = "free"` hinzu, damit die Plots leichter zu interpretieren sind. Füge dem Plot außerdem einen Titel, einen Untertitel und sinnvolle Achsenbeschriftungen hinzu. Füge den Plot dem Objekt `time_use_density_plots` zu. 
Schreibe ein paar Sätze Interpretation:
- Für welche Aktivitäten wird am meisten/am wenigsten Zeit aufgewändet?
- Welche verschiedenen Arten von Verteilungen sehen wir?
(Beachte, dass die Achsen nicht die gleichen Skalierungen aufweisen!)

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü2 a**

- Nutze `select(starts_with("time_use"))` und `summary()`. Die Mittelwerte zeigen dir schnell, wo die meiste Zeit anfällt.

**Ü2 b**

- Das `cols`-Argument von `pivot_longer()` akzeptiert Selektions-Helfer wie `starts_with("time_use")`.
- Vergiss nicht, anschließend mit `mutate(kategorie = str_replace(kategorie, "time_use_", ""))` den Präfix aus den Kategorienamen zu entfernen.

**Ü2 c**

- Ausgangspunkt ist `time_use_daten_long` aus b). Auf der x-Achse kommt `minuten`, auf der y-Achse brauchst du keine Variable — `geom_density()` berechnet die Dichte selbst.
- `facet_wrap(~kategorie, ...)` erzeugt ein kleines Panel pro Aktivität. `scales = "free"` sorgt dafür, dass jede y-Achse ihre eigene Skala bekommt. Das ist wichtig, weil z.B. Schlaf und Sport sehr unterschiedliche Größenordnungen haben.
- Titel, Untertitel und Achsenbeschriftungen fügst du mit `labs()` am Ende der Pipeline hinzu. Weise die gesamte Pipeline dem Objekt `time_use_density_plots` zu.
- Bei der Interpretation: Schau dir die **Mittelwerte** aus a) und die **Form** der Kurven in den Panels an — wo liegen die meisten Länder, und sehen die Verteilungen ähnlich aus (glockig, schief, mit Ausreißern)?

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r

# Ü2 a
time_use_daten_corrected |>
  select(starts_with("time_use")) |>
  summary()

# Ü2 b
time_use_daten_long <- time_use_daten_corrected |> 
  pivot_longer(cols = starts_with("time_use"),
               names_to = "kategorie",
               values_to = "minuten") |>
  mutate(kategorie = str_replace(kategorie, "time_use_", ""))


# Ü2 c     
time_use_density_plots <- time_use_daten_long |>
  ggplot(aes(x = minuten)) +
  geom_density() +
  facet_wrap(~kategorie, scales = "free") +
  labs(
    title = "Verteilung der Zeitnutzung nach Kategorie",
    subtitle = "Dichteplots pro Aktivität, 2013",
    x = "Minuten pro Tag",
    y = "Dichte"
  )

# Am meisten Zeit wird für Schlaf und Arbeiten aufgewandt. 
# Am wenigsten Zeit wird für Sport, Events und Shopping aufgewandt.
# Einige Verteilung sind annähernd normal, andere sind leicht links- bzw. rechtsschief. 
# Manche zeigen ein paar Ausreißerfälle, wie z.B. Personal care und Events.

```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue3">Ü3 · Breite Vergleiche anstellen mit Heatmaps</h3>

### Ziel

Manchmal wollen wir viele Beobachtungen (hier: Ländern) und anhand vieler Variablen vergleichen. Viele Plots sind dafür eher ungeeignet, und Tabellen sind eher unübersichtlich. Eine Plot-Art, die für solche Vergleiche gut geeignet ist: Heatmaps. In dieser Übung lernst du Heatmaps kennen und erstellst eine Heatmap, die die Zeitnutzung aller Länder auf einen Blick vergleichbar macht. Das geht mit `geom_tile()`. Du lernst diesen `ggplot()`-Befehl kennen und übst, Achsenbeschriftungen und Variablen-Reihenfolge gezielt anzupassen.

### Heatmaps mit `geom_tile()`

Eine **Heatmap** zeigt Werte als eingefärbte Kacheln in einem Raster — eine Zeile pro Einheit (z. B. Land), eine Spalte pro Kategorie (z. B. Aktivität), oder umgekehrt. Je heller oder dunkler die Kachel, desto größer oder kleiner der Wert. Das erlaubt es, viele Einheiten und viele Variablen auf einmal zu vergleichen, ohne dutzende Balkendiagramme zu benötigen.

In ggplot2 erstellt man Heatmaps mit `geom_tile()`. Das Mapping braucht drei Aesthetics:

```r
ggplot(aes(x = [VARIABLE 1], y = [VARIABLE 2], fill = [VARIABLE MIT WERTEN])) +
  geom_tile()
```

- `x` und `y` legen fest, welche Variable auf welcher Achse steht.
- `fill` ist der Wert, den du darstellen willst. Er bestimmt die Farbe der einzelnen Kacheln.

**Wie interpretiert man eine Heatmap?**

- Ähnlich gefärbte Zeilen bedeuten: Dieses Land hat ein ähnliches Muster wie andere Länder.
- Auffällig helle oder dunkle einzelne Kacheln sind interessante Ausreißer — Länder, die bei einer bestimmten Aktivität deutlich mehr oder weniger Zeit aufwenden als der Rest.


### Deine Aufgaben

**a)** Erstelle eine Heatmap mit `geom_tile()`. `country` sollte auf die x-Achse, `kategorie` auf die y-Achse. Die Kategorien `sleep` und `paid_work` vereinen mit Abstand am meisten Zeitnutzung auf sich. Dadurch sind Differenzierungen beim Rest in der Grafik nicht mehr so gut zu sehen. Filtere diese beiden Kategorien aus der `kategorie`-Spalte heraus, indem einen `filter()`-Befehl am Anfang der Pipeline hinzufügst und darin `!=` benutzt.

**b)** Sortiere die `kategorie`-Variable nach den Werten in `minuten`, damit die Kategorien mit den geringsten Werten links landen und der Rest nach aufsteigenden Werten sortiert ist. Das erleichtert die Interpretation. Du kannst hierfür `fct_reorder()` auf die Spalte `kategorie` innerhalb des `aes()`-Befehls anwenden. Das sollte so aussehen: `aes(x = fct_reorder(..., minuten), y = ...)`. Weise den Plot dem Objekt `time_use_heatmap` zu.

**c)** Erweitere den Plot `time_use_heatmap` wie folgt: Die Labels der verschiedenen `time_use`-Kategorien sind kaum lesbar. Du kannst das ändern, indem du die Labels um 45 Grad drehst. Dazu fügst du dem Plot einen `theme()`-Befehl hinzu, innerhalb dessen du die X-Achse ansteuerst und dort den Winkel der Labels anpasst: `axis.text.x = element_text(angle = 45, hjust = 1)`. Füge außerdem mit `labs()` einen Titel, einen Untertitel und sinnvolle Achsenbeschriftungen hinzu. Weise den erweiterten Plot dem Objekt `time_use_heatmap_angled` zu.

**d)** Interpretiere kurz, was der Plot zeigt.

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü3 a**

- Für `geom_tile()` brauchst du drei aesthetics: `x = country`, `y = kategorie`, `fill = minuten`.
- Die beiden ausgeschlossenen Kategorien in `time_use_daten_long` heißen `"sleep"` und `"paid_work"` (der Präfix wurde in Ü2 b entfernt). Um die Farben besser unterscheiden zu können, füge dem Plot den Befehl `scale_fill_viridis(name="Minuten/Tag",option ="C")` hinzu.

**Ü3 b**

- `fct_reorder(kategorie, minuten)` sortiert die Faktorebenen nach dem Mittelwert von `minuten` — also nach der durchschnittlichen Zeit pro Kategorie. Setze das direkt im `aes(x = ...)`-Argument ein.

**Ü3 c**

- Du kannst den gespeicherten Plot `time_use_heatmap` direkt erweitern, ohne die ganze Pipeline zu wiederholen: `time_use_heatmap + theme(...) + labs(...)`.

**Ü3 d**

- Schaue auf horizontale Muster (Zeilen = Länder) und vertikale Muster (Spalten = Aktivitäten). Welche Länder sind auffällig hell oder dunkel bei einer bestimmten Kategorie?

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r

# Ü3 a
time_use_daten_long |>
  filter(kategorie != "sleep", kategorie != "paid_work") |>
  ggplot(aes(x = kategorie, y = country, fill = minuten)) +
  geom_tile() +
  scale_fill_viridis(name="Hrly Temps C",option ="C")

# Ü3 b
time_use_heatmap <- time_use_daten_long |>
  filter(kategorie != "sleep", kategorie != "paid_work") |>
  ggplot(aes(x = fct_reorder(kategorie, minuten), y = country, fill = minuten)) +
  geom_tile() +
  scale_fill_viridis(name="Hrly Temps C",option ="C")

# Ü3 c
time_use_heatmap_angled <- time_use_heatmap +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(
    title = "Zeitnutzung im Ländervergleich",
    subtitle = "Minuten pro Tag, 2013 (ohne Schlaf und bezahlte Arbeit)",
    y = "Land",
    x = "Aktivität",
    fill = "Minuten/Tag"
  )

# Ü3 d

# Hellere Farben zeigen mehr Zeitinvestition an.
# Tendenziell gibt es relativ starke Parallelen zwischen den Ländern hinsichtlich der Zeitnutzung. Das zeigen die relativ homogenen Farben der horizontalen Balken.
# Ausnahmen sind z.B. `care` in Irland, `housework` in Mexiko und `volunteering` in Japan und Finnland (üblicher als in anderen Ländern) oder `friends` in Japan und China, und `tv_radio` in Mexico und Irland (seltener als in anderen Ländern).


```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue4">Ü4 · Entwicklung von Arbeitsstunden pro Jahr über die Zeit</h3>

### Ziel

Du erforschst in dieser Übung, wie sich die jährlichen Arbeitsstunden in verschiedenen Ländern über die Zeit verändert haben. Dabei lernst du `ggplot()`-Themes kennen und anzuwenden, um das visuelle Erscheinungsbild von Plots zu steuern. Außerdem lernst du `gghighlight()` kennen, was dir hilft, bestimmte Beobachtungen (bei uns: Länder) oder Gruppen (bei uns: Regionen) hervorzuheben.


### `ggplot()`-Themes

**ggplot-Themes** steuern das visuelle Erscheinungsbild eines Plots: Hintergrundfarbe, Gitternetzlinien, Schriftgrößen und mehr. Du hängst sie wie eine weitere Ebene mit `+` an:

```r
plot + theme_bw()       # Weißer Hintergrund, schwarzer Rahmen — klassisch und klar
plot + theme_minimal()  # Weißer Hintergrund ohne Rahmen — minimalistisch
plot + theme_ipsum()    # Aus dem hrbrthemes-Paket — typografisch ansprechend
```

Gehe sicher, dass du das Paket `hrbrthemes` installiert und geladen hast (siehe [Neue Werkzeuge](#neue-werkzeuge)).

### Aspekte in Plots hervorheben: `gghighlight()`

**`gghighlight`** hebt ausgewählte Datenpunkte oder Linien hervor und graut den Rest dezent ab, ohne ihn zu entfernen. Das ist besonders nützlich, wenn ein Plot viele Linien enthält und du einzelne hervorheben möchtest:

```r
plot + gghighlight(country == "Germany")
plot + gghighlight(country %in% c("Germany", "France", "Japan"))
```

Gehe sicher, dass du das Paket `gghighlight` installiert und geladen hast (siehe [Neue Werkzeuge](#neue-werkzeuge)).

### Deine Aufgaben

**a)** Erstelle einen Linienplot der jährlichen Arbeitsstunden (`annual_working_hours`) über die Zeit für alle Länder. Färbe die Linien nach `country` ein und filtere vorher fehlende Werte auf `annual_working_hours` heraus. Benutze dafür den Basis-datensatz `owid_daten`, da wir jetzt uns nicht nur auf das Jahr 2013 beziehen wollen. Weise den Plot dem Objekt `annual_wh_base` zu.

**b)** Erweitere `annual_wh_base` um das Theme `theme_bw()`.  Dann erweitere `annual_wh_base` um das Theme `theme_ipsum()`. Entscheide dich für eines der Themes und weise füge den Code in dein Skript ein. Weise den Plot dem Objekt `annual_wh_theme` zu. Nutze in den nächsten Schritten diesen Plot. 

**c)** Was fällt dir an der Lesbarkeit des Plots auf, wenn so viele Länder gleichzeitig dargestellt werden? Füge deinem Plot folgenden Code an und schaue, was passiert: `gghighlight(country %in% c("United States", "Germany", "Spain", "France", "United Kingdom"))`

**d)** Entscheide dich für einen eigenen Satz an Ländern, die du gerne hervorheben möchtest. Wenn du nochmal die Liste der Länder oder ihre Schreibweise brauchst, schau in Übung 1d nach. Erstelle einen Plot, der diese Länder hervorhebt und weise ihn dem Objekt `annual_wh_highlight_own` zu.

**e)** Gruppiere die Daten nach Weltregion, indem du im `aes()`-Befehl `color = world_region` setzt und `geom_smooth(se = FALSE)` statt `geom_line()` verwendest. Du kannst hier nicht das vorhandene Plot-Objekt verwenden. Nutze daher den Code, mit dem du das erste Objekt generiert hast, als Ausgangspunkt, plus dein präferiertes Theme. Füge außerdem einen Titel, einen Untertitel und sinnvolle Achsenbeschriftungen hinzu. Weise den neuen Plot dem Objekt `annual_wh_grouped` zu.


<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü4 a**

- Ausgangspunkt ist `owid_daten`. Filtere mit `filter(!is.na(annual_working_hours))`. Das `aes()` braucht `x = year`, `y = annual_working_hours` und `color = country`.
- Der Plot mit `color = country` bei so vielen Ländern ist bewusst unleserlich — das ist der Ausgangspunkt, den du in den nächsten Schritten verbesserst.

**Ü4 b**

- Hänge `theme_bw()` mit `+` an das gespeicherte Objekt `annual_wh_base` an. Das gleiche kannst du mit `theme_ipsum()` machen.

**Ü4 c**

- `gghighlight()` hängst du mit `+` an ein bestehendes Plot-Objekt.
- Im Argument gibst du eine logische Bedingung an: `gghighlight(country %in% c("Germany", ...))`.

**Ü4 d**

- Die vollständige Liste der verfügbaren Länder findest du mit `owid_daten |> filter(!is.na(annual_working_hours)) |> pull(country) |> unique()` — oder schau in Ü1 d nach.

**Ü4 e**

- Verwende `geom_smooth(se = FALSE)` statt `geom_line()` — das glättet die Daten und zeigt einen Trend pro Region, ohne das Zickzack-Problem vieler Länder-Linien.
- Filtere mit `!is.na(world_region)`, damit Länder ohne Regionen-Zuordnung nicht stören.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r

# Ü4 a
annual_wh_base <- owid_daten |>
  filter(!is.na(annual_working_hours)) |>
  ggplot(aes(x = year, y = annual_working_hours, color = country)) +
  geom_line()

# Ü4 b
annual_wh_theme_bw <- annual_wh_base +
  theme_bw()

# ODER

annual_wh_theme_ipsum <- annual_wh_base +
  theme_ipsum()

# Ü4 c
annual_wh_highlight <- annual_wh_theme_ipsum +
  gghighlight(country %in% c("United States", "Germany", "Spain", "France", "United Kingdom"))

# Ü4 d
annual_wh_highlight_own <- annual_wh_theme_ipsum +
  gghighlight(country %in% c("Finland", "Sweden", "Iceland", "Estonia", "Latvia"))

# Ü4 e
annual_wh_grouped <- owid_daten |>
  filter(!is.na(annual_working_hours), !is.na(world_region)) |>
  ggplot(aes(x = year, y = annual_working_hours, color = world_region)) +
  geom_smooth(se = FALSE) +
  theme_bw() +
  labs(
    title = "Jährliche Arbeitsstunden nach Weltregion",
    subtitle = "Geglätteter Trend, 1970–heute",
    x = "Jahr",
    y = "Jährliche Arbeitsstunden",
    color = "Weltregion"
  )

```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue5">Ü5 · Zusammenhang von Zeitnutzung und BIP</h3>

### Ziel

Wenden wohlhabendere Länder mehr oder weniger Zeit für bestimmte Aktivitäten auf? Eine Grafik mit `facet_wrap()` erlaubt es, diesen Zusammenhang für alle Zeitnutzungs-Kategorien gleichzeitig darzustellen.

### Deine Aufgaben

**a)** Erstelle ein Streudiagramm, das pro `time_use`-Kategorie den Zusammenhang zwischen `gdp` und `minuten` zeigt. Nutze `geom_point()` und füge mit `geom_smooth(method = "lm", se = FALSE)` eine lineare Trendlinie hinzu. Verwende `facet_wrap(~kategorie, scales = "free")`, damit jede Kategorie ein eigenes Panel mit eigener Skala bekommt. Weise den Plot dem Objekt `time_use_lm_base` zu.

**b)** Füge dem Plot einen Titel, einen Untertitel und sinnvolle Achsenbeschriftungen, sowie ein Theme deiner Wahl hinzu. Weise den Plot dem Objekt `time_use_lm_annotated` zu.

**c)** Interpretiere die Plots in ein paar Sätzen.

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü5 a**

- Ausgangspunkt ist `time_use_daten_long` — der lange Datensatz aus Ü2, der auch `gdp` enthält.
- `facet_wrap(~kategorie, scales = "free")` erstellt ein eigenes Panel pro Kategorie. `scales = "free"` ist wichtig, weil die Zeitspannen der Kategorien sehr unterschiedlich sind.
- `geom_smooth(method = "lm", se = FALSE)` fügt eine lineare Trendlinie hinzu, ohne das Konfidenzband anzuzeigen.

**Ü5 b**

- Du musst die Pipeline aus a) nicht wiederholen — hänge `labs()` und ein Theme mit `+` an das gespeicherte Objekt `time_use_lm_base` an.
- `labs()` setzt Titel, Untertitel und Achsenbeschriftungen. Denk daran: x = BIP, y = Minuten, und der Titel sollte den Plot allgemein beschreiben (Zeitnutzung und wirtschaftliche Entwicklung).
- Ein Theme wie `theme_bw()` oder `theme_minimal()` hängst du ebenfalls mit `+` an. Probiere aus, welches dir besser gefällt.

**Ü5 c**

- Gehe Panel für Panel durch: Steigt die Trendlinie, fällt sie, oder liegt sie fast flach? Das sagt dir die Richtung des Zusammenhangs pro Kategorie.
- Fasse ähnliche Muster zusammen — z. B. Kategorien, bei denen mehr BIP mit mehr Zeit einhergeht, und Kategorien, bei denen es umgekehrt ist.
- Formuliere in ganzen Sätzen und beziehe dich auf konkrete Kategorien aus dem Plot, nicht nur auf „positive" oder „negative Korrelation".

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r

# Ü5 a
time_use_lm_base <- time_use_daten_long |>
  ggplot(aes(x = gdp, y = minuten)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~kategorie, scales = "free") 
  
# Ü5 b
time_use_lm_annotated <- time_use_lm_base +
  theme_bw() +
  labs(
    title = "Zeitnutzung und wirtschaftliche Entwicklung",
    subtitle = "Zusammenhang zwischen BIP und Zeitnutzung nach Aktivität, 2013",
    x = "BIP pro Kopf (USD)",
    y = "Minuten pro Tag"
  )

# Ü5 c
# Mit steigendem BIP/Kopf steigt im Durchschnitt der Zeitaufwand für `education`, `events`, `other`, `shopping`, `sports` und `volunteering`.
# Mit steigendem BIP/Kopf sinkt im Durchschnitt der Zeitaufwand für `housework`, `paid_work`, und `sleep`.
# BIP/Kopf hängt nur sehr schwach oder gar nicht zusammen mit Zeitaufwand in `care`, `eating_drinking`, `friends`, `personal_care` und `tv_radio`.
# Insgesamt betrachtet scheinen Menschen in Ländern mit höherem BIP mehr Zeit für Freizeitaktivitäten zur Verfügung zu haben.

```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>


---

<h3 id="ue6">Ü6 · Code formatieren</h3>

### Ziel

Gut geschriebener Code ist leichter zu lesen, zu verstehen und zu warten. Das gilt für andere, aber vor allem für dich selbst in drei Wochen oder in drei Monaten. In dieser Übung schauen wir uns kurz die wichtigsten Prinzipien lesbaren R-Codes an und lernen das `styler`-Paket kennen, mit dessen Hilfe du deinen Code automatisch formatieren kannst.

### Grundprinzipien für lesbaren Code; `styler`

Der **Tidyverse Style Guide** ist ein verbreiteter Standard für R-Code im Umgang mit R. Die wichtigsten Regeln auf einen Blick:

- **Variablen- und Funktionsnamen**: `snake_case` (Kleinbuchstaben, Wörter mit `_` getrennt), z. B. `time_use_daten`, nicht `TimeUseDaten` oder `time.use.daten`
- **Leerzeichen**: Ein Leerzeichen vor und nach Operatoren wie `<-`, `=`, `+`, `|>`. Kein Leerzeichen vor Klammern.
- **Zeilenlänge**: Nicht mehr als etwa 80 Zeichen pro Zeile. 
- **Pipelines**: Jeder Schritt in eine neue Zeile.
- **Kommentare**: Nur kommentieren, was nicht ohnehin aus dem Code ersichtlich ist. Ein guter Kommentar erklärt das *Warum*, nicht das *Was*.

Das Paket `styler` formatiert deinen Code automatisch nach dem Tidyverse Style Guide:

```r
styler::style_file(here("scripts", "session_08_analysis.r"))
```

Alternativ kannst du in RStudio über **Addins → Style active file** das aktive Skript formatieren.

Gehe sicher, dass du das Paket `styler` installiert und geladen hast (siehe [Neue Werkzeuge](#neue-werkzeuge)).

### Deine Aufgaben

**a)**  Formatiere `session_08_analysis.r` per `style_file()`. Führe diesen Befehl nur in der Konsole aus, schreibe ihn *nicht* in eines der Skripte. Schau dir an, was `styler` verändert hat. Formatiere dann auch `session_08_data_wrangling.R`.

**b)** Schreibe sinnvollen Kommentar für die Aufgabe Ü1 (im Skript `session_08_data_wrangling.R`).

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü6 a**

- `style_file()` braucht den **Pfad zur Datei**. Mit `here("scripts", "session_08_analysis.r")` findest du sie relativ zum Projektordner. Gehe nach dem gleichen Schema vor, um das Skript `session_08_data_wrangling.R` zu formattieren.
- Der Befehl gehört **nur in die Konsole**, nicht ins Skript. Nach dem Ausführen speichert RStudio die Datei oft automatisch 
- Typische Anpassungen durch `styler`: Leerzeichen um `<-` und `|>`, Pipelines mit einem Schritt pro Zeile, einheitliche Einrückung. Kommentare und Variablennamen lässt `styler` in der Regel unverändert.
- Alternative in RStudio: **Addins → Style active file** — dafür muss `session_08_analysis.r` gerade geöffnet und aktiv sein.

**Ü6 b**

- Gute Kommentare erklären das *Warum*, nicht das *Was*. Ein Kommentar wie `# Filtere fehlende Werte heraus` ist überflüssig — der Code sagt das selbst. Besser: `# 2013 ist das einzige Jahr mit vollständigen Zeitnutzungsdaten`.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r

# Ü6 a — nur in der Konsole ausführen, nicht ins Skript schreiben

styler::style_file(here("scripts", "session_08_analysis.r"))
styler::style_file(here("scripts", "session_08_data_wrangling.r"))

# Ü6 b — Beispielkommentare für Ü1 in session_08_data_wrangling.r

# Ü1 — Zeitnutzungsdaten aufbereiten
# Die OWID-Zeitnutzungsvariablen liegen nur für 2013 vor; danach fehlende
# Weltregionen korrigieren, damit spätere Analysen nach Region funktionieren.

# Ü1 a — Jahr mit den meisten Datenpunkten ermitteln
owid_daten |>
  group_by(year) |>
  summarize(non_na = sum(!is.na(time_use_paid_work))) |>
  arrange(desc(non_na))

# Ü1 b — Arbeitsdatensatz: nur 2013, ohne fehlende time_use-Werte
time_use_daten <- owid_daten |>
  filter(year == 2013) |>
  filter(!is.na(time_use_education)) |>
  select(country, world_region, gdp, starts_with("time_use"))

# Ü1 e — USA, Korea und UK haben keinen world_region-Wert in den Rohdaten. Die entsprechenden Werte werden zugewiesen.
time_use_daten_corrected <- time_use_daten |>
  mutate(world_region = if_else(country == "USA", "North America", world_region),
         world_region = if_else(country == "Korea", "Asia", world_region),
         world_region = if_else(country == "UK", "Europe", world_region))

```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue7">Ü7 · Markdown Bericht</h3>

### Ziel

Füge deine Ergebnisse (Plots und Interpretationen) in einen RMarkdown-Bericht ein. Der Bericht lädt die aufbereiteten Daten per `source()`, zeigt deine finalen Plots und enthält deine schriftlichen Interpretationen als Fließtext.

### Deine Aufgaben

**a)** Ergänze im **Setup-Chunk** von `session_08_report.Rmd` den `source()`-Aufruf für `session_08_data_wrangling.r`, damit alle aufbereiteten Objekte im Bericht verfügbar sind. Füge außerdem `library()`-Befehle für alle benötigten Pakete hinzu.

**b)** Übertrage deine finalen Plots aus den Skripten in Code-Chunks. Schreibe deine Interpretationen als Fließtext zwischen die Chunks. Strukturiere den Bericht mit Markdown-Überschriften (`##`). Die Plots und Interpretationen, die du übertragen solltest:

| Übung | Plot-Objekt |
|-------|-------------|
| Ü2 | `time_use_density_plots` |
| Ü3 | `time_use_heatmap_angled` |
| Ü4 | `annual_wh_highlight_own`, `annual_wh_grouped` |
| Ü5 | `time_use_lm_annotated` |

| Übung | Aufgabe | Leitfragen |
|-------|---------|------------|
| Ü2 | c | Für welche Aktivitäten wird am meisten/am wenigsten Zeit aufgewandt? Welche Arten von Verteilungen sehen wir? |
| Ü3 | d | Was zeigt die Heatmap? Welche Muster und Ausreißer fallen auf? |
| Ü5 | c | Wie hängen BIP und Zeitnutzung pro Kategorie zusammen? Steigen oder sinken die Trendlinien? |

**c)** Knitte den Bericht zu HTML.

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü7 a**

- Der `source()`-Aufruf gehört in den Setup-Chunk (der erste Chunk im Rmd, meist mit `include=FALSE`). Der Pfad lautet `here("scripts", "session_08_data_wrangling.r")`.
- `library(here)` muss im Setup-Chunk **vor** dem `source()`-Aufruf stehen.

**Ü7 b**

- Kopiere den Code in das Markdown-Dokument, der die finalen Plots erzeugt, aber ohne die Zuweisung zu einem Objekt.
- Deine Interpretationen aus den R-Kommentaren kannst du als normalen Markdown-Text zwischen die Chunks einfügen.

**Ü7 c**

- Klicke auf den **Knit**-Button in RStudio. Wenn das Knitten fehlschlägt, lies die Fehlermeldung von unten nach oben: Häufige Ursachen sind fehlende Pakete oder Objekte, die im Setup-Chunk nicht geladen wurden.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r

# Ü7 a — Sourcen im Setup-Chunk (nicht als R-Code, sondern im .Rmd)
# ```{r setup, include=FALSE}
# knitr::opts_chunk$set(message = FALSE, warning = FALSE)
# library(tidyverse)
# library(here)
# library(hrbrthemes)
# library(gghighlight)
# source(here("scripts", "session_08_data_wrangling.r"))
# ```

```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h2 id="bonus-aufgaben">Bonus-Aufgaben</h2>

Diese Aufgaben sind freiwillig und bewusst **weniger angeleitet**. Sie geben dir Raum, eigenen Fragen nachzugehen — genau wie in echter Forschung. Es gibt nicht *die eine* richtige Lösung.

---

<h3 id="b-ue1">B-Ü1 · Work-Play-Verhältnis</h3>

**Analytisches Ziel:** Welche Länder verbringen verhältnismäßig viel Zeit mit Arbeit (bezahlte Arbeit, Bildung, Care, Hausarbeit) im Vergleich zu Freizeit (alles andere)?

**a)** Berechne pro Land ein Work-Play-Verhältnis: Summiere alle "Arbeit"-Kategorien (`time_use_paid_work`, `time_use_education`, `time_use_care`, `time_use_housework`) und dividiere durch die Summe aller "Freizeit"-Kategorien. Nutze `rowwise()` für die zeilenweise Berechnung.

**b)** Erstelle ein Balkendiagramm, das die Länder nach dem Verhältnis sortiert (`fct_reorder()`).

**c)** Erstelle ein Streudiagramm des Work-Play-Verhältnisses gegen das BIP. Gibt es einen Zusammenhang?

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# Ausgangspunkt:
time_use_daten_work_play <- time_use_daten |>
  rowwise() |>
  mutate(
    time_use_work = sum(time_use_paid_work, time_use_education, time_use_care, time_use_housework),
    time_use_play = sum(time_use_shopping, time_use_volunteering, time_use_eating_drinking,
                        time_use_personal_care, time_use_sports, time_use_events,
                        time_use_friends, time_use_tv_radio, na.rm = TRUE),
    time_use_work_play_ratio = time_use_work / time_use_play
  )

time_use_daten_work_play |>
  ggplot(aes(x = fct_reorder(country, time_use_work_play_ratio), y = time_use_work_play_ratio)) +
  geom_col() +
  coord_flip() +
  theme_bw()

time_use_daten_work_play |>
  ggplot(aes(x = gdp, y = time_use_work_play_ratio)) +
  geom_point() +
  geom_smooth(method = "lm") +
  theme_bw()

```

</details>

<br>

---

<h3 id="b-ue2">B-Ü2 · Deutschlandprofil</h3>

**Analytisches Ziel:** Wie sieht das Zeitnutzungsprofil Deutschlands im internationalen Vergleich aus?

Erstelle ein Profil von Deutschland hinsichtlich der Zeitnutzung. Wo liegt Deutschland im Vergleich zu anderen Ländern? Bei welchen Aktivitäten ist Deutschland auffällig? 

---

<h2 id="abgabe">Abgabe</h2>

Wenn du fertig bist:

1. Speichere die Skripte `scripts/session_08_data_wrangling.R` und `scripts/session_08_analysis.R` sowie `session_08_report.Rmd`.

2. Zippe die Dateien als einen Ordner.

3. Reiche auf Learnweb als zip-Datei ein.

> **Falls etwas nicht klappt:** Lies zuerst die Fehlermeldung, frage deine Buddy-Partner:in oder schau in den [häufigen Fehlern](../../resources/other/common_errors.md) nach.

---

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>
