# Generative KI im Seminar — Regeln und Hinweise

Werkzeuge wie ChatGPT, Claude, GitHub Copilot und ähnliche KI-Assistenten sind in der Wissenschaft und in vielen Berufen angekommen. Sie erleichtern viele Aufgaben und sie werden auch nicht wieder verschwinden. Es ist daher sinnvoll, sie zu verstehen und zu lernen, sie richtig einzusetzen.

Im Seminar gibt es klare Regeln, was erlaubt ist und was nicht — und dahinter steckt ein konkreter Grund, der mit deinen eigenen Interessen zu tun hat.

---

## Warum du die Arbeit nicht einfach KI erledigen lassen solltest

Dieser Abschnitt ist der wichtigste. Bitte lies ihn dir aufmerksam durch.

### Du lernst das Falsche — oder gar nichts

Das Ziel dieses Seminars ist nicht, einen fertigen Bericht abzugeben. Das Ziel ist, dass du am Ende des Semesters **selbst** in der Lage bist, einen Datensatz einzulesen, ihn zu bereinigen, zu analysieren, zu visualisieren und deine Ergebnisse zu interpretieren.

Diese Fähigkeit ist übertragbar. Sie hilft dir in der Abschlussarbeit, im Studium, in der Forschung und in vielen Jobs — ob in der Wissenschaft, in der öffentlichen Verwaltung oder in der Privatwirtschaft. Wenn du die Aufgaben von einer KI erledigen lässt, gibst du diese Chance auf.

Es ist wie beim Fahrradfahren: Du kannst dir beschreiben lassen, wie es geht. Du wirst trotzdem hinfallen, bis du es selbst gemacht hast.

### Du bemerkst nicht, wenn die KI falsch liegt

KI-Sprachmodelle sind sehr überzeugend — auch wenn sie Unsinn produzieren. In R bedeutet das konkret:

- KI erfindet Funktionen, die nicht existieren
- KI verwendet veraltete Syntax aus älteren Paketversionen
- KI liefert Code, der auf den ersten Blick richtig aussieht, aber stille Fehler enthält — zum Beispiel falsche Filterlogik, die keine Fehlermeldung erzeugt, aber falsche Ergebnisse produziert
- KI gibt selbstbewusst falsche Interpretationen statistischer Ergebnisse

Wenn du nicht weißt, was der Code tut, kannst du diese Fehler nicht erkennen. Du gibst dann Arbeit ab, die du nicht verstehst und die möglicherweise falsch ist.

### Du bist beim mündlichen Gespräch verloren

Es kann passieren, dass ich Studierendebitte, ihre Analysen und ihren Code mündlich zu erläutern. 
Das ist keine Drohung, sondern eine Einladung: Wenn du die Arbeit selbst gemacht hast, ist das Gespräch einfach.

---

## Was erlaubt ist

| Einsatz | Erlaubt? |
|---------|----------|
| KI nach einer Fehlermeldung fragen und sich die Ursache erklären lassen | ✅ Ja |
| KI bitten, einen R-Befehl in einfachen Worten zu erklären | ✅ Ja |
| KI nutzen, um ein statistisches Konzept zu verstehen | ✅ Ja |
| KI fragen, was eine bestimmte Funktion macht | ✅ Ja |
| KI-generierten Code als Ausgangspunkt nutzen, den du danach vollständig verstehst und anpasst | ✅ Ja, mit Vorsicht |
| KI Code schreiben lassen, den du kopierst und einreichst | ❌ Nein |
| KI Interpretationen oder Schlussfolgerungen formulieren lassen | ❌ Nein |
| KI die Forschungsfrage, Variablenauswahl oder Analysestrategie entscheiden lassen | ❌ Nein |
| KI Teile des Abschlussberichts verfassen lassen | ❌ Nein |

Die Grenze ist: **Verstehen vs. Auslagern.** Wenn KI dir hilft, etwas zu verstehen, das du dann selbst umsetzt, ist das gut. Wenn KI die Arbeit für dich erledigt und du das Ergebnis einreichst, ist das nicht erlaubt.

---

## Wie du KI sinnvoll zum Lernen einsetzt

Das Entscheidende ist, wie du die Frage stellst.

### Gut: KI als Erklärer

> *„Ich habe diesen R-Fehler bekommen: `Error in mutate(...): non-numeric argument to binary operator`. Was bedeutet das? Erkläre mir die Ursache, ohne mir die Lösung zu nennen."*

> *„Was macht `pivot_longer()` in R? Erkläre es mit einem einfachen Beispiel."*

> *„Ich habe `group_by(land) |> summarise(mittelwert = mean(gini))` geschrieben. Erkläre mir Schritt für Schritt, was dieser Code macht."*

### Nicht gut: KI als Aufgabenerlediger

> *„Schreib mir den R-Code, der den Gini-Koeffizienten für Länder in Subsahara-Afrika über die Zeit visualisiert."*

> *„Interpretiere diese Grafik für mich."*

> *„Schreib mir die Einleitung für meinen Abschlussbericht."*

Der Unterschied: Im ersten Fall bekommst du eine Erklärung, die du anwendest. Im zweiten Fall bekommst du eine fertige Antwort, hinter der du nichts verstehst.

### Die „Erkläre, ohne zu lösen"-Technik

Ein nützlicher Prompt:

> *„Ich versuche, [X] zu tun und bekomme [Fehlermeldung / unerwartetes Ergebnis]. Erkläre mir, was das Problem sein könnte — aber nenne mir nicht die fertige Lösung. Ich möchte es selbst herausfinden."*

Das zwingt die KI, dir Konzepte zu erklären statt Code zu liefern, und zwingt dich, selbst zu denken.

---

## KI-Output kritisch prüfen — immer

Wenn du KI-generierten Code verwendest, teste ihn immer selbst und prüfe jede Zeile:

**1. Existiert die Funktion?**
Tippe `?funktionsname` in die Console. Wenn die Hilfedokumentation erscheint, existiert die Funktion. Wenn eine Fehlermeldung kommt, hat die KI sie erfunden.

**2. Aus welchem Paket kommt sie?**
KI nennt manchmal Pakete, die veraltet sind oder bei dir nicht installiert sind. Prüfe, ob das Paket geladen ist.

**3. Produziert der Code das richtige Ergebnis?**
Führe den Code mit einem kleinen Testdatensatz aus, dessen Ergebnis du kennst. Stimmt der Output mit dem überein, was du erwartest?

**4. Stimmt die Interpretation?**
Wenn KI dir sagt, was ein Ergebnis bedeutet: Überprüfe das kritisch. KI macht bei statistischen Interpretationen regelmäßig Fehler — besonders bei Kausalaussagen, Signifikanzniveaus und Einheitenangaben.

---

## Zusammenfassung

| Prinzip | Warum? |
|---------|--------|
| KI als Erklärer, nicht als Aufgabenerlediger | Du lernst nur, was du selbst durchdenkst |
| Immer selbst verstehen, was der Code tut | Sonst erkennst du KI-Fehler nicht |
| Interpretationen immer selbst schreiben | Das ist der eigentliche Lerninhalt |
| KI-Output immer testen | KI erfindet Funktionen und macht stille Fehler |
| Mündliche Nachfragen sind jederzeit möglich | Dein Verständnis zählt, nicht der Text |

KI ist ein mächtiges Werkzeug — aber nur, wenn du weißt, was du tust. Dieses Seminar gibt dir genau dieses Fundament.
