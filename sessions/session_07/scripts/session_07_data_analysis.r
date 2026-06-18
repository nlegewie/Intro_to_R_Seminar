
###***********************************************************###
###***********************************************************###
##### ***SESSION 7 — GESCHLECHTERUNGLEICHHEITEN*** #####
###***********************************************************###
###***********************************************************###


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


###***************************###
##### Aufbereitung laden ########
###***************************###

source(here("scripts", "session_07_data_wrangling.r"))


###*************************###
##### ***ÜBUNGEN*** #####
###*************************###

# Bearbeite die Aufgaben der Reihe nach.
# Ausführliche Anleitungen: README.md im Session-Ordner auf GitHub.


###******************************************************###
##### Ü1 · Datenaufbereitung auslagern (source) ##########
###******************************************************###

# c) Prüfe mit glimpse(), dass gender_2015 und parity_2015 existieren


# d) Schreibe 2 Sätze als Kommentar: Warum Aufbereitung in eine eigene Datei auslagern?



###***********************************************************###
##### Ü2 · count(), Anteile, tabyl ############################
###***********************************************************###

# a) count(parity_category), Spalte prop mit Anteilen; Kommentar zu Benachteiligung


# b) count(world_region, parity_category); welche Region fällt auf?


# c) tabyl(world_region, parity_category) mit adorn_totals, adorn_percentages, adorn_pct_formatting


# d) Schreibe 3–4 Sätze Interpretation als Kommentar



###***************************************************###
##### Ü3 · Themes & patchwork #########################
###***************************************************###

# a) Panel 1: parity_counts, geom_col(position = "dodge"), p_parity


# b) Panel 2: Median female_labor_participation je Region, geom_col(), p_labor


# c) Panel 3: Streudiagramm Suizid (female vs. male), geom_abline, p_suicide


# d) labs() für alle Panels; p_parity lesbar machen (theme oder coord_flip)


# e) Kombiniere zu composite mit patchwork und plot_annotation()


# f) Speichere als output/plot_gender_composite.png


# g) Schreibe 3–4 Sätze Interpretation als Kommentar



###*******************************************###
##### Ü4 · Cohen's d ############################
###*******************************************###

# a) Mittelwerte girls_in_primary und boys_in_primary; Differenz in Prozentpunkten


# b) Gepaartes Cohen's d: Länder-Differenz, dann mean() / sd()


# c) Schreibe 3–4 Sätze Interpretation als Kommentar



###***************************************************###
##### Ü5 · Ergebnisse berichten (RMarkdown) ###########
###***************************************************###

# Bearbeite session_07_report.Rmd (nicht dieses Skript):
# a) Setup-Chunk: Pakete und source()
# b) Chunk: Kreuztabelle aus Ü2 mit knitr::kable()
# c) Chunk: kombinierte Abbildung aus Ü3
# d) Interpretation als Fließtext zwischen den Chunks
# e) Bericht zu HTML knitten



###***************************************************###
##### B-Ü1 · Müttersterblichkeit ######################
###***************************************************###

# a) Querschnitt 2015 mit maternal_mortality_ratio, population, gdp, life_expectancy_birth, world_region


# b) Streudiagramm mit Trendlinie, eingefärbt nach world_region


# c) Auffälligste Ausreißer über der Trendlinie labeln (ggrepel oder Residuen)


# d) Schreibe 4–5 Sätze Interpretation als Kommentar



###*******************************************************###
##### B-Ü2 · Die männliche Seite der Ungleichheit #########
###*******************************************************###

# a) Muster in Suizidraten erkunden (Tabellen/Grafiken/Regression)


# b) Muster in Hochschulbildung erkunden


# c) patchwork-Grafik zu einem der Themenbereiche



###*******************************************************###
##### B-Ü3 · Freie Exploration #############################
###*******************************************************###

# 1) Eigene Frage zu gender_wage_gap, domestic_violence_women oder female_homicide_rate
# 2) Variable in session_07_data_wrangling.r ergänzen, source() erneut ausführen
# 3) Mindestens eine Abbildung und eine Tabelle
# 4) 4–5 Sätze Interpretation

