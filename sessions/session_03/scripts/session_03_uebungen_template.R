###*****************************************###
##### ***SESSION 3 UEBUNGEN TEMPLATE*** #####
###*****************************************###


###***************************###
##### ***SETUP & DATEN*** #####
###***************************###

library(tidyverse)
library(here)

# Datensatz laden
toy <- read_csv(here("data", "toy_data_session_03.csv"), show_col_types = FALSE)


###************************###
##### ***UEBUNG 1*** #####
###************************###

# a) CSV laden und Objekt anlegen
# b) toy ausgeben
# c) class(toy) pruefen


###************************###
##### ***UEBUNG 2*** #####
###************************###

# Struktur erkunden:
# glimpse(toy)
# head(toy, 6)
# tail(toy, 6)
# nrow(toy), ncol(toy), names(toy)


###************************###
##### ***UEBUNG 3*** #####
###************************###

# Datentypen pruefen:
# class(toy$country)
# class(toy$region)
# class(toy$year)
# class(toy$gdp_per_capita)
# class(toy$life_expectancy_birth)


###************************###
##### ***UEBUNG 4*** #####
###************************###

# Fehlende Werte pruefen:
# sum(is.na(toy$gdp_per_capita))
# sum(is.na(toy$life_expectancy_birth))
# sum(is.na(toy$child_mortality_rate))
# sum(is.na(toy))


###************************###
##### ***UEBUNG 5*** #####
###************************###

# Histogramm: life_expectancy_birth
# Histogramm: gdp_per_capita


###************************###
##### ***UEBUNG 6*** #####
###************************###

# Partneraufgabe (Interpretation, keine neue Codierung notwendig)
# Notizen als Kommentare festhalten


###************************###
##### ***UEBUNG 7*** #####
###************************###

# Filter + select + arrange + top 5
toy_kurz <- toy |>
  filter(year == 2015) |>
  select(country, region, gdp_per_capita) |>
  arrange(desc(gdp_per_capita))

toy_kurz |>
  slice_head(n = 5)


###************************###
##### ***UEBUNG 8*** #####
###************************###

# Verifikation:
# nrow(toy) vs. nrow(toy_kurz)
# ncol(toy) vs. ncol(toy_kurz)
# names(toy_kurz)


###***********************###
##### BONUS (OPTIONAL) #####
###***********************###

# Bonus 1: summary() auf zwei Variablen
# Bonus 2: Histogramm mit bins = 6 und bins = 15
# Bonus 3: cor(toy$gdp_per_capita, toy$life_expectancy_birth)
