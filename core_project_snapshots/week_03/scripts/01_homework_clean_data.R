###*********************************###
###*********************************###
##### ***01 — DATEN EINLESEN*** #####
###*********************************###
###*********************************###

# Snapshot-Ziel: Vollständig bearbeiteter Stand nach Session 3 (Core + Bonus).


###***********************************###
##### ***PAKETE UND DATEIPFADE*** #####
###***********************************###

library(tidyverse)
library(here)


###*****************************###
##### ***DATEN EINLESEN*** #####
###*****************************###

owid <- read_csv(here("data", "owid_data.csv"), show_col_types = FALSE)


###*************************************###
##### ***HA1 — STRUKTUR DOKUMENTIEREN*** #####
###*************************************###

ha1_nrow <- nrow(owid)
ha1_ncol <- ncol(owid)
ha1_names <- names(owid)
ha1_glimpse <- glimpse(owid)


###***************************************###
##### ***HA2 — FEHLENDE WERTE PRÜFEN*** #####
###***************************************###

n_miss_gini <- sum(is.na(owid$gini))
n_miss_child <- sum(is.na(owid$child_mortality_rate))
n_miss_le <- sum(is.na(owid$life_expectancy_birth))

pct_miss_gini <- n_miss_gini / nrow(owid) * 100
pct_miss_child <- n_miss_child / nrow(owid) * 100
pct_miss_le <- n_miss_le / nrow(owid) * 100

na_summary <- tibble(
  variable = c("gini", "child_mortality_rate", "life_expectancy_birth"),
  n_missing = c(n_miss_gini, n_miss_child, n_miss_le),
  pct_missing = c(pct_miss_gini, pct_miss_child, pct_miss_le)
)
