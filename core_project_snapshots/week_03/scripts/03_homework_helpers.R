###*******************************###
###*******************************###
##### ***03 — HILFSCODE*** #####
###*******************************###
###*******************************###

# Snapshot-Ziel: Vollständig bearbeiteter Stand nach Session 3 (Core + Bonus).
# In Session 3 ist dieses Skript meist noch knapp; wir halten es bewusst einfach.


###***********************************###
##### ***PAKETE UND DATEIPFADE*** #####
###***********************************###

library(tidyverse)
library(here)


###************************************###
##### ***EINFACHE HILFSFUNKTION*** #####
###************************************###

format_percent <- function(x, digits = 1) {
  paste0(round(x, digits), " %")
}
