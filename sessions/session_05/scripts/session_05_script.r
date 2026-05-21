
###***********************************************************###
###***********************************************************###
##### ***SESSION 5 — DATEN TRANSFORMIEREN UND ZUSAMMENFASSEN*** #####
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




###*****************************************###
##### Ü1 · Analyse-Datensatz erstellen #####
###*****************************************###


##### Ü1 a · session_daten erstellen und glimpse()

# Kopiere den Code zur Erstellung von session_daten aus dem README (Ü1) und führe ihn aus.
# Wende dann glimpse() auf session_daten an.
# Notiere als Kommentar: Wie viele Zeilen und Spalten hat der neue Datensatz?




##### Ü1 b · summary()

# Wende summary() auf session_daten an.
# Welche Variable hat die meisten fehlenden Werte — und warum könnte das so sein?
# (1–2 Sätze als Kommentar)
#
#
#




##### Ü1 c · select(starts_with())

# Nutze select(starts_with("co2")) auf owid_daten (kein neues Objekt nötig).
# Wie viele Variablen werden ausgewählt?
# Welche weiteren Variablen bräuchtest du zusätzlich, um damit zu arbeiten?
#
#
#




###******************************************************###
##### Ü2 · Daten sortieren und Top-Werte anzeigen #####
###******************************************************###

# Top-10-bevölkerungsreichste Länder (Jahr 2023):
# filter(), !is.na(population), select(), arrange(desc(population)), slice_head(n = 10)
# Notiere als Kommentar: Welche Regionen sind unter den Top 10 vertreten?
#
#
#




###**************************************************************###
##### Ü3 · Weltbevölkerung: zusammenfassen und visualisieren #####
###**************************************************************###


##### Ü3 A · Aktuelle Gesamtbevölkerung

# Berechne die Gesamtbevölkerung aller Länder im Jahr 2023.
# Notiere als Kommentar: In welcher Größenordnung liegt das Ergebnis?
#
#
#




##### Ü3 B · Gesamtbevölkerung nach Weltregion (2023)

# group_by(world_region) + summarize() für 2023.
# Sortiere absteigend nach Gesamtbevölkerung.
# Notiere als Kommentar: Welche Region hat die größte Bevölkerung?
#
#
#




##### Ü3 C · Bevölkerungswachstum — Daten vorbereiten

# Erstelle pop_pro_jahr_region mit group_by(year, world_region) und summarize().
# Schließe vor summarize() fehlende Werte auf population aus (filter).
# Wende glimpse() auf das Ergebnis an. Was ist jetzt eine Zeile im Datensatz?




##### Ü3 D · Linienplot nach Region

# Linienplot: year (x), gesamt_pop (y), color = world_region.
# Beschrifte vollständig. Weise den Plot dem Objekt pop_lineplot zu.

ggsave(
  here("output", "pop_wachstum_region.png"),
  plot   = pop_lineplot,
  width  = 9,
  height = 5
)

# Schreibe 3–4 Sätze Interpretation als Kommentar:
# Welche Region wächst am stärksten? Welche stagniert?
# Was bedeutet das für zukünftige globale Ungleichheit?
# Was ist in Europa Anfang der 1990er Jahre los?
#
#
#




###*************************************************************###
##### Ü4 · CO₂-Emissionen: Verteilung und Gruppenvergleich #####
###*************************************************************###


##### Ü4 A · Überblick verschaffen

# Filtere auf 2022, entferne fehlende Werte auf share_global_co2.
# Speichere in co2_2022. nrow() und summary(co2_2022$share_global_co2).
# Notiere als Kommentar: Warum ist der Median so viel kleiner als der Mittelwert?
#
#
#




##### Ü4 B · Histogramm der CO₂-Verteilung

# Histogramm von share_global_co2 aus co2_2022.
# Beschrifte vollständig. Weise den Plot dem Objekt co2_histogram zu.

ggsave(
  here("output", "co2_histogramm_2022.png"),
  plot   = co2_histogram,
  width  = 8,
  height = 5
)

# Schreibe 2–3 Sätze Interpretation: Was sagt die Form der Verteilung?
#
#
#




##### Ü4 C · Zusammenfassung nach Weltregion

# Jahr 2022, nach world_region: sum_co2, mean_co2, n_laender = n().
# Sortiere nach sum_co2 absteigend.
# Notiere als Kommentar: Welche Region emittiert am meisten?
# Verändert sich das Bild bei mean_co2 — und was erklärt das?
#
#
#




##### Ü4 D · Top-10-Emittenten 2022

# arrange() + slice_head(n = 10) für höchsten share_global_co2 in 2022.
# Zeige country, world_region, share_global_co2.
# Schreibe 2–3 Sätze: Welche Länder dominieren — und überrascht dich etwas?
#
#
#




###**************************************************************###
##### Ü5 · Pro-Kopf-Emissionen mit mutate() berechnen #####
###**************************************************************###


##### Ü5 A · Pro-1Mio-Variablen berechnen

# mutate() auf session_daten: co2_pro_1mio und kumulativ_co2_pro_1mio
# (share_global_co2 bzw. cumulative_co2 / population * 1e6)
# Speichere als session_daten_mutated.




##### Ü5 B · Plausibilitätscheck

# session_daten_mutated, Jahr 2022, select(), arrange(desc(co2_pro_1mio)), slice_head(10).
# Notiere als Kommentar: Unterschied zu den Top-10 aus Ü4 D?
#
#
#




##### Ü5 C · Zusammenfassung nach Region (pro 1 Mio.)

# Jahr 2022, !is.na(co2_pro_1mio), Mittelwert von co2_pro_1mio nach world_region.
# Notiere als Kommentar: Rangfolge im Vergleich zu Ü4 C?
#
#
#




###****************************************************###
##### Ü6 · Pro-Kopf-Emissionen über die Zeit #####
###****************************************************###


##### Ü6 A · Datensatz filtern

# session_daten_mutated: Germany, China, United States, Nigeria, Brazil.
# !is.na(co2_pro_1mio). Speichere als laender_co2.
# glimpse(laender_co2) — wie viele Zeilen?




##### Ü6 B · Linienplot erstellen

# year (x), co2_pro_1mio (y), color = country.
# Beschrifte vollständig. Weise den Plot dem Objekt co2_lineplot zu.

ggsave(
  here("output", "co2_pro_kopf_verlauf.png"),
  plot   = co2_lineplot,
  width  = 9,
  height = 5
)




##### Ü6 C · Interpretation

# Schreibe 4–5 Sätze als Kommentar:
# Welches Land hatte historisch die höchsten Pro-1-Mio.-Emissionen?
# Was passiert mit der USA-Kurve seit den 1970ern?
# China — Wachstum vs. Niveau im Vergleich zu den USA?
# Was sagt das über historische Verantwortung für den Klimawandel?
#
#
#




###*************************************************###
##### Ü7 · Plastikmüll: Querschnittsanalyse #####
###*************************************************###


##### Ü7 A · Datensatz für 2010 vorbereiten

# session_daten_mutated, year == 2010.
# Fehlende Werte auf plastic_waste_generation, co2_pro_1mio, population ausschließen.
# mutate(plastik_pro_kopf = plastic_waste_generation / population).
# Speichere als plastik_2010.
# nrow(plastik_2010) und summary(plastik_2010$plastik_pro_kopf).




##### Ü7 B · Streudiagramm mit Trendlinie

# co2_pro_1mio (x), plastik_pro_kopf (y), color = world_region.
# geom_smooth(method = "lm", se = FALSE, color = "black").
# Beschrifte vollständig. Weise den Plot dem Objekt plastik_scatter zu.

ggsave(
  here("output", "plastik_co2_scatter.png"),
  plot   = plastik_scatter,
  width  = 9,
  height = 6
)




##### Ü7 C · Interpretation

# Schreibe 4–5 Sätze als Kommentar:
# Zusammenhang zwischen CO₂ und Plastikmüll pro Kopf?
# Richtung des Zusammenhangs?
# Welche Region fällt besonders auf?
# Was sagt das über Entwicklung und Umweltbelastung?
#
#
#




###*************************************###
##### BONUS-AUFGABEN (freiwillig) #####
###*************************************###


##### B-Ü1 · Kumulierte historische Emissionen

# a) Top 10 nach kumulativ_co2_pro_1mio im Jahr 2022.
# b) Histogramm von cumulative_co2 (2022), Objekt co2_kumulativ_histogram_2022, ggsave:
# ggsave(
#   here("output", "co2_kumulativ_histogram_2022.png"),
#   plot   = co2_kumulativ_histogram_2022,
#   width  = 8,
#   height = 5
# )
# c) 3–4 Sätze: historische Perspektive und Klimaverantwortung.
#
#
#




##### B-Ü2 ⚠️ · Plastikexporte

# a) Top-10-Exporteure 2019 (plastic_waste_exports).
# b) Linienplot DE, USA, Japan, China, Australien seit 2000; ggsave optional:
# ggsave(here("output", "plastik_export_verlauf.png"), plot = plastik_export_lineplot, width = 9, height = 5)
# c) mutate(): Plastikexporte pro Kopf 2019 — Top 10.
# d) 3–4 Sätze: globales Abfallsystem und Verantwortung.
#
#
#




##### B-Ü3 ⚠️⚠️ · Freie Exploration

# Eigene Forschungsfrage mit zwei Variablen aus session_daten.
# Mindestens ein Plot und eine Tabelle (group_by + summarize).
# 4–5 Sätze Antwort oder Begründung, warum die Daten keine klare Antwort erlauben.
#
#
#

