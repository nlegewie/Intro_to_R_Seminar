
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

# a) Filtere auf 2020, entferne fehlende Werte in years_of_schooling und world_region


# b) Erstelle ein facettiertes Histogramm (facet_wrap) nach world_region


# c) Schreibe 4–5 Sätze Interpretation als Kommentar


# d) Speichere den Plot als plot_bildungsjahre.png



###**********************************************###
##### Ü2 · Analphabetismus nach Weltregion #########
###**********************************************###

# a) Prüfe, in welchem Jahr seit 2016 die meisten Daten für illiterate_rate vorhanden sind


# b) Erstelle Datensatz owid_illiterate_2016 (2016, keine NAs, select country, world_region, illiterate_rate)


# c) Zeige die 10 Länder mit höchster und niedrigster Analphabetismusrate


# d) Erstelle Balkendiagramm bar_plot_illiteracy mit Mittelwerten je world_region


# e) Verbessere den Plot mit coord_flip() und labs(), speichere als bar_plot_illiteracy_pretty


# f) Interpretiere das Ergebnis in 2–3 Sätzen als Kommentar


# g) Speichere den Plot als plot_bar_illiteracy.png



###******************************************************###
##### Ü3 · Analphabetismus-Trend über die Zeit #############
###******************************************************###

# a) Erstelle Datensatz owid_illiterate_trend (ab 1901, group_by year & world_region, median illiterate_rate)


# b) Prüfe die ersten und letzten 10 Zeilen des neuen Datensatzes


# c) Erstelle Plot smooth_plot_illiteracy mit geom_smooth(method = "loess", se = FALSE)


# d) Interpretiere den Trend: allgemeine Richtung und Unterschiede zwischen Regionen


# e) Speichere den Plot als plot_smooth_illiteracy.png



###************************************************###
##### Ü4 · Die Bildungsschere (Gender-Gap) #########
###************************************************###

# a) Filtere auf 2021, entferne fehlende Werte in girls_in_tertiary, boys_in_tertiary, world_region


# b) Berechne gender_gap = girls_in_tertiary - boys_in_tertiary, speichere als owid_gender_mutated


# c) Erstelle Streudiagramm plot_gdp_gender_gap:
#    - x = gdp, y = gender_gap, color = world_region
#    - geom_hline bei 0, geom_point, geom_smooth(method = "lm", se = FALSE)
#    - Vollständige Beschriftung mit labs()


# d) Schreibe 4–5 Sätze Interpretation als Kommentar


# e) Speichere den Plot als plot_gdp_gender_gap.png



###******************************************************###
##### Ü5 · Tertiäre Bildung: Länder-Trends #################
###******************************************************###

# a) Wähle 6 Länder, filtere auf Jahr >= 2000, entferne NAs in tertiary_enrollment_rate
#    Notiere als Kommentar: Warum hast du diese Länder gewählt?


# b) Erstelle Linienplot plot_tertiaer_trend mit geom_line(linewidth = 1)


# c) Schreibe 4–5 Sätze Interpretation als Kommentar


# d) Speichere den Plot als plot_tertiaer_trend.png



###***********************************###
##### B-Ü6 · Demokratie und Bildung ####
###***********************************###

# a) Gruppiere nach democracy_score, berechne median edu_spending_gdp (2017), visualisiere als Balkendiagramm
#    Weise den Plot plot_democracy_spending zu und speichere als plot_democracy_spending.png


# b) Liste alle Länder mit democracy_score == 3 (liberale Demokratien) auf


# c) Streudiagramm: edu_spending_gdp ~ gdp, je world_region eine Trendlinie
#    Weise den Plot plot_gdp_edu_spending zu und speichere als plot_gdp_edu_spending.png



###********************************************************###
##### B-Ü7 · Time-Lag: Zahlt Bildung sich aus? ###############
###********************************************************###

# a) Erstelle zwei Datensätze (spending_2007, schooling_2017) und joine sie zu lagged_edu


# b) Erstelle Streudiagramm plot_lagged_edu mit linearem Trend und speichere als plot_lagged_edu.png


# c) Führe lineare Regression mit lm() und broom::tidy() durch, interpretiere Ergebnis



