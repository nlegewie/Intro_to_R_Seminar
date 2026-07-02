# Fünf analytische Projekttypen

Dieser Katalog ist dein Werkzeugkasten für den Abschlussbericht. Du wählst **einen Projekttypen** und füllst ihn mit **deinem eigenen Thema** aus dem Bereich „Globale Ungleichheiten“. Die Typen geben dir die Struktur vor, so dass du nicht bei null anfangen musst.

Achtung: Die Projekttypen beschreiben Basis-Projekte. Für bessere Noten könnt ihr die umrissenen Analysen noch sinnvoll erweitern.

**Was jeder Projekttyp gemeinsam hat:**

- Er besteht aus **4–5 Schritten**, die von *beschreiben* zu *quantifizieren* führen.
- Er beginnt mit einer **Machbarkeitsprüfung** (gibt es die Daten überhaupt?).
- Jeder Projekttyp enthält **mindestens eine formatierte Tabelle** mit `kable()` / `kableExtra`.
- Jeder Projekttyp schließt mit einer **Synthese**: Was ist die Antwort auf deine Frage, und wo sind die Grenzen?
- Jeder Projekttyp verlangt von dir, nicht nur Analysen durchzuführen, sondern auch die Ergebnisse zu interpretieren.

**Welche Projekttypen für wen?**

| Projekttyp | Titel | Schwierigkeit |
|------|-------|---------------|
| **P1** | Die Landkarte | leicht – guter Einstieg |
| **P4** | Der Vergleich | leicht–mittel |
| **P2** | Der Wandel | mittel |
| **P3** | Der Zusammenhang | mittel–anspruchsvoll |
| **P5** | Die Abweichung | anspruchsvoll |

Wenn du unsicher bist: Nimm **P1** oder **P4**. Beide ergeben einen vollständigen, guten Bericht.

---

## P1 — Die Landkarte
**Leitfrage (Vorlage):**
> „Wie ist *[Variable X]* weltweit verteilt, und wo ist *[X]* am *[höchsten / niedrigsten]*?“

**Wann passt das?** Du hast **eine** Variable, die dich interessiert (z.B. Kindersterblichkeit, CO₂ pro Kopf), und willst wissen, wie sie sich über die Welt verteilt.

**Machbarkeit:** Eine Variable aus **Tier A oder B** des Spickzettels. Wähle **ein Jahr** mit guter Abdeckung.

**Der Ablauf:**

1. **Verteilung anschauen**: Histogramm der Variable für dein Jahr. *→ `geom_histogram`*
2. **Rangliste**: die Top-10 und Bottom-10 Länder. *→ `arrange`, `slice_max` / `slice_min`, Tabelle mit `kable`*
3. **Regionaler Vergleich**: Mittelwert oder Median je `world_region`. *→ `group_by`, `summarise`, `geom_col` oder Boxplot*
4. **Quantifizieren**: `lm(X ~ world_region)`: Sind die Regionsunterschiede signifikant, oder könnte es Zufall sein? *→ `broom::tidy`, Tabelle*
5. **Synthese**: Was sind Muster in den Unterschieden? Wie klar sind die Regionsunterschiede? Was überrascht?

**Interpretations-Fragen:** Wo liegt der Modus, wo liegen die Ränder? Ist die Verteilung schief (wenige extreme Länder)? Welche Region hebt sich ab?

**Typische Fallstricke:** Ein Jahr ist nur eine Momentaufnahme. Einzelne Ausreißer können die Rangliste dominieren. Sehr kleine Regionen sind wackelig.

---

## P4 — Der Vergleich
**Leitfrage (Vorlage):**
> „Unterscheidet sich *[Variable X]* zwischen *[Gruppen]* – und welche Gruppe schneidet am *[besten / schlechtesten]* ab?“

**Wann passt das?** Du willst Gruppen bestimmter Länder vergleichen. Die Gruppen können **schon vorhanden** sein (z.B. Regimetyp `democracy_score_string`, Weltregion) oder du **bildest sie selbst** (z.B. reiche/mittlere/arme Länder per Einkommens-Drittel).

**Machbarkeit:** Eine metrische Zielgröße (Tier A/B) + eine Gruppenvariable, **ein Jahr**. Prüfe die **Gruppengrößen**: Gruppen unter 5 Ländern sind problematisch für die Analyse.

**Der Ablauf:**

1. **Gruppen festlegen**: vorhandene Gruppe nutzen *oder* selbst bilden mit `mutate` + `ntile()` / `case_when()`. Gruppengrößen prüfen. *→ `count`*
2. **Verteilungen vergleichen**: Boxplot, Histogramm oder Dichtekurve je Gruppe
3. **Kennzahlen-Tabelle**: Anzahl, Mittelwert, Median je Gruppe. *→ `group_by`, `summarise`, `kable`*
4. **Quantifizieren** – `lm(X ~ gruppe)`: Die Koeffizienten sind die Unterschiede zur Referenzgruppe. *→ `broom::tidy`, `kable`*
5. **Synthese & Grenzen**: Welche Gruppe liegt vorn? Wie groß ist der Abstand? Vorsicht bei kleinen Gruppen und einem einzelnen Jahr; kein Kausalschluss.

**Interpretations-Fragen:** Ist der Gruppenunterschied groß oder klein im Vergleich zur Streuung *innerhalb* der Gruppen? Ist das Muster geordnet (je mehr…, desto…) oder unregelmäßig?

**Typische Fallstricke:** Kleine Gruppen tragen keine starken Aussagen. Selbst gebildete Gruppen brauchen eine klare Begründung. Ein Jahr ≠ dauerhaftes Muster.

---

## P2 — Der Wandel
**Leitfrage (Vorlage):**
> „Wie hat sich *[Variable X]* in *[Land / Region]* über die Zeit verändert?“

**Wann passt das?** Dich interessiert die **Entwicklung über die Jahre**, nicht ein Land-Vergleich, sondern der Verlauf.

**Wichtige Einschränkung:** Bleibe bei **einem Land** oder **einem regionalen Durchschnitt**. Wirf nicht viele Länder zusammen in eine Regression. Die Regression über `year` ist nur für **eine** Zeitreihe sinnvoll.

**Machbarkeit:** Eine Variable (Tier A/B) mit einer **langen, lückenarmen** Zeitreihe für deine gewählte Einheit.

**Der Ablauf:**

1. **Zeitreihe plotten**: Linie über die Jahre für deine Einheit. *→ `geom_line`*
2. **(optional) 2–3 Vergleichseinheiten**: weitere Länder/Regionen als Linien oder Facetten. *→ `color` / `facet_wrap`*
3. **Quantifizieren**: `lm(X ~ year)` für *ein* Land. Die Steigung = **durchschnittliche Veränderung pro Jahr**. *→ `broom::tidy`, `kable`*
4. **Einordnen**: Passt eine gerade Linie? Schau in den Plot: Gibt es Brüche, Sprünge, Trendwenden?
5. **Synthese**: Richtung, Tempo, auffällige Phasen.

**Interpretations-Fragen:** Um wie viel pro Jahr (bzw. pro Jahrzehnt) ändert sich X? Ist die Veränderung stetig oder gibt es Phasen?

**Typische Fallstricke:** Länder treten im Panel ein oder aus – Lücken verzerren den Trend. Die Steigung ist nur aussagekräftig, wenn der Verlauf einigermaßen gerade ist. Trend ≠ Ursache.

---

## P3 — Der Zusammenhang
**Leitfrage (Vorlage):**
> „Hängt *[Variable X]* mit *[Variable Y]* zusammen?“

**Wann passt das?** Dich interessieren **zwei metrische** Variablen und vermutest einen Zusammenhang (z.B. Bildungsausgaben und Lebenserwartung).

**Machbarkeit (hier besonders wichtig):** Beide Variablen brauchen im **selben Jahr** genug gemeinsame Länder. Nutze `Template B aus dem README, bevor du dich festlegst! (Erinnerung aus der Demo: das „neueste“ Jahr ist oft leer.)

**Der Ablauf:**

1. **Beide Variablen beschreiben**: kurz Spanne und Verteilung jeder Variable.
2. **Streudiagramm + Trendlinie** *→ `geom_point`, `geom_smooth(method = "lm")`*
3. **Quantifizieren**:`lm(Y ~ X)`: Steigung und Bestimmtheitsmaß R². *→ `broom::tidy`, `broom::glance`, `kable`*
4. **Heterogenität prüfen**: Gilt der Zusammenhang überall? Facetten je Weltregion *oder* Regression je Region und Steigungen vergleichen. *→ `facet_wrap(~ world_region)` mit `geom_smooth`*
5. **Grenzen & Synthese**: Ergebnisse einordner. Zu Korrelation ≠ Kausalität reflektieren. Mögliche Störvariablen benennen.

**Interpretations-Fragen:** Ist der Zusammenhang positiv/negativ, stark/schwach? Erklärt X viel oder wenig (R²)? Gilt das Muster in allen Regionen – oder nur in einer?

**Typische Fallstricke:** Einzelne Ausreißer können die Linie kippen. Ein sichtbarer Zusammenhang kann durch eine dritte Variable entstehen. Ein Jahr ≠ Beweis.

---

## P5 — Die Abweichung  *(herausfordernd)*
**Leitfrage (Vorlage):**
> „Welche Länder schneiden bei *[Y]* besser oder schlechter ab, als man aufgrund von *[X]* erwarten würde?“

**Wann passt das?** Du willst nicht den Durchschnitt, sondern die **interessanten Ausnahmen** finden, d.h. Länder, die aus dem Muster fallen.

**Der Ablauf:**

1. **Erwartung schätzen**: `lm(Y ~ X)` (wie P3, Schritt 3).
2. **Residuen extrahieren**: `broom::augment()` liefert `.resid` (die Abweichung vom Erwartungswert). 
3. **Auffällige Länder**: größte positive und negative Residuen. *→ `slice_max` / `slice_min`, `kable`; Streuplot mit Beschriftung via `ggrepel`*
4. **Profilieren**: Was ist an diesen Ländern besonders? (kurze inhaltliche Einordnung)
5. **Synthese**

**Typische Fallstricke:** Residuen hängen vom gewählten Modell ab. Bei kleiner Stichprobe sind Ausreißer instabil. Nicht überinterpretieren.

---

## Pflicht-Bausteine in **jedem** Bericht

- [ ] **Ein** Projekttyp gewählt und im Bericht benannt
- [ ] Forschungsfrage forstellen und deren Relevanz darlegen.
- [ ] Datengrundlage erläutern: Welche Variablen? Was genau messen sie und wie (im Codebook nachschlagen)?
- [ ] **Mindestens eine** Tabelle mit `kable` / `kableExtra`
- [ ] **Mindestens einen** Plot mit `ggplot`
- [ ] Ausformulierte Analysetexte zu jedem Schritt.
- [ ] Paragraphen, der die verschiedenen Schritte der Analyse verbinden und für einen Roten Faden sorgen.
- [ ] Ein **Grenzen-Abschnitt** (Was kann deine Analyse *nicht* zeigen?)
