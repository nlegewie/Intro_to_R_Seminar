
###***************************************************###
###***************************************************###
##### ***ABSCHLUSSBERICHT: DATENAUFBEREITUNG*** #####
###***************************************************###
###***************************************************###


###*************************************###
##### ***SETUP*** #####
###*************************************###


###******************###
##### Pakete laden #####
###******************###

library(tidyverse)
library(here)

# Weitere Pakete?


###****************************************** ###
##### Vollständigen OWID-Datensatz laden #####
###****************************************** ###

# owid_daten wird in den Übungen verwendet.
# Pfad zur zentralen Datei im Kursrepository (einmal gespeichert, alle Sitzungen):
# Projekt-Stamm ist dieser Sitzungsordner → zwei Ebenen nach oben zum Repo-Stamm → full_data/
owid_daten <- read_csv(here("..", "..", "full_data", "owid_data.csv"))


###*************************###
##### ***DATENAUFBEREITUNG*** #####
###*************************###


