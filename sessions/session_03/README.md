# Session 3 — Datensatz laden und erkunden

**Seminar:** Globale Ungleichheit · Wintersemester 2025/26

---

## Inhaltsverzeichnis

- [Dein Endprodukt](#endprodukt)
- [Wo du arbeitest](#wo-du-arbeitest)
- [Einleitung](#einleitung)
- [Übungen](#uebungen)
  - [Ü1 · Datensatz laden](#ue1)
  - [Ü2 · Datenstruktur erkunden](#ue2)
  - [Ü3 · Datentypen verstehen](#ue3)
  - [Ü4 · Debugging: Typischer Ladefehler](#ue4)
  - [Ü5 · Erste Histogramme](#ue5)
  - [Ü6 · Interpretation: Was sagen die Verteilungen?](#ue6)
  - [Ü7 · Code-Kommentare: Was und warum](#ue7)
  - [Bonus-Übungen](#bonus-uebungen)
- [Hausaufgaben](#hausaufgaben)
  - [HA1 · OWID-Datensatz erkunden](#ha1)
  - [HA2 · Fehlende Werte prüfen](#ha2)
  - [HA3 · Histogramm der Lebenserwartung erstellen](#ha3)
  - [Bonus-Hausaufgaben](#bonus-hausaufgaben)
- [Abgabe](#abgabe)

---

<h2 id="endprodukt">Dein Endprodukt</h2>

**Frage dieser Sitzung:** Wie ist die Lebenserwartung weltweit verteilt — und was sagt uns diese Verteilung über globale Ungleichheit?

Am Ende dieser Sitzung wirst du:

- einen echten CSV-Datensatz in R laden können
- die Struktur eines Datensatzes systematisch erkunden können
- fehlende Werte erkennen und zählen können
- einfache, beschriftete Histogramme mit ggplot2 erstellen können
- das folgende Diagramm erstellt und interpretiert haben

---

### Zielddiagramm: Verteilung der Lebenserwartung 2015

> **Hinweis für Lehrkraft:** Hier Bild `output/life_expectancy_histogram_2015.png` einfügen, nachdem es erstellt wurde.

Der folgende Code (aus den Hausaufgaben) erzeugt dieses Diagramm:

```r
ggplot(owid_2015, aes(x = life_expectancy_birth)) +
  geom_histogram(bins = 25, fill = "#4472C4", color = "white") +
  labs(
    title = "Verteilung der Lebenserwartung bei Geburt (2015)",
    x = "Lebenserwartung bei Geburt (Jahre)",
    y = "Anzahl Länder",
    caption = "Quelle: Our World in Data"
  )
```

*Das Histogramm zeigt die Verteilung der Lebenserwartung aller Länder im OWID-Datensatz für das Jahr 2015. Die meisten Länder liegen bei über 65 Jahren, wenige noch deutlich darunter. Die Verteilung ist linksschief. Was bedeutet das für globale Ungleichheit? Das wirst du in HA3 D herausfinden.*

---

<h2 id="wo-du-arbeitest">Wo du arbeitest</h2>

Alle Code-Aufgaben dieser Sitzung bearbeitest du in **einem einzigen Skript**:

**`scripts/session_03_skript.R`**

### Schritt-für-Schritt

1. Vergewissere dich, dass du das Projekt `session_03.Rproj` geöffnet hast. Oben rechts in RStudio sollte klein **„session_03"** stehen.
2. Öffne das Skript `scripts/session_03_skript.R`. Klicke dazu oben links auf das kleine Ordner-Icon in RStudio, gehe in den `scripts`-Ordner und öffne dort die Datei.
3. **Führe zuerst den SETUP-Abschnitt aus** — er ist am Anfang des Skripts klar mit `SETUP — ZUERST AUSFÜHREN!` markiert. Markiere alle Zeilen bis zur nächsten Sektion und drücke `Ctrl+Enter` / `Cmd+Enter`. Damit werden Pakete geladen und beide Datensätze (Übungen und Hausaufgaben) vorbereitet.
4. Bearbeite dann die Übungen der Reihe nach in den Abschnitten `ÜBUNGEN`.
5. Die Hausaufgaben bearbeitest du zu Hause im Abschnitt `HAUSAUFGABEN`.

> **Wichtig:** Schreibe deinen Code immer in die markierten Abschnitte im Skript — nicht in die Konsole. Nur dann bleibt deine Arbeit gespeichert.

### Lösungen und Tipps

Tipps und Lösungen findest du als aufklappbare Abschnitte direkt unterhalb jeder Aufgabe in diesem Dokument.

---

<h2 id="einleitung">Einleitung: Unser R-Abenteuer beginnt!</h2>

In Session 2 hast du Werte von Hand als Vektor eingegeben. Ab heute arbeiten wir mit echten Daten aus einer echten Datei: Wir laden einen CSV-Datensatz, prüfen seine Struktur und erstellen erste Visualisierungen.

Ein CSV ist eine Textdatei mit tabellarischen Daten — ähnlich wie eine Tabelle in Excel, aber ohne Formatierung. Daten werden sehr häufig in diesem Format gespeichert und geteilt.

Der Fokus dieser Sitzung liegt auf dem **Workflow**:

- Daten korrekt laden
- Struktur systematisch prüfen
- Einfache Visualisierungen erstellen
- Ergebnisse kurz inhaltlich einordnen

In den Übungen arbeitest du mit einem kleinen Toy-Datensatz (20 Länder, Jahr 2015). In den Hausaufgaben wendest du dieselben Schritte auf den vollständigen OWID-Datensatz an — und beantwortest dabei unsere Frage für diese Sitzung.

---

<h2 id="uebungen">Übungen</h2>

<h3 id="ue1">Ü1 · Datensatz laden</h3>

### Was ist neu?

Mit `read_csv()` (aus dem tidyverse-Paket) laden wir eine CSV-Datei in R als Tibble:

```r
mein_datensatz <- read_csv("der/Pfad/zur/datei.csv")
```

Für den Dateipfad nutzen wir `here()`, das den Pfad automatisch relativ zum geöffneten Projekt aufbaut:

```r
here("data", "toy_data_session_03.csv")
```

Das verhindert viele „Datei nicht gefunden"-Fehler, weil der Pfad immer vom Projektordner ausgeht — unabhängig davon, wo auf deinem Computer der Ordner liegt.

Ein Datensatz sollte immer einem Objekt zugewiesen werden, damit wir ihn weiterverarbeiten können. Zur Erinnerung:

```r
mein_vektor <- c(1, 2, 3)
```

Genauso:

```r
session_03_daten <- read_csv(here("data", "toy_data_session_03.csv"))
```

### Deine Aufgaben

Schreibe den Code für a) bis c) in den Abschnitt **Ü1** in `scripts/session_03_skript.R`.

a) Lade `data/toy_data_session_03.csv` in ein Objekt namens `session_03_daten`.
b) Lass dir `session_03_daten` ausgeben (tippe einfach den Objektnamen und führe die Zeile aus).
c) Prüfe mit `class()`, welcher Objekttyp das neue Objekt ist.

<br>

<details>
<summary><strong>Tip</strong></summary>

Arbeite in drei Schritten:

1. `read_csv(here(...))` dem Objekt `session_03_daten` zuweisen
2. Objektnamen allein ausführen
3. `class(session_03_daten)` ausführen

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
session_03_daten <- read_csv(here("data", "toy_data_session_03.csv"))

session_03_daten

class(session_03_daten)
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue2">Ü2 · Datenstruktur erkunden</h3>

### Warum wollen wir die Struktur kennen?

Bevor du mit einer Analyse loslegst, solltest du immer erst verstehen, wie deine Daten aussehen:

- Wie viele Zeilen und Spalten gibt es?
- Wie heißen die Variablen?
- Welchen Datentyp hat jede Variable?

Diese Informationen helfen dir einzuschätzen, was du mit den Daten machen kannst und was nicht.

### Nützliche Funktionen zur Daten-Erkundung

| Funktion | Was sie zeigt |
|----------|--------------|
| `glimpse()` | Übersicht über Variablen, Typen und Beispielwerte |
| `head(datensatz, n)` | Erste `n` Zeilen |
| `tail(datensatz, n)` | Letzte `n` Zeilen |
| `nrow()` | Anzahl Zeilen |
| `ncol()` | Anzahl Spalten |

### Deine Aufgabe

Schreibe den Code in den Abschnitt **Ü2** in `scripts/session_03_skript.R`.

Wende alle fünf Funktionen auf `session_03_daten` an. Für `head()` und `tail()` gib als zweites Argument `5` an.

Notiere anschließend **2 kurze Beobachtungen** als Kommentar im Skript (z. B. „Es gibt X Länder", „Variable Y ist numerisch").

Kommentare beginnen mit `#` — R ignoriert sie beim Ausführen:

```r
# Das ist ein Kommentar
```

<br>

<details>
<summary><strong>Tip</strong></summary>

Rufe jede Funktion einmal mit `session_03_daten` auf. Für `head()` und `tail()`: `head(session_03_daten, 5)`.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
glimpse(session_03_daten)
head(session_03_daten, 5)
tail(session_03_daten, 5)
nrow(session_03_daten)
ncol(session_03_daten)

# Beobachtung 1: ...
# Beobachtung 2: ...
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue3">Ü3 · Datentypen verstehen</h3>

Mit `$` greifst du einzelne Spalten aus einem Tibble heraus:

```r
session_03_daten$country
session_03_daten$gdp_per_capita
```

Mit `class()` siehst du den Datentyp einer Spalte:

```r
class(session_03_daten$country)
```

### Deine Aufgaben

Schreibe den Code in den Abschnitt **Ü3** in `scripts/session_03_skript.R`.

a) Prüfe die Klassen von `country`, `region`, `year`, `gdp_per_capita` und `life_expectancy_birth`.
b) Welche Variablen sind Text (`character`), welche sind Zahlen (`numeric` oder `integer`)?
c) Warum wäre `mean(session_03_daten$country)` unsinnig? Probiere es aus: Berechne `mean()` einmal auf `country` und einmal auf `gdp_per_capita` und vergleiche die Ergebnisse.

> **👥 Partneraufgabe:** Besprich mit deiner Nachbar:in: Was kannst du mit jeder Variablen machen, was nicht? Notiere 1–2 Beispiele als Kommentar.

<br>

<details>
<summary><strong>Tip</strong></summary>

Für a): `class(session_03_daten$country)` — wiederhole das für alle genannten Variablen.

Für c): Führe `mean(session_03_daten$country)` und `mean(session_03_daten$gdp_per_capita)` aus — lies die Fehlermeldung.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
class(session_03_daten$country)
class(session_03_daten$region)
class(session_03_daten$year)
class(session_03_daten$gdp_per_capita)
class(session_03_daten$life_expectancy_birth)

mean(session_03_daten$country)
mean(session_03_daten$gdp_per_capita)
```

`mean()` auf `country` gibt eine Warnung und `NA` zurück, weil R keinen Mittelwert aus Textwerten berechnen kann. Auf `gdp_per_capita` (numerisch) funktioniert es.

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue4">Ü4 · Debugging: Typischer Ladefehler</h3>

Fehler lesen und beheben ist ein zentraler Teil der Datenanalyse. In dieser Übung provozierst du bewusst einen typischen Fehler — und behebst ihn.

### Deine Aufgaben

Schreibe den Code in den Abschnitt **Ü4** in `scripts/session_03_skript.R`.

a) Führe diesen **absichtlich falschen** Befehl aus:

```r
read_csv(here("data", "toy_data_session03.csv"))
```

b) Lies die Fehlermeldung genau: Was ist das Problem? Notiere deine Diagnose als Kommentar im Skript.
c) Korrigiere den Dateinamen und lade den Datensatz korrekt.
d) Schreibe eine kurze Fehlerregel als Kommentar (z. B. „Dateinamen immer exakt prüfen").

<br>

<details>
<summary><strong>Tip</strong></summary>

Der Fehler steckt im Dateinamen: `toy_data_session03.csv` statt `toy_data_session_03.csv` — ein fehlender Unterstrich. Wenn du ihn nicht sofort siehst: Öffne im Datei-Explorer den Ordner `session_03/data/` und schau, wie die Datei wirklich heißt.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# absichtlich falsch:
read_csv(here("data", "toy_data_session03.csv"))

# Diagnose: fehlender Unterstrich im Dateinamen

# korrigiert:
session_03_daten <- read_csv(here("data", "toy_data_session_03.csv"))

# Fehlerregel: Dateinamen immer exakt prüfen — Unterstriche, Groß-/Kleinschreibung, Dateiendung.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue5">Ü5 · Erste Histogramme</h3>

Ein Histogramm zeigt, wie sich Werte verteilen — es teilt eine Variable in Gruppen ein und zählt, wie viele Beobachtungen in jede Gruppe fallen.

Mit `ggplot2` (Teil des tidyverse) sieht das Grundmuster so aus:

```r
ggplot(session_03_daten, aes(x = life_expectancy_birth)) +
  geom_histogram()
```

- `ggplot()` startet die Grafik und bekommt den Datensatz als erstes Argument.
- `aes(x = ...)` legt fest, welche Variable auf der x-Achse dargestellt wird.
- `geom_histogram()` zeichnet das Histogramm.
- `+` verbindet Schichten der Grafik.

Mit `labs()` fügen wir sinnvolle Beschriftungen hinzu:

```r
ggplot(session_03_daten, aes(x = life_expectancy_birth)) +
  geom_histogram() +
  labs(
    title = "Titel der Grafik",
    x = "Beschriftung x-Achse",
    y = "Beschriftung y-Achse",
    caption = "Quelle: Our World in Data"
  )
```

### Deine Aufgaben

Schreibe den Code in den Abschnitt **Ü5** in `scripts/session_03_skript.R`.

a) Erstelle ein Histogramm von `child_mortality_rate` aus `session_03_daten`.
b) Füge dem Histogramm aus a) mit `labs()` einen Titel, Achsenbeschriftungen und eine Quellenangabe hinzu.
c) Erstelle ein zweites Histogramm für `gdp_per_capita`.

<br>

<details>
<summary><strong>Tip</strong></summary>

Nutze für jedes Histogramm das Grundmuster:
`ggplot(session_03_daten, aes(x = ...)) + geom_histogram() + labs(...)`

Für die Achsen: Variablenname (x-Achse) und „Anzahl Beobachtungen" (y-Achse). Quelle: „Our World in Data".

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
ggplot(session_03_daten, aes(x = child_mortality_rate)) +
  geom_histogram(bins = 20, fill = "#4472C4", color = "white") +
  labs(
    title = "Verteilung der Kindessterblichkeit",
    x = "Kindessterblichkeit",
    y = "Anzahl Beobachtungen",
    caption = "Quelle: Our World in Data"
  )

ggplot(session_03_daten, aes(x = gdp_per_capita)) +
  geom_histogram(bins = 20, fill = "#E07B39", color = "white") +
  labs(
    title = "Verteilung des BIP pro Kopf",
    x = "BIP pro Kopf (USD)",
    y = "Anzahl Beobachtungen",
    caption = "Quelle: Our World in Data"
  )
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue6">Ü6 · Interpretation: Was sagen die Verteilungen?</h3>

> **👥 Partneraufgabe — kein neuer Code notwendig**

Schaut euch eure Histogramme aus Ü5 an und besprecht:

- Wo liegen die meisten Länder bei der Kindessterblichkeit?
- Ist die Verteilung eher symmetrisch oder schief?
- Wie unterscheidet sich das Bild bei `gdp_per_capita`?
- Was lernt ihr aus diesen beiden Visualisierungen über globale Ungleichheit?

Haltet **3 kurze Stichpunkte** als Kommentar im Abschnitt **Ü6** in `scripts/session_03_skript.R` fest.

<br>

<details>
<summary><strong>Tip</strong></summary>

Beschreibt zuerst die Form (schief/symmetrisch), dann den Vergleich beider Variablen, dann eure inhaltliche Einschätzung.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# 1. Bei child_mortality_rate liegen viele Länder im unteren Bereich (unter ~2%).
#    Die Verteilung ist rechtsschief — wenige Länder haben sehr hohe Werte.
# 2. gdp_per_capita ist ebenfalls rechtsschief, mit einem langen rechten Ausläufer.
# 3. Beide Variablen zeigen: globale Ungleichheit ist stark ausgeprägt.
#    Wenige Länder haben sehr hohe Werte, viele Länder konzentrieren sich im unteren Bereich.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ue7">Ü7 · Code-Kommentare: Was und warum</h3>

In dieser Sitzung führst du erstmals ein vollständiges Skript durch. Gute Kommentare helfen dir und anderen, den Code später zu verstehen.

Schreibe in deinen Abschnitt **Ü7** in `scripts/session_03_skript.R`:

- Für jede Übung eine kurze Abschnittsüberschrift
- Mindestens 2 Kommentare, die erklären **warum** etwas gemacht wird (nicht nur was)

Schlechtes Beispiel:

```r
# Datensatz laden
session_03_daten <- read_csv(...)
```

Gutes Beispiel:

```r
# Wir laden die CSV zuerst, damit alle späteren Auswertungen auf demselben Objekt basieren.
session_03_daten <- read_csv(...)
```

<br>

<details>
<summary><strong>Tip</strong></summary>

Geh dein Skript durch und füge vor jedem Übungsblock eine Kommentar-Überschrift ein. Bei mindestens zwei Stellen: schreibe den Zweck des folgenden Codes, nicht nur eine Beschreibung.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# === Übung 2: Datensatz strukturell erkunden ===
# Wir prüfen zuerst die Struktur, damit wir wissen, welche Variablen numerisch sind
# und welche Operationen sinnvoll sind.
glimpse(session_03_daten)

# Zeilen- und Spaltenanzahl gibt uns die Dimensionen des Datensatzes.
nrow(session_03_daten)
ncol(session_03_daten)
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h2 id="bonus-uebungen">Bonus-Übungen</h2>

### Bonus 1 · `summary()` gezielt nutzen

Die Funktion `summary()` gibt dir einen schnellen Überblick über Minimum, Maximum, Median, Mittelwert und Quartile einer Variable.

Nutze `summary()` auf:

- `session_03_daten$life_expectancy_birth`
- `session_03_daten$gdp_per_capita`

Welche Kennzahlen helfen dir am meisten für eine schnelle Orientierung? Notiere eine kurze Einschätzung als Kommentar.

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
summary(session_03_daten$life_expectancy_birth)
summary(session_03_daten$gdp_per_capita)

# Besonders hilfreich sind Median und Quartile, weil sie robuster gegen Ausreißer sind
# als der Mittelwert.
```

</details>

---

### Bonus 2 · Histogramm-Feintuning

In `geom_histogram()` legt `bins` fest, wie viele Gruppen gebildet werden.

Erstelle zwei Histogramme für `gdp_per_capita`:

- eins mit `bins = 6`
- eins mit `bins = 15`

Welche Einstellung ist informativer? Notiere deine Begründung als Kommentar.

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
ggplot(session_03_daten, aes(x = gdp_per_capita)) +
  geom_histogram(bins = 6)

ggplot(session_03_daten, aes(x = gdp_per_capita)) +
  geom_histogram(bins = 15)

# Mit mehr bins sieht man mehr Detailstruktur in der Verteilung.
# Mit weniger bins erkennt man den groben Trend besser.
# Für einen ersten Überblick sind 10–20 bins oft ein guter Ausgangspunkt.
```

</details>

---

### Bonus 3 ⚠️ · Erste Korrelation (nur Exploration)

Berechne die Korrelation zwischen `gdp_per_capita` und `life_expectancy_birth`:

```r
cor(session_03_daten$gdp_per_capita, session_03_daten$life_expectancy_birth)
```

Schreibe 2 Sätze: Wie stark und in welche Richtung ist der Zusammenhang? Was bedeutet das inhaltlich?

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
cor(session_03_daten$gdp_per_capita, session_03_daten$life_expectancy_birth)

# Die Korrelation ist positiv: höheres BIP pro Kopf geht tendenziell mit
# höherer Lebenserwartung einher. Der Wert liegt typischerweise bei r > 0.7 —
# das ist ein starker Zusammenhang. Korrelation bedeutet aber nicht Kausalität.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h2 id="hausaufgaben">Hausaufgaben</h2>

Die Hausaufgaben bearbeitest du zu Hause im Abschnitt **HAUSAUFGABEN** in `scripts/session_03_skript.R`.

Du arbeitest dort mit `owid_daten` — dem vollständigen OWID-Datensatz, der bereits im SETUP-Abschnitt geladen wurde. Führe den SETUP-Abschnitt erneut aus, bevor du beginnst.

**Ziel der Hausaufgaben:** Beantworte die Frage dieser Sitzung auf Basis des echten, vollständigen Datensatzes: *Wie ist die Lebenserwartung weltweit verteilt?*

---

<h3 id="ha1">HA1 · OWID-Datensatz erkunden</h3>

### Ziel

Du dokumentierst die Grundstruktur des vollständigen OWID-Datensatzes, mit dem wir das ganze Semester arbeiten werden.

### Aufgaben

Schreibe den Code in den Abschnitt **HA1** in `scripts/session_03_skript.R`.

#### HA1 A: Grundstruktur prüfen

Wende die folgenden Funktionen auf `owid_daten` an:

- `nrow()`
- `ncol()`
- `names()`
- `glimpse()`

#### HA1 B: Drei Beobachtungen dokumentieren

Notiere **3 Beobachtungen** als Kommentare im Skript (z. B. Anzahl Länder/Jahre, auffällige Variablen, Datentypen).

#### HA1 C: Plausibilitätschecks

Führe aus:

- `class(owid_daten$life_expectancy_birth)`
- `summary(owid_daten$life_expectancy_birth)`

Notiere, was dir auffällt.

<br>

<details>
<summary><strong>Tip</strong></summary>

Starte mit dem bereits geladenen Objekt `owid_daten`. Rufe die vier Prüf-Funktionen einzeln auf. Bei `names()` wird eine lange Liste von Variablennamen ausgegeben — kein Grund zur Sorge.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
nrow(owid_daten)
ncol(owid_daten)
names(owid_daten)
glimpse(owid_daten)

# Beobachtung 1: Der Datensatz hat viele Zeilen — Länder über viele Jahre hinweg.
# Beobachtung 2: Es gibt viele Variablen, darunter Gesundheit, Wirtschaft, Ungleichheit.
# Beobachtung 3: Nicht alle Variablen sind numerisch — z. B. country und region sind Text.

class(owid_daten$life_expectancy_birth)
summary(owid_daten$life_expectancy_birth)
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha2">HA2 · Fehlende Werte prüfen</h3>

### Ziel

Du prüfst systematisch, wo Daten im OWID-Datensatz fehlen.

### Aufgaben

Schreibe den Code in den Abschnitt **HA2** in `scripts/session_03_skript.R`.

#### HA2 A: Fehlende Werte je Variable zählen

Berechne die Anzahl fehlender Werte für diese drei Variablen mit `sum(is.na(...))`:

- `gini`
- `child_mortality_rate`
- `life_expectancy_birth`

#### HA2 B: Prozentanteile berechnen

Berechne den Prozentanteil fehlender Werte je Variable:

```r
n_miss / nrow(owid_daten) * 100
```

#### HA2 C: Ergebnisse einordnen

Notiere **3–5 Sätze** als Kommentar im Skript:

- Wo fehlen besonders viele Werte?
- Welche Variable wirkt am robustesten?
- Welche Konsequenz hat das für spätere Analysen?

<br>

<details>
<summary><strong>Tip</strong></summary>

Gehe in zwei Schritten vor:

1. `n_miss_gini <- sum(is.na(owid_daten$gini))`
2. `pct_miss_gini <- n_miss_gini / nrow(owid_daten) * 100`

Wiederhole das für `child_mortality_rate` und `life_expectancy_birth`.

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
n_miss_gini  <- sum(is.na(owid_daten$gini))
n_miss_child <- sum(is.na(owid_daten$child_mortality_rate))
n_miss_le    <- sum(is.na(owid_daten$life_expectancy_birth))

pct_miss_gini  <- n_miss_gini  / nrow(owid_daten) * 100
pct_miss_child <- n_miss_child / nrow(owid_daten) * 100
pct_miss_le    <- n_miss_le    / nrow(owid_daten) * 100

# Alle drei Variablen haben viele fehlende Werte, weil sie nicht für alle Jahre
# und Länder verfügbar sind. gini fehlt besonders häufig.
# life_expectancy_birth ist die robusteste Variable der drei.
# Für spätere Analysen müssen wir immer prüfen, welche Daten für unser Zieljahr
# tatsächlich verfügbar sind.
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h3 id="ha3">HA3 · Histogramm der Lebenserwartung erstellen</h3>

### Ziel

Du erstellst das Diagramm, das am Anfang dieser Seite gezeigt wird: ein beschriftetes Histogramm der Lebenserwartung aus dem vollständigen OWID-Datensatz.

### Aufgaben

Schreibe den Code in den Abschnitt **HA3** in `scripts/session_03_skript.R`.

Der Abschnitt enthält bereits diese vorbereitete Zeile — führe sie zuerst aus:

```r
owid_2015 <- owid_daten |> filter(year == 2015)
```

> `filter()` wird in Session 4 eingeführt. Hier nutzt du es schon als Vorgabe: Es wählt nur die Zeilen aus, in denen `year == 2015` gilt. So arbeitest du mit einem Querschnitt für ein einziges Jahr.

#### HA3 A: Histogramm erstellen

Erstelle ein Histogramm von `life_expectancy_birth` aus `owid_2015` mit `ggplot() + geom_histogram()`.

#### HA3 B: Plot beschriften

Erweitere den Plot mit `labs()`:

- einen klaren Titel
- sinnvolle Achsenbeschriftungen (`x`, `y`)
- eine Quellenangabe im `caption`

Weise den beschrifteten Plot dem Objekt `life_expectancy_histogram` zu.

#### HA3 C: Plausibilitätschecks

Führe aus:

- `nrow(owid_2015)`
- `summary(owid_2015$life_expectancy_birth)`
- `class(owid_2015$life_expectancy_birth)`

Notiere kurz, was du siehst.

#### HA3 D: Verteilung interpretieren

Schreibe **3 Sätze Interpretation** als Kommentar im Skript:

- Wo liegt der Hauptbereich der Verteilung?
- Ist die Verteilung eher symmetrisch oder schief?
- Was könnte das für globale Ungleichheit bedeuten?

#### HA3 E: Plot speichern

Erstelle einen Unterordner `output/` in deinem Projektordner und speichere den Plot:

```r
dir.create(here("output"), showWarnings = FALSE)

ggsave(
  here("output", "life_expectancy_histogram_2015.png"),
  plot   = life_expectancy_histogram,
  width  = 8,
  height = 5
)
```

<br>

<details>
<summary><strong>Hinweis</strong></summary>

Nutze direkt `owid_2015` als Datensatz in `ggplot()`.

Grundmuster:
```r
life_expectancy_histogram <- ggplot(owid_2015, aes(x = life_expectancy_birth)) +
  geom_histogram() +
  labs(...)
```

Für `ggsave()` muss das Objekt `life_expectancy_histogram` in deiner Umgebung vorhanden sein (d.h. die Zeile mit der Zuweisung muss ausgeführt worden sein).

</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
owid_2015 <- owid_daten |> filter(year == 2015)

life_expectancy_histogram <- ggplot(owid_2015, aes(x = life_expectancy_birth)) +
  geom_histogram(bins = 25, fill = "#4472C4", color = "white") +
  labs(
    title   = "Verteilung der Lebenserwartung bei Geburt (2015)",
    x       = "Lebenserwartung bei Geburt (Jahre)",
    y       = "Anzahl Länder",
    caption = "Quelle: Our World in Data"
  )

life_expectancy_histogram

nrow(owid_2015)
summary(owid_2015$life_expectancy_birth)
class(owid_2015$life_expectancy_birth)

# Die Verteilung ist linksschief: die meisten Länder haben eine Lebenserwartung
# von über 65 Jahren, nur wenige liegen noch deutlich darunter.
# Es gibt einen langen linken Ausläufer mit wenigen Ländern mit sehr niedriger
# Lebenserwartung.
# Das zeigt: Während ein Großteil der Welt heute lange lebt, gibt es noch immer
# eine kleine Gruppe von Ländern mit deutlich schlechteren Gesundheitsaussichten —
# ein Zeichen anhaltender globaler Ungleichheit.

dir.create(here("output"), showWarnings = FALSE)

ggsave(
  here("output", "life_expectancy_histogram_2015.png"),
  plot   = life_expectancy_histogram,
  width  = 8,
  height = 5
)
```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h2 id="bonus-hausaufgaben">Bonus-Hausaufgaben</h2>

### B-HA1 · Zweites Histogramm: GDP

Erstelle ein Histogramm von `gdp` (aus `owid_2015`, nur Zeilen ohne NA in `gdp`).

Vergleiche die Verteilung schriftlich (als Kommentar) mit der Lebenserwartung:

- Was können wir aus diesen beiden Verteilungen für Informationen ziehen?
- Welche Verteilung ist schiefer?

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
ggplot(owid_2015, aes(x = gdp)) +
  geom_histogram(bins = 25)

# Die GDP-Verteilung ist stark rechtsschief: viele Länder haben niedrige GDP-Werte,
# sehr wenige haben extrem hohe.
# Im Gegensatz dazu ist die Lebenserwartung linksschief — die meisten Länder
# haben hohe Werte. Die beiden Verteilungen spiegeln sich in gewissem Sinne:
# Wohlstand ist ungleicher verteilt als Gesundheit.
```

</details>

---

### B-HA2 ⚠️ · `geom_freqpoly()` erkunden

Schlage `geom_freqpoly()` in der ggplot2-Dokumentation nach (z. B. `?geom_freqpoly` oder online) und wende es auf `life_expectancy_birth` aus `owid_2015` an.

- Was zeigt es im Vergleich zum Histogramm besser?
- Was schlechter?

Notiere deine Einschätzung (3–4 Sätze) als Kommentar.

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---

<h2 id="abgabe">Abgabe</h2>

Wenn du mit den Hausaufgaben fertig bist:

1. Speichere das Skript `scripts/session_03_skript.R` (Datei → Speichern oder `Ctrl+S` / `Cmd+S`).
2. Stelle sicher, dass der Plot in `output/life_expectancy_histogram_2015.png` gespeichert wurde.
3. Reiche auf Learnweb ein:
   - die Datei `scripts/session_03_skript.R`
   - die Datei `output/life_expectancy_histogram_2015.png`

> **Falls etwas nicht funktioniert:** Lies zuerst die Fehlermeldung, frage deine Buddy-Partner:in, schlage in den [häufigen Fehlern](../../resources/other/common_errors.md) nach oder melde dich im Seminar.

---

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>
