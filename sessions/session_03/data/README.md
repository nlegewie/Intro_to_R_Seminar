# Daten für Session 3

Dieser Ordner enthält die **Toy-Daten** für die Übungen in dieser Sitzung.

## Dateien

### `toy_data_session_03.csv`

Kleiner Übungsdatensatz für die Übungen in der Sitzung.

- **20 Länder**, Jahr 2015
- Variablen: `country`, `year`, `region`, `gdp_per_capita`, `life_expectancy_birth`, `child_mortality_rate`
- Keine fehlenden Werte — bewusst sauber gehalten, damit du dich auf den Workflow konzentrieren kannst

Dieser Datensatz ist eine Auswahl aus dem vollständigen OWID-Datensatz und wurde mit `set.seed(42)` für Reproduzierbarkeit erstellt.

## Vollständiger OWID-Datensatz (Hausaufgaben)

Der große Datensatz **`owid_data.csv`** liegt **nicht** in jedem `data/`-Ordner unter `sessions/`, sondern **einmal zentral** unter:

```
Intro_to_R_Seminar/full_data/owid_data.csv
```

Das Skript `scripts/session_03_skript.R` lädt ihn im SETUP automatisch über `here("..", "..", "full_data", "owid_data.csv")`.

> **Ordnerstruktur:** Entpacke das **gesamte** Repository so, dass `full_data/` und `sessions/` **nebeneinander** im selben Hauptordner liegen. Wenn du nur den Ordner `session_03/` ohne den Rest des Repos herunterlädst, fehlt `full_data/` — dann musst du entweder das volle Repo holen oder `owid_data.csv` manuell aus dem Kurs/Material an die oben genannte Stelle legen.

## Verwendung im Skript (SETUP)

```r
owid_daten       <- read_csv(here("..", "..", "full_data", "owid_data.csv"))  # Hausaufgaben
session_03_daten <- read_csv(here("data", "toy_data_session_03.csv"))        # Übungen
```
