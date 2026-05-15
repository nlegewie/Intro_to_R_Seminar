# Hausaufgaben Session 4 — Datenstrukturen, Variablentypen und fehlende Werte

**Seminar:** Globale Ungleichheit · Wintersemester 2025/26

> **Hinweis:** Diese Woche findet keine Sitzung statt — die Hausaufgaben sind dein eigenständiger Einstieg in das Thema dieser Session. Lies alles sorgfältig und arbeite Schritt für Schritt. Du schaffst das!

---

## Inhaltsverzeichnis

- [Dein Endprodukt](#endprodukt)
- [Wo du arbeitest](#wo-du-arbeitest)
- [Einleitung](#einleitung)
- [Hausaufgaben](#hausaufgaben)
  - [HA1 · Datenstruktur erkunden](#ha1)
  - [HA2 · Variablentypen verstehen](#ha2)
  - [HA3 · Fehlende Werte untersuchen](#ha3)
  - [HA4 · Kindermortalität visualisieren](#ha4)
  - [Bonus-Hausaufgaben](#bonus-hausaufgaben)
- [Abgabe](#abgabe)

---

<h2 id="endprodukt">Dein Endprodukt</h2>

**Frage dieser Session:** Wie hat sich die Kindermortalität weltweit verteilt — und was verrät uns diese Verteilung über globale Ungleichheit?

Am Ende dieser Hausaufgaben wirst du:

- die Datenstruktur des OWID-Datensatzes systematisch verstehen
- Variablentypen erkennen und erklären können
- fehlende Werte gezielt untersuchen und einordnen können
- ein aussagekräftiges, beschriftetes Histogramm der Kindermortalität erstellt haben

So (oder sehr ähnlich) soll deine **Zielgrafik** aussehen — ein Histogramm der Kindermortalitätsrate aus dem Jahr 2015, das die globale Ungleichheit im Überleben von Kindern sichtbar macht:

```
Kindermortalität bei Geburt, 2015 (Todesfälle pro 100 Lebendgeburten)

Anzahl Länder
  30 |     ████
  25 |     ████
  20 |     ████
  15 | ████████ ██
  10 | ████████████ ██
   5 | ██████████████████ ██    ██
   0 +─────────────────────────────────────────────
     0     20     40     60     80    100
```

*Diese ASCII-Skizze zeigt nur die ungefähre Form — dein ggplot-Histogramm wird deutlich schöner aussehen und muss beschriftet sein.*

Die Verteilung wird dir etwas zeigen, das auf den ersten Blick überrascht: Die Welt ist nicht einfach „arm" oder „reich" — es gibt eine tatsächliche **bimodale Struktur** in der Kindersterblichkeit. Schau genau hin.

---

<h2 id="wo-du-arbeitest">Wo du arbeitest</h2>

Alle Code-Aufgaben bearbeitest du in **einem einzigen Skript**:

**`scripts/session_04_skript.R`**

### Schritt-für-Schritt

1. Vergewissere dich, dass du das **korrekte RStudio-Projekt** geöffnet hast. Oben rechts in RStudio sollte der Projektname erscheinen. Wenn nicht: Öffne die `.Rproj`-Datei im Projektordner per Doppelklick.
2. Öffne das Skript `scripts/session_04_skript.R`.
3. **Führe zuerst den SETUP-Abschnitt aus** — er ist im Skript mit `# SETUP — ZUERST AUSFÜHREN!` markiert. Dort werden Pakete geladen und der OWID-Datensatz eingelesen.

   > **`owid_data.csv` liegt unter `full_data/`** im Hauptordner des Repos, nicht im Session-Ordner. Wenn ein Fehler „Datei nicht gefunden" erscheint, stimmt wahrscheinlich der Pfad nicht — vergleiche deine Ordnerstruktur mit der im Repo und schau in den [häufigen Fehlern](../../resources/other/common_errors.md) nach.

4. Bearbeite die Hausaufgaben danach der Reihe nach in den markierten Abschnitten `HA1` bis `HA4`.

> **Wichtig:** Schreibe deinen Code immer ins Skript, nicht in die Konsole. Nur so bleibt er gespeichert.

---

<h2 id="einleitung">Einleitung: Daten richtig lesen, bevor man sie analysiert</h2>

In Session 3 hast du gelernt, Daten zu laden und erste Histogramme zu erstellen. Diese Session geht tiefer: Bevor eine Analyse sinnvoll ist, müssen wir verstehen, **was** die Daten überhaupt sind — also welche Variablentypen vorliegen, wie die Datenstruktur aussieht und wo Werte fehlen.

Das ist keine trockene Pflichtübung. Wer diesen Schritt überspringt, produziert regelmäßig Fehler, die schwer zu finden sind: falsche Berechnungen, irreführende Grafiken, Funktionen die abstürzen. Gute Datenanalyse beginnt immer mit einem systematischen Blick auf die Daten.

Und die substantielle Frage dieser Session ist alles andere als langweilig: **Kindermortalität** — also wie viele Kinder unter fünf Jahren pro 100 Lebendgeburten sterben — ist einer der deutlichsten Indikatoren für globale Ungleichheit. Hinter jeder Zahl stehen echte Leben.

---

<h2 id="hausaufgaben">Hausaufgaben</h2>

<h3 id="ha1">HA1 · Datenstruktur erkunden</h3>

### Was ist neu?

In dieser Aufgabe lernst du drei Funktionen kennen, mit denen du einen Datensatz systematisch *von außen* anschaust, bevor du ihn analysierst.

| Funktion | Was sie zeigt |
|----------|--------------|
| `glimpse()` | Kompakte Übersicht: Variablennamen, Typen, erste Werte |
| `summary()` | Für numerische Variablen: Min, Max, Mittelwert, Median, NA-Anzahl |
| `names()` | Alle Spaltennamen als Zeichenvektor |

`summary()` ist dabei besonders praktisch: Sie zeigt dir auf einen Blick die Wertebereiche aller Variablen — und markiert fehlende Werte mit `NA's:`.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **HA1** in `scripts/session_04_skript.R`.

a) Wende `glimpse()` auf den OWID-Datensatz an. Notiere anschließend im Skript als Kommentar: Wie viele Zeilen und Spalten hat der Datensatz?

b) Wende `summary()` auf den gesamten Datensatz an. Lies die Ausgabe durch. Notiere als Kommentar: Welche Variable hat nach erster Sicht die meisten fehlenden Werte?

c) Lass dir alle Spaltennamen mit `names()` ausgeben.

d) Schreibe als Kommentar: Welche drei Variablen könnten für eine Analyse globaler Ungleichheit besonders interessant sein? Begründe kurz (je 1 Satz).

<br>

<details>
<summary><strong>Tipp</strong></summary>

Rufe jede Funktion einmal auf, z. B.:

```r
glimpse(owid_daten)
summary(owid_daten)
names(owid_daten)
```

Für d) gibt es keine einzig richtige Antwort — schreib auf, was dich inhaltlich interessiert.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
glimpse(owid_daten)
# Der Datensatz hat ca. 75.000 Zeilen und 77 Spalten (je nach Version leicht abweichend).

summary(owid_daten)
# Nach erster Sicht hat z. B. gini sehr viele fehlende Werte.

names(owid_daten)

# Interessante Variablen für globale Ungleichheit:
# gini — misst Einkommensungleichheit direkt.
# child_mortality_rate — zeigt, ob Kinder überleben, stark mit Armut verknüpft.
# gdp — erlaubt Vergleiche des wirtschaftlichen Entwicklungsstandes.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha2">HA2 · Variablentypen verstehen</h3>

### Was ist neu?

In R hat jede Variable einen **Typ** (auch *Klasse* genannt). Der Typ bestimmt, was R damit machen kann:

| Typ | Beschreibung | Beispiel |
|-----|-------------|---------|
| `numeric` / `dbl` | Zahlen mit Dezimalstellen | `72.3`, `0.04` |
| `integer` / `int` | Ganze Zahlen | `2015`, `42` |
| `character` / `chr` | Text | `"Germany"`, `"Asia"` |
| `factor` | Kategorien mit definierten Stufen | `"niedrig"`, `"mittel"`, `"hoch"` |
| `logical` | Wahr/Falsch | `TRUE`, `FALSE` |

Du kannst den Typ einer einzelnen Spalte mit `class()` oder `typeof()` prüfen. Mit `$` greifst du auf eine Spalte zu:

```r
class(owid_daten$country)
class(owid_daten$year)
class(owid_daten$child_mortality_rate)
```

Warum ist das wichtig? Funktionen reagieren auf Typen. `mean()` funktioniert auf `numeric`, aber nicht auf `character`. `ggplot()` behandelt eine Variable als `factor` anders als als `numeric`. Falsche Typen sind eine häufige Fehlerquelle.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **HA2** in `scripts/session_04_skript.R`.

a) Bestimme die Klasse dieser Variablen mit `class()`:
   - `country`
   - `year`
   - `world_region`
   - `child_mortality_rate`
   - `gini`
   - `democracy_score_string`

b) **Debugging-Aufgabe:** Der folgende Code produziert einen Fehler. Führe ihn aus, lies die Fehlermeldung und erkläre im Kommentar, was das Problem ist und wie es sich beheben ließe:

```r
mean(owid_daten$country)
```

c) **Denk-Aufgabe (kein Code nötig):** Die Variable `democracy_score` enthält die Werte 0, 1, 2 und 3, die politische Regime beschreiben (0 = geschlossene Autokratie, 3 = liberale Demokratie). Was ist ihr aktueller Typ? Wäre es besser, sie als `factor` zu behandeln? Schreibe 2–3 Sätze als Kommentar.

<br>

<details>
<summary><strong>Tipp zu b)</strong></summary>

Lies die Fehlermeldung genau: Was sagt R über den Typ des Arguments? `mean()` erwartet numerische Werte. `country` enthält Text. Das Problem ist der Typ — nicht ein Tippfehler.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
class(owid_daten$country)            # "character"
class(owid_daten$year)               # "integer"
class(owid_daten$world_region)       # "character"
class(owid_daten$child_mortality_rate) # "numeric"
class(owid_daten$gini)               # "numeric"
class(owid_daten$democracy_score_string) # "character"

mean(owid_daten$country)
# Fehlermeldung: argument is not numeric or logical...
# Problem: `country` ist vom Typ `character` (Text). Der Mittelwert von
# Ländernamen ergibt keinen Sinn. Man müsste eine numerische Variable wählen,
# z. B. mean(owid_daten$child_mortality_rate, na.rm = TRUE).

# democracy_score ist aktuell numeric (0–3).
# Als Faktor wäre es besser, weil die Kategorien nominal sind — die Abstände
# zwischen 0 und 1 vs. 2 und 3 sind nicht unbedingt gleich groß.
# Als numeric könnte R irreführende Berechnungen erlauben (z. B. einen
# "mittleren Regimetyp"), die inhaltlich wenig Sinn ergeben.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha3">HA3 · Fehlende Werte untersuchen</h3>

### Was ist neu?

Fehlende Werte (`NA` — *Not Available*) sind in echten Datensätzen unvermeidlich. R behandelt sie konsequent: Fast jede Berechnung mit einem `NA` ergibt wieder `NA`:

```r
mean(c(1, 2, NA))       # ergibt NA
mean(c(1, 2, NA), na.rm = TRUE)  # ergibt 1.5
```

`na.rm = TRUE` weist R an, `NA`-Werte vor der Berechnung zu ignorieren (*remove*). Das ist oft sinnvoll — aber du solltest wissen, wie viele Werte dabei wegfallen.

Nützliche Funktionen für fehlende Werte:

```r
is.na(vektor)                # gibt TRUE/FALSE für jeden Wert zurück
sum(is.na(vektor))           # zählt die fehlenden Werte
sum(is.na(vektor)) / length(vektor) * 100  # Prozentanteil
```

### Deine Aufgaben

Schreibe den Code in den Abschnitt **HA3** in `scripts/session_04_skript.R`.

#### HA3 A: Fehlende Werte zählen

Berechne die Anzahl fehlender Werte für diese vier Variablen:

- `child_mortality_rate`
- `gini`
- `gdp`
- `life_expectancy_birth`

Speichere jedes Ergebnis in einem sinnvoll benannten Objekt, z. B. `n_miss_child`.

#### HA3 B: Prozentanteile berechnen

Berechne für jede der vier Variablen den Anteil fehlender Werte in Prozent:

```r
n_miss_child / nrow(owid_daten) * 100
```

#### HA3 C: Mittelwert mit und ohne NA-Behandlung

Berechne den Mittelwert von `child_mortality_rate`:

1. Ohne `na.rm = TRUE` — was passiert?
2. Mit `na.rm = TRUE` — was ist das Ergebnis?

Erkläre den Unterschied als Kommentar im Skript.

#### HA3 D: Interpretieren

Schreibe **3–5 Sätze** als Kommentar:

- Welche Variable hat die meisten fehlenden Werte?
- Was könnte der Grund dafür sein? (Denk an: Für welche Länder oder Jahre könnte diese Information schwer zu erheben sein?)
- Welche Konsequenz hat das für Analysen, die diese Variable verwenden?

<br>

<details>
<summary><strong>Tipp</strong></summary>

Gehe in zwei Schritten vor:

1. `n_miss_child <- sum(is.na(owid_daten$child_mortality_rate))`
2. `pct_miss_child <- n_miss_child / nrow(owid_daten) * 100`

Wiederhole das Muster für die anderen drei Variablen.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# HA3 A: Fehlende Werte zählen
n_miss_child <- sum(is.na(owid_daten$child_mortality_rate))
n_miss_gini  <- sum(is.na(owid_daten$gini))
n_miss_gdp   <- sum(is.na(owid_daten$gdp))
n_miss_le    <- sum(is.na(owid_daten$life_expectancy_birth))

# HA3 B: Prozentanteile
pct_miss_child <- n_miss_child / nrow(owid_daten) * 100
pct_miss_gini  <- n_miss_gini  / nrow(owid_daten) * 100
pct_miss_gdp   <- n_miss_gdp   / nrow(owid_daten) * 100
pct_miss_le    <- n_miss_le    / nrow(owid_daten) * 100

# HA3 C: Mittelwert mit und ohne na.rm
mean(owid_daten$child_mortality_rate)             # ergibt NA
mean(owid_daten$child_mortality_rate, na.rm = TRUE) # ergibt einen Zahlenwert
# Ohne na.rm = TRUE "infiziert" ein einziges NA das gesamte Ergebnis.
# Mit na.rm = TRUE werden NA-Werte ignoriert und der Mittelwert aus den
# verfügbaren Werten berechnet. Man sollte dabei wissen, wie viele Werte
# wegfallen — sonst kann das Ergebnis irreführend sein.

# HA3 D: Interpretation
# gini hat mit Abstand die meisten fehlenden Werte.
# Gini-Koeffizienten erfordern Haushaltsbefragungen, die aufwändig und teuer
# sind — viele Länder, besonders ärmere oder von Konflikten betroffene,
# erheben diese Daten seltener oder gar nicht.
# Für Analysen mit gini müssen wir immer prüfen, welche Länder und Jahre
# tatsächlich abgedeckt sind — sonst besteht das Risiko, nur über eine
# verzerrte Auswahl von Ländern zu sprechen (z. B. nur reichere Länder,
# die häufiger Daten erheben).
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha4">HA4 · Kindermortalität visualisieren</h3>

### Ziel

Du erstellst das Histogramm, das am Anfang dieser Seite angedeutet wird: eine beschriftete Visualisierung der Kindermortalitätsrate aus dem vollständigen OWID-Datensatz für das Jahr 2015.

### Hintergrund: Was ist Kindermortalität?

Die Variable `child_mortality_rate` gibt an, wie viele Kinder unter fünf Jahren pro 100 Lebendgeburten sterben. Ein Wert von `5` bedeutet: 5 von 100 geborenen Kindern sterben vor ihrem fünften Geburtstag. Diese Zahl ist einer der stärksten Indikatoren für globale Ungleichheit — sie hängt von Gesundheitsversorgung, Ernährung, Wasser, Sanitäranlagen und politischer Stabilität ab.

### Aufgaben

Schreibe den Code in den Abschnitt **HA4** in `scripts/session_04_skript.R`.

Der Abschnitt enthält bereits diese vorbereitete Zeile — führe sie zuerst aus:

```r
owid_2015 <- owid_daten |> filter(year == 2015)
```

> `filter()` wird in Session 5 ausführlich eingeführt. Hier nutzt du es als Vorgabe: Es wählt nur die Zeilen aus, in denen `year == 2015` gilt — ein Querschnitt für ein einziges Jahr.

#### HA4 A: Plausibilitätschecks

Führe aus:

- `nrow(owid_2015)` — wie viele Länder gibt es für 2015?
- `summary(owid_2015$child_mortality_rate)` — welche Wertebereiche siehst du?
- `sum(is.na(owid_2015$child_mortality_rate))` — wie viele Länder fehlen?

Notiere deine Beobachtungen kurz als Kommentar.

#### HA4 B: Histogramm erstellen

Erstelle ein Histogramm von `child_mortality_rate` aus `owid_2015` mit `ggplot()` und `geom_histogram()`.

Experimentiere mit dem `bins`-Argument (probiere z. B. `bins = 20` und `bins = 30`) und entscheide dich für die Version, die die Verteilung deiner Meinung nach am klarsten zeigt.

#### HA4 C: Plot beschriften

Erweitere den Plot mit `labs()`:

- einen klaren, informativen Titel
- sinnvolle Achsenbeschriftungen (`x`, `y`)
- einen Untertitel (`subtitle`) mit dem Jahr
- eine Quellenangabe im `caption`

Weise den beschrifteten Plot dem Objekt `child_mortality_histogram` zu.

#### HA4 D: Farbe und Stil anpassen

Verändere den Plot ästhetisch mit diesen Argumenten in `geom_histogram()`:

```r
geom_histogram(bins = 25, fill = "steelblue", color = "white")
```

Probiere auch andere Farben aus (z. B. `"#c0392b"`, `"#27ae60"`, oder ein anderes [Hex-Farbcode](https://colorpicker.me/)). Welche Farbe findest du für das Thema Kindermortalität angemessen?

#### HA4 E: Verteilung interpretieren

Schreibe **3–5 Sätze Interpretation** als Kommentar im Skript:

- Wo liegt der Großteil der Länder?
- Gibt es eine Gruppe von Ländern mit sehr hoher Kindermortalität?
- Was sagt das über globale Ungleichheit?
- Hat dich irgendetwas an der Verteilung überrascht?

#### HA4 F: Plot speichern

```r
dir.create(here("output"), showWarnings = FALSE)

ggsave(
  here("output", "child_mortality_histogram_2015.png"),
  plot   = child_mortality_histogram,
  width  = 8,
  height = 5
)
```

<br>

<details>
<summary><strong>Tipp</strong></summary>

Grundmuster für den Plot:

```r
child_mortality_histogram <- ggplot(owid_2015, aes(x = child_mortality_rate)) +
  geom_histogram(bins = 25, fill = "steelblue", color = "white") +
  labs(
    title    = "...",
    subtitle = "...",
    x        = "...",
    y        = "...",
    caption  = "Quelle: Our World in Data"
  )

child_mortality_histogram
```

Wenn `ggsave()` einen Fehler bringt, prüfe, ob `child_mortality_histogram` wirklich in deiner Umgebung existiert (oben rechts im *Environment*-Panel sichtbar). Wenn nicht, musst du die Zuweisung nochmal ausführen.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
owid_2015 <- owid_daten |> filter(year == 2015)

# HA4 A: Plausibilitätschecks
nrow(owid_2015)
summary(owid_2015$child_mortality_rate)
sum(is.na(owid_2015$child_mortality_rate))
# Es gibt ca. 195–200 Länder für 2015, mit wenigen fehlenden Werten.
# Die Werte reichen von unter 2 bis über 100 (Todesfälle pro 100 Lebendgeburten).

# HA4 B–D: Histogramm
child_mortality_histogram <- ggplot(owid_2015, aes(x = child_mortality_rate)) +
  geom_histogram(bins = 25, fill = "#c0392b", color = "white") +
  labs(
    title    = "Kindermortalität weltweit (Kinder unter 5 Jahren)",
    subtitle = "Jahr 2015 — Todesfälle pro 100 Lebendgeburten",
    x        = "Kindermortalitätsrate (Todesfälle pro 100 Lebendgeburten)",
    y        = "Anzahl Länder",
    caption  = "Quelle: Our World in Data / UN Inter-agency Group for Child Mortality Estimation"
  )

child_mortality_histogram

# HA4 E: Interpretation
# Die meisten Länder haben eine Kindermortalität unter 20 pro 100 Lebendgeburten.
# In den reichen Ländern liegt sie sogar unter 5.
# Gleichzeitig gibt es eine kleine, aber deutlich sichtbare Gruppe von Ländern
# mit Werten über 50 oder sogar über 80. Das sind meist Länder in Sub-Sahara-Afrika.
# Die Verteilung ist stark rechtsschief: Wenige Länder haben extrem hohe Werte,
# während die Mehrheit relativ niedrig liegt.
# Das zeigt: Kindermortalität ist nicht gleichmäßig verteilt — es gibt tiefe
# globale Ungleichheiten darin, ob Kinder ihren fünften Geburtstag erleben.

dir.create(here("output"), showWarnings = FALSE)

ggsave(
  here("output", "child_mortality_histogram_2015.png"),
  plot   = child_mortality_histogram,
  width  = 8,
  height = 5
)
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h2 id="bonus-hausaufgaben">Bonus-Hausaufgaben</h2>

Diese Aufgaben sind freiwillig. Sie vertiefen das Thema und können die Grundlage für den späteren Abschlussbericht bilden.

---

### B-HA1 · Zwei Verteilungen vergleichen

Erstelle ein zweites Histogramm — diesmal für `gdp` aus `owid_2015` (das Bruttoinlandsprodukt pro Kopf).

- Filtere zuerst auf Zeilen ohne fehlende Werte in `gdp`.
- Vergleiche schriftlich als Kommentar: Wie unterscheidet sich die Verteilung von GDP von der Kindermortalität? Was bedeutet das für den Zusammenhang der beiden Variablen?

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
owid_2015_gdp <- owid_2015 |> filter(!is.na(gdp))

gdp_histogram <- ggplot(owid_2015_gdp, aes(x = gdp)) +
  geom_histogram(bins = 30, fill = "#2980b9", color = "white") +
  labs(
    title   = "Verteilung des BIP pro Kopf (2015)",
    x       = "BIP pro Kopf (KKP, konstante internationale $)",
    y       = "Anzahl Länder",
    caption = "Quelle: Our World in Data"
  )

gdp_histogram

# GDP ist stark rechtsschief: Wenige sehr reiche Länder heben den Mittelwert.
# Bei Kindermortalität hingegen ist die Schieflage anders — viele Länder mit
# niedrigen Werten und wenige mit sehr hohen.
# Beide Verteilungen zeigen globale Ungleichheit, aber auf spiegelbildliche Weise:
# Reichtum konzentriert sich oben, Kindersterblichkeit konzentriert sich ebenfalls
# oben — aber das "Oben" betrifft verschiedene Länder.
```

</details>

---

### B-HA2 ⚠️ · `geom_density()` erkunden

Schlage `geom_density()` in der ggplot2-Dokumentation nach (`?geom_density` oder online) und wende es auf `child_mortality_rate` aus `owid_2015` an.

- Was zeigt die Dichtekurve im Vergleich zum Histogramm?
- Siehst du Hinweise auf **zwei Häufungspunkte** (*Bimodalität*)? Was könnte das bedeuten?
- Notiere 3–4 Sätze als Kommentar.

---

### B-HA3 ⚠️ · Trendvergleich über zwei Jahre

Erstelle zwei Histogramme — eines für 2000, eines für 2015 — und vergleiche die Verteilung von `child_mortality_rate` visuell.

*Hinweis:* `filter(year == 2000)` gibt dir die Daten für 2000.

Hat sich die Verteilung verschoben? In welche Richtung? Was sagt das über den weltweiten Fortschritt bei der Kindersterblichkeit?

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h2 id="abgabe">Abgabe</h2>

Wenn du mit den Hausaufgaben fertig bist:

1. Speichere das Skript `scripts/session_04_skript.R` (`Ctrl+S` / `Cmd+S`).
2. Stelle sicher, dass der Plot unter `output/child_mortality_histogram_2015.png` gespeichert wurde.
3. Reiche auf Learnweb ein:
   - `scripts/session_04_skript.R`
   - `output/child_mortality_histogram_2015.png`

> **Falls etwas nicht funktioniert:** Lies zuerst die Fehlermeldung, frage deine Buddy-Partner:in, schlage in den [häufigen Fehlern](../../resources/other/common_errors.md) nach oder poste im Kurs-Forum.

---

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>
