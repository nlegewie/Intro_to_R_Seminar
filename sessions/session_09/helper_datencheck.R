# =============================================================================
# HILFSFUNKTIONEN: Machbarkeit prüfen
# -----------------------------------------------------------------------------
# So benutzt du diese Datei:
#   1. Einmal am Anfang deines Skripts ausführen:  source("R/helper_datencheck.R")
#   2. Dann die Funktionen aufrufen (Beispiele stehen bei jeder Funktion).
#
# Die Funktionen erwarten den OWID-Datensatz und Variablennamen als Text
# in Anführungszeichen, z.B. "gini" oder c("gini", "democracy_score").
# =============================================================================

library(tidyverse)


# -----------------------------------------------------------------------------
# nur_laender(): entfernt Aggregate und historische Gebilde.
# Echte Länder haben eine Weltregion (world_region).
# -----------------------------------------------------------------------------
# Beispiel:
#   laender <- nur_laender(owid)
nur_laender <- function(daten) {
  daten %>% filter(!is.na(world_region))
}


# -----------------------------------------------------------------------------
# variable_pruefen(): Grund-Steckbrief EINER Variable.
# Gibt zurück: Anzahl Werte, Jahresspanne, Anzahl Länder.
# -----------------------------------------------------------------------------
# Beispiel:
#   variable_pruefen(laender, "gini")
variable_pruefen <- function(daten, variable) {
  daten %>%
    filter(!is.na(.data[[variable]])) %>%
    summarise(
      variable    = variable,
      n_werte     = n(),
      jahr_von    = min(year),
      jahr_bis    = max(year),
      n_laender   = n_distinct(country)
    )
}


# -----------------------------------------------------------------------------
# abdeckung_pro_jahr(): Für die Variablen, die du zusammen brauchst —
# wie viele Länder haben in jedem Jahr ALLE davon gleichzeitig?
# So findest du das beste Jahr (oder den besten Zeitraum) für deine Analyse.
# -----------------------------------------------------------------------------
# Beispiel (zwei Variablen ab dem Jahr 2000):
#   abdeckung_pro_jahr(laender, c("gini", "democracy_score"), ab_jahr = 2000)
abdeckung_pro_jahr <- function(daten, variablen, ab_jahr = 2000) {
  daten %>%
    filter(year >= ab_jahr) %>%
    mutate(hat_alle = rowSums(!is.na(across(all_of(variablen)))) == length(variablen)) %>%
    group_by(year) %>%
    summarise(laender_mit_allen = sum(hat_alle)) %>%
    arrange(desc(year))
}


# -----------------------------------------------------------------------------
# gruppengroessen(): Wenn du Gruppen vergleichst (Journey J4) —
# wie viele Länder stecken in jeder Gruppe? Kleine Gruppen (< 5) sind ein
# Warnsignal und gehören später in deine Interpretation.
# -----------------------------------------------------------------------------
# Beispiel:
#   laender %>% filter(year == 2018) %>% gruppengroessen("democracy_score_string")
gruppengroessen <- function(daten, gruppen_variable) {
  daten %>%
    filter(!is.na(.data[[gruppen_variable]])) %>%
    count(.data[[gruppen_variable]], name = "n_laender") %>%
    arrange(desc(n_laender))
}
