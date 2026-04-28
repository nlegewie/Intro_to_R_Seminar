###******************************###
###******************************###
##### ***02 — ANALYSE*** #####
###******************************###
###******************************###

# Snapshot-Ziel: Vollständig bearbeiteter Stand nach Session 3 (Core + Bonus).
# Voraussetzung: 01_homework_clean_data.R wurde bereits ausgeführt.


###***********************************###
##### ***PAKETE UND DATEIPFADE*** #####
###***********************************###

library(tidyverse)
library(here)


###**************************************###
##### ***HA3 — LEBENSERWARTUNGSPLOT*** #####
###**************************************###

life_expectancy_histogram <- ggplot(owid, aes(x = life_expectancy_birth)) +
  geom_histogram(bins = 25, fill = "#4472C4", color = "white") +
  labs(
    title = "Verteilung der Lebenserwartung im OWID-Datensatz",
    x = "Lebenserwartung bei Geburt (Jahre)",
    y = "Anzahl Beobachtungen",
    caption = "Quelle: Our World in Data"
  ) +
  theme_minimal()


###**************************************###
##### ***BONUS B-HA1 — BIP-PLOT*** #####
###**************************************###

gdp_per_capita_histogram <- ggplot(owid, aes(x = gdp_per_capita)) +
  geom_histogram(bins = 25, fill = "#E07B39", color = "white") +
  labs(
    title = "Verteilung des BIP pro Kopf im OWID-Datensatz",
    x = "BIP pro Kopf",
    y = "Anzahl Beobachtungen",
    caption = "Quelle: Our World in Data"
  ) +
  theme_minimal()


###**************************************###
##### ***BONUS B-HA2 — BINS-VERGLEICH*** #####
###**************************************###

life_expectancy_bins10 <- ggplot(owid, aes(x = life_expectancy_birth)) +
  geom_histogram(bins = 10, fill = "#4472C4", color = "white") +
  labs(
    title = "Lebenserwartung (bins = 10)",
    x = "Lebenserwartung bei Geburt (Jahre)",
    y = "Anzahl Beobachtungen"
  ) +
  theme_minimal()

life_expectancy_bins40 <- ggplot(owid, aes(x = life_expectancy_birth)) +
  geom_histogram(bins = 40, fill = "#70AD47", color = "white") +
  labs(
    title = "Lebenserwartung (bins = 40)",
    x = "Lebenserwartung bei Geburt (Jahre)",
    y = "Anzahl Beobachtungen"
  ) +
  theme_minimal()
