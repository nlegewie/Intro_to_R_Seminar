# Session 9 — Von der Idee zur Frage

Heute beginnt die Vorbereitung auf deine **Abschlussarbeit**. In den nächsten drei Sitzungen bringen wir dich in Startposition:

- **Heute (S9):** von einer vagen Idee zu einer **präzisen, machbaren Frage**.
- **S10:** von der Frage zur **Analyse** (Skripte, Modell, Tabellen).
- **S11:** von der Analyse zum **Bericht** (RMarkdown, knitten, abgeben).

Du musst die Arbeit **nicht** in diesen Sitzungen fertigstellen. Ziel heute ist nur: eine gute Frage, die die Daten auch beantworten können.

Für die, die keine Prüfungsleistung machen: Die Session werden euch zeigen, wir ihr ein neues Analyseprojekt angeht. Das ist über die Prüfungsleistung dieses Seminars hinaus sehr hilfreich.

---

## Was du heute mitnimmst
- **Eine (oder zwei) Kandidatenfragen** zu deinem Thema aus dem Bereich „Globale Ungleichheiten“.
- Ein **Machbarkeits-Check**: Gibt es die Daten überhaupt für genug Länder und Jahre?
- **Eine gewählte Reise** (P1–P5) aus dem Fragetyp-Katalog.

---

## Ablauf
1. **Demo:** Wir verwandeln gemeinsam eine vage Idee („Sind Demokratien gleicher?“) in eine präzise Frage – und sehen, wie der Machbarkeits-Check die Frage mit bestimmt.
2. **Katalog:** Überblick über die fünf Projekttypen.
3. **Deine Arbeit:** Frage(n) formulieren, Machbarkeit prüfen, Projekttyp wählen.
4. **Diskussion:** Wer mag, stellt seine Ideen für Fragestellungen vor; die Gruppe hilft, Risiken zu erkennen.

---

## Deine Aufgabe (Eigenarbeit)

**Schritt 1 — Frage(n) formulieren.**
Nimm eine Vorlage aus dem `Fragetyp_Katalog.md` und fülle die Lücken mit deinem Thema. Schreib **eine oder zwei** Kandidatenfragen auf.

**Schritt 2 — Machbarkeit prüfen.**

Bevor du eine Frage festlegst, musst du wissen: Gibt es überhaupt genug Daten? Nutze die folgenden Code-Templates und passe die hervorgehobenen Stellen an deine Variablen an. Führe den Code in deinem Analyse-Skript oder direkt in der Konsole aus.

---

**Template A — Steckbrief einer Variable.** Wie viele Werte gibt es? Über welche Jahre? In wie vielen Ländern?

Ersetze `DEINE_VARIABLE` durch den Variablennamen, z. B. `gini`.

```r
owid_daten |>
  filter(!is.na(DEINE_VARIABLE)) |>
  summarise(
    n_werte_ges   = n(),
    jahr_von  = min(year),
    jahr_bis  = max(year),
    n_laender = n_distinct(country)
  )
```

Was zeigt das Ergebnis?
- `n_werte_ges` — Gesamtzahl der Zeilen mit einem Wert (Land × Jahr)
- `jahr_von` / `jahr_bis` — Zeitspanne der verfügbaren Daten
- `n_laender` — Anzahl unterschiedlicher Länder, die jemals einen Wert haben

---

**Template B — Abdeckung pro Jahr (für P3 / P5: zwei Variablen zusammen).** Du brauchst oft für *dasselbe Land im selben Jahr* Werte auf *beiden* Variablen. Dieser Code zeigt dir, wie viele Länder das pro Jahr erfüllen — so findest du das beste Analysejahr.

Ersetze `VARIABLE_1` und `VARIABLE_2` durch deine Variablennamen, und passe `2000` ans früheste sinnvolle Jahr an.

```r
owid_daten |>
  filter(year >= 2000) |>
  filter(!is.na(VARIABLE_1), !is.na(VARIABLE_2)) |>
  count(year, name = "laender_mit_beiden") |>
  arrange(desc(laender_mit_beiden))
```

Schau, in welchem Jahr `laender_mit_beiden` am größten ist — das ist dein Kandidat. Denk daran: Das *neueste* Jahr ist oft das *leerste*, weil neue Daten noch nicht überall vorliegen.

---

**Template C — Gruppengrößen prüfen (für P4: Gruppenvergleiche).** Wenn du Länder nach einer Kategorie vergleichst (z. B. Demokratietyp), prüfe zuerst, wie viele Länder in jeder Gruppe stecken. Gruppen mit weniger als 5 Ländern können viele Analysen schwierig machen.

Ersetze `DEIN_JAHR` und `"DEINE_GRUPPE_VARIABLE"` entsprechend, z. B. `2018` und `"democracy_score_string"`.

```r
owid_daten |>
  filter(year == DEIN_JAHR, !is.na(DEINE_GRUPPE_VARIABLE)) |>
  count(DEINE_GRUPPE_VARIABLE, name = "n_laender") |>
  arrange(desc(n_laender))
```

Nutze den **`Daten_Abdeckung_Spickzettel.md`** als Orientierung, welche Variablen grundsätzlich gut abgedeckt sind.

**Schritt 3 — Entscheiden.**
- Ist die Frage **machbar**? (Genug Länder? Ein Jahr mit guter Abdeckung? Beide Variablen vorhanden?)
- Welche **Reise** passt (P1–P5)?
- Welches **Jahr** (oder welchen Zeitraum) nimmst du?

> **Denk an die Demo:** Das *neueste* Jahr ist oft das *leerste*. Geh im Zweifel ein paar Jahre zurück.

---

## Hausaufgabe

Entscheide dich für **eine** Frage und schreib ein **Mini-Exposé (5 Sätze)** ins dein `report_markdown.Rmd` im `Abschlussbericht`-Ordner:
1. Mein Thema ist …
2. Meine Frage lautet …
3. Ich nutze Projekttyp … (P1–P5), weil …
4. Meine Variable(n) und mein Jahr: …
5. Das ist relevant, weil …

Bring das Exposé zu Session 10 mit. Dort fangen wir an, die Analyse vorzubereiten.

---

## Checkliste zum Feierabend
- [ ] Ich habe eine Frage, die zu mindestens einem Projekttypen (P1–P5) passt.
- [ ] Ich habe mit Template A / B / C geprüft, dass die Daten existieren und genug Länder abdecken.
- [ ] Ich weiß, welches **Jahr** (oder welchen Zeitraum) ich nehme.
- [ ] Mein Mini-Exposé ist geschrieben.
