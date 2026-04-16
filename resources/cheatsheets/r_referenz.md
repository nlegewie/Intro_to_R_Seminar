# R-Referenz: Operatoren, Basis-Funktionen und Statistik

Diese Seite ist dein Nachschlagewerk für die R-Grundbausteine: Operatoren, häufig gebrauchte Basis-Funktionen und Statistikfunktionen. Du findest sie in fast jedem R-Skript — Tidyverse oder nicht.

**Tipp:** Du musst diese nicht auswendig können. Nutze die Seite, wenn du dir unsicher bist, was ein Symbol oder eine Funktion bedeutet, oder du vergessen hast wie du eine bestimmte Operation durchführen kannst.

Wenn du dir nicht sicher bist, *mit was für einem Objekt* du gerade arbeitest (Vektor? Tibble? Liste?), hilft die Schwesterseite: [Objekte in R](../other/r_objekte.md)

---

## Inhaltsverzeichnis

- [Operatoren](#operatoren)
- [Basis-Funktionen](#basis-funktionen)
- [Statistik-Funktionen](#statistik-funktionen)

---

## Operatoren

### Zuweisung

| Operator | Bedeutung | Beispiel |
|----------|-----------|---------|
| `<-` | Wert einem Objekt zuweisen (empfohlen) | `x <- 5` |
| `=` | Zuweisung in Funktionsargumenten | `mean(x, na.rm = TRUE)` |

**Faustregel:** `<-` für Variablen im Skript, `=` innerhalb von Funktionsklammern.

---

### Vergleiche

Vergleiche geben `TRUE` oder `FALSE` zurück — und werden unter anderem in `filter()` verwendet.

| Operator | Bedeutung | Beispiel |
|----------|-----------|---------|
| `==` | gleich | `year == 2015` |
| `!=` | ungleich | `country != "World"` |
| `>` | größer als | `gini > 0.45` |
| `<` | kleiner als | `year < 2000` |
| `>=` | größer oder gleich | `population >= 1e6` |
| `<=` | kleiner oder gleich | `year <= 2020` |
| `%in%` | ist Element dieser Menge | `country %in% c("Germany", "France")` |

---

### Logische Verknüpfungen

| Operator | Bedeutung | Typischer Einsatz |
|----------|-----------|-------------------|
| `&` | UND, **für jedes Element** eines Vektors | `filter(daten, a & b)` — jede **Zeile** wird einzeln geprüft |
| `\|` | ODER, **für jedes Element** eines Vektors | `filter(daten, a \| b)` |
| `!` | NICHT (Negation) | `!is.na(gini)` |

---

### Pipes

| Operator | Bedeutung | Wann |
|----------|-----------|------|
| `\|>` | Native Pipe: Ergebnis links → erstes Argument rechts | R ≥ 4.1, empfohlen im Seminar |
| `%>%` | Magrittr-Pipe: dasselbe, aber aus dem `magrittr`-Paket | Älterer Code; funktioniert mit `library(tidyverse)` |

```r
# Beide sind gleichwertig:
owid |> filter(year == 2015)
owid %>% filter(year == 2015)
```

---

### Weitere Operatoren

| Operator | Bedeutung | Beispiel |
|----------|-----------|---------|
| `:` | Sequenz ganzer Zahlen | `1:10` → `1, 2, 3, …, 10` |
| `$` | Spalte/Element aus Objekt | `owid$gini` |
| `[ ]` | Indexierung | `owid[1, 3]` (Zeile 1, Spalte 3) |
| `[[ ]]` | Einzelnes Element (Liste/Tibble) | `meine_liste[["name"]]` |
| `::` | Funktion aus Paket direkt aufrufen | `here::here("data")` |
| `~` | Formel (z. B. für Regressionen) | `lm(gini ~ gdp, data = owid)` |

---

## Basis-Funktionen

### Objekte untersuchen

| Funktion | Was sie tut | Beispiel |
|----------|-------------|---------|
| `class()` | Datentyp des Objekts | `class(owid$year)` → `"numeric"` |
| `head()` | Erste n Zeilen (Standard: 6) | `head(owid, 10)` |
| `tail()` | Letzte n Zeilen | `tail(owid, 5)` |
| `nrow()` | Anzahl Zeilen | `nrow(owid)` |
| `ncol()` | Anzahl Spalten | `ncol(owid)` |
| `dim()` | Dimensionen (Zeilen × Spalten) | `dim(owid)` → `c(5000, 12)` |
| `names()` | Spaltennamen | `names(owid)` |
| `length()` | Länge eines Vektors | `length(owid$year)` |

---

### Typ-Prüfung und Umwandlung

| Funktion | Was sie tut | Beispiel |
|----------|-------------|---------|
| `is.na()` | `TRUE` wenn fehlender Wert | `is.na(owid$gini)` |
| `!is.na()` | `TRUE` wenn **nicht** fehlend | `filter(owid, !is.na(gini))` |
| `is.numeric()` | Ist die Variable numerisch? | `is.numeric(owid$year)` |
| `is.character()` | Ist es Text? | `is.character(owid$country)` |
| `as.numeric()` | In Zahl umwandeln | `as.numeric("3.14")` |
| `as.character()` | In Text umwandeln | `as.character(2015)` → `"2015"` |
| `as.integer()` | In ganze Zahl umwandeln | `as.integer(3.7)` → `3` |
| `as.factor()` | In kategoriale Variable umwandeln | `as.factor(owid$region)` |

---

### Vektoren und Sequenzen

| Funktion | Was sie tut | Beispiel |
|----------|-------------|---------|
| `c()` | Vektor erstellen | `c("Germany", "France", "Italy")` |
| `seq()` | Numerische Sequenz | `seq(0, 1, by = 0.1)` → `0.0, 0.1, …, 1.0` |
| `rep()` | Werte wiederholen | `rep(0, times = 5)` → `0 0 0 0 0` |
| `unique()` | Einmalige Werte | `unique(owid$region)` |
| `sort()` | Sortieren (aufsteigend) | `sort(c(3, 1, 2))` → `1 2 3` |
| `rev()` | Reihenfolge umkehren | `rev(1:5)` → `5 4 3 2 1` |
| `which()` | Indizes wo Bedingung zutrifft | `which(owid$year == 2015)` |

---

### Mathematik

| Funktion | Was sie tut | Beispiel |
|----------|-------------|---------|
| `abs()` | Absolutwert | `abs(-5)` → `5` |
| `sqrt()` | Wurzel | `sqrt(9)` → `3` |
| `round()` | Runden | `round(3.1415, 2)` → `3.14` |
| `floor()` | Abrunden | `floor(3.9)` → `3` |
| `ceiling()` | Aufrunden | `ceiling(3.1)` → `4` |
| `log()` | Natürlicher Logarithmus | `log(exp(1))` → `1` |
| `log10()` | Logarithmus zur Basis 10 | `log10(1000)` → `3` |
| `exp()` | Exponentialfunktion | `exp(0)` → `1` |

---

### Text

| Funktion | Was sie tut | Beispiel |
|----------|-------------|---------|
| `paste()` | Text zusammenkleben (Leerzeichen) | `paste("Land:", "Germany")` → `"Land: Germany"` |
| `paste0()` | Text zusammenkleben (kein Trennzeichen) | `paste0("n=", 42)` → `"n=42"` |
| `nchar()` | Anzahl Zeichen | `nchar("Hallo")` → `5` |
| `toupper()` | Großbuchstaben | `toupper("gini")` → `"GINI"` |
| `tolower()` | Kleinbuchstaben | `tolower("GINI")` → `"gini"` |
| `trimws()` | Leerzeichen am Rand entfernen | `trimws("  Hallo  ")` → `"Hallo"` |

---

### Sonstiges

| Funktion | Was sie tut | Beispiel |
|----------|-------------|---------|
| `print()` | Objekt in der Konsole ausgeben | `print(owid)` |
| `Sys.time()` | Aktuelle Uhrzeit | `Sys.time()` |
| `table()` | Häufigkeitstabelle | `table(owid$region)` |
| `duplicated()` | Welche Zeilen sind Duplikate? | `duplicated(owid)` |

---

## Statistik-Funktionen

Alle folgenden Funktionen haben ein Argument `na.rm`: Wenn du `na.rm = TRUE` setzt, werden fehlende Werte (`NA`) vor der Berechnung ignoriert. **Fast immer nötig bei echten Daten.**

```r
mean(owid$gini, na.rm = TRUE)  # ohne na.rm = TRUE → NA, sobald ein Wert fehlt
```

---

### Lagemaße (Zentrum der Verteilung)

| Funktion | Was sie tut | Beispiel |
|----------|-------------|---------|
| `mean()` | Arithmetisches Mittel | `mean(owid$gini, na.rm = TRUE)` |
| `median()` | Median (mittlerer Wert) | `median(owid$gini, na.rm = TRUE)` |
| `weighted.mean()` | Gewichteter Mittelwert | `weighted.mean(owid$gini, owid$population, na.rm = TRUE)` |

**Mittel vs. Median:** Der Median ist robuster gegenüber Ausreißern. Bei schiefen Verteilungen (z. B. Einkommen, BIP) ist er oft aussagekräftiger.

---

### Streuungsmaße (Breite der Verteilung)

| Funktion | Was sie tut | Beispiel |
|----------|-------------|---------|
| `sd()` | Standardabweichung | `sd(owid$gini, na.rm = TRUE)` |
| `var()` | Varianz (= sd²) | `var(owid$gini, na.rm = TRUE)` |
| `min()` | Minimum | `min(owid$gini, na.rm = TRUE)` |
| `max()` | Maximum | `max(owid$gini, na.rm = TRUE)` |
| `range()` | Minimum und Maximum | `range(owid$gini, na.rm = TRUE)` |

---

### Quantile und Verteilung

| Funktion | Was sie tut | Beispiel |
|----------|-------------|---------|
| `quantile()` | Beliebige Quantile | `quantile(owid$gini, probs = c(0.25, 0.5, 0.75), na.rm = TRUE)` |
| `IQR()` | Interquartilsabstand (Q75 − Q25) | `IQR(owid$gini, na.rm = TRUE)` |
| `summary()` | Min, Q1, Median, Mittel, Q3, Max | `summary(owid$gini)` |

**Tipp für `quantile()`:**
```r
# Erstes Quartil (25. Perzentil):
quantile(owid$gini, probs = 0.25, na.rm = TRUE)

# Alle vier Quartile auf einmal:
quantile(owid$gini, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)
```

---

### Zusammenhänge messen

| Funktion | Was sie tut | Beispiel |
|----------|-------------|---------|
| `cor()` | Korrelationskoeffizient (Pearson) | `cor(owid$gini, owid$gdp, use = "complete.obs")` |
| `cor()` (Spearman) | Rangkorrelation (robuster) | `cor(owid$gini, owid$gdp, method = "spearman", use = "complete.obs")` |
| `cov()` | Kovarianz | `cov(owid$gini, owid$gdp, use = "complete.obs")` |

**`use = "complete.obs"`** ignoriert Zeilen, in denen eine der beiden Variablen `NA` ist — entspricht `na.rm = TRUE` bei `cor()`.

**Pearson vs. Spearman:**
- **Pearson** misst lineare Zusammenhänge; empfindlich gegenüber Ausreißern.
- **Spearman** misst monotone Zusammenhänge (Rangkorrelation); robuster, besonders wenn eine Variable stark schief verteilt ist (z. B. BIP pro Kopf).

---

### Einfache lineare Regression

| Funktion | Was sie tut | Beispiel |
|----------|-------------|---------|
| `lm()` | Lineares Modell schätzen | `lm(gini ~ gdp_pro_kopf, data = owid2015)` |
| `summary()` | Ergebnisse inkl. Koeffizienten, R², p-Werte | `summary(mein_modell)` |
| `coef()` | Nur die Koeffizienten | `coef(mein_modell)` |
| `broom::tidy()` | Koeffizienten als aufgeräumter Tibble | `broom::tidy(mein_modell)` |
| `broom::glance()` | Modellgüte (R², AIC, …) als Tibble | `broom::glance(mein_modell)` |

```r
# Typisches Muster:
modell <- lm(gini ~ bip_pro_kopf, data = owid2015)
summary(modell)          # ausführliche Ausgabe
broom::tidy(modell)      # Koeffizienten als Tibble (weiterverarbeitbar)
broom::glance(modell)    # Modellgüte als Tibble
```

---

### Häufigkeiten und Kreuztabellen

| Funktion | Was sie tut | Beispiel |
|----------|-------------|---------|
| `table()` | Häufigkeitstabelle (eine oder zwei Variablen) | `table(owid$region)` |
| `prop.table()` | Relative Häufigkeiten aus `table()` | `prop.table(table(owid$region))` |
| `tabyl()` | Wie `table()`, aber als Tibble (`janitor`-Paket) | `janitor::tabyl(owid, region)` |

---

### Summen und Anzahlen

| Funktion | Was sie tut | Beispiel |
|----------|-------------|---------|
| `sum()` | Summe aller Werte | `sum(owid$population, na.rm = TRUE)` |
| `cumsum()` | Kumulierte Summe | `cumsum(c(1, 2, 3))` → `1 3 6` |
| `n()` | Anzahl Zeilen (nur in `dplyr`-Verben) | `summarise(owid, n = n())` |
| `n_distinct()` | Anzahl einmaliger Werte (`dplyr`) | `n_distinct(owid$country)` |
| `sum(is.na())` | Wie viele fehlende Werte? | `sum(is.na(owid$gini))` |
