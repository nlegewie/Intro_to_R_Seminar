
###***********************************************************###
###***********************************************************###
##### ***SESSION 7 — GESCHLECHTERUNGLEICHHEITEN*** #####
###***********************************************************###
###***********************************************************###


###*************************************###
##### ***SETUP — ZUERST AUSFÜHREN!*** #####
###*************************************###

# Führe diesen gesamten Abschnitt aus, BEVOR du mit den Übungen beginnst.
# Dieses Skript wird per source() aus session_07_data_analysis.r geladen.


###******************###
##### Pakete laden #####
###******************###

library(tidyverse)
library(here)


###****************************************** ###
##### Vollständigen OWID-Datensatz laden #####
###****************************************** ###

owid_daten <- read_csv(here("..", "..", "full_data", "owid_data.csv"))


###*************************###
##### ***ÜBUNGEN*** #####
###*************************###

# Bearbeite die Aufgaben der Reihe nach.
# Ausführliche Anleitungen: README.md im Session-Ordner auf GitHub.


###******************************************************###
##### Ü1 · Datenaufbereitung auslagern (source) ##########
###******************************************************###

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

# a) Ergänze primary_gap als Differenz von girls_in_primary und boys_in_primary


# b) Erstelle parity_2015: filter(!is.na(primary_gap)), parity_category mit case_when(),
#    Faktor-Reihenfolge: "Jungen vorne", "etwa gleich", "Mädchen vorne"


# Bonus B-Ü3: Erweitere bei Bedarf den select()-Block oben um weitere Variablen.

