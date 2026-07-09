
###***************************************************###
###***************************************************###
##### ***SESSION 10 — Analyse*** #####
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
library(broom)
library(kableExtra)


###****************************************** ###
##### Vollständigen OWID-Datensatz laden #####
###****************************************** ###

# owid_daten wird in den Übungen verwendet.
# Pfad zur zentralen Datei im Kursrepository (einmal gespeichert, alle Sitzungen):
# Projekt-Stamm ist dieser Sitzungsordner → zwei Ebenen nach oben zum Repo-Stamm → full_data/
owid_daten <- read_csv(here("..", "..", "full_data", "owid_data.csv"))


###*****************************************************###
##### Funktion 1 — Datenabdeckung pro Jahr prüfen #####
###*****************************************************###

# Gibt für jede gewählte Variable an, wie viele Länder in jedem Jahr
# einen Nicht-NA-Wert haben. Das Ergebnis ist absteigend sortiert,
# so sieht man die Jahre mit der besten Abdeckung zuerst.
#
# Nutzung: abdeckung_pro_jahr("life_expectancy_birth")
#          abdeckung_pro_jahr("life_expectancy_birth", "gdp")

pruefe_abdeckung_pro_jahr <- function(...) {
  variablen <- c(...)

  owid_daten |>
    select(year, all_of(variablen)) |>
    filter(if_all(all_of(variablen), \(x) !is.na(x))) |>
    count(year, name = "n_laender") |>
    arrange(desc(n_laender))
}


pruefe_abdeckung_pro_jahr("suicide_rate") %>% 
  ggplot(aes(x = year, y = n_laender)) +
  geom_col()

pruefe_abdeckung_pro_jahr("gini", "suicide_rate", "life_satisfaction") %>% 
  ggplot(aes(x = year, y = n_laender)) +
  geom_col()


###***************************************************###
##### Funktion 2 — Streudiagramm für zwei Variablen #####
###***************************************************###

# Erstellt ein Streudiagramm von var_x (X-Achse) gegen var_y (Y-Achse).
# Achsenbeschriftungen und Titel werden automatisch aus den Variablennamen
# abgeleitet.
#
# Nutzung: gen_streudiagramm("gdp_per_capita", "life_expectancy")

gen_streudiagramm <- function(var_x, var_y) {
  owid_daten |>
    filter(!is.na(.data[[var_x]]), !is.na(.data[[var_y]])) |>
    ggplot(aes(x = .data[[var_x]], y = .data[[var_y]])) +
    geom_point(alpha = 0.4) +
    geom_smooth(method = "lm", se = FALSE) +
    labs(
      title = paste(var_y, "vs.", var_x),
      x     = var_x,
      y     = var_y
    ) +
    theme_bw()
}


gen_streudiagramm("gdp", "life_expectancy_birth")


gen_streudiagramm("gdp", "plastic_waste_generation")

gen_streudiagramm("gdp", "one_person_households")


###*************************************************************###
##### Funktion 2 auf mehrere Variablenpaare anwenden (map) #####
###*************************************************************###

# Definiere die Variablenpaare paarweise: x_variablen[1] wird mit
# y_variablen[1] kombiniert, x_variablen[2] mit y_variablen[2], usw.

x_variablen <- c(
  "gdp",
  "gdp",
  "years_of_schooling"
)

y_variablen <- c(
  "life_expectancy_birth",
  "child_mortality_rate",
  "life_expectancy_birth"
)

# map2() läuft paarweise durch beide Vektoren und gibt eine Liste von Plots zurück.
alle_plots <- map2(x_variablen, y_variablen, gen_streudiagramm)

# Einzelnen Plot aus der Liste ansehen (z. B. das erste Paar):
alle_plots[[1]]
