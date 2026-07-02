# Session 9 — Von der Idee zur Frage

Heute beginnt die Vorbereitung auf deine **Abschlussarbeit**. In den nächsten drei Sitzungen bringen wir dich auf die Startbahn:

- **Heute (S9):** von einer vagen Idee zu einer **präzisen, machbaren Frage**.
- **S10:** von der Frage zur **Analyse** (Skripte, Modell, Tabellen).
- **S11:** von der Analyse zum **Bericht** (RMarkdown, knitten, abgeben).

Du musst die Arbeit **nicht** in diesen Sitzungen fertigstellen – danach hast du noch rund zwei Monate. Ziel heute ist nur: eine gute Frage, die die Daten auch beantworten können.

---

## Was du heute mitnimmst
- **Eine (oder zwei) Kandidatenfragen** zu deinem Thema aus dem Bereich „Globale Ungleichheiten“.
- Ein **Machbarkeits-Check**: Gibt es die Daten überhaupt – für genug Länder und Jahre?
- **Eine gewählte Reise** (J1–J5) aus dem Fragetyp-Katalog.

---

## Ablauf
1. **Demo:** Wir verwandeln gemeinsam eine vage Idee („Sind Demokratien gleicher?“) in eine präzise Frage – und sehen, wie der Machbarkeits-Check die Frage formt.
2. **Katalog:** Überblick über die fünf Reisen.
3. **Deine Arbeit:** Frage(n) formulieren, Machbarkeit prüfen, Reise wählen.
4. **Gruppenrunde:** Jede/r stellt die eigene Frage in **einem Satz** vor; die Gruppe hilft, Risiken zu erkennen.

---

## Deine Aufgabe (Eigenarbeit)

**Schritt 1 — Frage(n) formulieren.**
Nimm eine Vorlage aus dem `Fragetyp_Katalog.md` und fülle die Lücken mit deinem Thema. Schreib **eine oder zwei** Kandidatenfragen auf.

**Schritt 2 — Machbarkeit prüfen.** Lade zuerst die Hilfsfunktionen:
```r
source("R/helper_datencheck.R")
laender <- nur_laender(owid)
```
Dann prüfe deine Variablen:
```r
# Eine Variable:
variable_pruefen(laender, "gini")

# Zwei Variablen zusammen (für J3/J5) – welches Jahr hat genug Länder?
abdeckung_pro_jahr(laender, c("gini", "life_expectancy_birth"), ab_jahr = 2000)
```
Nutze den **`Daten_Abdeckung_Spickzettel.md`** als Orientierung.

**Schritt 3 — Entscheiden.**
- Ist die Frage **machbar**? (Genug Länder? Ein Jahr mit guter Abdeckung? Beide Variablen vorhanden?)
- Welche **Reise** passt (J1–J5)?
- Welches **Jahr** (oder welchen Zeitraum) nimmst du?

> **Denk an die Demo:** Das *neueste* Jahr ist oft das *leerste*. Geh im Zweifel ein paar Jahre zurück.

---

## Hausaufgabe

Entscheide dich für **eine** Frage und schreib ein **Mini-Exposé (5 Sätze)** ins Starter-Projekt:
1. Mein Thema ist …
2. Meine Frage lautet …
3. Ich nutze Reise … (J1–J5), weil …
4. Meine Variable(n) und mein Jahr: …
5. Das ist relevant, weil …

Bring das Exposé zu Session 10 mit – dort bauen wir die Analyse dazu.

---

## Checkliste zum Feierabend
- [ ] Ich habe eine Frage, die zu einer Reise (J1–J5) passt.
- [ ] Ich habe mit `variable_pruefen()` / `abdeckung_pro_jahr()` geprüft, dass die Daten existieren.
- [ ] Ich weiß, welches **Jahr** (oder welchen Zeitraum) ich nehme.
- [ ] Mein Mini-Exposé ist geschrieben.
