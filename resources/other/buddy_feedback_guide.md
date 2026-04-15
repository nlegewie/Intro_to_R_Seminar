# Buddy-System: Leitfaden für Peer-Feedback

Im Seminar arbeitest du mit einer Buddy-Partnerin oder einem Buddy-Partner zusammen. Das Ziel ist nicht, die Aufgaben gemeinsam zu lösen — es ist, sich gegenseitig weiterzuhelfen, wenn man feststeckt, und voneinander zu lernen.

---

## Was ein Buddy tut

| Buddy tut | Buddy tut nicht |
|-----------|----------------|
| Bei Fehlermeldungen gemeinsam nachdenken | Die Aufgabe für die andere Person lösen |
| Code der anderen Person lesen und Feedback geben | Code kopieren |
| Erklären, wie man ein Problem lösen könnte | Fertige Lösungen diktieren |
| Fragen stellen, die zum Nachdenken anregen | Bewertungen abgeben wie „das ist falsch" |
| Auf Ressourcen verweisen (Cheatsheets, Fehlerbehebung) | Alles selbst googeln und die Antwort präsentieren |

---

## Wann du deinen Buddy fragen solltest

1. Du hast die Fehlermeldung gelesen und nicht verstanden
2. Du hast R neu gestartet und das Skript erneut ausgeführt
3. Du hast in der [Fehlerbehebung](../troubleshooting/reset_and_recover.md) nachgeschlagen

Wenn keiner dieser drei Schritte hilft: Buddy-Zeit.

---

## Wie du deinem Buddy hilfst

### Schritt 1 — Zuhören

Lass deine Partnerin oder deinen Partner erklären, was sie/er versucht hat. Unterbrich nicht sofort mit einer Lösung — oft findet die Person den Fehler selbst, während sie ihn erklärt. Das ist kein Zufall, sondern eine bewährte Debugging-Technik (Rubber-Duck-Debugging).

### Schritt 2 — Gemeinsam lesen

Schaut euch den Code zusammen an. Lies ihn Zeile für Zeile laut vor. Achte auf:

- Fehlende Kommas, Klammern, Anführungszeichen
- Tippfehler in Variablennamen
- Fehlende `library()`-Aufrufe
- Ist die `.Rproj`-Datei geöffnet? (Oben rechts in RStudio prüfen)

### Schritt 3 — Fragen stellen statt Antworten geben

Gute Buddy-Fragen:

> *„Was genau soll diese Zeile tun?"*
>
> *„Welchen Typ hat die Variable `year` — ist sie numerisch oder Text?"*
>
> *„Hast du `library(tidyverse)` schon ausgeführt?"*
>
> *„Was passiert, wenn du nur die erste Hälfte des Befehls ausführst?"*

Weniger hilfreiche Aussagen:

> *„Schreib einfach X."*
>
> *„Das geht so nicht. Hier, lass mich mal."*

### Schritt 4 — Gemeinsam testen

Führt eine vereinfachte Version des Codes aus. Funktioniert der Befehl mit einem einfacheren Datensatz oder weniger Argumenten? So könnt ihr das Problem eingrenzen.

---

## Feedback auf Code geben

Ab der zweiten Semesterhälfte kann es hilfreich sein, den Code der anderen Person zu lesen — nicht nur bei Fehlern, sondern auch um voneinander zu lernen.

### Worauf du achten kannst

| Aspekt | Fragen, die du stellen kannst |
|--------|------------------------------|
| **Lesbarkeit** | Kann ich den Code verstehen, ohne Erklärung? Gibt es sinnvolle Variablennamen? |
| **Kommentare** | Erklären die Kommentare das *Warum*, nicht das *Was*? |
| **Struktur** | Ist der Code von oben nach unten ausführbar? Stehen `library()`-Aufrufe ganz oben? |
| **Ergebnisse** | Sind die Ergebnisse plausibel? Stimmen die Achsenbeschriftungen in Grafiken? |

### Wie du Feedback formulierst

- **Konkret:** *„In Zeile 14 steht `filter(data, year = 2015)` — meinst du `==` statt `=`?"* statt *„Da ist ein Fehler."*
- **Als Frage:** *„Warum verwendest du hier `mean()` statt `median()`?"* statt *„Du solltest median() nehmen."*
- **Positiv anfangen:** *„Die Grafik ist übersichtlich. Eine Sache, die mir aufgefallen ist…"*

---

## Wenn ihr beide feststeckt

Das passiert und ist kein Problem. In diesem Fall:

1. Formuliert das Problem gemeinsam so klar wie möglich (was wollt ihr, was passiert stattdessen, was habt ihr versucht)
2. Sucht gemeinsam in den Ressourcen ([Häufige Fehler](common_errors.md), [Fehlerbehebung](../troubleshooting/reset_and_recover.md))
3. Fragt die Person neben euch oder den Dozenten — mit eurem klar formulierten Problembericht

---

## Zusammenfassung

| Prinzip | Warum? |
|---------|--------|
| Erklären lassen, nicht lösen | Die andere Person lernt mehr, wenn sie selbst denkt |
| Fragen statt Antworten | Fragen zwingen zum Nachdenken und vertiefen das Verständnis |
| Gemeinsam lesen | Vier Augen finden mehr als zwei |
| Positiv und konkret | Feedback motiviert, wenn es konstruktiv formuliert ist |
