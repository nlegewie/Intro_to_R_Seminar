
###***************************************************###
###***************************************************###
##### ***SESSION 8 — ZEITNUTZUNG*** #####
###***************************************************###
###***************************************************###


###*************************************###
##### ***SETUP — ZUERST AUSFÜHREN!*** #####
###*************************************###

# Führe diesen gesamten Abschnitt aus, BEVOR du mit den Übungen beginnst.
# Markiere alle Zeilen bis zur nächsten Sektion und drücke Ctrl+Enter / Cmd+Enter.


###******************###
##### Pakete laden #####
###******************###

library(tidyverse)
library(here)


###****************************************** ###
##### Vollständigen OWID-Datensatz laden #####
###****************************************** ###

# owid_daten wird in den Übungen verwendet.
# Pfad zur zentralen Datei im Kursrepository (einmal gespeichert, alle Sitzungen):
# Projekt-Stamm ist dieser Sitzungsordner → zwei Ebenen nach oben zum Repo-Stamm → full_data/
owid_daten <- read_csv(here("..", "..", "full_data", "owid_data.csv"))


###*************************###
##### ***SCHRITT 1*** #####
###*************************###

owid_daten |>
  filter(!is.na(gini)) |>
  summarise(
    n_werte_ges   = n(),
    jahr_von  = min(year),
    jahr_bis  = max(year),
    n_laender = n_distinct(country)
  )


owid_daten |>
  filter(year >= 2000) |>
  filter(!is.na(gini), !is.na(life_satisfaction)) |>
  count(year, name = "laender_mit_beiden") |>
  arrange(desc(laender_mit_beiden))



