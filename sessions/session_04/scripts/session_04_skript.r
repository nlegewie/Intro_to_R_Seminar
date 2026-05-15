
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




###****************************************###
##### HA1 · Datenstruktur erkunden #####
###****************************************###


##### HA1 a · glimpse()

# Wende glimpse() auf owid_daten an.
# Notiere als Kommentar: Wie viele Zeilen und Spalten hat der Datensatz?




##### HA1 b · summary()

# Wende summary() auf den gesamten Datensatz an.
# Notiere als Kommentar: Welche Variable hat nach erster Sicht die meisten fehlenden Werte?




##### HA1 c · names()

# Lass dir alle Spaltennamen mit names() ausgeben.




##### HA1 d · Variablen für Ungleichheitsanalyse

# Schreibe als Kommentar: Welche drei Variablen könnten für eine Analyse
# globaler Ungleichheit besonders interessant sein? Begründe kurz (je 1 Satz).
#
#
#




###*****************************************###
##### HA2 · Variablentypen verstehen #####
###*****************************************###


##### HA2 a · Klassen bestimmen

# Bestimme die Klasse dieser Variablen mit class():
# country, year, world_region, child_mortality_rate, gini, democracy_score_string




##### HA2 b · Debugging-Aufgabe

# Führe aus und erkläre im Kommentar, was das Problem ist und wie es sich beheben ließe:
# mean(owid_daten$country)
#
#
#




##### HA2 c · Denk-Aufgabe (kein Code nötig)

# democracy_score enthält 0, 1, 2, 3 (politische Regime).
# Was ist ihr aktueller Typ? Wäre es besser, sie als factor zu behandeln?
# Schreibe 2–3 Sätze als Kommentar.
#
#
#




###******************************************###
##### HA3 · Fehlende Werte untersuchen #####
###******************************************###


##### HA3 A · Fehlende Werte zählen

# Berechne die Anzahl fehlender Werte für:
# child_mortality_rate, gini, gdp, life_expectancy_birth
# Speichere jedes Ergebnis in einem sinnvoll benannten Objekt, z. B. n_miss_child.




##### HA3 B · Prozentanteile berechnen

# Berechne für jede der vier Variablen den Anteil fehlender Werte in Prozent:
# n_miss_child / nrow(owid_daten) * 100




##### HA3 C · Mittelwert mit und ohne NA-Behandlung

# Berechne den Mittelwert von child_mortality_rate:
# 1. Ohne na.rm = TRUE — was passiert?
# 2. Mit na.rm = TRUE — was ist das Ergebnis?
# Erkläre den Unterschied als Kommentar.
#
#
#




##### HA3 D · Interpretieren

# Schreibe 3–5 Sätze als Kommentar:
# Welche Variable hat die meisten fehlenden Werte?
# Was könnte der Grund dafür sein?
# Welche Konsequenz hat das für Analysen?
#
#
#




###***************************************************###
##### HA4 · Kindermortalität visualisieren #####
###***************************************************###

# filter() wird in Session 5 ausführlich eingeführt — hier nutze ihn als Vorgabe:
owid_2015 <- owid_daten |> filter(year == 2015)




##### HA4 A · Plausibilitätschecks

# nrow(owid_2015)
# summary(owid_2015$child_mortality_rate)
# sum(is.na(owid_2015$child_mortality_rate))
# Notiere deine Beobachtungen kurz als Kommentar.
#
#
#




##### HA4 B · Histogramm erstellen

# Erstelle ein Histogramm von child_mortality_rate aus owid_2015
# mit ggplot() und geom_histogram().
# Experimentiere mit bins (z. B. 20 und 30).




##### HA4 C · Plot beschriften

# Erweitere den Plot mit labs() (title, x, y, subtitle, caption).
# Weise den beschrifteten Plot dem Objekt child_mortality_histogram zu:




##### HA4 D · Farbe und Stil anpassen

# Verändere den Plot mit fill und color in geom_histogram(), z. B.:
# geom_histogram(bins = 25, fill = "steelblue", color = "white")




##### HA4 E · Verteilung interpretieren

# Schreibe 3–5 Sätze Interpretation als Kommentar:
# Wo liegt der Großteil der Länder?
# Gibt es eine Gruppe von Ländern mit sehr hoher Kindermortalität?
# Was sagt das über globale Ungleichheit?
# Hat dich irgendetwas an der Verteilung überrascht?
#
#
#




##### HA4 F · Plot speichern

# Erstelle den output/-Ordner und speichere den Plot:
dir.create(here("output"), showWarnings = FALSE)

ggsave(
  here("output", "child_mortality_histogram_2015.png"),
  plot   = child_mortality_histogram,
  width  = 8,
  height = 5
)




###*************************************###
##### BONUS-HAUSAUFGABEN (freiwillig) #####
###*************************************###


##### B-HA1 · Zwei Verteilungen vergleichen

# Erstelle ein zweites Histogramm für gdp aus owid_2015.
# Filtere zuerst auf Zeilen ohne fehlende Werte in gdp.
# Vergleiche schriftlich als Kommentar mit der Kindermortalität:
#
#
#




##### B-HA2 ⚠️ · geom_density() erkunden

# Schlage geom_density() nach (?geom_density oder online) und wende es auf
# child_mortality_rate aus owid_2015 an.
# Was zeigt die Dichtekurve im Vergleich zum Histogramm?
# Siehst du Hinweise auf Bimodalität? Notiere 3–4 Sätze als Kommentar.
#
#
#




##### B-HA3 ⚠️ · Trendvergleich über zwei Jahre

# Erstelle zwei Histogramme — eines für 2000, eines für 2015.
# filter(year == 2000) gibt dir die Daten für 2000.
# Vergleiche die Verteilung von child_mortality_rate visuell.
# Notiere als Kommentar: Hat sich die Verteilung verschoben? In welche Richtung?
#
#
#

