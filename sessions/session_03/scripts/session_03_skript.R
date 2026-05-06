###****************************************************###
###****************************************************###
##### ***SESSION 3 — DATENSATZ LADEN UND ERKUNDEN*** #####
###****************************************************###
###****************************************************###


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


###******************************************###
##### Vollständigen OWID-Datensatz laden #####
###******************************************###

# owid_daten wird in den Hausaufgaben verwendet.
owid_daten <- read_csv(here("data", "owid_data.csv"))


###*************************************###
##### Toy-Datensatz für Übungen laden #####
###*************************************###

# session_03_daten ist eine kleine, saubere Auswahl (20 Länder, 2015).
# Dieser Datensatz wird in den Übungen verwendet.
session_03_daten <- read_csv(here("data", "toy_data_session_03.csv"))


###*******************###
##### ***ÜBUNGEN*** #####
###*******************###


###***********************###
##### Ü1 · Datensatz laden #####
###***********************###

# a) Lade toy_data_session_03.csv in ein Objekt namens session_03_daten.
#    (Du hast das bereits im SETUP getan — hier übst du den Ladebefehl selbst.)



# b) Lass dir session_03_daten ausgeben.



# c) Prüfe mit class(), welcher Objekttyp das ist.




###****************************###
##### Ü2 · Datenstruktur erkunden #####
###****************************###

# Wende auf session_03_daten an:
# glimpse(), head() (erste 5 Zeilen), tail() (letzte 5 Zeilen), nrow(), ncol()



# Notiere 2 kurze Beobachtungen als Kommentar:
# Beobachtung 1:
# Beobachtung 2:




###***************************###
##### Ü3 · Datentypen verstehen #####
###***************************###

# a) Prüfe die Klassen von: country, region, year, gdp_per_capita,
#    life_expectancy_birth



# b) Berechne mean() auf country und gdp_per_capita — was passiert?



# Partneraufgabe: Was kannst du mit jeder Variablen machen, was nicht?
# Notiere 1-2 Beispiele als Kommentar:




###**********************************###
##### Ü4 · Debugging: Typischer Ladefehler #####
###**********************************###

# a) Führe diesen absichtlich falschen Befehl aus:
read_csv(here("data", "toy_data_session03.csv"))

# b) Diagnose (was ist das Problem?):
#

# c) Korrigiert laden:



# d) Fehlerregel als Kommentar:
#




###***********************###
##### Ü5 · Erste Histogramme #####
###***********************###

# a) Histogramm von child_mortality_rate aus session_03_daten:



# b) Füge labs() hinzu (Titel, x-Achse, y-Achse, Quellenangabe):



# c) Histogramm von gdp_per_capita:




###***************************###
##### Ü6 · Interpretation (👥) #####
###***************************###

# Partneraufgabe — kein neuer Code notwendig.
# Besprich mit deiner Nachbar:in und halte 3 Beobachtungen als Kommentar fest:
# 1.
# 2.
# 3.




###*****************************###
##### Ü7 · Code-Kommentare verbessern #####
###*****************************###

# Geh durch dein Skript und ergänze:
# - Für jede Übung eine kurze Abschnittsüberschrift
# - Mindestens 2 Kommentare, die erklären WARUM (nicht nur was) etwas gemacht wird




###**************************###
##### BONUS-ÜBUNGEN (freiwillig) #####
###**************************###


##### Bonus 1 · summary() auf zwei Variablen

# summary() auf life_expectancy_birth und gdp_per_capita:



# Kurze Notiz — welche Kennzahlen helfen am meisten?
#


##### Bonus 2 · Histogramm-Feintuning

# Zwei Histogramme von gdp_per_capita: bins = 6 und bins = 15



# Begründung — welche Einstellung ist informativer?
#


##### Bonus 3 ⚠️ · Korrelation

# Korrelation zwischen gdp_per_capita und life_expectancy_birth:



# Interpretation (2 Sätze als Kommentar):
# Stärke und Richtung:
#
# Inhaltliche Bedeutung:
#




###************************###
##### ***HAUSAUFGABEN*** #####
###************************###

# Bearbeite diesen Abschnitt zu Hause.
# Du arbeitest hier mit owid_daten (im SETUP geladen).
# Führe den SETUP-Abschnitt erneut aus, bevor du beginnst.


###***********************************###
##### HA1 · OWID-Datensatz erkunden #####
###***********************************###

##### HA1 A: Grundstruktur prüfen

# Wende an: nrow(), ncol(), names(), glimpse()



##### HA1 B: Drei Beobachtungen dokumentieren

# Beobachtung 1:
# Beobachtung 2:
# Beobachtung 3:


##### HA1 C: Plausibilitätschecks

# class(owid_daten$life_expectancy_birth)
# summary(owid_daten$life_expectancy_birth)



# Was fällt dir auf?
#




###**********************************###
##### HA2 · Fehlende Werte prüfen #####
###**********************************###

##### HA2 A: Fehlende Werte zählen

# sum(is.na(...)) für: gini, child_mortality_rate, life_expectancy_birth



##### HA2 B: Prozentanteile berechnen

# n_miss / nrow(owid_daten) * 100 für jede der drei Variablen



##### HA2 C: Ergebnisse einordnen

# 3-5 Sätze als Kommentar:
# Wo fehlen besonders viele Werte?
#
# Welche Variable wirkt am robustesten?
#
# Welche Konsequenz hat das für spätere Analysen?
#




###**********************************************###
##### HA3 · Histogramm der Lebenserwartung 2015 #####
###**********************************************###

# Dieser Schritt filtert den Datensatz auf das Jahr 2015.
# filter() wird in Session 4 eingeführt — hier nutze ihn als Vorgabe:
owid_2015 <- owid_daten |> filter(year == 2015)


##### HA3 A: Histogramm erstellen

# Histogramm von life_expectancy_birth aus owid_2015:



##### HA3 B: Plot beschriften

# Erweitere mit labs() (Titel, x, y, caption).
# Weise den beschrifteten Plot dem Objekt life_expectancy_histogram zu:



##### HA3 C: Plausibilitätschecks

# nrow(owid_2015), summary(owid_2015$life_expectancy_birth),
# class(owid_2015$life_expectancy_birth)



# Was fällt dir auf?
#


##### HA3 D: Verteilung interpretieren

# 3 Sätze als Kommentar:
# Wo liegt der Hauptbereich der Verteilung?
#
# Ist die Verteilung eher symmetrisch oder schief?
#
# Was bedeutet das für globale Ungleichheit?
#


##### HA3 E: Plot speichern

# Erstelle den output/-Ordner und speichere den Plot:
dir.create(here("output"), showWarnings = FALSE)

ggsave(
  here("output", "life_expectancy_histogram_2015.png"),
  plot   = life_expectancy_histogram,
  width  = 8,
  height = 5
)




###*************************************###
##### BONUS-HAUSAUFGABEN (freiwillig) #####
###*************************************###


##### B-HA1 · Zweites Histogramm: gdp

# Histogramm von gdp aus owid_2015:



# Vergleich mit Lebenserwartung als Kommentar:
#


##### B-HA2 ⚠️ · geom_freqpoly() erkunden

# Schlage geom_freqpoly() nach (?geom_freqpoly oder online) und wende es auf
# life_expectancy_birth aus owid_2015 an:



# Was zeigt es besser/schlechter als ein Histogramm? (3-4 Sätze als Kommentar)
#
