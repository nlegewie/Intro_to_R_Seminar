###****************************************************###
###****************************************************###
##### ***SESSION 3 — DATENSATZ LADEN UND ERKUNDEN*** #####
###****************************************************###
###****************************************************###

# MUSTERLÖSUNG (Referenz): Dieses Skript entspricht dem Aufbau von
# `session_03_skript.R`, ist aber vollständig ausgefüllt — Übungen,
# Hausaufgaben und freiwillige Bonusaufgaben.


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
# Pfad zur zentralen Datei im Kursrepository (einmal gespeichert, alle Sitzungen):
# Projekt-Stamm ist dieser Sitzungsordner → zwei Ebenen nach oben zum Repo-Stamm → full_data/
owid_daten <- read_csv(here("..", "..", "full_data", "owid_data.csv"))


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

session_03_daten <- read_csv(here("data", "toy_data_session_03.csv"))


# b) Lass dir session_03_daten ausgeben.

session_03_daten


# c) Prüfe mit class(), welcher Objekttyp das ist.

class(session_03_daten)




###****************************###
##### Ü2 · Datenstruktur erkunden #####
###****************************###

# Wende auf session_03_daten an:
# glimpse(), head() (erste 5 Zeilen), tail() (letzte 5 Zeilen), nrow(), ncol()

glimpse(session_03_daten)
head(session_03_daten, 5)
tail(session_03_daten, 5)
nrow(session_03_daten)
ncol(session_03_daten)


# Notiere 2 kurze Beobachtungen als Kommentar:
# Beobachtung 1: Der Toy-Datensatz hat 20 Zeilen und 6 Spalten (Länder plus Messvariablen).
# Beobachtung 2: country und region sind Text (character); year und die drei Messgrößen sind numerisch.





###***************************###
##### Ü3 · Datentypen verstehen #####
###***************************###

# a) Prüfe die Klassen von: country, region, year, gdp_per_capita,
#    life_expectancy_birth

class(session_03_daten$country)
class(session_03_daten$region)
class(session_03_daten$year)
class(session_03_daten$gdp_per_capita)
class(session_03_daten$life_expectancy_birth)


# b) Berechne mean() auf country und gdp_per_capita — was passiert?

mean(session_03_daten$country)
mean(session_03_daten$gdp_per_capita)


# Partneraufgabe: Was kannst du mit jeder Variablen machen, was nicht?
# Notiere 1-2 Beispiele als Kommentar:
# Mit numerischen Variablen (gdp_per_capita, life_expectancy_birth) sind Mittelwert, Histogramm
# oder Korrelation möglich. Mit Text (country) ergibt mean() keine sinnvolle Zahl.





###**********************************###
##### Ü4 · Debugging: Typischer Ladefehler #####
###**********************************###

# a) Führe diesen absichtlich falschen Befehl aus:
# Hinweis: In der Unterrichtsphase aktiv ausführen. Für einen Durchlauf des
# Gesamtskripts ist die Zeile auskommentiert, sonst bricht hier alles ab.
#
# read_csv(here("data", "toy_data_session03.csv"))

# b) Diagnose (was ist das Problem?):
# Falsche Zeichenkette im Dateinamen (Unterstrich fehlt: session03 statt session_03).

# c) Korrigiert laden:

session_03_daten <- read_csv(here("data", "toy_data_session_03.csv"))


# d) Fehlerregel als Kommentar:
# Dateinamen immer Zeichen für Zeichen prüfen — Unterstriche, Groß-/Kleinschreibung, Endung `.csv`.





###***********************###
##### Ü5 · Erste Histogramme #####
###***********************###

# a) Histogramm von child_mortality_rate aus session_03_daten:

ggplot(session_03_daten, aes(x = child_mortality_rate)) +
  geom_histogram(bins = 20, fill = "#4472C4", color = "white")


# b) Füge labs() hinzu (Titel, x-Achse, y-Achse, Quellenangabe):

ggplot(session_03_daten, aes(x = child_mortality_rate)) +
  geom_histogram(bins = 20, fill = "#4472C4", color = "white") +
  labs(
    title = "Verteilung der Kindessterblichkeit",
    x = "Kindessterblichkeit",
    y = "Anzahl Beobachtungen",
    caption = "Quelle: Our World in Data"
  )


# c) Histogramm von gdp_per_capita:

ggplot(session_03_daten, aes(x = gdp_per_capita)) +
  geom_histogram(bins = 20, fill = "#E07B39", color = "white") +
  labs(
    title = "Verteilung des BIP pro Kopf",
    x = "BIP pro Kopf (USD)",
    y = "Anzahl Beobachtungen",
    caption = "Quelle: Our World in Data"
  )




###***************************###
##### Ü6 · Interpretation (👥) #####
###***************************###

# Partneraufgabe — kein neuer Code notwendig.
# Besprich mit deiner Nachbar:in und halte 3 Beobachtungen als Kommentar fest:
# 1. Bei child_mortality_rate liegen die meisten Länder bei niedrigen Werten; wenige sehr hohe Werte.
# 2. Die Verteilung der Kindessterblichkeit ist rechtsschief.
# 3. gdp_per_capita wirkt ebenfalls rechtsschief — Ungleichheit zeigt sich in beiden Dimensionen.





###*****************************###
##### Ü7 · Code-Kommentare verbessern #####
###*****************************###

# Geh durch dein Skript und ergänze:
# - Für jede Übung eine kurze Abschnittsüberschrift
# - Mindestens 2 Kommentare, die erklären WARUM (nicht nur was) etwas gemacht wird

# === Übung 2: Datensatz strukturell erkunden ===
# Wir prüfen zuerst die Struktur, damit wir wissen, welche Variablen numerisch sind
# und welche Grafiken später sinnvoll sind.

glimpse(session_03_daten)

# Wir notieren nrow/ncol explizit, um die Datengröße gegen andere Datensätze abzuschätzen.
nrow(session_03_daten)
ncol(session_03_daten)




###**************************###
##### BONUS-ÜBUNGEN (freiwillig) #####
###**************************###


##### Bonus 1 · summary() auf zwei Variablen

# summary() auf life_expectancy_birth und gdp_per_capita:

summary(session_03_daten$life_expectancy_birth)
summary(session_03_daten$gdp_per_capita)


# Kurze Notiz — welche Kennzahlen helfen am meisten?
# Median und Quartile sind oft am robustersten für einen schnellen Überblick; Min/Max zeigen Extreme.


##### Bonus 2 · Histogramm-Feintuning

# Zwei Histogramme von gdp_per_capita: bins = 6 und bins = 15

ggplot(session_03_daten, aes(x = gdp_per_capita)) +
  geom_histogram(bins = 6)

ggplot(session_03_daten, aes(x = gdp_per_capita)) +
  geom_histogram(bins = 15)


# Begründung — welche Einstellung ist informativer?
# Weniger bins zeigen den groben Trend stärker; mehr bins zeigen Feinstrukturen.
# Für einen ersten Überblick liegt ein Mittelweg (z. B. 10–20 bins) oft dazwischen.


##### Bonus 3 ⚠️ · Korrelation

# Korrelation zwischen gdp_per_capita und life_expectancy_birth:

cor(session_03_daten$gdp_per_capita, session_03_daten$life_expectancy_birth)


# Interpretation (2 Sätze als Kommentar):
# Stärke und Richtung:
# Der Korrelationskoeffizient ist stark positiv: höheres BIP pro Kopf geht mit höherer
# Lebenserwartung zusammen — zumindest bei diesen 20 Querschnitten.
#
# Inhaltliche Bedeutung:
# Das ist keine Kausalität; es gibt viele andere Faktoren, die Gesundheit und Wohlstand verdrahten.




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

nrow(owid_daten)
ncol(owid_daten)
names(owid_daten)
glimpse(owid_daten)


##### HA1 B: Drei Beobachtungen dokumentieren

# Beobachtung 1: owid_daten kombiniert viele Jahr-Länder-Zeilen; die Zeilenzahl ist deutlich größer als beim Toy-Datensatz.
# Beobachtung 2: Es gibt viele Variablen (Wirtschaft, Gesundheit, Ungleichheit, Umwelt, …).
# Beobachtung 3: Nicht alle Spalten haben für jede Zeile gültige Werte — Datenverfügbarkeit variiert je Variable und Jahr.


##### HA1 C: Plausibilitätschecks

# class(owid_daten$life_expectancy_birth)
# summary(owid_daten$life_expectancy_birth)

class(owid_daten$life_expectancy_birth)
summary(owid_daten$life_expectancy_birth)


# Was fällt dir auf?
# life_expectancy_birth ist typischerweise numeric; Summary zeigt Quartile sowie viele NAs möglicherweise




###**********************************###
##### HA2 · Fehlende Werte prüfen #####
###**********************************###

##### HA2 A: Fehlende Werte zählen

# sum(is.na(...)) für: gini, child_mortality_rate, life_expectancy_birth

n_miss_gini <- sum(is.na(owid_daten$gini))
n_miss_child <- sum(is.na(owid_daten$child_mortality_rate))
n_miss_le <- sum(is.na(owid_daten$life_expectancy_birth))


##### HA2 B: Prozentanteile berechnen

# n_miss / nrow(owid_daten) * 100 für jede der drei Variablen

pct_miss_gini <- n_miss_gini / nrow(owid_daten) * 100
pct_miss_child <- n_miss_child / nrow(owid_daten) * 100
pct_miss_le <- n_miss_le / nrow(owid_daten) * 100


##### HA2 C: Ergebnisse einordnen

# 3-5 Sätze als Kommentar:
# Wo fehlen besonders viele Werte?
# gini fehlt typischerweise am häufigsten, weil Gini-Schätzungen sporadisch erhoben werden.
#
# Welche Variable wirkt am robustesten?
# life_expectancy_birth hat oft höhere Datenabdeckung als gini oder manche andere Kerngrößen.
#
# Welche Konsequenz hat das für spätere Analysen?
# Wir müssen pro Fragestellung prüfen, welche Kombination Jahr–Land–Variablen realistisch vollständig ist.






###**********************************************###
##### HA3 · Histogramm der Lebenserwartung 2015 #####
###**********************************************###

# Dieser Schritt filtert den Datensatz auf das Jahr 2015.
# filter() wird in Session 4 eingeführt — hier nutze ihn als Vorgabe:
owid_2015 <- owid_daten |> filter(year == 2015)


##### HA3 A: Histogramm erstellen

# Histogramm von life_expectancy_birth aus owid_2015:

ggplot(owid_2015, aes(x = life_expectancy_birth)) +
  geom_histogram(bins = 25, fill = "#4472C4", color = "white")


##### HA3 B: Plot beschriften

# Erweitere mit labs() (Titel, x, y, caption).
# Weise den beschrifteten Plot dem Objekt life_expectancy_histogram zu:

life_expectancy_histogram <- ggplot(owid_2015, aes(x = life_expectancy_birth)) +
  geom_histogram(bins = 25, fill = "#4472C4", color = "white") +
  labs(
    title = "Verteilung der Lebenserwartung bei Geburt (2015)",
    x = "Lebenserwartung bei Geburt (Jahre)",
    y = "Anzahl Länder",
    caption = "Quelle: Our World in Data"
  )


##### HA3 C: Plausibilitätschecks

# nrow(owid_2015), summary(owid_2015$life_expectancy_birth),
# class(owid_2015$life_expectancy_birth)

nrow(owid_2015)
summary(owid_2015$life_expectancy_birth)
class(owid_2015$life_expectancy_birth)


# Was fällt dir auf?
# Die Zahl Zeilen entspricht Ländern mit einer 2015-Zeile; Lebenserwartung variiert stark; NAs treten weiterhin auf.



##### HA3 D: Verteilung interpretieren

# 3 Sätze als Kommentar:
# Wo liegt der Hauptbereich der Verteilung?
# Die meisten Länder haben eine relativ hohe Lebenserwartung; der große Hauptteil liegt typischerweise oberhalb der unteren Quintile.

# Ist die Verteilung eher symmetrisch oder schief?
# Für 2015 ist die Verteilung oft linksschief: wenige sehr niedrige Werte, viele höhere.

# Was bedeutet das für globale Ungleichheit?
# Obwohl vieles höher liegt, gibt es weiterhin kleinere Gruppen mit sehr niedrigen Werten —
# Ungleichheit in Gesundheits-Chancen bleibt sichtbar.




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

owid_2015_nonmissing_gdp <- owid_2015 |> filter(!is.na(gdp))

ggplot(owid_2015_nonmissing_gdp, aes(x = gdp)) +
  geom_histogram(bins = 25, fill = "#E07B39", color = "white") +
  labs(
    title = "Verteilung von BIP (GDP) nach Land (2015, ohne NA)",
    x = "BIP (GDP)",
    y = "Anzahl Beobachtungen",
    caption = "Quelle: Our World in Data"
  )


# Vergleich mit Lebenserwartung als Kommentar:
# Lebenserwartung (2015) ist oft weniger stark rechtsschief als Roh-BIP/GDP —
# sehr reiche wenige pushen die GDP-Verteilung stärker nach rechts.




##### B-HA2 ⚠️ · geom_freqpoly() erkunden

# Schlage geom_freqpoly() nach (?geom_freqpoly oder online) und wende es auf
# life_expectancy_birth aus owid_2015 an:

ggplot(owid_2015, aes(x = life_expectancy_birth)) +
  geom_freqpoly(bins = 25, color = "#4472C4")


# Was zeigt es besser/schlechter als ein Histogramm? (3-4 Sätze als Kommentar)
# Freqpoly eignet sich gut zum Vergleich mehrerer Verteilungen in einer Grafik oder zum schnellen
# Trendüberblick ohne Balkenfüllungen. Für Anfänger:innen wirkt Histogramm intuitiver beim Abzählen
# von Bereichen; ohne Flächen sind absolute Häufungen schwerer abzuschätzen.
#
