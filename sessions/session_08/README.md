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

<h2 id="einleitung">Einleitung: XXX</h2>

---

<h2 id="endprodukt">Dein Endprodukt</h2>

---

<h2 id="neue-werkzeuge">Neue Werkzeuge dieser Session</h2>

---

<h2 id="wo-du-arbeitest">Wo du arbeitest</h2>

Führe zuerst den **SETUP-Abschnitt** aus — er lädt die nötigen Pakete und den OWID-Datensatz.

In dieser Session vertiefen wir die Trennung von Datenaufbereitungs- und Analyse-Skripten, sowie die Nutzung von RMarkdown als Format für die Erstellung von Berichten. Das heißt, du wirst...

Alle Code-Aufgaben bearbeitest du in den folgenden Skripten: `session_08_data_wrangling.r`, `session_08_analysis.r` (beide im `scripts`-Ordner) und `session_08_report.Rmd` im `session_08`-Ordner.\

---

<h2 id="aufgaben">Übungen</h2>

---

<h3 id="ue1">Ü1 · Datenaufbereitung</h3>

### Ziel

Bevor du Zeitnutzungsdaten analysieren kannst, musst du herausfinden, welches Jahr am besten geeignet ist, und einen sauberen Arbeitsdatensatz erstellen.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **Ü1** in `scripts/session_08_data_wrangling.r`.

**a)** Finde heraus, in welchem Jahr die meisten Länder Daten zur Variablen `time_use_paid_work` haben. Zähle dazu pro Jahr, wie viele Zeilen auf dieser Variable **keinen** fehlenden Wert haben, und sortiere das Ergebnis absteigend.

**b)** Erstelle einen Datensatz `time_use_daten`, der:
- nur das Jahr mit den meisten Datenpunkten enthält
- Zeilen mit fehlenden Werten auf `time_use_education` ausschließt. (Da alle `time_use`-Variablen aus der selben Datenquelle kommen, deckt dieser Befehl dann alle relevanten Variablen ab.)
- nur die Variablen `country`, `world_region`, `gdp` und alle `time_use_*`-Variablen enthält

**c)** Prüfe den neuen Datensatz kurz: Wie viele Länder bleiben übrig? Welche Weltregionen sind vertreten?

**d)** Schaue dir an, welche Länder vertreten sind. Nutze dazu `pull()`.

**e)** Zähle pro Weltregion, wie viele Länder in `time_use_daten` vorhanden sind. Könnte hier ein Problem liegen für spätere Analysen?

**f)** Es gibt ein paar fehlende Werte auf der Variable `world_region`. Schau nach, um welche Länder es sich handelt, und weise den Ländern die korrekten Werte auf `world_region` zu. Nutze für diese Korrektur für jedes Land eine Kombination aus `mutate()` und `if_else()`. Weise das Ergebnis dem neuen Objekt `time_use_daten_corrected` zu.

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

- `nrow()` zählt die Zeilen, `unique(time_use_daten$world_region)` zeigt die vorhandenen Regionen.

**Ü1 d**

- Pipe `time_use_daten` in `pull(country)` — das liefert einen einfachen Vektor aller Ländernamen, den du schnell überfliegen kannst.

**Ü1 e**

- `count(world_region)` zeigt dir, wie viele Länder pro Region vorhanden sind. Nutze den Befehl in einer Pipe. Schau, ob alle Regionen vertreten sind und ob es fehlende Werte (`NA`) auf `world_region` gibt.

**Ü1 f**

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

# 32 Länder, 4 Weltregionen: Europa, Asien, Nordamerika, Ozeanien

# Ü1 d
time_use_daten |>
  pull(country)

# Ü1 e
time_use_daten |>
  count(world_region)


# Ü1 f
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


### Wörter aus Variablen entfernen mit `str_replace()`


### Deine Aufgaben

Schreibe den Code zum Datenaufbereitungsschritt in **b)** in den Abschnitt **Ü2** in `scripts/session_08_data_wrangling.r`, und die Analyseschritte in **a)**, **b)** und **c)** in `scripts/session_08_analysis.r`. 

**a)** Schaue dir Zusammenfassungen aller `time_use`-Variablen an. In welchen drei Bereichen wird fällt am meisten Zeit an?


**b)** Wir wollen im nächsten Schritt unaufwändig viele Plots für die verschiedenen `time_use`-Variablen erstellen. Dafür müssen wir den Datensatz umformen. Nutze `pivot_longer` auf alle `time_use`-Variablen. Gebe der Variablen-Spalte den Namen `kategorie` und der Werte-Spalte den Namen `minuten`. Dann 
 `time_use_daten_long`. Denke daran, als Ausgangspunkt `time_use_daten_corrected` zu nutzen. 

**c)** Erstelle einen Dichte-Plot für jede `time_use`-Variable mit nur einer Pipeline. Nutze dazu `facet_wrap` und füge das Argument `scales = "free"` hinzu, damit die Plots leichter zu interpretieren sind. Füge dem Plot außerdem einen Titel, einen Untertitel und sinnvolle Achsenbeschriftungen hinzu. Schreibe ein paar Sätze Interpretation:
- Für welche Aktivitäten wird am meisten/am wenigsten Zeit aufgewändet?
- Welche verschiedenen Arten von Verteilungen sehen wir?
(Beachte, dass die Achsen nicht die gleichen Skalierungen aufweisen!)

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü2 a**

- Nutze `select(starts_with("time_use")) |> summary()`. Die Mittelwerte zeigen dir schnell, wo die meiste Zeit anfällt.

**Ü2 b**

- Das `cols`-Argument von `pivot_longer()` akzeptiert Selektions-Helfer wie `starts_with("time_use")`.
- Vergiss nicht, anschließend mit `mutate(kategorie = str_replace(kategorie, "time_use_", ""))` den Präfix aus den Kategorienamen zu entfernen.
- Denke daran, als Ausgangspunkt `time_use_daten_corrected` (nicht `time_use_daten`) zu nutzen.

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
time_use_daten_long |>
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
# Einige Verteilung sind annähernd normal, andere sind leicht links- bzw. rechtsschief. Manche zeigen ein paar Ausreißerfälle, wie z.B. Personal care und Events.

```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue3">Ü3 · Breite Vergleiche anstellen mit Heatmaps</h3>

### Ziel

Du erstellst eine Heatmap, die die Zeitnutzung aller Länder auf einen Blick vergleichbar macht — eine Kachel pro Land und Aktivitätskategorie, eingefärbt nach Minutenzahl. Dabei lernst du `geom_tile()` kennen und übst, Achsenbeschriftungen und Variablen-Reihenfolge gezielt anzupassen.

### Was ist neu? — Heatmaps mit `geom_tile()`

Eine **Heatmap** zeigt Werte als eingefärbte Kacheln in einem Raster — eine Zeile pro Einheit (z. B. Land), eine Spalte pro Kategorie (z. B. Aktivität). Je heller oder dunkler die Kachel, desto größer oder kleiner der Wert. Das erlaubt es, viele Einheiten und viele Variablen auf einmal zu vergleichen, ohne dutzende einzelne Balkendiagramme zu benötigen.

In ggplot2 erstellt man Heatmaps mit `geom_tile()`. Das Mapping braucht drei aesthetics:

```r
ggplot(aes(x = country, y = kategorie, fill = minuten)) +
  geom_tile()
```

- `x` und `y` legen fest, welche Variable auf welcher Achse steht.
- `fill` bestimmt die Farbe der einzelnen Kacheln — das ist der Wert, den du darstellen willst.

Mit `coord_flip()` tauscht du die Achsen: Die Länder landen dann auf der y-Achse, sodass ihre Namen vertikal lesbar werden.

**Wie interpretiert man eine Heatmap?**

- Ähnlich gefärbte Zeilen bedeuten: Dieses Land hat ein ähnliches Muster wie andere Länder.
- Auffällig helle oder dunkle einzelne Kacheln sind interessante Ausreißer — Länder, die bei einer bestimmten Aktivität deutlich mehr oder weniger Zeit aufwenden als der Rest.


### Deine Aufgaben


**a)** Erstelle eine Heatmap mit `geom_tile()`. Die Kategorien `sleep` und `paid_work` vereinen mit Abstand am meisten Zeitnutzung auf sich. Dadurch sind Differenzierungen beim Rest in der Grafik nicht mehr so gut zu sehen. Filtere diese beiden Kategorien aus der `kategorie`-Spalte heraus, indem einen `filter()`-Befehl am Anfang der Pipeline hinzufügst und darin `!=` benutzt.

**b)** Sortiere die `kategorie`-Variable nach den Werten in `minuten`, damit die Kategorien mit den geringsten Werten links landen und der Rest nach aufsteigenden Werten sortiert ist. Das erleichtert die Interpretation. Die kannst hierfür `fct_reorder()` auf die Spalte `kategorie` innerhalb des `aes()`-Befhels anwenden. Das sollte so aussehen: `aes(x = ..., y = fct_reorder(..., minuten))`. Weise den Plot dem Objekt `time_use_heatmap` zu.

**c)** Erweitere den Plot `time_use_heatmap` wie folgt: Die Labels der verschiedenen `time_use`-Kategorien sind kaum lesbar. Du kannst das ändern, indem du die Labels um 45 Grad drehst. Dazu fügst du dem Plot einen `theme()`-Befehl hinzu, innerhalb dessen du die X-Achse ansteuerst und dort den Winkel der Labels anpasst: `axis.text.x = element_text(angle = 45, hjust = 1)`. Füge außerdem mit `labs()` einen Titel, einen Untertitel und sinnvolle Achsenbeschriftungen hinzu. Weise den erweiterten Plot dem Objekt `time_use_heatmap_angled` zu.

**d)** Interpretiere kurz, was der Plot zeigt.

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü3 a**

- Für `geom_tile()` brauchst du drei aesthetics: `x = country`, `y = kategorie`, `fill = minuten`. Füge `coord_flip()` hinzu, damit die langen Ländernamen lesbar werden.
- Die beiden ausgeschlossenen Kategorien in `time_use_daten_long` heißen `"sleep"` und `"paid_work"` (der Präfix wurde in Ü2 b entfernt).

**Ü3 b**

- `fct_reorder(kategorie, minuten)` sortiert die Faktorebenen nach dem Mittelwert von `minuten` — also nach der durchschnittlichen Zeit pro Kategorie. Setze das direkt im `aes(y = ...)` argument ein.

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
  ggplot(aes(x = country, y = kategorie, fill = minuten)) +
  geom_tile() +
  coord_flip()

# Ü3 b
time_use_heatmap <- time_use_daten_long |>
  filter(kategorie != "sleep", kategorie != "paid_work") |>
  ggplot(aes(x = country, y = fct_reorder(kategorie, minuten), fill = minuten)) +
  geom_tile() +
  coord_flip()

# Ü3 c
time_use_heatmap_angled <- time_use_heatmap +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(
    title = "Zeitnutzung im Ländervergleich",
    subtitle = "Minuten pro Tag, 2013 (ohne Schlaf und bezahlte Arbeit)",
    x = "Land",
    y = "Aktivität",
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

Du erforschst, wie sich die jährlichen Arbeitsstunden in verschiedenen Ländern über die Zeit verändert haben. Dabei lernst du, ggplot-Themes anzuwenden um das visuelle Erscheinungsbild von Plots zu steuern, und `gghighlight` zu nutzen, um bestimmte Länder oder Regionen hervorzuheben.


### Was ist neu? — ggplot-Themes und `gghighlight`

**ggplot-Themes** steuern das visuelle Erscheinungsbild eines Plots: Hintergrundfarbe, Gitternetzlinien, Schriftgrößen und mehr. Du hängst sie wie eine weitere Ebene mit `+` an:

```r
plot + theme_bw()       # Weißer Hintergrund, schwarzer Rahmen — klassisch und klar
plot + theme_minimal()  # Weißer Hintergrund ohne Rahmen — minimalistisch
plot + theme_ipsum()    # Aus dem hrbrthemes-Paket — typografisch ansprechend
```

Das Paket `hrbrthemes` muss einmalig installiert werden: `install.packages("hrbrthemes")`.

**`gghighlight`** hebt ausgewählte Datenpunkte oder Linien hervor und graut den Rest dezent ab — ohne ihn zu entfernen. Das ist besonders nützlich, wenn ein Plot viele Linien enthält und du einzelne hervorheben möchtest:

```r
plot + gghighlight(country == "Germany")
plot + gghighlight(country %in% c("Germany", "France", "Japan"))
```

Das Paket muss einmalig installiert werden: `install.packages("gghighlight")`.

### Aspekte in Plots hervorheben: `gghighlight()`


### Deine Aufgaben


**a)** Erstelle einen Linienplot (`geom_line()`) der jährlichen Arbeitsstunden (`annual_working_hours`) über die Zeit (`year`) für alle Länder. Fäbe die Linien nach `country` ein und filtere vorher fehlende Werte auf `annual_working_hours` heraus. Weise den Plot dem Objekt `annual_wh_base` zu.

**b)** Erweitere `annual_wh_base` um das Theme `theme_bw()`. Weise das Ergebnis dem Objekt `annual_wh_theme_bw` zu. Was fällt dir an der Lesbarkeit des Plots auf, wenn so viele Länder gleichzeitig dargestellt werden?

**c)** Entscheide dich für das Theme `bw` oder `ipsum` und nutze in der Folge den entsprechenden Plot. Installiere das `hrbrthemes`-Paket mit `install.packages("hrbrthemes")`. Tippe den Befehl nur einmal in der Konsole ein und drücke ENTER; der Befehl solle in keinem der Skripts landen. Nachdem das Paket installiert ist, musst du es noch mit `library()` aktivieren. Schreibe den Befehl in das `session_08_analysis.R`-Skript, damit er jedes Mal am Anfang ausgeführt wird. Füre ihn dann einmal aus, damit das Paket direkt geladen ist.

**d)** Installiere und lade das `gghighlight`-Paket. Gehe so vor wie eben: Erst per Konsole installieren, dann Lade-Befehl ins Skript einfügen und einmal ausführen.

**e)** Entscheide dich für einen eigenen Satz an Ländern, die du gerne hervorheben möchtest. Wenn du nochmal die Liste der Länder oder ihre Schreibweise brauchst, schau in Übung 1d nach. Erstelle einen Plot, der diese Länder hervorhebt und weise ihn dem Objekt `annual_wh_highlight_own` zu.

**f)** Gruppiere die Daten nach Weltregion, indem du im `aes()`-Befehl `color = world_region` setzt und `geom_smooth(se = FALSE)` statt `geom_line()` verwendest. Du kannst hier nicht das vorhandene Plot-Objekt verwenden. Nutze daher den Code, mit dem du das erste Objekt generiert hast, als Ausgangspunkt, plus dein präferiertes Theme. Füge außerdem einen Titel, einen Untertitel und sinnvolle Achsenbeschriftungen hinzu. Weise den neuen Plot dem Objekt `annual_wh_grouped` zu.


<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü4 a**

- Ausgangspunkt ist `owid_daten`. Filtere mit `filter(!is.na(annual_working_hours))`. Das `aes()` braucht `x = year`, `y = annual_working_hours` und `color = country`.
- Der Plot mit `color = country` bei so vielen Ländern ist bewusst unleserlich — das ist der Ausgangspunkt, den du in den nächsten Schritten verbesserst.

**Ü4 b**

- Hänge `theme_bw()` mit `+` an das gespeicherte Objekt `annual_wh_base` an.

**Ü4 c**

- Installiere `hrbrthemes` einmalig in der Konsole mit `install.packages("hrbrthemes")`, dann lade es mit `library(hrbrthemes)` im Skript.
- `theme_ipsum()` funktioniert wie jedes andere Theme: einfach mit `+` anhängen.

**Ü4 d**

- Installiere `gghighlight` einmalig in der Konsole, dann lade es im Skript. `gghighlight()` hängst du mit `+` an ein bestehendes Plot-Objekt.
- Im Argument gibst du eine logische Bedingung an: `gghighlight(country %in% c("Germany", ...))`.

**Ü4 e**

- Die vollständige Liste der verfügbaren Länder findest du mit `owid_daten |> filter(!is.na(annual_working_hours)) |> pull(country) |> unique()` — oder schau in Ü1 d nach.

**Ü4 f**

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

# Ü4 c
annual_wh_theme_ipsum <- annual_wh_base +
  theme_ipsum()

# Ü4 d
annual_wh_highlight <- annual_wh_theme_ipsum +
  gghighlight(country %in% c("United States", "Germany", "Spain", "France", "United Kingdom"))

# Ü4 e
annual_wh_highlight_own <- annual_wh_theme_ipsum +
  gghighlight(country %in% c("Finland", "Sweden", "Iceland", "Estonia", "Latvia"))

# Ü4 f
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

Du untersuchst, ob wohlhabendere Länder mehr oder weniger Zeit für bestimmte Aktivitäten aufwenden. Eine Grafik mit `facet_wrap()` erlaubt es, diesen Zusammenhang für alle Zeitnutzungs-Kategorien gleichzeitig darzustellen.

### Deine Aufgaben

**a)** Erstelle ein Streudiagramm, das pro `time_use`-Kategorie den Zusammenhang zwischen `gdp` und `minuten` zeigt. Nutze `geom_point()` und füge mit `geom_smooth(method = "lm", se = FALSE)` eine lineare Trendlinie hinzu. Verwende `facet_wrap(~kategorie, scales = "free")`, damit jede Kategorie ein eigenes Panel mit eigener Skala bekommt. Füge dem Plot außerdem einen Titel, einen Untertitel und sinnvolle Achsenbeschriftungen hinzu.

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü5 a**

- Ausgangspunkt ist `time_use_daten_long` — der lange Datensatz aus Ü2, der auch `gdp` enthält.
- `facet_wrap(~kategorie, scales = "free")` erstellt ein eigenes Panel pro Kategorie. `scales = "free"` ist wichtig, weil die Zeitspannen der Kategorien sehr unterschiedlich sind.
- `geom_smooth(method = "lm", se = FALSE)` fügt eine lineare Trendlinie hinzu, ohne das Konfidenzband anzuzeigen.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r

# Ü5 a

time_use_daten_long |>
  ggplot(aes(x = gdp, y = minuten)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~kategorie, scales = "free") +
  theme_bw() +
  labs(
    title = "Zeitnutzung und wirtschaftliche Entwicklung",
    subtitle = "Zusammenhang zwischen BIP und Zeitnutzung nach Aktivität, 2013",
    x = "BIP pro Kopf (USD)",
    y = "Minuten pro Tag"
  )

```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>


---

<h3 id="ue6">Ü6 · Code formatieren</h3>

### Ziel

Gut geschriebener Code ist leichter zu lesen, zu verstehen und zu warten — für andere, aber vor allem für dich selbst in drei Monaten. Du lernst die wichtigsten Prinzipien lesbaren R-Codes und wendest das Paket `styler` an, um deinen Code automatisch zu formatieren.

### Grundprinzipien für lesbaren Code; `styler`

Der **Tidyverse Style Guide** ist der verbreitete Standard für R-Code in der Datenwissenschaft. Die wichtigsten Regeln auf einen Blick:

- **Variablen- und Funktionsnamen**: `snake_case` (Kleinbuchstaben, Wörter mit `_` getrennt), z. B. `time_use_daten`, nicht `TimeUseDaten` oder `time.use.daten`
- **Leerzeichen**: Ein Leerzeichen vor und nach Operatoren wie `<-`, `=`, `+`, `|>`. Kein Leerzeichen vor Klammern.
- **Zeilenlänge**: Nicht mehr als etwa 80 Zeichen pro Zeile. Lange Pipelines und Funktionsaufrufe über mehrere Zeilen aufteilen.
- **Kommentare**: Nur kommentieren, was nicht ohnehin aus dem Code ersichtlich ist. Ein guter Kommentar erklärt das *Warum*, nicht das *Was*.

Das Paket `styler` formatiert deinen Code automatisch nach dem Tidyverse Style Guide:

```r
install.packages("styler")  # einmalig in der Konsole
styler::style_file(here("scripts", "session_08_analysis.r"))
```

Alternativ kannst du in RStudio über **Addins → Style active file** das aktive Skript formatieren.

### Deine Aufgaben

**a)** Installiere `styler` (einmalig in der Konsole). Öffne dann `session_08_analysis.r` und formatiere es per Addin oder per `styler::style_file()`. Schau dir an, was `styler` verändert hat.

**b)** Gehe das Skript durch und prüfe alle Kommentare: Beschreiben sie nur, was der Code ohnehin tut, oder erklären sie das Warum? Entferne oder verbessere Kommentare, die keinen echten Mehrwert bieten.

**c)** Prüfe alle Variablen- und Objektnamen: Sind sie nach `snake_case` benannt? Sind sie kurz, aber aussagekräftig?

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü6 a**

- Installiere `styler` einmalig mit `install.packages("styler")` in der Konsole. In RStudio findest du das Addin dann unter **Addins → Style active file** (oben in der Toolbar).
- Speichere das Skript vor und nach dem Formatieren und vergleiche die Unterschiede.

**Ü6 b**

- Gute Kommentare erklären das *Warum*, nicht das *Was*. Ein Kommentar wie `# Filtere fehlende Werte heraus` ist überflüssig — der Code sagt das selbst. Besser: `# 2013 ist das einzige Jahr mit vollständigen Zeitnutzungsdaten`.

**Ü6 c**

- Suche nach Variablennamen mit Punkten (`.`) oder Großbuchstaben und ersetze sie durch `snake_case`.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r

# Ü6 a



```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue7">Ü7 · Markdown Bericht</h3>

### Ziel

Du fasst deine Ergebnisse in einem reproduzierbaren RMarkdown-Bericht zusammen. Der Bericht lädt die aufbereiteten Daten per `source()`, zeigt deine finalen Plots mit `echo = FALSE` und enthält deine schriftlichen Interpretationen als Fließtext.

### Deine Aufgaben

**a)** Ergänze im **Setup-Chunk** von `session_08_report.Rmd` den `source()`-Aufruf für `session_08_data_wrangling.r`, damit alle aufbereiteten Objekte im Bericht verfügbar sind. Füge außerdem `library()`-Befehle für alle benötigten Pakete hinzu.

**b)** Übertrage deine finalen Plots aus den Skripten in Code-Chunks mit `echo = FALSE`. Schreibe deine Interpretationen als Fließtext zwischen die Chunks. Strukturiere den Bericht mit Markdown-Überschriften (`##`).

**c)** Knitte den Bericht zu HTML.

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü7 a**

- Der `source()`-Aufruf gehört in den Setup-Chunk (der erste Chunk im Rmd, meist mit `include=FALSE`). Der Pfad lautet `source(here("scripts", "session_08_data_wrangling.r"))`.
- `library(here)` muss **vor** dem `source()`-Aufruf stehen.

**Ü7 b**

- Verwende für jeden Plot einen eigenen Chunk mit `echo = FALSE`, damit im Bericht nur der Plot erscheint, nicht der Code.
- Du kannst die Plot-Objekte (z. B. `time_use_heatmap_angled`, `annual_wh_grouped`) direkt im Chunk aufrufen — sie wurden beim Sourcen erzeugt.
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
# knitr::opts_chunk$set(echo = FALSE, message = FALSE, warning = FALSE)
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

---

<h3 id="b-ue2">B-Ü2 · Deutschlandprofil</h3>

**Analytisches Ziel:** Wie sieht das Zeitnutzungsprofil Deutschlands im internationalen Vergleich aus?

Erstelle ein Profil von Deutschland hinsichtlich der Zeitnutzung. Wo liegt Deutschland im Vergleich zu anderen Ländern? Bei welchen Aktivitäten ist Deutschland auffällig? Nutze `gghighlight(country == "Germany")` oder filtere den Datensatz, um Deutschland hervorzuheben. 

---

<h2 id="abgabe">Abgabe</h2>

Wenn du fertig bist:

1. Speichere die Skripte `scripts/session_08_data_wrangling.R` und `scripts/session_08_analysis.R` sowie `session_08_report.Rmd`.

2. Zippe die Dateien als einen Ordner.

3. Reiche auf Learnweb als zip-Datei ein.

> **Falls etwas nicht klappt:** Lies zuerst die Fehlermeldung, frage deine Buddy-Partner:in oder schau in den [häufigen Fehlern](../../resources/other/common_errors.md) nach.

---

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>
