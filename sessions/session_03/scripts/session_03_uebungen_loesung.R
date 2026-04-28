###***************************************###
###***************************************###
##### ***SESSION 03 UEBUNGEN LOESUNG*** #####
###***************************************###
###***************************************###

# Musterloesung fuer die script-basierte Bearbeitung der Uebungen.
# Diese Datei passt zum Workflow in session_03_uebungen_template.R.


###***************************************###
##### ***PAKETE UND DATEIPFADE LADEN*** #####
###***************************************###

library(tidyverse)
library(here)


###***************************************###
##### ***UEBUNG 1 CSV LADEN UND PRUEFEN*** #####
###***************************************###

# a) CSV laden
session_03_daten <- read_csv(
  here("data", "toy_data_session_03.csv"),
  show_col_types = FALSE
)

# b) Datensatz anzeigen
session_03_daten

# c) Objekttyp pruefen
class(session_03_daten)


###***********************************###
##### ***UEBUNG 2 STRUKTUR PRUEFEN*** #####
###***********************************###

glimpse(session_03_daten)
head(session_03_daten, 5)
tail(session_03_daten, 5)
nrow(session_03_daten)
ncol(session_03_daten)

# Beobachtung 1: session_03_daten hat 20 Zeilen und 6 Spalten.
# Beobachtung 2: country und region sind character; die Messvariablen sind numerisch.


###***********************************###
##### ***UEBUNG 3 DATENTYPEN PRUEFEN*** #####
###***********************************###

class(session_03_daten$country)
class(session_03_daten$region)
class(session_03_daten$year)
class(session_03_daten$gdp_per_capita)
class(session_03_daten$life_expectancy_birth)

mean(session_03_daten$country)
mean(session_03_daten$gdp_per_capita)

# country ist Text, daher ist es unsinnig mean() darauf anzuwenden.


###*******************************************###
##### ***UEBUNG 4 DEBUGGING DATEINAME PRUEFEN*** #####
###*******************************************###

# Absichtlich falsch:
read_csv(here("data", "toy_data_session03.csv"), show_col_types = FALSE)

# Korrigiert:
session_03_daten <- read_csv(
  here("data", "toy_data_session_03.csv"),
  show_col_types = FALSE
)

# Fehlerregel:
# Dateinamen immer exakt pruefen (Unterstriche, Gross/Kleinschreibung, Endung).


###************************************###
##### ***UEBUNG 5 HISTOGRAMME BAUEN*** #####
###************************************###

ggplot(session_03_daten, aes(x = child_mortality_rate)) +
  geom_histogram(bins = 20, fill = "#4472C4", color = "white") +
  labs(
    title = "Verteilung der Kindessterblichkeit",
    x = "Kindessterblichkeit",
    y = "Anzahl Beobachtungen",
    caption = "Quelle: Our World in Data"
  ) +
  theme_minimal()

ggplot(session_03_daten, aes(x = gdp_per_capita)) +
  geom_histogram(bins = 20, fill = "#E07B39", color = "white") +
  labs(
    title = "Verteilung des BIP pro Kopf",
    x = "BIP pro Kopf",
    y = "Anzahl Beobachtungen",
    caption = "Quelle: Our World in Data"
  ) +
  theme_minimal()


###**************************************###
##### ***ÜBUNG 6 KURZ INTERPRETIEREN*** #####
###**************************************###

# Bei child_mortality_rate liegen viele Laender im unteren Bereich, mit Werten bei der Kindersterblichkeit unter ~2%.
# Die Verteilung wirkt rechtsschief, mit wenigen Ländern bei sehr hohen Werten.
# gdp_per_capita ist ebenfalls rechtsschief, aber weniger stark als child_mortality_rate.


###************************************###
##### ***ÜBUNG 7 GUTE KOMMENTARE*** #####
###************************************###

# === Übung 2 Datensatz strukturell erkunden ===
# Wir pruefen zuerst die Struktur, damit spaetere Analysen die richtigen Datentypen nutzen.
glimpse(session_03_daten)

# Wir schauen Zeilen und Spalten an, um die Datengroesse einzuordnen.
nrow(session_03_daten)
ncol(session_03_daten)


###***********************************###
##### ***BONUS 1 SUMMARY NUTZEN*** #####
###***********************************###

summary(session_03_daten$life_expectancy_birth)
summary(session_03_daten$gdp_per_capita)

# Hilfreich fuer schnellen Ueberblick: Median, Quartile, Min und Max.


###************************************###
##### ***BONUS 2 BINS VERGLEICHEN*** #####
###************************************###

ggplot(session_03_daten, aes(x = gdp_per_capita)) +
  geom_histogram(bins = 6)

ggplot(session_03_daten, aes(x = gdp_per_capita)) +
  geom_histogram(bins = 15)

# Mit mehr bins sieht man mehr Detailstruktur, mit weniger bins den groben Trend.


###**************************************###
##### ***BONUS 3 KORRELATION*** #####
###**************************************###

cor(
  session_03_daten$gdp_per_capita,
  session_03_daten$life_expectancy_birth
)

# Interpretation:
# Die Korrelation ist positiv: hoeheres BIP pro Kopf geht tendenziell mit
# hoeherer Lebenserwartung einher.
# Die Korrelation ist sehr stark (r = 0.82)
# Das bedeutet nicht automatisch, dass BIP die Ursache ist.

