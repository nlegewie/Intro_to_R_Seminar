# Um Hilfe bitten — richtig und effektiv

Steckenbleiben ist normal. Es passiert allen, auch erfahrenen Programmierer*innen. Der Unterschied liegt nicht darin, ob man auf Probleme stößt — sondern darin, wie man damit umgeht.

Diese Seite erklärt, wie du effektiv nach Hilfe suchst, sodass dir tatsächlich geholfen werden kann.

---

## Bevor du fragst: Drei Schritte Selbsthilfe

Bevor du jemanden fragst, probiere diese fünf Schritte. Sie lösen einen überraschend großen Teil aller Probleme:


**1. Fehlermeldung lesen — wirklich lesen**
R-Fehlermeldungen wirken auf den ersten Blick kryptisch, enthalten aber fast immer den entscheidenden Hinweis. Lies die Meldung langsam, Wort für Wort. Frag dich:
- In welcher **Zeile** tritt der Fehler auf?
- Welcher **Befehl** verursacht ihn?
- Welches **Objekt** oder welche **Datei** wird genannt?


**2. R neu starten und Skript komplett ausführen**
- Ctrl+Shift+F10 (Windows) / Cmd+Shift+F10 (macOS)
- Dann: Ctrl+Shift+Enter (Windows) / Cmd+Shift+Enter (macOS)

Das löst alle Probleme, die durch eine „verschmutzte" R-Umgebung entstehen — und das ist häufiger als du denkst.


**3. In der Fehlerbehebung nachschlagen**
[Fehlerbehebung und Wiederherstellung](reset_and_recover.md) deckt die häufigsten Probleme ab, Schritt für Schritt.


**4. Die R-Hilfe benutzen**

R hat eine eingebaute Hilfedokumentation, die du direkt in RStudio aufrufen kannst. Sie erklärt, was eine Funktion tut, welche Argumente sie erwartet und wie sie verwendet wird — inklusive Beispielen am Ende jeder Seite.

So rufst du sie auf:

```r
?filter          # Hilfe zur Funktion filter()
?ggplot          # Hilfe zur Funktion ggplot()
help("mutate")   # Alternative Schreibweise
```

Die Hilfeseite erscheint im Bereich unten rechts in RStudio unter dem Reiter **Help**. Am Ende der Seite findest du unter **Examples** lauffähige Codebeispiele, die du direkt ausprobieren kannst.

Wenn du eine Funktion nur halb kennst oder dir nicht sicher bist, welche Argumente du übergeben musst, ist die Hilfe oft schneller als eine Websuche.


**5. Googeln oder KI befragen**

Wenn die Hilfe nicht reicht, hilft oft eine kurze Suche. Kopiere den Kerntext der Fehlermeldung (ohne spezifische Variablen- oder Dateinamen), füge `R` und den Paketnamen hinzu, und such auf Englisch — die R-Community ist überwiegend englischsprachig und deutlich größer als die deutschsprachige. `Stackoverflow` ist eine gute Webseite, auf der sehr häufig nützliche Infos zu finden sind.

Beispiel: statt `Error in filter(owid_data, land == "Germany")` such nach `R dplyr filter object not found error`.

Mehr dazu — inklusive empfohlener Seiten und Tipps zur KI-Nutzung — weiter unten im Abschnitt [Online nach Lösungen suchen](#online-nach-lösungen-suchen).

---

## Wen fragen — in welcher Reihenfolge

| Schritt | An wen? | Warum? |
|---------|---------|--------|
| 1 | **Dich selbst** | Fehlermeldung lesen, R neu starten, Fehlerbehebung nachschlagen |
| 2 | **Dein Buddy** | Oft hilft schon das laute Erklären des Problems (Rubber-Duck-Debugging) |
| 3 | **Die Person neben dir** | Eine zweite Perspektive reicht häufig aus |
| 4 | **Den Dozenten** | Während der Sitzung direkt ansprechen |
| 5 | **Per E-Mail** | Außerhalb der Sitzung — mit einem guten Problembericht (siehe unten) |

Es geht nicht darum, Hemmungen aufzubauen. Es geht darum, dass die ersten drei Schritte erstaunlich oft funktionieren — und du dir die Wartezeit sparst.

---

## Wie du eine gute Frage stellst

Eine gute Frage enthält drei Dinge:

### 1. Was du erreichen wolltest

Sag kurz, was du vor hattest — in einem Satz.

> *„Ich wollte eine Grafik erstellen, die den Gini-Koeffizienten über die Zeit für drei Länder zeigt."*

### 2. Was stattdessen passiert ist

Zeig die **Fehlermeldung** (genau kopieren, nicht umschreiben) und beschreib, was du siehst.

> *„Ich bekomme diese Fehlermeldung: `Error in ggplot(daten, aes(x = year, y = gini)) : object 'daten' not found`"*

### 3. Was du bereits versucht hast

Das zeigt, dass du selbst nachgedacht hast, und hilft der helfenden Person, Dinge auszuschließen.

> *„Ich habe R neu gestartet und das Skript von oben ausgeführt. Die Zeile `daten <- read_csv(...)` läuft ohne Fehler, aber danach ist `daten` trotzdem nicht im Environment."*

### Beispiel für eine gute Frage

> Hallo,
>
> ich arbeite an Hausaufgabe 3. Ich möchte eine Grafik erstellen, die den Gini-Koeffizienten für Deutschland, Frankreich und Brasilien über die Zeit zeigt.
>
> Mein Code:
> ```r
> daten_auswahl <- owid_data |>
>   filter(country %in% c("Germany", "France", "Brazil"))
>
> ggplot(daten_auswahl, aes(x = year, y = gini)) +
>   geom_line()
> ```
>
> Die Fehlermeldung: `Error in filter(...): object 'owid_data' not found`
>
> Ich habe R neu gestartet und das gesamte Skript `01_homework_clean_data.R` ausgeführt — dort steht `owid <- read_csv(...)`, und das läuft ohne Fehler. Trotzdem findet R `owid` in meinem Analyse-Skript nicht.
>
> Was übersehe ich?

### Beispiel für eine schlechte Frage

> *„Mein Code funktioniert nicht, kannst du dir das mal anschauen?"*

Warum schlecht? Ich muss erraten, was du gemacht hast, was du erwartet hast und was schiefging. Das kostet beide Seiten Zeit.

---

## Online nach Lösungen suchen

Wenn die Selbsthilfe nicht reicht und du nicht auf eine Antwort von deinem Buddy oder mir warten willst, hilft oft eine kurze Websuche.

**So suchst du effektiv:**

1. **Fehlermeldung kopieren** — aber entferne die spezifischen Variablen- und Dateinamen. Such nach dem allgemeinen Muster:
   - Schlecht: `Error in filter(owid_data, country == "Germany")`
   - Gut: `R error "object not found" dplyr filter`

2. **Auf Englisch suchen** — Die R-Community ist überwiegend englischsprachig. Du findest deutlich mehr Ergebnisse.

3. **Nützliche Seiten:**
   - [Stack Overflow](https://stackoverflow.com/questions/tagged/r) — die größte Frage-und-Antwort-Plattform für Programmierfragen. Fast jede R-Anfängerfrage wurde dort schon beantwortet.
   - [RStudio Community](https://forum.posit.co/) — freundliches Forum speziell für R und RStudio
   - [R for Data Science](https://r4ds.hadley.nz/) — kostenloses Online-Buch, deckt fast alles ab, was wir im Seminar machen

4. **Vorsicht bei veralteten Antworten:** R und das Tidyverse entwickeln sich weiter. Bevorzuge Antworten aus den letzten 2–3 Jahren. Wenn eine Antwort `attach()`, `setwd()` oder `<<-` empfiehlt, ist sie wahrscheinlich veraltet.

---

## Generative KI als Hilfsmittel

Du darfst ChatGPT, Claude, Copilot und ähnliche Tools nutzen, um Fehlermeldungen zu verstehen oder Code-Konzepte erklärt zu bekommen. Aber es gelten klare Regeln:

- Du darfst KI **nicht** nutzen, um Hausaufgaben oder den Abschlussbericht schreiben zu lassen
- Du musst verstehen, was der Code tut — sonst lernst du nichts
- KI-generierter Code enthält regelmäßig Fehler oder verwendet veraltete Funktionen

Ausführliche Regeln zur KI-Nutzung: [Generative KI im Seminar](../other/using_genai.md)

**So nutzt du KI sinnvoll zum Debuggen:**

> *„Ich bekomme diese Fehlermeldung in R: `Error in mutate(...): Problem while computing 'bip_pro_kopf = gdp / population'. Caused by error: non-numeric argument to binary operator`. Mein Datensatz hat die Spalten gdp und population. Was könnte die Ursache sein?"*

Das ist eine gute KI-Frage: Du beschreibst das Problem konkret und bittest um eine Erklärung — nicht um eine fertige Lösung.

---

## Zusammenfassung

| Prinzip | Warum? |
|---------|--------|
| Erst selbst versuchen | Die meisten Probleme haben eine einfache Lösung |
| Fehlermeldung immer mitlesen | Sie enthält den Hinweis |
| Konkreter Problembericht | Hilft dir und der helfenden Person |
| Buddy zuerst fragen | Lautes Erklären löst erstaunlich viel |
| Englisch suchen | Mehr und bessere Ergebnisse |
