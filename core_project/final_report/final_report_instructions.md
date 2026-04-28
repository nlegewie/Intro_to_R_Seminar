# Abschlussbericht — Aufgaben und Erwartungen

**Seminar:** Globale Ungleichheit — Eine Einführung in die statistische Datenauswertung mit R  
**Abgabe:** Nach Ende der Lehrveranstaltung, vor Beginn des neuen Semesters (genaues Datum wird in Session 13 bekanntgegeben)

---

## Was ist der Abschlussbericht?

Am Ende dieses Seminars wirst du in der Lage sein, einen Datensatz mit Daten zu fast 200 Ländern über mehrere Jahrzehnte zu öffnen, zu bereinigen und zurechtzuschneiden, professionelle Visualisierungen zu erstellen und eine kohärente, datengestützte Analyse zu verfassen — alles in einem reproduzierbaren Dokument, das Code, Ausgaben und Text an einem Ort vereint.

Der Abschlussbericht ist deine Gelegenheit, genau das zu zeigen.

Es handelt sich um eine eigenständige Analyse globaler Ungleichheit, die auf demselben Datensatz basiert, mit dem du das gesamte Semester arbeitest. Du wählst deinen eigenen Schwerpunkt, deine eigenen Länder, deine eigenen Fragen — innerhalb der unten beschriebenen Struktur. Das Ergebnis ist etwas, das du selbst gebaut hast, von Grund auf, mit echten Daten.

**Das ist keine klassische Hausarbeit.** Es gibt keine Literaturübersicht, keine Fußnoten, keinen Theorieteil. Was du schreibst, ist: Code, Ausgaben (Grafiken und Tabellen) sowie Interpretationen der Ergebnisse. Der Arbeitsaufwand ist vergleichbar mit einer ca. 10-seitigen Seminararbeit — aber der Großteil deiner Arbeit fließt in die Analyse selbst.

---

## Format und Abgabe

Der Bericht besteht nicht aus einer einzelnen Datei, sondern aus einem vollständigen RStudio-Projekt. Du gibst einen **gezippten Projektordner** ab, der folgende Struktur hat:

```
nachname_vorname_abschlussbericht.zip
├── abschlussbericht.Rproj       ← das RStudio-Projekt
├── abschlussbericht.Rmd         ← der Berichtstext mit Code-Chunks
├── abschlussbericht.html        ← das gerenderte Ergebnis
├── scripts/
│   ├── 01_datenvorbereitung.R   ← Datenladen, Filtern, Bereinigen
│   └── 02_analyse.R             ← Transformationen, neue Variablen, Zusammenfassungen
└── data/
    └── owid_gefiltert.rds       ← dein gefilterter Datensatz (nicht der volle Datensatz)
```

**Warum diese Struktur?** Im Laufe des Semesters lernst du, Analysen in separate Skripte aufzuteilen und diese mit `source()` in R Markdown einzubinden. Der Abschlussbericht zeigt, dass du diesen Workflow beherrschst. Der `.Rmd`-Bericht enthält den Text, die Interpretationen und die Grafiken — die eigentliche Datenarbeit (Laden, Filtern, Transformieren, Ausgaben erstellen) findet in den Skripten statt, die am Anfang des Berichts eingebunden werden:

```r
source(here("scripts/01_datenvorbereitung.R"))
source(here("scripts/02_analyse.R"))
```

**Warum `here()`?** Die Funktion `here()` aus dem `here`-Paket stellt sicher, dass alle Dateipfade relativ zum Projektstamm (wo die `.Rproj`-Datei liegt) aufgelöst werden — unabhängig davon, auf welchem Computer das Projekt geöffnet wird. Solange du den gesamten Projektordner mit der `.Rproj`-Datei abgibst, wird der Bericht auf jedem Rechner fehlerfrei rendern.

**Zum gefilterten Datensatz:** Du musst nicht den vollständigen OWID-Datensatz mitliefern. Speichere stattdessen den Datensatz, den du tatsächlich verwendest, am Ende deines Vorbereitungsskripts als .rds-Datei im `data/`-Ordner. Diese Datei wird dann im Analyseskript eingelesen. Das macht deinen Bericht schnell, übersichtlich und vollständig autark.

**Keine Mindestseitenzahl** — Qualität vor Quantität.

**Code-Stil:** Dein Code sollte lesbar und konsistent formatiert sein. Verwende `styler` zur automatischen Formatierung und kommentiere dein Skript sinnvoll. Alles Wichtige dazu: [Code-Stil, Kommentare und automatische Formatierung](resources/other/code_style.md)

---

## Struktur des Berichts

Dein Bericht muss die folgenden Abschnitte in dieser Reihenfolge enthalten:

| Abschnitt | Inhalt |
|-----------|--------|
| **Einleitung** | Was ist deine Forschungsfrage? Was ist dein *roter Faden*? Welche Analysevorlage (A–E) hast du gewählt, und warum passt sie zu deiner Frage? Welche Indikatoren verwendest du, und warum passen sie zu deiner Frage? Was erwartest du zu finden? (1–2 Absätze) |
| **Daten** | Welche Variablen, welche Länder und Jahre? Zeige die wichtigsten Filterschritte als Code. Wie viele Beobachtungen verbleiben nach dem Filtern? Führe einen Plausibilitätscheck durch: Liegen die Werte in einem erwarteten Bereich? Wie viele fehlende Werte gibt es, und wie gehst du damit um? (Code + 1–2 Absätze) |
| **Analyse** | Die fünf analytischen Bausteine (siehe unten) — das ist der Hauptteil des Berichts |
| **Reflexion** | Eine kurze persönliche Reflexion — Details siehe unten (1 Absatz) |
| **Fazit** | Welche Antworten liefern deine Analysen zusammengenommen auf deine Forschungsfrage? Nicht: „In Aufgabe 1 habe ich X gefunden, in Aufgabe 2 Y." Sondern: Welche Argumente unterstützen die Befunde insgesamt? Was überrascht? Wo bleiben Fragen offen, und warum? (1–2 Absätze) |

### Der rote Faden

Der wichtigste strukturelle Unterschied zwischen einem guten und einem mittelmäßigen Bericht ist der *rote Faden*: eine übergeordnete Forschungsfrage, auf die alle fünf Analyseaufgaben gemeinsam eine Antwort aufbauen.

Ohne roten Faden ist ein Bericht eine Sammlung von fünf unabhängigen Analysen. Mit rotem Faden ist er ein Argument.

**Was ist ein roter Faden?** Eine Frage, die zu breit ist, um sie mit einer einzigen Analyse zu beantworten, aber konkret genug, um mit deinen fünf Analyseaufgaben Schritt für Schritt beantwortet zu werden. Beispiele:

> *„Ist Subsahara-Afrika strukturell benachteiligt — in mehreren Dimensionen, über die Zeit, und unabhängig vom wirtschaftlichen Entwicklungsstand?"*

> *„Hat sich die globale Einkommensungleichheit seit 1990 verringert, und wenn ja, für wen?"*

> *„Wie hängen Demokratie und Ungleichheit zusammen — und gilt das weltweit oder nur in bestimmten Regionen?"*

Dein roter Faden muss in der Einleitung klar formuliert sein. Die Aufgaben müssen darauf hinarbeiten. Das Fazit muss auf die zu Grunde liegende Frage Antworten liefern.

**Übergänge zwischen Aufgaben:** Am Ende jeder Aufgabe (nach deiner Interpretation) schreibst du 1–2 Sätze, die dein Ergebnis mit der nächsten Aufgabe verbinden. Welche Folgefrage motiviert den nächsten Schritt? Das muss nicht ausführlich sein — es reicht ein knapper Satz wie: *„Diese Verteilung legt nahe, dass regionale Faktoren eine Rolle spielen — dem gehen wir in Aufgabe 3 nach."*

Die vorgeschlagenen Übergänge in den Analysevorlagen unten (siehe nächster Abschnitt) sind konkrete Ausgangspunkte — passe sie an deine eigenen Befunde an.

## Analysevorlage wählen

Die fünf Pflichtaufgaben sind für alle Studierenden dieselben und stehen in derselben Reihenfolge im Bericht. Was sich unterscheidet, ist das **analytische Narrativ**: Je nach Forschungsfrage wie du jede Aufgabe rahmst, was du betonst, und wie du die Übergänge gestaltest. Je nachdem, welche übergeordnete Frage dich interessiert, empfehlen wir eine der folgenden fünf Vorlagen.

Wenn du eine Forschungsfrage im Kopf hast, aber keine der Vorlagen passt dazu, kannst du auch gerne deinen eigenen Roten Faden entwickeln. Die Vorlagen dienen nur der Orientierung und Unterstützung.

**So verwendest du eine Vorlage:**
1. Lies alle fünf durch. Welche passt am besten zu dem, was dich interessiert?
2. Formuliere deinen roten Faden in der Einleitung entsprechend der Vorlage.
3. Nutze die vorgeschlagenen Übergänge als Ausgangspunkt und passe sie an deine eigenen Befunde an.

### Vorlage A — Zoom-In: Von der globalen Verteilung zur nationalen Erklärung

**Analytische Logik:** Beginne mit der Welt als Ganzes und zoome schrittweise herein — von der globalen Verteilung über regionale Muster zu nationalen Zeitverläufen und schließlich zu einem erklärenden Zusammenhang.

**Beispiel-Forschungsfrage:**
> *„Warum ist [Indikator X] so ungleich über Länder verteilt — und welche regionalen und wirtschaftlichen Faktoren erklären dieses Muster?"*

**Rolle jeder Aufgabe:**
- **Aufgabe 1** stellt die globale Ausgangslage fest: Wie stark variiert X heute?
- **Aufgabe 2** fragt: War das schon immer so, oder ist es ein jüngeres Phänomen?
- **Aufgabe 3** zerlegt die globale Ungleichheit in ihre regionalen Bestandteile.
- **Aufgabe 4** sucht nach einer Erklärung auf Länderebene: Welche Variablen können eine Erklärung liefern?
- **Aufgabe 5** vertieft einen Gedankenstrang — z. B. könnte eine Ausreißerregion näher untersucht werden, eine dritte Variable oder ein spezifischer Ländervergleich.

**Vorgeschlagene Übergänge:**
- *Nach Aufgabe 1:* „Diese Verteilung zeigt ein hohes Maß an globaler Ungleichheit. Aber ist das ein stabiles Muster oder ein jüngeres Phänomen? Das untersucht Aufgabe 2."
- *Nach Aufgabe 2:* „Die historische Entwicklung zeigt [Konvergenz / Divergenz / Stagnation]. Aufgabe 3 fragt: Welche Weltregionen tragen am stärksten zu diesem Muster bei?"
- *Nach Aufgabe 3:* „Der regionale Vergleich macht deutlich, dass [Region X] besonders auffällt. Aufgabe 4 untersucht, ob wirtschaftliche Entwicklung dieses Muster erklären kann."
- *Nach Aufgabe 4:* „Das Modell erklärt einen Teil der Variation — aber nicht alles. In Aufgabe 5 untersuche ich [Ausreißer / weitere Variable / Mechanismus] genauer."


### Vorlage B — Historische Verläufe: Woher kommen wir, und wo stehen wir heute?

**Analytische Logik:** Beginne mit dem zeitlichen Verlauf und frage, welche Länder sich angenähert und welche sich auseinanderentwickelt haben. Situiere den heutigen Zustand als Ergebnis dieser Verläufe.

**Beispiel-Forschungsfrage:**
> *„Hat sich [Indikator X] seit [Jahrzehnt] global verändert — und wenn ja, gleichmäßig für alle Weltregionen und Länder?"*

**Rolle jeder Aufgabe:**
- **Aufgabe 1** etabliert den heutigen Zustand: Wo steht die Welt *jetzt*?
- **Aufgabe 2** ist der analytische Kern: Welche Länder haben sich verbessert, welche stagniert, welche haben sich verschlechtert?
- **Aufgabe 3** aggregiert auf Regionsebene: Welche Regionen haben profitiert, welche wurden abgehängt?
- **Aufgabe 4** fragt nach dem Mechanismus: Korreliert der Wandel mit anderen Variablen?
- **Aufgabe 5** untersucht eine Ausnahme oder einen unerwarteten Fall.

**Vorgeschlagene Übergänge:**
- *Nach Aufgabe 1:* „Dieser Momentaufnahme fehlt die zeitliche Dimension: Ist dieser Zustand das Ergebnis langer Verbesserungen oder eines jüngsten Rückgangs? Das zeigt Aufgabe 2."
- *Nach Aufgabe 2:* „Die nationalen Trajektorien zeigen erhebliche Unterschiede. Aufgabe 3 fragt: Spiegeln sich diese Unterschiede in regionalen Mustern wider?"
- *Nach Aufgabe 3:* „Der regionale Vergleich zeigt, dass [Region X] besonders [profitiert hat / zurückgeblieben ist]. Aufgabe 4 untersucht, ob wirtschaftliche Entwicklung diesen Wandel vorhersagt."
- *Nach Aufgabe 4:* „Das Modell erklärt [viel / wenig] Variation. In Aufgabe 5 gehe ich [einem unerwarteten Befund / einem Ausreißerland] genauer nach."


### Vorlage C — Mehrdimensionale Ungleichheit: Misst man immer dasselbe?

**Analytische Logik:** Hinterfrage die Annahme, dass Ungleichheit eine einzige Dimension hat. Vergleiche mehrere Dimensionen gleichzeitig und untersuche, ob sie dasselbe Bild zeichnen — oder ob verschiedene Indikatoren verschiedene Welten zeigen.

**Beispiel-Forschungsfrage:**
> *„Sind Länder, die in einer Dimension ungleich sind, auch in anderen Dimensionen benachteiligt — oder erzählen verschiedene Indikatoren verschiedene Geschichten?"*

**Rolle jeder Aufgabe:**
- **Aufgabe 1** charakterisiert die Verteilung eines einzelnen Indikators als Ausgangspunkt.
- **Aufgabe 2** verfolgt diesen Indikator über die Zeit für ausgewählte Länder.
- **Aufgabe 3** ist der analytische Kern: Vergleiche 2–3 Dimensionen regional — liegen dieselben Regionen immer vorne?
- **Aufgabe 4** untersucht, ob zwei dieser Dimensionen auf Länderebene korrelieren.
- **Aufgabe 5** vertieft die überraschendste Divergenz aus Aufgabe 3.

**Vorgeschlagene Übergänge:**
- *Nach Aufgabe 1:* „Diese Verteilung beschreibt nur eine Dimension von Ungleichheit. Bevor wir weitere Dimensionen hinzuziehen, fragen wir in Aufgabe 2: Hat sich diese Dimension über die Zeit verändert?"
- *Nach Aufgabe 2:* „Der Zeitverlauf zeigt [Konvergenz / Divergenz]. Aufgabe 3 stellt die entscheidende Frage: Sehen andere Dimensionen von Ungleichheit genauso aus?"
- *Nach Aufgabe 3:* „Der Mehrfachvergleich zeigt, dass die Dimensionen [konvergieren / divergieren] — insbesondere bei [Region X]. Aufgabe 4 prüft, ob dieser Befund auch auf Länderebene gilt."
- *Nach Aufgabe 4:* „Der Zusammenhang zwischen den Dimensionen ist [stark / schwach / regional verschieden]. In Aufgabe 5 untersuche ich, warum [Region / Land X] aus dem Muster herausfällt."


### Vorlage D — Die Entwicklungsfrage: Macht Wachstum gleicher oder ungleicher?

**Analytische Logik:** Beginne mit einer Hypothese über den Zusammenhang zwischen wirtschaftlicher Entwicklung und Ungleichheit und prüfe sie empirisch — für alle Regionen, über die Zeit, mit Blick auf Ausnahmen.

**Beispiel-Forschungsfrage:**
> *„Sind reichere Länder gleicher — und gilt dieser Zusammenhang für alle Weltregionen und zu jeder Zeit?"*

**Rolle jeder Aufgabe:**
- **Aufgabe 1** etabliert die Verteilung des Outcome-Indikators — noch ohne Bezug zum Entwicklungsstand.
- **Aufgabe 2** zeigt, wie sich Entwicklungsstand und Ungleichheit bei ausgewählten Ländern über die Zeit entwickelt haben.
- **Aufgabe 3** prüft, ob der Zusammenhang regional konsistent ist: Gilt er in allen Weltregionen gleich?
- **Aufgabe 4** ist der analytische Kern: Modelliere den Zusammenhang zwischen Entwicklungsstand und Ungleichheit formal.
- **Aufgabe 5** untersucht Ausreißer oder einen möglichen Mechanismus, der das Muster erklärt oder bricht.

**Vorgeschlagene Übergänge:**
- *Nach Aufgabe 1:* „Diese Verteilung zeigt, wo Ungleichheit hoch und niedrig ist. Aber entwickeln sich Länder mit steigendem Wohlstand tatsächlich in Richtung Gleichheit? Das untersucht Aufgabe 2 im Zeitverlauf."
- *Nach Aufgabe 2:* „Die nationalen Trajektorien zeigen [ein klares Muster / ein heterogenes Bild]. Aufgabe 3 prüft, ob regionale Zugehörigkeit den Zusammenhang moderiert."
- *Nach Aufgabe 3:* „Regionale Muster legen nahe, dass der Zusammenhang nicht universell gilt. Aufgabe 4 modelliert ihn formal — für alle Länder gemeinsam."
- *Nach Aufgabe 4:* „Das Modell erklärt [viel / wenig] der Variation. In Aufgabe 5 gehe ich den Ländern nach, die am stärksten vom Trend abweichen."


### Vorlage E — Regionale Fallstudie: Was macht [Region X] besonders?

**Analytische Logik:** Nutze eine Weltregion als analytischen Anker. Vergleiche sie mit dem globalen Bild, verfolge den Verlauf wichtiger Indikatoren über die Zeit, verstehe ihre interne Heterogenität und erkläre, was ihr Ungleichheitsprofil antreibt.

**Beispiel-Forschungsfrage:**
> *„Was erklärt das Ungleichheitsprofil von [Region X] — und wie unterscheiden sich die Länder innerhalb der Region voneinander?"*

**Rolle jeder Aufgabe:**
- **Aufgabe 1** verortert die Region im globalen Kontext: Wo steht sie in der globalen Verteilung?
- **Aufgabe 2** verfolgt ausgewählte Länder *innerhalb* der Region über die Zeit und zeigt interne Heterogenität.
- **Aufgabe 3** vergleicht die Region mit anderen Weltregionen in mehreren Dimensionen: Ist ihr Profil konsistent?
- **Aufgabe 4** untersucht, ob wirtschaftliche Entwicklung Ungleichheit *innerhalb* der Region vorhersagt.
- **Aufgabe 5** fokussiert auf ein spezifisches Land oder einen sub-regionalen Mechanismus.

**Vorgeschlagene Übergänge:**
- *Nach Aufgabe 1:* „Im globalen Vergleich fällt [Region X] durch [hohe / niedrige / heterogene] Werte auf. Aufgabe 2 schaut genauer hin: Wie einheitlich ist die Region intern?"
- *Nach Aufgabe 2:* „Die internen Unterschiede sind [groß / gering / zunehmend]. Aufgabe 3 stellt die Frage: Wie verhält sich die Region im Vergleich zu anderen Weltregionen über mehrere Dimensionen?"
- *Nach Aufgabe 3:* „Der multidimensionale Vergleich zeigt, dass [Region X] in [Dimension Y] besonders auffällt. Aufgabe 4 fragt, ob wirtschaftliche Entwicklung dieses Profil innerhalb der Region erklärt."
- *Nach Aufgabe 4:* „Der Zusammenhang gilt [stark / nur bedingt / gar nicht] innerhalb der Region. In Aufgabe 5 gehe ich [Land X / Mechanismus Y] genauer nach."


## Die fünf analytischen Bausteine

Der Bericht besteht aus fünf analytischen Bausteinen, die je nach Vorlage/Vorgehensweise in verschiedenen Reihenfolgen im Dokument erscheinen können. **Welche analytische Rolle jeder Baustein in deinem Argument spielt, hängt von deiner gewählten Vorlage ab.** Die Bausteine schreiben nicht vor, welche Frage du stellst — sie definieren, was du technisch und inhaltlich in jedem Abschnitt leisten musst.

Jeder Baustein muss enthalten:
- ✅ Funktionierenden R-Code mit kurzen Kommentaren
- ✅ Mindestens eine Ausgabe (Grafik oder Tabelle)
- ✅ 1-2 Absätze schriftliche Interpretation — nicht nur Beschreibung, sondern Deutung
- ✅ 1–2 Sätze Übergang zur nächsten Aufgabe (außer bei Baustein 5) — nutze die Übergänge deiner Vorlage als Ausgangspunkt

**Was ist eine gute Interpretation?** Nicht: *„Der Wert für Subsahara-Afrika ist höher."* Sondern: *„Subsahara-Afrika weist im Jahr 2015 einen regionalen Mittelwert von ca. 80 Kindertodesfällen pro 1.000 Lebendgeburten auf — etwa viermal so hoch wie in Westeuropa. Das dürfte mit strukturellen Unterschieden in Gesundheitsversorgung, Einkommen und historischen Entwicklungspfaden zusammenhängen."* Du musst keine Expertin oder kein Experte sein. Du musst laut denken.

Ein Schritt-für-Schritt-Leitfaden, der dir bei der Interpretation hilft: [Wie du eine Grafik oder Tabelle interpretierst und darüber schreibst](resources/other/interpretation_workflow.md)

### Baustein A — Querschnittsanalyse

Beschreibe die **Verteilung eines Indikators über Länder hinweg zu einem Zeitpunkt**. Zeige, wie stark der Indikator variiert, welche Länder die Extreme besetzen, und was die Verteilungsform bedeutet.

**Muss enthalten:**
- Einen gefilterten Datensatz: ein Indikator, ein Jahr
- Eine Visualisierung der Verteilung über Länder
- Eine Rangtabelle: die 5 höchsten und 5 niedrigsten Länder (`arrange()`, `slice()`)
- Deskriptive Statistiken: Mittelwert, Median, SD, Minimum, Maximum
- Interpretation: Wie stark variiert der Indikator? Gibt es Ausreißer? Was haben die Extremwerte gemeinsam?

*Technische Schwerpunkte: `filter()`, `arrange()`, `slice()`, `summarise()`, Verteilungsvisualisierung*

### Baustein B — Längsschnittanalyse

Verfolge die **Entwicklung eines Indikators oder mehrerer Indikatoren über die Zeit** für eine bewusst gewählte Gruppe von Ländern. Zeige Konvergenz, Divergenz oder Wendepunkte.

**Muss enthalten:**
- Eine begründete Länderauswahl (2–3 Sätze): Warum diese Länder, welcher Vergleich ist analytisch interessant?
- Eine Visualisierung, die Veränderungen pro Land über die Zeit zeigt
- Interpretation: Welche Trends sind erkennbar? Bewegen sich alle Länder in dieselbe Richtung? Was könnte Wendepunkte oder Abweichungen erklären?

*Technische Schwerpunkte: `filter()`, `arrange()`, Zeitreihenvisualisierung*

### Baustein C — Mesoanalyse: Regionen und Dimensionen

Vergleiche **Weltregionen auf 2–3 Indikatoren gleichzeitig**. Prüfe, ob regionale Muster über verschiedene Dimensionen hinweg stabil sind oder sich verschieben.

**Muss enthalten:**
- 2–3 inhaltlich begründete Indikatoren
- Umformen von Breit- ins Langformat mit `pivot_longer()`
- Eine facettierte Visualisierung (ein Panel pro Indikator, Regionen im Vergleich)
- Eine Zusammenfassungstabelle: Mittelwert pro Region pro Indikator
- Interpretation: Welche Regionen stechen hervor? Ist die Reihenfolge über Indikatoren stabil?


*Technische Schwerpunkte: `pivot_longer()`, `group_by()`, `summarise()`, `facet_wrap()`*

### Baustein D — Zusammenhangsanalyse

Untersuche die **Beziehung zwischen wirtschaftlichem Entwicklungsstand und einem Ungleichheitsindikator**. Verbinde visuelle Exploration mit einem formalen Modell.

**Muss enthalten:**
- Mindestens eine neu erstellte Variable mit `mutate()` (z. B. log-transformiertes BIP, Einkommensquartile)
- Explizite Behandlung fehlender Werte: Wie viele Beobachtungen wurden ausgeschlossen, und warum?
- Eine Visualisierung des Zusammenhangs, mit einer dritten Variable als Farbe
- Ein einfaches Regressionsmodell mit `lm()` und `broom::tidy()`, inklusive Koeffizienteninterpretation in einfacher Sprache
- Interpretation: Richtung und Stärke des Zusammenhangs, auffällige Ausreißer, mögliche Erklärungen

*Technische Schwerpunkte: `mutate()`, fehlende Werte behandeln, Zusammenhangsvisualisierung, `lm()`, `broom::tidy()`*

### Baustein E — Eigenständige Analyse

Formuliere und beantworte eine **weiterführende Forschungsfrage**, die mindestens drei verschiedene Datentransformationsschritte verwendet. Dieser Baustein zeigt, dass du den gesamten Analyseworkflow selbstständig anwenden kannst.

**Muss enthalten:**
- Eine klar formulierte Frage zu Beginn des Abschnitts
- Eine Begründung (2–4 Sätze): Warum diese Frage, was erwartest du zu finden, wie hängt sie mit deinem roten Faden zusammen?
- Eine Analyse mit mindestens **drei verschiedenen Datentransformationsschritten**, die im Code kurz kommentiert sind
- Mindestens eine Ausgabe
- Interpretation: Was hast du gefunden? Entspricht es deiner Erwartung? Was trägt es zum Gesamtargument des Berichts bei?

**Falls du keine Frage findest — Gerüst:**
> - Was ist das für dich überraschendste Ergebnis deiner bisherigen Analysen? 
> -Wie könntest du diesen Befund weiter untersuchen und vielleicht ein bisschen Licht ins Dunkel bringen?

---

## Bonusaufgaben (optional — verbessern deine Note)

Wer alle fünf Pflichtaufgaben abgeschlossen hat und weitergehen möchte, kann beliebig viele der folgenden Erweiterungen hinzufügen. Jede Bonusaufgabe sollte im Bericht **klar gekennzeichnet** sein (füge einfach eine Überschrift ein: *„Bonusaufgabe B1 — Regressionsmodell"*, zum Beispiel).

Bonusaufgaben sind nicht nur „mehr Analyse" — sie erfordern die Anwendung fortgeschrittenerer Techniken und entsprechend tiefere Interpretationen.

| Kürzel | Aufgabe | Was du zeigst |
|--------|---------|---------------|
| **B1** | Erweitere das Regressionsmodell aus Baustein D: Füge einen zweiten Prädiktor hinzu (z. B. Demokratiebewertung oder Region als Faktorvariable) und vergleiche beide Modelle mit `broom::glance()` (R², AIC). Interpretiere: Was erklärt der zweite Prädiktor zusätzlich? Verbessert sich die Modellgüte? | Mehrfachregression, Modellvergleich, `broom::glance()` |
| **B2** | Füge eine **zweite selbst formulierte Frage** hinzu — eine völlig andere Analysefrage als in Aufgabe 5, beantwortet mit Code, Ausgabe und Interpretation. | Eigenständige Frageentwicklung und Analyse |
| **B3** | Führe eine **Teilgruppenanalyse** durch: Wiederhole eine deiner Kernanalysen separat für zwei unterschiedliche Teilgruppen (z. B. demokratische vs. nicht-demokratische Länder oder Hoch- vs. Niedrigeinkommensländer). Vergleiche und interpretiere die Unterschiede. | Gefilterter Vergleich nach Teilgruppen |
| **B4** | Erstelle eine **publikationsreife mehrteilige Abbildung** mit dem `patchwork`-Paket. Die Abbildung muss einen aussagekräftigen Titel, beschriftete Achsen, eine Bildunterschrift und eine Farbpalette haben. Schreibe eine Bildunterschrift, wie sie in einem Forschungsartikel stehen würde. | Fortgeschrittene Visualisierung, Plot-Komposition |
| **B5** | Nutze `pivot_wider()`, um **Daten ins Breitformat umzustrukturieren** — für einen konkreten analytischen Zweck. Erkläre, warum das Breitformat für diesen Schritt notwendig war. | Bidirektionales Umformen von Daten |
| **B6** | **Modelliere einen Trend über die Zeit**: Schätze eine Regression mit Jahr als Prädiktor für ein Land oder eine Region. Interpretiere die Steigung als Veränderungsrate pro Jahr (z. B. „Die Lebenserwartung stieg in diesem Zeitraum durchschnittlich um X Jahre pro Jahr"). | Regression auf Zeittrends angewendet |

---

## Bewertung

Der Bericht wird nach einem vierstufigen System bewertet. Die Stufen sind kumulativ: Jede höhere Stufe setzt alles aus der Stufe darunter voraus — plus mehr.

### Stufe 1 — Ausreichend *(4)*

Alle fünf Pflichtaufgaben sind vorhanden. Der Code läuft fehlerfrei und erzeugt Ausgaben. Interpretationen und Übergänge sind vorhanden (auch wenn sie knapp sind). Der Bericht rendert zu HTML.

**Gemeint ist:** Du warst dabei, du hast die Arbeit gemacht, du hast etwas abgegeben.

### Stufe 2 — Gut *(2–3)*

Alle fünf Pflichtaufgaben sind vollständig und korrekt ausgeführt. Interpretationen sind **substanziell**: Sie beziehen sich auf konkrete Werte aus deiner Ausgabe und gehen über das bloße Beschreiben der Grafik hinaus. Der Bericht hat einen erkennbaren **roten Faden**: Die Einleitung formuliert eine übergeordnete Frage, die Übergänge zwischen den Aufgaben sind inhaltlich begründet, und das Fazit beantwortet die Frage argumentativ. Deine Länderauswahl in Aufgabe 2 und deine Forschungsfrage in Aufgabe 5 sind klar begründet.

**Gemeint ist:** Du hast solide, durchdachte Arbeit abgeliefert — und ein kohärentes Argument gebaut.

### Stufe 3 — Sehr gut *(1–2)*

Alles aus Stufe 2, plus **1–2 Bonusaufgaben**, die korrekt und mit substanzieller Interpretation durchgeführt wurden.

**Gemeint ist:** Du bist über das Minimum hinausgegangen und hast echte Neugier gezeigt.

### Stufe 4 — Ausgezeichnet *(1)*

Alles aus Stufe 2, plus **3 oder mehr Bonusaufgaben** — ODER 1–2 Bonusaufgaben mit außergewöhnlicher Tiefe, Differenziertheit und Reflexion.

**Gemeint ist:** Du hast Arbeit abgeliefert, die weit über das Erwartete hinausgeht.

---

**Was „substanzielle Interpretation" in der Praxis bedeutet:**

| ❌ Oberflächlich | ✅ Substanziell |
|-----------------|----------------|
| *„Der Balken für Afrika ist höher."* | *„Länder in Subsahara-Afrika weisen deutlich höhere Kindersterblichkeitsraten auf — im regionalen Durchschnitt etwa 80 Todesfälle pro 1.000 Lebendgeburten im Jahr 2015, verglichen mit unter 10 in Westeuropa."* |
| *„Es gibt einen positiven Zusammenhang."* | *„Länder mit höherem BIP pro Kopf tendieren zu niedrigeren Gini-Koeffizienten, obwohl der Zusammenhang mäßig ist und mehrere lateinamerikanische Länder klare Ausreißer darstellen — sie sind relativ wohlhabend, aber hochgradig ungleich."* |
| *„Die Lebenserwartung ist über die Zeit gestiegen."* | *„Die Lebenserwartung in Südkorea stieg von 71 Jahren im Jahr 1990 auf 83 Jahre im Jahr 2019 — ein Gewinn von 12 Jahren in weniger als drei Jahrzehnten. Dieser Anstieg liegt im 90. Perzentil aller Anstiege von Ländern."* |

---

## Reflexionsabschnitt

Füge gegen Ende deines Berichts (vor dem Fazit) einen kurzen Absatz ein, der auf die folgenden Fragen eingeht. Dieser Abschnitt ist **verpflichtend**, wird aber nicht auf Korrektheit oder sprachliche Perfektion bewertet — schreib einfach ehrlich.

> - Was war der schwierigste Teil dieser Analyse für dich?
> - Was hast du über die Arbeit mit echten Daten gelernt, das du nicht erwartet hättest?
> - Siehst du Verbindungen zwischen dem, was du herausgefunden hast, und Themen, Theorien oder Forschungsfeldern, die du in deinem ersten Studienjahr kennengelernt hast? (Jede aufrichtige Verbindung ist gültig; es gibt keine falschen Antworten.)
> - Was würdest du als Nächstes untersuchen, wenn du mehr Zeit und Daten hättest?

---

## Hinweis zu KI-Tools

Du darfst KI-Tools (ChatGPT, Claude, GitHub Copilot usw.) nutzen, um:
- Konzepte oder Fehlermeldungen zu verstehen, die du nicht nachvollziehst
- Anregungen zu bekommen, wie du an ein Problem herangehst
- Ideen zu erkunden

Du darfst KI **nicht** nutzen, um deine Analyse zu schreiben, deine Interpretationen zu generieren oder deinen Code für dich zu produzieren.

Warum das in der Praxis wichtig ist — nicht nur ethisch: **Du kannst jederzeit gebeten werden, deine Analyse in einem kurzen Gespräch mit dem Dozenten zu erläutern.** Wenn du nicht erklären kannst, was dein Code tut, warum du bestimmte Entscheidungen getroffen hast oder was deine Ausgabe bedeutet, ist das ein Problem — unabhängig davon, ob KI involviert war.

Außerdem: Der Bericht ist so gestaltet, dass echte Analyse schneller geht als das Vortäuschen. Jede Studierende und jeder Studierende arbeitet mit einer anderen Kombination aus Ländern, Jahren und Indikatoren. Interpretationen, die sich auf deine spezifischen Ausgaben beziehen, deine konkreten Entscheidungen widerspiegeln und mit deinem eigenen Studium zusammenhängen, können von einer KI nicht generiert werden, die deine Daten nicht kennt. Wer versucht, die Arbeit auszulagern, verbringt mehr Zeit damit, KI-Ausgaben zu managen, als die Analyse selbst gedauert hätte — und liefert schlechtere Berichte ab.

---

## Praktische Checkliste vor der Abgabe

Bevor du abgibst, geh diese Liste durch:

**Projektstruktur**
- [ ] Der gezippte Abgabeordner ist korrekt benannt mit `[vorname]_[nachname]_abschlussbericht.zip`
- [ ] Der Abgabeordner enthält die `.Rproj`-Datei, die `.Rmd`-Datei, die `.html`-Datei, den `scripts/`-Ordner und den `data/`-Ordner
- [ ] Der `data/`-Ordner enthält deinen gefilterten Datensatz als `.rds`-Datei
- [ ] Die `.Rmd`-Datei bindet die Skripte mit `source(here("scripts/..."))` ein
- [ ] Das Projekt rendert fehlerfrei nach einem vollständigen Neustart von R (`Session → Restart R`) und erneutem Knitten des Berichts

**Inhalt und roter Faden**
- [ ] Eine Analysevorlage (A–E) wurde gewählt und ist in der Einleitung erkennbar. Wenn eine eigene Struktur gewählt wurde, wird diese erklärt.
- [ ] Die Einleitung enthält eine klar formulierte übergeordnete Forschungsfrage
- [ ] Der Datenabschnitt zeigt die wichtigsten Filterschritte als Code und enthält einen Plausibilitätscheck
- [ ] Alle fünf Pflichtaufgaben sind vorhanden, in der richtigen Reihenfolge, mit funktionierendem Code und mindestens einer Ausgabe
- [ ] Jede Aufgabe (außer Aufgabe 5) endet mit einem Übergang zur nächsten Aufgabe
- [ ] Jede Grafik hat einen aussagekräftigen Titel und beschriftete Achsen
- [ ] Auf jede Ausgabe (Grafik oder Tabelle) folgt eine schriftliche Interpretation
- [ ] Fehlende Werte werden explizit thematisiert
- [ ] Das Fazit beantwortet die Fragestellung argumentativ (nicht nur zusammenfassend)
- [ ] Der Reflexionsabschnitt ist vorhanden
- [ ] Eventuelle Bonusaufgaben sind klar gekennzeichnet
- [ ] Dein Name und deine Matrikelnummer stehen im Bericht (im YAML-Header oder in der Einleitung)

---

## Fragen?

Wenn etwas in diesen Anweisungen unklar ist, bespreche dich mit deinen Mit-Studierenden oder wende dich an mich.
