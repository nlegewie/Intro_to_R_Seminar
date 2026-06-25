
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
##### ***ÜBUNGEN*** #####
###*************************###

# Bearbeite die Aufgaben der Reihe nach.
# Ausführliche Anleitungen: README.md im Session-Ordner auf GitHub.


###***********************************###
##### Ü1 · Datenaufbereitung #####
###***********************************###

##### a #####

owid_daten |> 
  group_by(year) |> 
  summarize(non_na = sum(!is.na(time_use_paid_work))) |> 
  arrange(desc(non_na))

##### b #####

time_use_daten <- owid_daten |>
  filter(year == 2013) |>
  filter(!is.na(time_use_paid_work)) |>
  select(country, world_region, gdp, starts_with("time_use"))
  

##### c #####

nrow(time_use_daten)

time_use_daten |> pull(country)


##### d #####

time_use_daten |>
  count(world_region)


##### e #####

time_use_daten_corrected <- time_use_daten |>
  mutate(world_region = if_else(country == "Korea", "Asia", world_region),
         world_region = if_else(country == "UK", "Europe", world_region),
         world_region = if_else(country == "USA", "North America", world_region))
  
time_use_daten_corrected |>
  filter(is.na(world_region))



###*******************************************###
##### Ü2 · Beschreibung der Variablen #####
###*******************************************###

##### b #####


