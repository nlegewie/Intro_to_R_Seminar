
###**********************************************************************###
###**********************************************************************###
##### ***SESSION 4 — DATENSTRUKTUREN, VARIABLENTYPEN UND FEHLENDE WERTE*** #####
###**********************************************************************###
###**********************************************************************###


###*************************************###
##### ***SETUP — ZUERST AUSFÜHREN!*** #####
###*************************************###

# Führe diesen gesamten Abschnitt aus, BEVOR du mit den Hausaufgaben beginnst.
# Markiere alle Zeilen bis zur nächsten Sektion und drücke Ctrl+Enter / Cmd+Enter.


###******************###
##### Pakete laden #####
###******************###

library(tidyverse)
library(here)


###****************************************** ###
##### Vollständigen OWID-Datensatz laden #####
###****************************************** ###

# owid_daten wird in den Hausaufgaben verwendet.
# Pfad zur zentralen Datei im Kursrepository (einmal gespeichert, alle Sitzungen):
# Projekt-Stamm ist dieser Sitzungsordner → zwei Ebenen nach oben zum Repo-Stamm → full_data/
owid_daten <- read_csv(here("..", "..", "full_data", "owid_data.csv"))




###***************************###
##### ***HAUSAUFGABEN*** #####
###***************************###

# Bearbeite diesen Abschnitt zu Hause.
# Ausführliche Anleitungen: README.md in diesem Ordner.
# Führe den SETUP-Abschnitt erneut aus, bevor du beginnst.




###**************************************************###
##### HA1 · Den Datensatz systematisch erkunden #####
###**************************************************###


##### HA1 a · glimpse()

# Wende glimpse() auf owid_daten an.
# Notiere als Kommentar: Wie viele Zeilen und Spalten hat der Datensatz?




##### HA1 b · summary()

# Wende summary() auf den gesamten Datensatz an.
# Schau dir die Ausgabe für access_to_water an: Was sind Minimum, Maximum und Median?




##### HA1 c · summary() für eine Spalte

# Wende summary() gezielt auf eine einzige Spalte an — nutze dafür $:
# summary(owid_daten$access_to_water)
# Notiere als Kommentar: Was fällt dir an den Werten auf?




##### HA1 d · Wertebereich interpretieren

# Schreibe 2–3 Sätze als Kommentar: Was sagt der Wertebereich von access_to_water
# über globale Ungleichheit aus?
#
#
#




###***********************************************###
##### HA2 · Variablentypen und ihre Tücken #####
###***********************************************###


##### HA2 a · Klassen bestimmen

# Bestimme den Typ dieser Variablen mit class():
# country, year, world_region, access_to_water, democracy_score_string




##### HA2 b · Debugging-Aufgabe

# Führe aus und erkläre im Kommentar, was das Problem ist und wie man es beheben würde:
# mean(owid_daten$world_region)
#
#
#




##### HA2 c · Denk-Aufgabe (kein Code nötig)

# year hat den Typ integer. Was würde passieren, wenn year fälschlicherweise
# als character gespeichert wäre — besonders in einem Linienplot?
# Schreibe 2 Sätze als Kommentar.
#
#
#




###******************************************###
##### HA3 · Fehlende Werte untersuchen #####
###******************************************###


##### HA3 A · Fehlende Werte zählen

# Berechne die Anzahl fehlender Werte für:
# access_to_water, life_expectancy_birth, gini
# Speichere jedes Ergebnis in einem sinnvoll benannten Objekt, z. B. n_miss_water.




##### HA3 B · Prozentanteile berechnen

# Berechne den prozentualen Anteil fehlender Werte für jede der drei Variablen.




##### HA3 C · Mittelwert mit und ohne na.rm

# Berechne den Mittelwert von access_to_water:
# 1. Ohne na.rm = TRUE — was liefert R?
# 2. Mit na.rm = TRUE — was ist der Wert?
# Schreibe einen Kommentar, der den Unterschied erklärt.
#
#
#




##### HA3 D · Interpretieren

# Schreibe 3–4 Sätze als Kommentar:
# Welche der drei Variablen hat die meisten fehlenden Werte?
# Was könnte der Grund dafür sein?
# Was bedeutet das für eine Analyse, die diese Variable verwendet?
#
#
#




###*********************************************************###
##### HA4 · Histogramm: Verteilung des Wasserzugangs #####
###*********************************************************###

# filter() und distinct() werden in Session 5 ausführlich eingeführt — hier als Vorgabe:
owid_2020 <- owid_daten |>
  filter(year == 2020) |>
  distinct(country, .keep_all = TRUE)




##### HA4 A · Plausibilitätschecks

# nrow(owid_2020)
# summary(owid_2020$access_to_water)
# sum(is.na(owid_2020$access_to_water))
# Notiere deine Beobachtungen als Kommentar.
#
#
#




##### HA4 B · Histogramm erstellen und beschriften

# Erstelle ein Histogramm von access_to_water mit ggplot() + geom_histogram().
# Experimentiere mit bins (probiere 15, 25, 35).
# Füge labs() hinzu (title, subtitle, x, y, caption).
# Vergib dem Plot das Objekt water_histogram und gib ihn aus.




##### HA4 C · Farbe und Interpretation

# Passe die Balkenfarbe an, z. B.: fill = "steelblue", color = "white"
# Schreibe 3–4 Sätze Interpretation als Kommentar:
# Siehst du die zwei Häufungspunkte?
# Was bedeutet die Lücke dazwischen?
# Was sagt die Verteilung über globale Ungleichheit beim Wasserzugang?
#
#
#




##### HA4 D · Plot speichern

# Erstelle den output/-Ordner und speichere den Plot:
dir.create(here("output"), showWarnings = FALSE)

ggsave(
  here("output", "water_histogram_2020.png"),
  plot   = water_histogram,
  width  = 8,
  height = 5
)




###*********************************************************###
##### HA5 · Linienplot: Entwicklung über die Zeit #####
###*********************************************************###

# %in% und filter() werden in Session 5 ausführlich eingeführt — hier als Vorgabe:
fuenf_laender <- owid_daten |>
  filter(
    country %in% c("Germany", "Brazil", "India", "Nigeria", "Bangladesh"),
    year >= 2000
  ) |>
  distinct(country, year, .keep_all = TRUE)




##### HA5 A · Plausibilitätschecks

# nrow(fuenf_laender)
# summary(fuenf_laender$access_to_water)
# sum(is.na(fuenf_laender$access_to_water))
# Notiere deine Beobachtungen als Kommentar.
#
#
#




##### HA5 B · Linienplot erstellen

# Erstelle einen Linienplot mit year auf der x-Achse, access_to_water auf der y-Achse,
# und einer Linie pro Land (color = country).
# Beschrifte den Plot vollständig mit labs().
# Weise den Plot dem Objekt water_lineplot zu.




##### HA5 C · Plot speichern und interpretieren

# Speichere den Plot:
ggsave(
  here("output", "water_lineplot.png"),
  plot   = water_lineplot,
  width  = 9,
  height = 5
)

# Schreibe 3–4 Sätze Interpretation als Kommentar:
# Welches Land hat den niedrigsten Wasserzugang — und hat er sich verbessert?
# Welches Land zeigt den stärksten Anstieg?
# Was fällt dir am Abstand zwischen den Ländern auf?
#
#
#




###**********************************************************************###
##### HA6 · Streudiagramm: Wasserzugang und Lebenserwartung #####
###**********************************************************************###


# filter() und !is.na() werden in Session 5 ausführlich eingeführt — hier als Vorgabe:
owid_2020_scatter <- owid_daten |>
  filter(year == 2020) |>
  distinct(country, .keep_all = TRUE) |>
  filter(!is.na(access_to_water), !is.na(life_expectancy_birth))




##### HA6 A · Plausibilitätschecks

# nrow(owid_2020_scatter)
# Schreibe als Kommentar: Was würde passieren, wenn wir die NAs nicht entfernen würden?
#
#
#




##### HA6 B · Streudiagramm erstellen

# Erstelle ein Streudiagramm mit:
# access_to_water auf der x-Achse
# life_expectancy_birth auf der y-Achse
# color = world_region
# Beschrifte den Plot vollständig. Weise ihn dem Objekt water_scatter zu.




##### HA6 C · Plot speichern und interpretieren

# Speichere den Plot:
ggsave(
  here("output", "water_scatter.png"),
  plot   = water_scatter,
  width  = 9,
  height = 6
)

# Schreibe 4–5 Sätze Interpretation als Kommentar:
# Gibt es einen erkennbaren Zusammenhang zwischen Wasserzugang und Lebenserwartung?
# In welche Richtung geht er?
# Gibt es Ausreißer — Länder, die nicht ins Muster passen?
# Welche Weltregionen fallen besonders auf?
#
#
#




###*************************************###
##### BONUS-HAUSAUFGABEN (freiwillig) #####
###*************************************###


##### B-HA1 · Mittlere, Median und Streuung vergleichen

# Berechne für access_to_water im Datensatz owid_2020:
# Mittelwert, Median, Standardabweichung (jeweils mit na.rm = TRUE).
# Schreibe 3–4 Sätze Kommentar: Warum weichen Mittelwert und Median voneinander ab?
# Was sagt die Standardabweichung über die Ungleichheit des Wasserzugangs aus?
#
#
#




##### B-HA2 ⚠️ · Trendlinie im Streudiagramm

# Füge dem Streudiagramm aus HA6 eine glatte Trendlinie hinzu:
# water_scatter +
#   geom_smooth(method = "loess", color = "black", se = FALSE)
# Was zeigt die Kurve — ist der Zusammenhang linear?
# Gibt es Bereiche, in denen die Lebenserwartung besonders stark steigt?
# Schreibe 3–4 Sätze Kommentar.
#
#
#




##### B-HA3 ⚠️ · Eigene Länderauswahl für den Linienplot

# Wähle 4–6 Länder deiner Wahl und erstelle einen eigenen Linienplot
# der Wasserzugangsentwicklung seit 2000.
# Begründe als Kommentar, warum du genau diese Länder gewählt hast —
# und was der Vergleich zeigt.
#
#
#

