
###***************************************************###
###***************************************************###
##### ***SESSION 6 — ZUGANG ZU BILDUNG WELTWEIT*** #####
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
library(janitor)
library(patchwork)


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
##### Ü1 · Bildungsjahre nach Region #####
###***********************************###





###**********************************************###
##### Ü2 · Analphabetismus nach Weltregion #########
###**********************************************###





###******************************************************###
##### Ü3 · Analphabetismus-Trend über die Zeit #############
###******************************************************###





###************************************************###
##### Ü4 · Die Bildungsschere (Gender-Gap) #########
###************************************************###





###******************************************************###
##### Ü5 · Tertiäre Bildung: Länder-Trends #################
###******************************************************###





###***********************************###
##### B-Ü6 · Demokratie und Bildung ####
###***********************************###





###********************************************************###
##### B-Ü7 · Time-Lag: Zahlt Bildung sich aus? ###############
###********************************************************###





