

###****************************************************###
###****************************************************###
##### ***SESSION 4 — FILTER*** #####
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


###****************************************** ###
##### Vollständigen OWID-Datensatz laden #####
###****************************************** ###

# owid_daten wird in den Hausaufgaben verwendet.
# Pfad zur zentralen Datei im Kursrepository (einmal gespeichert, alle Sitzungen):
# Projekt-Stamm ist dieser Sitzungsordner → zwei Ebenen nach oben zum Repo-Stamm → full_data/
owid_daten <- read_csv(here("..", "..", "full_data", "owid_data.csv"))



- `filter()`
- `arrange()`
- Logical operators (`==`, `!=`, `>`, `<`, `&`, `|`, `%in%`)
- Conditional subsetting
- geom_smooth




owid_daten %>%
    ggplot()



owid_daten %>%
    filter(between(year, 2000, 2025)) %>%
    ggplot(aes(x = gdp, y = headcount_ratio_international_povline)) +
    geom_point(alpha = 0.3)



owid_daten %>%
    filter(year == 2015) %>%
    ggplot(aes(x = gdp, y = headcount_ratio_international_povline)) +
    geom_point()




owid_daten %>%
    filter(between(year, 2000, 2025)) %>%
    drop_na(year, country, headcount_ratio_international_povline, gdp) %>%
    ggplot(aes(x = year, y = gdp, group = country, color = world_region)) +
    geom_line(alpha = 0.3)



owid_daten %>%
    filter(between(year, 2000, 2025)) %>%
    drop_na(year, country, headcount_ratio_international_povline, gdp) %>%
    ggplot(aes(x = year, y = headcount_ratio_international_povline, group = country, color = world_region)) +
    geom_line(alpha = 0.3)




