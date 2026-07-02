# Session 9 — XXX

**Seminar:** Globale Ungleichheit · Wintersemester 2025/26

---

## Inhaltsverzeichnis




---

<h2 id="endprodukt">Dein Endprodukt</h2>



---

<h2 id="wo-du-arbeitest">Wo du arbeitest</h2>

Führe zuerst den **SETUP-Abschnitt** aus — er lädt die nötigen Pakete und den OWID-Datensatz.

Alle Code-Aufgaben bearbeitest du in den folgenden Skripten: `session_09_data_wrangling.r`, `session_09_analysis.r` (beide im `scripts`-Ordner) und `session_09_report.Rmd` im `session_09`-Ordner.\

---

<h2 id="einleitung">Einleitung: XXX</h2>


---

<h2 id="endprodukt">Dein Endprodukt</h2>

---

<h2 id="neue-werkzeuge">Neue Werkzeuge dieser Session</h2>

---

<h2 id="wo-du-arbeitest">Wo du arbeitest</h2>

In dieser Session vertiefen wir die Trennung von Datenaufbereitungs- und Analyse-Skripten, sowie die Nutzung von RMarkdown als Format für die Erstellung von Berichten. Das heißt, du wirst...



---

<h2 id="aufgaben">Übungen</h2>

---

<h3 id="ue1">Ü1 · Datenaufbereitung</h3>

### Ziel

XXX

### Deine Aufgaben

Schreibe den Code in den Abschnitt **Ü1** in `scripts/session_09_data_wrangling.r`.

**a)** 

<br>

<details>
<summary><strong>Tipps</strong></summary>

**Ü1 a**



</details>

<br>

<details>
<summary><strong>Lösung</strong></summary>

```r
# Ü1 a



```

</details>

<br>

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>

---


- `join()`: add additional information from earlier year to a cross-section data set.
- ggplot details, color palettes: scale_colour_brewer(type = "seq", palette = "Spectral"). Color blind palettes. https://www.color-blindness.com/coblis-color-blindness-simulator/


# The palette with grey:
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# The palette with black:
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# To use for fills, add
  scale_fill_manual(values=cbPalette)

# To use for line and point colors, add
  scale_colour_manual(values=cbPalette)
























---

<h2 id="abgabe">Abgabe</h2>

Wenn du fertig bist:

1. Speichere das Skript `scripts/session_07_skript.R`.
2. Stelle sicher, dass alle fünf Pflicht-Plots im Ordner `output/` gespeichert wurden:
   - XXX

   **Optional (Bonus-Aufgaben):** Wenn du B-Ü6 oder B-Ü7 bearbeitet hast, kannst du zusätzlich diese Plots speichern — sie sind für die Abgabe nicht verpflichtend:
   - XXX

3. Reiche auf Learnweb ein:
   - `scripts/session_07_skript.R`
   - die Pflicht-Plots aus `output/`
   - optional: Bonus-Plots, falls du die Bonus-Aufgaben bearbeitet hast

> **Falls etwas nicht klappt:** Lies zuerst die Fehlermeldung, frage deine Buddy-Partner:in oder schau in den [häufigen Fehlern](../../resources/other/common_errors.md) nach.

---

<p align="right"><a href="#inhaltsverzeichnis"><strong>Zurück zum Inhaltsverzeichnis</strong></a></p>
