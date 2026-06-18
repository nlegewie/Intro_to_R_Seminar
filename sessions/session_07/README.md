# Session 7 — Geschlechterungleichheiten

**Seminar:** Globale Ungleichheit · Wintersemester 2025/26

---

## Inhaltsverzeichnis

- [Dein Endprodukt](#endprodukt)
- [Wo du arbeitest](#wo-du-arbeitest)
- [Einleitung](#einleitung)
- [Neue Werkzeuge dieser Session](#neue-werkzeuge)
- [Übungen](#aufgaben)
  - [Ü1 · Datenaufbereitung auslagern (`source()`)](#ue1)
  - [Ü2 · Das Muster beschreiben: `count()`, Anteile, `tabyl()`](#ue2)
  - [Ü3 · Von der Tabelle zur Abbildung: Themes & patchwork](#ue3)
  - [Ü4 · Wie groß ist der Unterschied? Cohen's d](#ue4)
  - [Ü5 · Ergebnisse berichten: RMarkdown](#ue5)
- [Bonus-Aufgaben](#bonus-aufgaben)
  - [B-Ü1 · Müttersterblichkeit, bedingt auf Entwicklung](#b-ue1)
  - [B-Ü2 · Die männliche Seite der Ungleichheit](#b-ue2)
  - [B-Ü3 · Freie Exploration: deine eigene Geschlechter-Frage](#b-ue3)
- [Abgabe](#abgabe)

---

<h2 id="endprodukt">Dein Endprodukt</h2>

**Frage dieser Session:** Wie ungleich ist der Zugang zu Bildung zwischen Mädchen und Jungen weltweit — und wie groß sind diese Unterschiede, eingeordnet neben anderen geschlechtsspezifischen Mustern in Erwerbsarbeit und Sterblichkeit?

Diese Session hat zwei Ziele zugleich. Inhaltlich untersuchst du **Geschlechterungleichheit als mehrdimensionales Phänomen** — sie verläuft nicht immer zuungunsten von Frauen, sondern je nach Bereich und Region in unterschiedliche Richtungen. Methodisch lernst du, **wie professionelle Datenanalyse organisiert ist**: Du trennst die Datenaufbereitung von der Analyse und greifst von einem Skript auf andere zu durch den `source()` Befehl. Außerdem schreibst du einen reproduzierbaren Bericht in **RMarkdown**.

Am Ende wirst du Folgendes erstellt und im Ordner `output/` bzw. im Projekt gespeichert haben:

| Produkt | Datei | Was es zeigt |
|---------|-------|--------------|
| **Aufbereitungsskript** | `scripts/data_wrangling.R` | Lädt Daten und baut die Analyse-Objekte — einmal, sauber, wiederverwendbar |
| **Kreuztabelle** | (im Bericht) | `tabyl()`: Bildungsparität (Grundschule) nach Weltregion |
| **Kombinierte Abbildung** | `output/plot_gender_composite.png` | patchwork-Komposition aus drei Panels: Bildung, Erwerbsarbeit, Suizid |
| **Reproduzierbarer Bericht** | `session_07_report.html` | RMarkdown-Bericht mit Tabelle, Abbildung und schriftlicher Interpretation |

> Die Bonus-Aufgaben enthalten zusätzliche explorative Analysen (Müttersterblichkeit, die männliche Seite der Ungleichheit, eine freie Frage). Sie sind freiwillig, aber gute Vorbereitung für deinen Abschlussbericht.

---

<h2 id="wo-du-arbeitest">Wo du arbeitest</h2>

**Neu in dieser Session:** Bisher hast du alles in *einem* Skript pro Session gemacht. Ab jetzt arbeitest du wie in echten Forschungsprojekten mit **mehreren Dateien**, die jeweils eine klare Aufgabe haben.

**Warum diese Trennung?** Wenn Aufbereitung und Analyse in einer Datei stehen, wird sie schnell unübersichtlich. Die Lösung: Die Aufbereitung wandert in `session_07_data_wrangling.R`. Andere Dateien laden dieses Skript mit **`source()`** — das führt das gesamte Skript aus, sodass alle dort erzeugten Objekte in deinem Environment landen. Du bereitest die Daten **einmal** auf und nutzt sie an beliebig vielen Stellen.

### Schritt-für-Schritt: Wie lege ich los?

1. Lade den Session-Ordner für Session 7 herunter und öffne das RStudio-Projekt (`.Rproj`).
2. Du arbeitest nacheinander in den oben genannten Dateien — die jeweilige Datei steht in jeder Übung dabei.
3. In `session_07_data_wrangling.R` und `session_07_analyse.R` ist jeweils ein **SETUP-Abschnitt** vorbereitet, der Pakete lädt. Führe ihn zuerst aus.

> **Neue Pakete:** Diese Session nutzt `janitor`, `patchwork` und (in den Bonus-Aufgaben) `ggrepel`, `effsize` und `gganimate`. Installiere sie einmalig mit `install.packages("paketname")`, falls noch nicht vorhanden.

---

<h2 id="einleitung">Einleitung: Geschlecht als Dimension globaler Ungleichheit</h2>

Geschlechterungleichheit ist eine der am gründlichsten untersuchten Dimensionen globaler Ungleichheit. Dabei zeigt sich: Das verbreitete Bild „Frauen sind überall benachteiligt" stimmt für viele Bereiche, aber längst nicht für alle, und das Ausmaß variiert zwischen Regionen.

In dieser Session schauen wir uns mehrere Dimensionen von Geschlechterungleichheit an.

| Variable | Was sie misst | Tendenz |
|----------|---------------|---------|
| `girls_in_primary` / `boys_in_primary` | Einschulungsanteil in der Grundschule nach Geschlecht | In ärmeren Regionen oft Mädchen benachteiligt |
| `girls_in_tertiary` / `boys_in_tertiary` | Einschreibungsanteil im Hochschulbereich | In reicheren Ländern oft **Jungen** zurück |
| `female_labor_participation` | Erwerbsbeteiligung von Frauen (%) | Stark regional, Frauen meist niedriger |
| `suicide_rate_male` / `suicide_rate_female` | Suizidrate nach Geschlecht (pro 100.000) | Männer fast überall höher |
| `maternal_deaths` | Zahl der Müttersterbefälle | Eine rein weibliche Gesundheitslast |

Unser methodischer roter Faden ist eine **echte Analyse-Pipeline**: aufbereiten → beschreiben → visualisieren → quantifizieren → berichten. Genau in dieser Reihenfolge sind die Übungen aufgebaut.

---

<h2 id="neue-werkzeuge">Neue Werkzeuge dieser Session</h2>

| Werkzeug | Wofür |
|----------|-------|
| `source()` | Ein ganzes Skript ausführen und seine Objekte laden |
| `case_when()` | Eine Variable in Kategorien einteilen (mehrere Bedingungen) |
| `count()` | Zeilen pro Gruppe zählen — equivalent zu `group_by() + summarize(n())` aber praktischer weil weniger Code. Wird sehr häufig genutzt |
| `janitor::tabyl()` | Kreuztabellen mit Häufigkeiten und Prozenten |
| Themes (`theme_minimal()`, `theme()`) | Aussehen von Plots steuern und feinjustieren |
| `patchwork` | Mehrere Plots zu einer Abbildung kombinieren |
| Cohen's d | Die *Größe* eines Unterschieds standardisiert messen |
| RMarkdown | Code, Abbildungen und Text in einem reproduzierbaren Bericht |

---

<h2 id="aufgaben">Übungen</h2>

---

<h3 id="ue1">Ü1 · Datenaufbereitung auslagern (<code>source()</code>)</h3>

### Ziel

Du baust das Aufbereitungsskript `scripts/data_wrangling.R` fertig und lädst es anschließend per `source()` in dein Analyse-Skript. Damit ist die Grundlage für alle weiteren Übungen gelegt.

### Was ist neu?

**`case_when()`** teilt eine Variable anhand mehrerer Bedingungen in Kategorien ein. Die Bedingungen werden von oben nach unten geprüft; die erste zutreffende gewinnt. `TRUE ~ ...` ist der „Rest"-Fall:

```r
mutate(kategorie = case_when(
  wert >  2 ~ "hoch",
  wert < -2 ~ "niedrig",
  TRUE      ~ "mittel"
))
```

Dieser Code schaut sich Beobachtungen auf der Variable `wert` an und gruppiert anhand dieser Werte in die neue Variable `kategorie`. Beobachtungen mit `wert > 2` landen in `kategorie == "hoch"`, Beobachtungen mit `wert < -2` landen in `kategorie == "mittel"`, alle anderen landen in `kategorie == "mittel"`. Die Tilde `~` regelt hier die Zuweisung. Meistens benutzen wir `case_when` innerhalb eines `mutate`-Befehls.


**`source()`** führt ein komplettes Skript aus. Alle Objekte, die das Skript erzeugt, stehen danach in deinem Environment zur Verfügung:

```r
source(here("scripts", "session_07_data_wrangling.R"))
```

Dieser Code geht vom aktuellen Arbeitsplatz (in unserem Fall gerade der Ordner `session_07`) aus in den `scripts`-Ordner und führt dort das Skript `session_07_data_wrangling.R`


### Deine Aufgaben

**a)** Öffne `scripts/session_07_data_wrangling.R`. Der Anfang ist vorbereitet — er lädt die Pakete, liest die Daten und baut den Querschnitt `gender_2015`:

```r
# SETUP
library(tidyverse)
library(here)

owid_daten <- read_csv(here("full_data", "owid_data.csv"))

# Querschnitt 2015: nur echte Weltregionen, relevante Variablen
gender_2015 <- owid_daten |>
  filter(year == 2015, !is.na(world_region)) |>
  select(
    country, world_region,
    girls_in_primary, boys_in_primary,
    girls_in_tertiary, boys_in_tertiary,
    female_labor_participation,
    suicide_rate_male, suicide_rate_female,
    gdp, life_expectancy_birth, population, maternal_deaths
  )
```

Ergänze in `gender_2015` per `mutate()` die Variable `primary_gap` als Differenz von `girls_in_primary` und `boys_in_primary`.

**b)** Erstelle darunter ein **zweites** Objekt `parity_2015`. Es soll nur Länder enthalten, für die `primary_gap` vorhanden ist (`!is.na()`), und eine Faktor-Variable `parity_category` haben, die mit `case_when()` aus `primary_gap` gebildet wird:

- größer als 2 Prozentpunkte → `"Mädchen vorne"`
- kleiner als −2 → `"Jungen vorne"`
- sonst → `"etwa gleich"`

Wandle `parity_category` anschließend in einen Faktor mit der Reihenfolge `"Jungen vorne"`, `"etwa gleich"`, `"Mädchen vorne"` um.

> **Warum ein Toleranzband (±2)?** `primary_gap` ist eine kontinuierliche Zahl — exakt 0 kommt fast nie vor. Mit dem Band fassen wir „praktisch gleich" sinnvoll zusammen, statt winzige Unterschiede zu überinterpretieren.

**c)** Starte deine R-Session neu (tippe dazu `.rs.restartR()` in die Konsole und drücke ENTER). Öffne dann `scripts/session_07_analyse.R`. Im SETUP stehen `library(tidyverse)`, `library(here)`, `library(janitor)` und `library(patchwork)`. Ergänze darunter den `source()`-Aufruf für `session_07_data_wrangling.R`. Führe das Skript aus und prüfe mit `glimpse()`, dass `gender_2015` und `parity_2015` existieren.

**d)** Schreibe als Kommentar 2 Sätze: Warum ist es sinnvoll, die Aufbereitung in eine eigene Datei auszulagern?

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü1 a**

- `primary_gap` ist eine neue Spalte per `mutate()` — du ziehst den Jungenanteil vom Mädchenanteil ab (Reihenfolge laut Aufgabenstellung).
- Du kannst `mutate()` direkt an die bestehende Pipe von `gender_2015` anhängen, statt das Objekt neu zu bauen.

**Ü1 b**

- Ausgangspunkt ist `gender_2015` — nicht `owid_daten`. Zuerst Zeilen ohne `primary_gap` ausschließen (`!is.na(...)`), dann kategorisieren.
- `case_when()` prüft die Bedingungen **von oben nach unten**; die erste zutreffende gewinnt. `TRUE ~ ...` fängt alle übrigen Fälle ab.
- Achte auf die Vorzeichen in der Aufgabe: „Mädchen vorne" bei **positivem** Gap, „Jungen vorne" bei **negativem** Gap unter −2.
- Die Faktor-Reihenfolge legst du mit `factor(..., levels = c(...))` fest — genau in der Reihenfolge aus der Aufgabenstellung. Sie bestimmt später die Sortierung in Tabellen und Plots.

**Ü1 c**

- `source()` braucht `library(here)` **vorher** im SETUP — sonst kennt R die Funktion `here()` nicht.
- Der Pfad ist relativ zum Projektordner: `here("scripts", "session_07_data_wrangling.R")`.
- Nach dem Ausführen prüfst du mit `glimpse(gender_2015)` und `glimpse(parity_2015)`, ob beide Objekte existieren und sinnvolle Spalten haben (z. B. `primary_gap`, `parity_category`).

**Ü1 d**

- Denk an **Trennung von Aufbereitung und Analyse**: Was passiert, wenn du später die Filterlogik änderst — und alles in einer langen Datei steht?
- Was ist der Vorteil, wenn mehrere Skripte (Analyse, RMarkdown-Bericht) **dieselbe** aufbereitete Datenbasis nutzen?

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

`scripts/data_wrangling.R`:

```r

# Querschnitt 2015
gender_2015 <- owid_daten |>
  filter(year == 2015, !is.na(world_region)) |>
  select(
    country, world_region,
    girls_in_primary, boys_in_primary,
    girls_in_tertiary, boys_in_tertiary,
    female_labor_participation,
    suicide_rate_male, suicide_rate_female,
    gdp, life_expectancy_birth, population, maternal_deaths
  ) |>
  mutate(primary_gap = girls_in_primary - boys_in_primary)

# Datensatz mit Paritäts-Kategorie (nur Länder mit Grundschul-Daten)
parity_2015 <- gender_2015 |>
  filter(!is.na(primary_gap)) |>
  mutate(
    parity_category = factor(
      case_when(
        primary_gap >  2 ~ "Mädchen vorne",
        primary_gap < -2 ~ "Jungen vorne",
        TRUE             ~ "etwa gleich"
      ),
      levels = c("Jungen vorne", "etwa gleich", "Mädchen vorne")
    )
  )
```

`scripts/session_07_analyse.R` (Anfang):

```r

source(here("scripts", "data_wrangling.R"))
# Danach existieren u.a.: owid_daten, gender_2015, parity_2015

glimpse(parity_2015)   # 106 Länder, mit parity_category

# d) Die Trennung hält die Analyse-Datei kurz und lesbar und stellt sicher,
#    dass alle Auswertungen auf exakt denselben aufbereiteten Daten beruhen.
#    Ändert sich die Aufbereitung, muss man sie nur an einer Stelle anpassen.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue2">Ü2 · Das Muster beschreiben: <code>count()</code>, Anteile, <code>tabyl()</code></h3>

### Ziel

Bevor man visualisiert, *quantifiziert* man. Du zählst aus, in wie vielen Ländern Mädchen bzw. Jungen in der Grundschule vorne liegen, und wie sich das über die Weltregionen verteilt. Dafür bildest du eine Kreuztabelle.

### Was ist neu?

**`count()`** zählt Zeilen pro Gruppe — eine Kurzform für `group_by() |> summarize(n = n())`:

```r
parity_2015 |> count(parity_category)
```

Dieser Code zählt für jede Kategorie in `parity_category`, wie viele Beobachtungen sie zeigen.

Du kannst auch nach **zwei** Variablen zählen (eine Zeile pro Kombination):

```r
parity_2015 |> count(world_region, parity_category)
```

Dieser Code zählt für jede Kombination von Kategorien in `world_region` und `parity_category`, wie viele Beobachtungen sie zeigen.

**Anteile** ergänzt du mit `mutate()`: `prop = n / sum(n)`. Was macht dieser Code? Er nimmt für jede Zeile die Anzahl der Beobachtungen und teilt sie durch die Gesamtzahl der Beobachtungen. Daraus ergibt sich der Anteil jeder Zeile an den Gesamtbeobachtungen. Wenn du statt einer Dezimalzahl eine Prozentzahl haben willst, multiplizierst du noch mit 100: `mutate()`: `prop = n / sum(n) * 100`.

**`janitor::tabyl()`** baut eine echte Kreuztabelle — eine Variable in den Zeilen, eine in den Spalten:

```r
parity_2015 |> tabyl(world_region, parity_category)
```

Mit den `adorn_*()`-Funktionen ergänzt du Summen und Prozente:

```r
parity_2015 |>
  tabyl(world_region, parity_category) |>
  adorn_totals("row") |>
  adorn_percentages("row") |>
  adorn_pct_formatting(digits = 1)
```

### Deine Aufgaben

Schreibe den Code in den Abschnitt **Ü2** in `scripts/session_07_analyse.R`.

**a)** Zähle mit `count()`, wie viele Länder in jede `parity_category` fallen. Ergänze eine Spalte `prop` mit dem Anteil an allen Ländern. Notiere als Kommentar: In welchem Anteil der Länder sind Mädchen bzw. Jungen in der Grundschule benachteiligt?

**b)** Zähle gruppiert nach `world_region` und `parity_category`. Notiere: Welche Region fällt dir auf?

**c)** Erstelle mit `tabyl(world_region, parity_category)` eine Kreuztabelle. Ergänze sie mit `adorn_totals()`, `adorn_percentages("row")` und `adorn_pct_formatting()`.

**d)** Schreibe **3–4 Sätze Interpretation**: Was sagt die Verteilung über Bildungsungleichheit auf Grundschul-Ebene? Wo konzentriert sich die Benachteiligung von Mädchen — und wie verbreitet ist sie insgesamt?

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü2 a**

- Ausgangspunkt ist `parity_2015` — das Objekt aus Ü1 mit der Spalte `parity_category`.
- `count()` liefert eine Spalte `n` (Anzahl Länder pro Kategorie). Für Anteile hängst du danach `mutate()` an: teile `n` durch die **Summe aller** `n`-Werte in der Tabelle.
- Für die Kommentarfrage: Welche Kategorien bedeuten Benachteiligung von Mädchen bzw. Jungen? Rechne den Anteil für beide Ränder — nicht nur für „etwa gleich".

**Ü2 b**

- Zwei Gruppierungsvariablen gibst du direkt in `count()` an — eine Zeile pro Kombination aus Region und Paritätskategorie.
- Sortiere die Ausgabe sinnvoll (`arrange()`), damit du Regionen mit auffälligen Mustern leichter erkennst.
- Achte besonders auf Regionen, in denen „Jungen vorne" oder „Mädchen vorne" **häufiger** vorkommt als im Gesamtbild aus a).

**Ü2 c**

- `tabyl()` braucht zwei Argumente: Zeilenvariable zuerst, Spaltenvariable danach — hier Region × Paritätskategorie.
- Die `adorn_*()`-Funktionen hängst du als Pipe-Schritte **an die tabyl-Tabelle** an, in der Reihenfolge aus der Aufgabenstellung.
- `adorn_percentages("row")` rechnet **zeilenweise** (pro Region summieren sich die Anteile auf 100 %). `"col"` wäre spaltenweise — hier brauchst du `"row"`.
- Die Spaltenreihenfolge in `tabyl()` folgt den Faktor-Stufen aus Ü1 — deshalb war die Reihenfolge dort wichtig.

**Ü2 d**

- Trenne in deiner Interpretation zwei Ebenen: Wie **verbreitet** ist Parität insgesamt (viele Länder „etwa gleich") — und **wo** konzentriert sich verbleibende Benachteiligung?
- Ein kleiner Anteil benachteiligter Länder kann trotzdem inhaltlich wichtig sein, wenn er regional gehäuft ist.
- Formuliere in ganzen Sätzen — nicht nur „Afrika hat viele Jungen vorne", sondern was das für globale Bildungsungleichheit bedeutet.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# Ü2 a
parity_2015 |>
  count(parity_category) |>
  mutate(prop = n / sum(n))
# In der großen Mehrheit der Länder ist die Grundschule "etwa gleich".
# Mädchen-benachteiligte und Jungen-benachteiligte Länder machen je nur einen
# kleineren Teil aus (jeweils rund ein Sechstel bis ein Fünftel).

# Ü2 b
parity_2015 |>
  count(world_region, parity_category)
# Die "Jungen vorne"-Fälle (Mädchen benachteiligt) häufen sich in Afrika.

# Ü2 c
parity_2015 |>
  tabyl(world_region, parity_category) |>
  adorn_totals("row") |>
  adorn_percentages("row") |>
  adorn_pct_formatting(digits = 1)

# Ü2 d
# Afrika: Jungen sind deutlich öfter vorne als Mädchen. Parität herrscht nur in knapp 1/3 der Länder.
# Asien: Parität in 60% der Länder, mehr Länder Mädchen vorne als Jungen. 
# Europa: Fasst komplette Parität
# Nordamerika: Parität in knapp 60% der Länder, mehr Länder Mädchen vorne als Jungen.
# Ozeanien: Der Anteil Länder mit Jungen vorne ist doppelt so hoch wie der mit Mädchen vorne.
# Südamerika: Fast 90% Parität, im Rest Mädchen vorne.

```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue3">Ü3 · Von der Tabelle zur Abbildung: Themes & patchwork</h3>

### Ziel

Du baust drei Plots, die Geschlechterungleichheit aus verschiedenen Blickwinkeln zeigen, passt ihr Aussehen mit Themes an und kombinierst sie mit `patchwork` zu **einer** Abbildung.


### Thema Selbstmord

Suizid ist ein ernstes Thema, und Zahlen allein erzählen nie die ganze Geschichte hinter ihnen. Wenn du selbst gerade eine schwere Zeit durchmachst oder dir Sorgen um jemanden machst, den du kennst: Du musst damit nicht allein sein. Es kann sich im Moment anders anfühlen, aber Unterstützung ist da, und Dinge können sich verändern.

| Angebot | Kontakt |
|---------|---------|
| Telefonseelsorge (kostenlos, anonym, rund um die Uhr) | 0800 111 0 111 oder 0800 111 0 222 |
| krisenchat | +49 15735998143 |
| Zentrale Studienberatung: Psychologischer Dienst | 0251 83 22 357 |
| Krisenhilfe Münster | 0251 519005 |
| Wochenende und Feiertage: LWL-Klinik Münster | 0251 91 555-0 |


### Was ist neu?

**Tabelle → Abbildung:** Eine `count()`-Tabelle beinhaltet bereits die Werte, die wir in einer Grafik ausdrücken können. Du kannst sie direkt an `ggplot()` weitergeben. Tabelle und Plot sind zwei Ansichten desselben Objekts.

**Themes** steuern das Aussehen von Plots. Eingebaute Themes wie `theme_minimal()` setzen einen kompletten Stil; mit `theme()` passt du einzelne Details an:

```r
plot +
  theme_minimal() +
  theme(legend.position = "bottom",
        axis.text.x = element_text(angle = 30, hjust = 1))
```

Dieser Code verändert das Aussehen des Plots insgesamt. `theme_minimal` benutze ich persönlich sehr oft in meinen Plots. Über den `theme()`-Befehl verschieben wir hier noch die Legende nach unter der Plot und verändern die Ausrichtung der Beschriftung der X-Achse.

**`patchwork`** kombiniert Plots mit einfachen Operatoren: `p1 | p2` nebeneinander, `p1 / p2` übereinander. `plot_annotation()` setzt einen Gesamttitel und Tags (A, B, C). Mit `&` wendest du ein Theme auf **alle** Teilplots an:

```r
(p1 / (p2 | p3)) +
  plot_annotation(title = "...", tag_levels = "A") &
  theme_minimal()
```
Dieser Code packt die Abbildung `p1` in eine Reihe, die beiden Abbildungen `p2` und `p3` in eine Reihe darunter, und fügt über `plot_annotion()` einen Titel und Tags hinzu. Außerdem wird `theme_minimal()` auf alle Plots angewandt.


### Deine Aufgaben

Schreibe den Code in den Abschnitt **Ü3** in `scripts/session_07_analyse.R`.

**a) Panel 1 — Bildungsparität.** Erzeuge mit `count(world_region, parity_category)` eine Tabelle `parity_counts` und gib sie an `ggplot()` weiter: `geom_col(position = "dodge")` mit `x = world_region`, `y = n`, `fill = parity_category`. Verwende des Theme `theme_minimal()`. Weise den Plot `p_parity` zu.

**b) Panel 2 — Erwerbsbeteiligung.** Fasse `female_labor_participation` als Median je Weltregion zusammen (`group_by()` + `summarize()`, NAs ausschließen) und stelle das Ergebnis als `geom_col()` dar. Verwende des Theme `theme_minimal()`. Weise den Plot `p_labor` zu.

**c) Panel 3 — Suizid nach Geschlecht.** Erstelle ein Streudiagramm mit `suicide_rate_female` auf der x-Achse und `suicide_rate_male` auf der y-Achse, eingefärbt nach `world_region`. Füge mit `geom_abline(slope = 1, intercept = 0, linetype = "dashed")` eine 45°-Linie hinzu: Punkte **darüber** bedeuten, dass Männer eine höhere Rate haben. Weise den Plot `p_suicide` zu.

**d) Themes.** Gib jedem Panel einen sinnvollen Titel und Achsenbeschriftungen (`labs()`). Wende auf `p_parity` zusätzlich `theme()` an, um die langen Regionsnamen lesbar zu machen (z. B. `axis.text.x` drehen oder `coord_flip()`).

**e) patchwork.** Kombiniere die drei Panels zu `composite` (z. B. `p_parity` oben, `p_labor` und `p_suicide` darunter nebeneinander), ergänze `plot_annotation()` mit Gesamttitel und `tag_levels = "A"`.

**f)** Speichere die Abbildung:

```r
ggsave(
  here("output", "plot_gender_composite.png"),
  plot   = composite,
  width  = 11,
  height = 8
)
```

**g)** Schreibe **3–4 Sätze**: Welches Panel zeigt eine Benachteiligung von Frauen, welches von Männern? Was bedeutet es, dass die Punkte im Suizid-Panel fast alle über der Linie liegen?

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü3 a**

- Erst `count(world_region, parity_category)` in ein Objekt speichern — dann kannst du dieselbe Tabelle später noch einmal nutzen.
- `ggplot()` nimmt die Zähltabelle direkt: x = Region, y = Anzahl (`n`), Füllfarbe = Paritätskategorie.
- `position = "dodge"` sorgt dafür, dass die Balken pro Kategorie **nebeneinander** stehen, nicht übereinander.
- `theme_minimal()` hängst du mit `+` an den Plot an.

**Ü3 b**

- Ausgangspunkt ist `gender_2015` — nicht `parity_2015` (hier geht es um Erwerbsbeteiligung, nicht Grundschul-Parität).
- Schließe fehlende Werte auf `female_labor_participation` aus, **bevor** du zusammenfasst.
- Pro Region brauchst du **eine Zeile** mit einem zusammengefassten Wert — also `group_by(world_region)` + `summarize(median(...))`, dann `geom_col()`.

**Ü3 c**

- Streudiagramm: x = Suizidrate Frauen, y = Suizidrate Männer, Farbe = Region.
- `geom_abline(slope = 1, intercept = 0)` zeichnet die Diagonale „gleiche Rate für beide Geschlechter". Punkte **darüber** = höhere Männerrate.
- Overplotting: `alpha` in `geom_point()` kann helfen, wenn sich Punkte überlagern.

**Ü3 d**

- `labs()` pro Panel: mindestens Titel und sinnvolle Achsenbeschriftungen — die drei Panels zeigen **verschiedene** Themen, also auch **verschiedene** Titel.
- Lange Regionsnamen auf der x-Achse: entweder `theme(axis.text.x = element_text(angle = ..., hjust = ...))` **oder** `coord_flip()` — probiere, was lesbarer ist.
- Themes hängst du mit `+` an den jeweiligen Plot-Objekten an, bevor du sie in patchwork kombinierst.

**Ü3 e**

- patchwork-Operatoren: `|` = nebeneinander, `/` = übereinander. Klammern setzen die Reihenfolge fest — z. B. ein Panel oben, zwei darunter.
- `plot_annotation()` ergänzt Gesamttitel und Panel-Tags (A, B, C).
- `& theme_minimal()` wendet ein Theme auf **alle** Teilplots an; ein einzelnes `+ theme_minimal()` am Ende gilt nur für den äußeren Layer.

**Ü3 f**

- Speichere `composite` — nicht die Einzelpanels. Weise den kombinierten Plot zuerst einem Objekt zu, dann `ggsave()`.

**Ü3 g**

- Gehe Panel für Panel durch: Welches zeigt Benachteiligung von **Frauen**, welches von **Männern**?
- Im Suizid-Panel: Was bedeutet es inhaltlich, wenn fast alle Punkte **über** der 45°-Linie liegen?
- Verbinde die drei Panels in der Interpretation: Geschlechterungleichheit ist **nicht** in alle Richtungen gleich.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# Ü3 a — Panel 1
parity_counts <- parity_2015 |>
  count(world_region, parity_category)

p_parity <- parity_counts |>
  ggplot(aes(x = world_region, y = n, fill = parity_category)) +
  geom_col(position = "dodge") +
  labs(title = "Grundschule: Wer liegt vorne?",
       x = NULL, y = "Anzahl Länder", fill = NULL) +
  theme_minimal()

# Ü3 b — Panel 2
labor_region <- gender_2015 |>
  filter(!is.na(female_labor_participation)) |>
  group_by(world_region) |>
  summarize(median_fla = median(female_labor_participation))

p_labor <- labor_region |>
  ggplot(aes(x = world_region, y = median_fla, fill = world_region)) +
  geom_col(show.legend = FALSE) +
  labs(title = "Erwerbsbeteiligung Frauen",
       x = NULL, y = "Median (%)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))

# Ü3 c — Panel 3
p_suicide <- gender_2015 |>
  filter(!is.na(suicide_rate_male), !is.na(suicide_rate_female)) |>
  ggplot(aes(x = suicide_rate_female, y = suicide_rate_male, color = world_region)) +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed") +
  geom_point(alpha = 0.7) +
  theme_minimal() +
  labs(title = "Suizidrate: Männer vs. Frauen",
       x = "Frauen (pro 100.000)", y = "Männer (pro 100.000)", color = NULL)

# Ü3 e — patchwork
composite <- (p_parity / (p_labor | p_suicide)) +
  plot_annotation(
    title    = "Geschlechterungleichheit ist mehrdimensional",
    subtitle = "Bildung, Erwerbsarbeit und Suizid, 2015",
    caption  = "Quelle: Our World in Data",
    tag_levels = "A"
  )

composite

# Ü3 f
ggsave(
  here("output", "plot_gender_composite.png"),
  plot   = composite,
  width  = 16,
  height = 12
)

# Ü3 g
# Panel A zeigt die Ergebnisse aus der Tabelle, die wir schon in Aufgabe 2 diskutiert haben.
# Panel B (Erwerbsbeteiligung) zeigt, dass in jeder
# Region die Frauen-Erwerbsquote zwischen knapp unter 50% und knapp unter 60% liegt.
# Panel C zeigt ein anderes Bild bei den Selbstmordraten: Fast alle Punkte liegen über der 45°-Linie, d.h.
# Männer haben in praktisch allen Ländern höhere Suizidraten als Frauen.
# Zusammen: Ungleichheit verläuft je nach Dimension in unterschiedliche Richtungen.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue4">Ü4 · Gruppenunterschiede einordnen mit Cohen's d</h3>

### Ziel

Ein Unterschied kann *statistisch* vorhanden, aber inhaltlich winzig sein, oder umgekehrt. **Cohen's d** misst die Größe eines Unterschieds in Standardabweichungen und macht ihn dadurch vergleichbar.

### Was ist neu? — Effektstärke als Konzept

Cohen's d kennt ihr bereits aus dem letzten Semester, aus Statistik 1. Zur Erinnerung: Die Maßzahl setzt den Unterschied im Mittelwert zwischen zwei Gruppen ins Verhältnis zur Streuung. Hier vergleichen wir **pro Land** Mädchen- und Jungenanteil — dieselben Länder, zwei Messungen. Deshalb nutzen wir die **gepaarte** Variante von Cohen's d und teilen durch die Standardabweichung der **Differenzen**:

$$ d = \frac{\bar{d}}{s_d} $$

Dabei ist $\bar{d}$ der mittlere Unterschied (Mädchen minus Jungen) und $s_d$ die Standardabweichung dieser Länder-Differenzen. (Die Formel für Cohen's d ist hier leicht anders als die in Statistik 1 verwendete; dort war die Formel für **zwei unabhängige Stichproben** gedacht, hier handelt es sich um zwei Messungen aus denselben Ländern.

Grobe Faustregeln zur Einordnung: |d| ≈ 0,2 = klein, 0,5 = mittel, 0,8 = groß. Werte nahe 0 bedeuten: Die beiden Verteilungen überlappen fast vollständig.

> **Warum nicht einfach die Differenz in Prozentpunkten?** Prozentpunkte sagen nichts darüber, wie *groß* der Unterschied im Verhältnis zur Streuung zwischen den Ländern ist. Cohen's d standardisiert, deshalb ist es in der vergleichenden Forschung verbreitet.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **Ü4** in `scripts/session_07_analyse.R`.

**a)** Berechne auf Basis von `parity_2015` die Mittelwerte von `girls_in_primary` und `boys_in_primary`, sowie die Differenz der Mittelwerte. Wie groß ist die Differenz in Prozentpunkten?

**b)** Berechne Cohen's d für den Vergleich Mädchen vs. Jungen in der Grundschule. Bilde zuerst die Länder-Differenz, dann berechne den Mittelwert und die Standardabweichung der Differenzen und teile diese beiden Werte durcheinander, um Cohen's d zu erhalten. Du brauchst dafür den Operator `$`, um direkt die Variablen `girls_in_primary` und `boys_in_primary` im Datensatz `parity_2015` anzuwählen, sowie die Funktionen für den Mittelwert `mean()` und die Standardabweichung `sd()`.

**c)** Schreibe **3–4 Sätze Interpretation**: Wie groß ist der Effekt nach den Faustregeln? Passt das zum Bild aus Ü2 (viele Länder „etwa gleich", aber regionale Ränder)? Was lernt man daraus über den Unterschied zwischen „Durchschnitt" und „Verteilung"?

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü4 a**

- Ausgangspunkt ist `parity_2015` — dort liegen `girls_in_primary` und `boys_in_primary` bereits vor.
- Mittelwerte pro Spalte: `$` wählt eine Spalte aus dem Datensatz aus, `mean()` berechnet den Durchschnitt.
- Die Differenz in Prozentpunkten ist einfach: Mittelwert Mädchen minus Mittelwert Jungen (Vorzeichen beachten — was bedeutet ein negatives Ergebnis?).

**Ü4 b**

- Schritt 1: Pro Land eine Differenz bilden (Mädchenanteil minus Jungenanteil) — Spalte minus Spalte, z. B. mit `$`.
- Schritt 2: Aus allen Länder-Differenzen Mittelwert und Standardabweichung berechnen.
- Schritt 3: Cohen's d = Mittelwert der Differenzen geteilt durch Standardabweichung der Differenzen.
- **Gepaart**, weil jedes Land **zwei** Messungen liefert — nicht zwei getrennte Stichproben. Die Streuung der Differenzen sagt, wie stark sich die Geschlechteranteile **innerhalb** der Länder unterscheiden.
- Vergleiche dein Ergebnis mit den Faustregeln aus dem Text (|d| ≈ 0,2 / 0,5 / 0,8).

**Ü4 c**

- Ordne |d| anhand der Faustregeln ein — klein, mittel oder groß?
- Beziehe dich auf Ü2: Viele Länder „etwa gleich" — passt das zu einem kleinen d?
- Kernpunkt: Ein kleiner **Durchschnitt**-effekt kann trotzdem mit regionaler Benachteiligung in einzelnen Ländern vereinbar sein. Cohen's d beschreibt die Mitte, nicht die Ränder der Verteilung.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# Ü4 a
mean_girls <- mean(parity_2015$girls_in_primary)
mean_boys  <- mean(parity_2015$boys_in_primary)
mean_girls - mean_boys
# Die rohe Differenz ist sehr klein: Jungen sind 0,3 Prozentpunkte häufiger in die Grundschule eingeschrieben.

# Ü4 b
# Gepaartes Cohen's d: pro Land Mädchen minus Jungen, dann Mittelwert / SD der Differenzen.
# (Nicht die gepoolte SD — die gilt für zwei unabhängige Gruppen.)
diff_primary <- parity_2015$girls_in_primary - parity_2015$boys_in_primary
cohens_d <- mean(diff_primary) / sd(diff_primary)
cohens_d
# Cohen's d liegt nahe 0.

# Ü4 c
# Nach den Faustregeln ist der Effekt vernachlässigbar: Im Durchschnitt
# unterscheiden sich Mädchen- und Jungen-Einschulung in der Grundschule kaum.
# Das passt zu Ü2: Die meisten Länder sind "etwa gleich". Ein kleiner
# Durchschnittseffekt schließt aber regionale Benachteiligung NICHT aus — er
# mittelt sie nur weg. Cohen's d beschreibt die zentrale Tendenz; die
# eigentliche Ungleichheit steckt in den Rändern der Verteilung, nicht im Mittel.
```

> **Bonus-Querverweis:** In B-Ü3 kannst du dein Ergebnis mit `effsize::cohen.d(girls, boys, paired = TRUE)` gegenprüfen — das Paket liefert zusätzlich ein Konfidenzintervall.

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue5">Ü5 · Ergebnisse berichten: RMarkdown</h3>

### Ziel

Du fasst deine Ergebnisse in einem reproduzierbaren **RMarkdown-Bericht** zusammen: Er lädt die aufbereiteten Daten per `source()`, bettet deine Kreuztabelle und deine kombinierte Abbildung ein und enthält deine schriftliche Interpretation.

### Was ist neu?

RMarkdown-Dateien haben die Endung `.Rmd`. Eine `.Rmd`-Datei mischt Text und **Code-Chunks**. Den Text kannst du frei schreiben und formatieren (anders und weniger flexibel als in Word & Co, aber man kann schon einiges machen). In Code-Chunks kannst du dann Berechnungen in R anstellen. 
Beim **Knitten** (Button „Knit" in RStudio) wird der Code ausgeführt und ein fertiges HTML-Dokument erzeugt — Abbildungen und Tabellen inklusive. 
Der Vorteil: Text und Analyse per R sind direkt integriert. Wenn du eine Kleinigkeit änderst oder aktualisierte Daten bekommst, kannst du deinen Bericht per Knopfdruck aktualisieren.

### YAML und der Setup-Chunk

**YAML** steht ganz oben in der `.Rmd`-Datei, eingeschlossen von drei Bindestrichen `---`. Das ist der **Kopfbereich** des Dokuments: Er sagt RMarkdown, wie der fertige Bericht heißen soll und in welches Format er beim Knitten umgewandelt wird. Du schreibst dort keinen R-Code — nur kurze Angaben in der Form `Schlüssel: Wert`.

Ein typischer Kopf sieht so aus:

```yaml
---
title: "Geschlechterungleichheiten weltweit"
author: "Dein Name"
date: "`r Sys.Date()`"
output: html_document
---
```

- `title` — Titel im fertigen HTML-Dokument
- `author` — dein Name
- `date` — Erstellungsdatum; `` `r Sys.Date()` `` fügt beim Knitten automatisch das aktuelle Datum ein
- `output: html_document` — beim Knitten entsteht eine HTML-Datei (die du in jedem Browser öffnen kannst)

**Der Setup-Chunk** ist der erste Code-Chunk direkt unter dem YAML-Kopf. Er läuft **einmal zu Beginn**, bevor alle anderen Chunks ausgeführt werden — deshalb heißt er oft `setup`. Hier bereitest du alles vor, was der Rest des Berichts braucht: Pakete laden, Daten einlesen, globale Chunk-Optionen setzen andere Skripte per `source` auführen.

```{r setup, include=FALSE}
knitr::opts_chunk$set(message = FALSE, warning = FALSE)
library(tidyverse)
library(here)
library(janitor)
library(patchwork)

source(here("scripts", "data_wrangling.R"))
```

- `include=FALSE` — dieser Chunk wird beim Knitten ausgeführt, erscheint aber **nicht** im fertigen Bericht (kein Code, kein Output). Ideal für „unsichtbare" Vorbereitung.
- `knitr::opts_chunk$set(...)` — setzt Standard-Optionen für **alle** folgenden Chunks auf einmal (z. B. Warnungen unterdrücken).
- `library(...)` und `source(...)` — damit stehen Pakete und Objekte wie `parity_2015` in jedem späteren Chunk zur Verfügung.

Ohne Setup-Chunk müsstest du Pakete und Daten in **jedem** Chunk neu laden — und der Bericht würde beim Knitten fehlschlagen, sobald ein Chunk auf ein Objekt zugreift, das noch nicht existiert.

### Code-Chunks

Code-Chunks erstellst du in RMarkdown wie folgt:

```{r EIN_TITEL_FÜR_DEN_CHUNK}

# Hier kann R code rein

```

Du kannst auch einfach CMD+option+i (MacOS)/Alt+Strg+i (Windows) drücken, dann wird direkt ein Chunk vorbereitet (aber ohne Titel).

Chunk-Optionen steuern, was angezeigt wird:

- `echo = FALSE` — Code ausblenden, nur Ergebnis zeigen
- `message = FALSE`, `warning = FALSE` — Meldungen unterdrücken
- `fig.width`, `fig.height` — Größe der Abbildung

Du fügst sie nach einem Komma in die geschwungene Klammer hinzu und trennst verschiedene Optionen ebenfalls per Komma, z.B. so:

```{r EIN_TITEL_FÜR_DEN_CHUNK, message = FALSE, warning = FALSE}

# Hier kann R code rein

```

### Text formatieren

Zwischen den Code-Chunks schreibst du normalen Text in **Markdown**. Das ist eine einfache Auszeichnungssprache: Du markierst Struktur mit wenigen Sonderzeichen, RMarkdown wandelt sie beim Knitten in Überschriften, Listen und formatierten Fließtext um.

**Überschriften** setzt du mit `#` am Zeilenanfang. Mehr `#` = kleinere Überschrift:

```markdown
# Hauptüberschrift (Kapitel)
## Abschnitt
### Unterabschnitt
```

**Aufzählungen** beginnst du mit `-` oder `*` und einem Leerzeichen:

```markdown
- Erster Punkt
- Zweiter Punkt
- Dritter Punkt
```

**Fett** und *kursiv*: Doppelsterne für fett, einfache Sterne für kursiv (oder Unterstriche statt Sterne):

```markdown
**wichtig** oder __wichtig__
*kursiv* oder _kursiv_
```

**Absätze und Abstände:** Ein Leerzeichen in einer Zeile reicht nicht — Markdown fügt den Text sonst in **einen** Absatz zusammen. Für einen neuen Absatz lässt du **eine Leerzeile** zwischen zwei Textblöcken. Willst du nur einen Zeilenumbruch *innerhalb* desselben Absatzes, endest du die Zeile mit **zwei Leerzeichen** oder setzt am Ende `<br>`.

```markdown
Erster Absatz mit eigener Interpretation.

Zweiter Absatz — sichtbar getrennt durch die Leerzeile dazwischen.
```

In deinem Bericht nutzt du das z. B. so: `##` für Abschnittstitel („Bildungsparität"), Fließtext für die Interpretation aus Ü2/Ü3, und `**fett**`, wenn du einen Begriff hervorheben willst.


### Deine Aufgaben

Bearbeite `session_07_report.Rmd`. Du findest die Datei im Session-Ordner.

**a)** Ergänze im **Setup-Chunk** das Laden der Pakete und den `source()`-Aufruf, sodass `gender_2015`, `parity_2015` usw. im Bericht verfügbar sind.

**b)** Baue einen Chunk, der die Kreuztabelle aus Ü2 als formatierte Tabelle ausgibt. Damit die Tabelle schön formatiert ist, kannst du die Funktion `knitr::kable()` als letzten Schritt in die Pipe integrieren.

**c)** Baue einen Chunk, der die kombinierte Abbildung aus Ü3 erzeugt und mit sinnvollen `fig.width`/`fig.height` anzeigt.

**d)** Füge **zwischen** den Chunks deine Interpretation als Fließtext (nicht als Kommentar!) deine Intepretationen ein, die du bereits geschrieben hast (was zeigen Tabelle und Abbildung über die Mehrdimensionalität von Geschlechterungleichheit?)

**e)** Knitte den Bericht zu HTML.

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü5 a**

- Der Setup-Chunk steht direkt unter dem YAML-Kopf und läuft zuerst — dort gehören Pakete, `knitr::opts_chunk$set(...)` und `source()`.
- `library(here)` muss **vor** `source(here(...))` stehen — sonst findet R den Pfad nicht.
- Der `source()`-Aufruf sollte auf dasselbe Aufbereitungsskript zeigen wie in `session_07_analyse.R` (Ü1).
- `include=FALSE` ist sinnvoll, damit Setup-Code nicht im HTML-Bericht erscheint.

**Ü5 b**

- Du musst die Kreuztabelle nicht neu erfinden — der Code aus Ü2 c) funktioniert hier fast 1:1 in einem eigenen Chunk.
- `knitr::kable()` als **letzter** Schritt in der Pipe wandelt die Tabelle in eine lesbare Ausgabe für den Bericht um.
- Gib dem Chunk einen kurzen Namen (z. B. `tabelle`) — das hilft beim Debuggen, wenn beim Knitten etwas schiefgeht.

**Ü5 c**

- Auch hier: Code aus Ü3 e) übernehmen, der `composite` erzeugt — nicht die drei Einzelpanels.
- `fig.width` und `fig.height` setzt du in den **Chunk-Kopf** (neben dem Chunk-Namen), nicht in `ggplot()`.
- Probiere die Größen aus der Ü3-`ggsave()`-Angabe als Ausgangspunkt und passe an, wenn die Abbildung im HTML zu klein oder abgeschnitten wirkt.

**Ü5 d**

- Interpretation gehört **zwischen** die Chunks als normaler Markdown-Text — nicht in `#`-Kommentare und nicht in den Setup-Chunk.
- Nutze `##` für Abschnittsüberschriften und Fließtext für deine Sätze aus Ü2 d) und Ü3 g).
- Verbinde Tabelle und Abbildung: Was zeigt die Kreuztabelle, was die drei Panels — und warum ist Geschlechterungleichheit „mehrdimensional"?

**Ü5 e**

- Knit-Button in RStudio — oder `rmarkdown::render()` auf die `.Rmd`-Datei.
- Die `.Rmd` muss im **Projektordner** liegen, damit `here()` beim Knitten dieselben Pfade findet wie in deinem Analyse-Skript.
- Liest die Fehlermeldung von **unten nach oben**: Oft fehlt ein Paket, ein Objekt aus `source()`, oder ein Chunk-Name ist doppelt.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

In `session_07_report.Rmd`:

````markdown
---
title: "Geschlechterungleichheiten weltweit"
author: "Dein Name"
date: "`r Sys.Date()`"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE, message = FALSE, warning = FALSE)
library(tidyverse)
library(here)
library(janitor)
library(patchwork)

source(here("scripts", "data_wrangling.R"))
```

## Bildungsparität nach Weltregion

Die folgende Kreuztabelle zeigt, in wie vielen Ländern je Region Mädchen bzw. Jungen in der Grundschule vorne liegen.

```{r tabelle}
parity_2015 |>
  tabyl(world_region, parity_category) |>
  adorn_totals("row") |>
  knitr::kable()
```

Die große Mehrheit der Länder liegt im Bereich "etwa gleich" — verbleibende Benachteiligung von Mädchen konzentriert sich regional.

## Drei Dimensionen der Ungleichheit

```{r abbildung, fig.width=11, fig.height=8}
# (Code aus Ü3, der `composite` erzeugt)
composite
```

Die Abbildung macht sichtbar, dass Geschlechterungleichheit nicht in eine Richtung läuft: Bei der Erwerbsbeteiligung sind Frauen benachteiligt, bei der Suizidrate die Männer, und in der Grundschulbildung herrscht meist Parität.
````

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h2 id="bonus-aufgaben">Bonus-Aufgaben</h2>

Diese Aufgaben sind freiwillig und bewusst **weniger angeleitet**. Sie geben dir Raum, eigenen Fragen nachzugehen — genau wie in echter Forschung. Es gibt nicht *die eine* richtige Lösung.

---

<h3 id="b-ue1">B-Ü1 ⚠️ · Müttersterblichkeit, bedingt auf Entwicklung</h3>

**Analytisches Ziel:** Warum sterben in manchen Ländern mehr Frauen an Schwangerschaft und Geburt, als ihr Entwicklungsstand erwarten ließe?

Die spannende Frage ist nicht „welches Land hat die meisten Müttersterbefälle" (das ist vor allem eine Frage der Bevölkerungsgröße), sondern: Welche Länder weichen **nach oben** ab, wenn man ihren Wohlstand oder ihre Lebenserwartung berücksichtigt?

**a)** Baue aus `owid_daten` einen Querschnitt 2015 mit `maternal_mortality_ratio`, `population`, `gdp`, `life_expectancy_birth`, `world_region` (ohne NAs). 

**b)** Erstelle ein Streudiagramm der Rate, mit einer der Variablen, die Entwicklungsstand anzeigt, als erkländer Variable. Füge eine Trendlinie hinzu. Färbe nach `world_region`.

**c)** Markiere die auffälligsten Ausreißer **über** der Trendlinie mit ihrem Ländernamen — z. B. mit `ggrepel::geom_text_repel()` oder indem du die Residuen einer `lm()` berechnest und die größten mit `slice_max()` herausziehst.

**d)** Schreibe 4–5 Sätze: Welche Länder fallen auf? Was könnte „überschüssige" Müttersterblichkeit bei gegebenem Entwicklungsstand erklären (Gesundheitssystem, Zugang, Konflikt …)?

<br>

<details>
<summary><strong>Tipp</strong></summary>

- `ggrepel` musst du evtl. installieren: `install.packages("ggrepel")`, dann `library(ggrepel)`.
- Für gezielte Labels nur der Ausreißer: erst die Punkte über der Trendlinie identifizieren (z. B. Residuen aus `lm(maternal_per_100k ~ gdp, data = ...)`), dann nur diese labeln.
- `broom::augment()` (aus Session 6) liefert dir die Residuen (`.resid`) direkt zu jedem Land — praktisch zum Sortieren mit `slice_max(.resid, n = 8)`.

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="b-ue2">B-Ü2 ⚠️ · Die männliche Seite der Ungleichheit</h3>

**Analytisches Ziel:** Wo und wie stark sind Männer benachteiligt?

Geschlechterungleichheit wird meist als Benachteiligung von Frauen diskutiert. Die Daten zeigen aber zwei deutliche Felder, in denen Männer schlechter abschneiden: **Suizid** und zunehmend **Hochschulbildung**.

**a)** Erforsche Muster von Geschlechterungleichheit in Suizidraten und Hochschulbildung. Du kannst z.B. Entwicklungen über die Zeit verfolgen, Ländervergleiche anstellen oder per linearer Regression statistische Zusammenhänge erkunden. Erstelle dazu Tabellen und Grafiken, und interpretiere sie.

**b)** Jetzt erkunde Muster und Zusammenhänge im Bereich Hochschulbildung.

**c)** Baue zu einem der Themenbereiche eine interessante zusammengestellte Grafik mit `patchwork`.

<br>

---

<h3 id="b-ue3">B-Ü3 ⚠️⚠️ · Freie Exploration: deine eigene Geschlechter-Frage</h3>

**Analytisches Ziel:** Du formulierst eine eigene Frage und beantwortest sie mit den Werkzeugen dieser Session.

Der Datensatz enthält weitere geschlechtsbezogene Variablen, die wir nicht im Detail behandelt haben:

| Variable | Was sie misst |
|----------|---------------|
| `gender_wage_gap` | Geschlechtsspezifische Lohnlücke |
| `domestic_violence_women` | Anteil der Frauen mit Gewalterfahrung durch eine:n Partner:in |
| `female_homicide_rate` | Tötungsrate von Frauen |

**Deine Aufgabe:**

1. Wähle **eine** dieser Variablen und formuliere eine Frage (z. B. „Hängt die Lohnlücke mit der Erwerbsbeteiligung von Frauen zusammen?" oder „Wo ist Partnergewalt am verbreitetsten — und korreliert das mit Bildung?").
2. **Erweitere `data_wrangling.R`**, sodass deine gewählte Variable in `gender_2015` enthalten ist. Das ist der eigentliche Sinn der Auslagerung: Du änderst die Aufbereitung an *einer* Stelle, und alle Analysen profitieren.
3. Erstelle **mindestens eine** Abbildung und **eine** Tabelle (`count()` oder `tabyl()`).
4. Schreibe 4–5 Sätze, die deine Frage beantworten — oder begründen, warum die Daten keine klare Antwort erlauben.

**Optionaler Stretch — Animation (`gganimate`):** Wähle eine Variable mit Zeitverlauf (z. B. `female_labor_participation`, `gender_wage_gap`) und animiere ihre Entwicklung über die Jahre nach Weltregion. `gganimate` erweitert einen ggplot um `transition_time(year)`; das Rendern braucht das `gifski`-Paket. Recherchiere die Grundsyntax selbst, online oder mit Hilfe eines LLMs.

<br>

<details>
<summary><strong>Tipp</strong></summary>

- Zum Erweitern von `gender_2015`: Füge den Variablennamen einfach in den `select()`-Block in `data_wrangling.R` ein und `source()` das Skript erneut.
- `domestic_violence_women` und `gender_wage_gap` sind survey-basiert und haben **lückenhafte** Jahresabdeckung — prüfe mit `summary()`/`count()`, für welche Jahre und Länder überhaupt Werte vorliegen, bevor du ein Jahr festlegst.
- Für `gganimate`: `install.packages(c("gganimate", "gifski"))`. Grundmuster: ein normaler Linien-/Punkteplot `+ transition_time(year) + labs(title = "Jahr: {frame_time}")`, dann `animate(plot)`.
- Es gibt keine Musterlösung — diese Aufgabe ist Übungsfeld für deinen Abschlussbericht.

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h2 id="abgabe">Abgabe</h2>

Wenn du fertig bist:

1. Speichere alle Dateien.
2. Stelle sicher, dass im Projekt vorhanden sind:
   - `scripts/data_wrangling.R`
   - `scripts/session_07_analyse.R`
   - `session_07_report.Rmd` **und** das geknittete `session_07_report.html`
   - `output/plot_gender_composite.png`
3. Erstelle eine .zip-Datei. Die Datei muss enthalten:
   - die drei Skript-/Report-Dateien (`.R`, `.R`, `.Rmd`)
   - das geknittete Dokument `session_07_report.html`
   - die Abbildung aus `output/`
   - optional: deine Bonus-Auswertungen
4. Reiche die gezippte Datei auf Learnweb ein
   

> **Falls etwas nicht klappt:** Lies zuerst die Fehlermeldung, frage deine Buddy-Partner:in oder schau in den [häufigen Fehlern](../../resources/other/common_errors.md) nach. Häufige Stolperfalle diese Woche: Pfade in `source()`/`here()` und vergessene Pakete (`janitor`, `patchwork`).

---

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>
