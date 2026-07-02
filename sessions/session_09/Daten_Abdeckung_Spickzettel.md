# Spickzettel: Welche Daten kann ich benutzen?

Nicht jede Variable ist für jede Frage brauchbar. Manche gibt es nur für wenige Länder oder nur für **ein** Jahr. Dieser Spickzettel zeigt dir, **worauf du bauen kannst**, bevor du dich in eine Frage verliebst, die die Daten nicht beantworten können.

**Die drei Stufen (Tier):**

- 🟢 **Tier A – gut:** viele Länder, viele Jahre. Ideal für jeden Projekttyp.
- 🟡 **Tier B – ok:** brauchbar, aber prüfe Jahre/Länder genau (oft ~150–210 Länder, manchmal kürzerer Zeitraum).
- 🔴 **Tier C – dünn:** wenige Länder oder nur ein einziges Jahr. Für die meisten Projekttypen nicht geeignet.

> **Immer selbst nachprüfen!** Dieser Zettel ist eine Hilfestellung, kein Ersatz für deine egeinen Machbarkeits-Checks.

---

## 🟢 Tier A — gute Abdeckung (viele Länder, lange Zeiträume)

| Variable | Thema | Zeitraum | ~Länder |
|---|---|---|---|
| `population` | Bevölkerung | sehr lang | 237 |
| `life_expectancy_birth` | Gesundheit | ab 1950 | 235 |
| `co2_per_capita`, `co2`, `co2_per_gdp`, `share_global_co2` | Umwelt | ab ~1900+ | 210+ |
| `total_ghg` | Umwelt | ab 1850 | 197 |
| `child_mortality_rate` | Gesundheit | ab ~1932 | 198 |
| `democracy_score` (+ `democracy_score_string`) | Demokratie | ab 1789 | 173 |
| `land_animals_slaughtered_for_meat` | Tierwohl | ab 1961 | 199 |

**democracy_score ist kategorial!** Vier Regimetypen (0 = closed autocracy … 3 = liberal democracy). Für Vergleiche (J4) nutze `democracy_score_string`.

---

## 🟡 Tier B — brauchbar, aber Jahre/Länder prüfen

**Bildung:** `primary_enrollment_rate`, `secondary_enrollment_rate`, `tertiary_enrollment_rate`, `edu_spending_gdp`, `edu_spending_total_spending`, `girls_in_primary`/`boys_in_primary`, `girls_in_tertiary`/`boys_in_tertiary` — meist ab ~1970, ~190–210 Länder.

**Wirtschaft & Einkommen:** `gdp` (ab 1990). ⚠️ Die ganze **Einkommens-/Armuts-Familie** (`gini`, `mean_income`, `median_income`, `s80_s20_ratio`, `polarization_income`, `headcount_ratio_*`, `poverty_gap_index_international_povline`) deckt **~160 Länder** ab, aber **nur bis ~2021**, und das **neueste Jahr ist fast leer**. Bestes Fenster: **etwa 2013–2018**.

**Gesundheit:** `healthcare_spending_share_of_gdp` (ab 2000), `suicide_rate` (ab 2000), `suicide_rate_male`/`suicide_rate_female` (~115 Länder), `maternal_mortality_ratio`, `maternal_deaths`, `access_to_water` (ab 2000).

**Technologie:** `share_internet_users`, `number_of_internet_users` (ab 1990, 200+ Länder).

**Gesellschaft:** `female_labor_participation` (ab 1990), `female_homicide_rate`, `life_satisfaction` (ab 2011), `deaths_in_armed_conflicts` (ab 1989), `total_immigrants`/`total_emigrants`, `plastic_waste_exports`.

---

## 🔴 Tier C — dünn: nur mit Vorsicht (oder meiden)

Diese Variablen haben **wenige Länder** oder existieren **nur für ein einziges Jahr** – für Ländervergleiche oder Zeitverläufe meist ungeeignet:

- **Zeitverwendung** (`time_use_*`): nur **29 Länder**, nur **2013**. → Kein Panel, kein Weltvergleich möglich.
- **Wohnungslosigkeit** (`unhoused_either`, `living_streets_or_public_spaces`, `staying_temporary_acc_shelter`): **< 16 Länder**. → Nicht brauchbar.
- `domestic_violence_women`: nur **2018**, `plastic_waste_generation`: nur **2010**. → Nur als Momentaufnahme (J1), nie über Zeit.
- `healthy_diet` (ab 2017), `gender_wage_gap`, `years_of_schooling` (2010–2020), `trust_attitudes`, `bribery_prevalence`, `one_person_households`, `illiterate_rate`, `annual_working_hours` (nur 36 Länder), `genuine_savings` (nur 11 Länder): **stark eingeschränkt** – vor der Wahl unbedingt `variable_pruefen()` laufen lassen.

---

## Faustregeln

1. **Zwei Variablen (J3/J5)?** Beide müssen im **selben Jahr** genug gemeinsame Länder haben → `abdeckung_pro_jahr()`.
2. **Zeitverlauf (J2)?** Wähle eine Variable mit **langer, lückenarmer** Reihe für **eine** Einheit.
3. **Neuestes Jahr ≠ bestes Jahr.** Aktuelle Jahre sind oft am leersten. Geh 3–6 Jahre zurück.
4. **Im Zweifel Tier A.** Wenn dein Thema nur mit Tier C funktioniert, wähle ein anderes Thema; das erspart dir viel Frust.
