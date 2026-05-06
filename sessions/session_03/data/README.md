# Daten für Session 3

Dieser Ordner enthält die Datensätze für Session 3.

## Dateien

### `toy_data_session_03.csv`

Kleiner Übungsdatensatz für die in-class Übungen.

- **20 Länder**, Jahr 2015
- Variablen: `country`, `year`, `region`, `gdp_per_capita`, `life_expectancy_birth`, `child_mortality_rate`
- Keine fehlenden Werte — bewusst sauber gehalten, damit du dich auf den Workflow konzentrieren kannst

Dieser Datensatz ist eine Auswahl aus dem vollständigen OWID-Datensatz (s. u.) und wurde mit `set.seed(42)` für Reproduzierbarkeit erstellt.

### `owid_data.csv`

Vollständiger OWID-Datensatz für die Hausaufgaben. Enthält Daten zu Ländern weltweit über viele Jahre.

> **Hinweis:** Diese Datei ist größer. Falls sie in deinem Ordner fehlt, findest du sie im Ordner `full_data/` im Hauptverzeichnis des Repos. Kopiere sie in diesen `data/`-Ordner, bevor du mit den Hausaufgaben beginnst.

## Verwendung im Skript

Im SETUP-Abschnitt von `scripts/session_03_skript.R` werden beide Dateien geladen:

```r
owid_daten       <- read_csv(here("data", "owid_data.csv"))       # Hausaufgaben
session_03_daten <- read_csv(here("data", "toy_data_session_03.csv"))  # Übungen
```
