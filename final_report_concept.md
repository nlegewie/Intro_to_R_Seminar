# Final Report — Concept and Design Notes

*Internal planning document. For use during course development.*

---

## Overview

The final report is the culminating assignment of the course. It is a self-contained R Markdown document in which students analyze global inequality using the OWID dataset. It is due after the teaching period ends, before the new semester begins.

**Workload equivalent:** ~10-page term paper  
**Format:** R Markdown (`.Rmd`) knitted to HTML — students submit both files  
**Grading:** Very fast. Structured identically across all submissions; tasks and grade tiers are transparent from Day 1.


---

## Design Principles

- **The report is independent from the homework project.** Students build a cumulative homework project over the semester; the final report is a separate, fresh document. It draws on everything they've learned but starts from a clean slate. This prevents the report from being a patchwork of recycled homework code.
- **All core data wrangling skills are explicitly required.** Each task is designed to practice one or more specific tidyverse tools, ensuring students demonstrate command of the full toolkit from the semester — not just plotting.
- **Question formulation is mandatory for all students**, but scaffolded at the base level and open at the extension level. Every student practices forming their own research question.
- **Anti-AI measures are baked into the design** (see dedicated section). The main strategy is requiring specific, personal interpretation and reflection that cannot be produced without having actually run the analysis.
- **Grading is fast by design.** The report structure is identical across all students. Grade tiers are additive and transparent.


---

## Report Structure

| Section | Content | Approximate length |
|---------|---------|-------------------|
| **Introduction** | What is the focus of the report? Which indicators and why? Brief motivation. | 1–2 paragraphs |
| **Data** | What data, which subset (countries, years), how many observations after filtering, how were missing values handled? | 3–6 sentences |
| **Analysis** | Five core tasks (see below) | Bulk of the report |
| **Conclusion** | What did you find overall? What surprised you? What limitations does your analysis have? What would you investigate next? | 1–2 paragraphs |
| **Reflection** | See anti-AI section below | 1 paragraph |


---

## Core Tasks (Base Track — required for all students)

Each task requires:
- Working, commented R code
- At least one output (plot or table)
- 2–4 sentences of written interpretation

The five tasks together cover the full data wrangling toolkit from the semester. Each task is designed around a specific cluster of skills.

---

### Task 1 — Snapshot and Ranking

**Analytical focus:** What does the distribution of one inequality indicator look like across countries in a given year? Which countries stand out at the top and bottom?

**What to do:**
- Choose one inequality-related indicator from the dataset (e.g., Gini coefficient, poverty headcount ratio, child mortality rate, life expectancy).
- Filter to a single year with good data coverage (you will learn which years have good coverage in class).
- Produce a histogram (or density plot) showing the distribution across countries.
- Use `arrange()` and `slice()` to extract a ranked table of the 5 most and 5 least unequal (or highest/lowest) countries.
- Summarize the distribution: report and interpret the mean, median, standard deviation, and range.
- Interpretation: What does the distribution look like? Are there notable outliers? What do the top and bottom countries have in common?

**Skills practiced:** `filter()`, `arrange()`, `slice()`, `summarise()`, histogram/density plot, summary statistics, written interpretation.

---

### Task 2 — Trends Over Time

**Analytical focus:** How has one indicator changed over time? Do different countries follow similar or diverging paths?

**What to do:**
- Choose one indicator and a set of **4–8 countries** of your choosing.
- Write a brief justification (2–3 sentences): why did you choose these countries? What comparison do you expect to find interesting?
- Plot the indicator over time as a line chart, with countries distinguished by color.
- Use `arrange()` to inspect the data chronologically before plotting.
- Interpretation: Describe the trend(s) you observe. Is the indicator improving, worsening, or stable? Do all countries move in the same direction? Are there notable turning points?

**Skills practiced:** `filter()`, `arrange()`, line plot with `geom_line()`, color mapping in `aes()`, written interpretation.

---

### Task 3 — Regional Comparison Across Multiple Indicators

**Analytical focus:** How do world regions compare across several dimensions of development or inequality simultaneously?

**What to do:**
- Choose **2–3 indicators** from the dataset that represent different dimensions (e.g., income inequality + health + education).
- Filter to a recent year with good coverage across your chosen indicators.
- Use `pivot_longer()` to reshape the data from wide to long format so that all indicators appear in a single column.
- Produce a **faceted plot** (one panel per indicator) comparing world regions.
- Supplement with a grouped summary table: mean value per region per indicator using `group_by()` and `summarise()`.
- Interpretation: Which regions stand out on each indicator? Do the same regions always rank high or low, or does the pattern differ by indicator?

**Skills practiced:** `filter()`, `pivot_longer()`, `group_by()`, `summarise()`, `facet_wrap()`, bar chart or boxplot, written interpretation.

> **Note:** This task requires the region/continent variable to be present in the dataset. See data documentation.

---

### Task 4 — Relationship Between Development and Inequality

**Analytical focus:** Is there a systematic relationship between a country's level of economic development and an inequality-related outcome?

**What to do:**
- Choose one inequality-related outcome variable and use GDP per capita as the development measure (or justify an alternative).
- Use `mutate()` to create at least one new variable — for example: log-transform GDP per capita (`log(gdp)`), or create a categorical variable (e.g., grouping countries into income quartiles using `ntile()`).
- Produce a scatter plot of the two variables, with a trend line (`geom_smooth()`). Map a third variable (e.g., region or democracy score) to point color.
- Handle missing values explicitly: report how many observations were dropped and why.
- Interpretation: Describe the relationship. Is it positive, negative, or non-linear? Are there outliers that deviate from the trend? What might explain the relationship?

**Skills practiced:** `filter()`, `mutate()`, `drop_na()` or `filter(!is.na(...))`, scatter plot, `geom_smooth()`, color aesthetics, written interpretation.

---

### Task 5 — Your Own Question

**Analytical focus:** You formulate and answer a question of your own choosing.

**What to do:**
1. Use the **question-generation scaffold** below to develop your question.
2. State your question clearly at the start of this section.
3. Explain in 2–4 sentences: Why is this question interesting to you? What do you expect to find, and why?
4. Conduct the analysis. Use at least **three distinct data wrangling operations** (e.g., `filter()`, `group_by()` + `summarise()`, `mutate()`, `arrange()`, `pivot_longer()`) — name them in a code comment at the top of your code chunk.
5. Produce at least one output (plot or table).
6. Interpret the result: What did you find? Does it match your expectation? What does it tell you about global inequality?

**Question-generation scaffold:**
> - What group of countries or world region do I find interesting? Why?
> - What pattern or trend would I like to understand?
> - Which two or more variables from the dataset could I use to investigate this?
> - What time period should I focus on?
> - What would it mean if I found a strong pattern? What if I found no pattern at all?

**Skills practiced:** Student-chosen; must demonstrate independent application of the full workflow.

---

## Extension Track (optional — enriches grade)

Students choose any combination of the following. Each extension should be clearly labeled as such in the report.

| Extension | Description | Key skills |
|-----------|-------------|------------|
| **E1 — Regression model** | Add a formal regression to Task 4 using `lm()` and `broom::tidy()`. Report the coefficient in a formatted table and interpret it in plain language: what does a one-unit change in X predict for Y? | `lm()`, `broom::tidy()`, model interpretation |
| **E2 — Second self-formulated question** | A second original analytical question, answered with code, output, and full interpretation. Must differ substantively from Task 5. | Student-chosen |
| **E3 — Subgroup analysis** | Repeat one of the core analyses for two distinct subgroups (e.g., democratic vs. non-democratic countries, high-income vs. low-income countries) and compare results across subgroups. | `filter()`, faceting or grouped comparison |
| **E4 — Multi-panel figure** | Produce one polished, publication-quality multi-panel figure using `patchwork` (or `facet_grid()`). Apply a custom theme, proper labels, captions, and a color palette. Write a figure caption as you would in a research paper. | `patchwork`, `theme()`, `scale_color_*` |
| **E5 — Reshape and compare** | Use `pivot_wider()` to restructure a dataset for a specific analytical purpose. Explain why the wide format was needed for that task. | `pivot_wider()` |
| **E6 — Trend + model** | Fit a simple regression using year as a predictor to model the trend for one country or region. Interpret the slope coefficient as a rate of change per year. | `lm()`, `broom::tidy()`, trend interpretation |


---

## Grading

### Grade Tiers

| Grade | Requirements |
|-------|-------------|
| **Pass / sufficient (bestanden)** | All 5 tasks present; code runs without errors; output is produced; interpretations are present (even if shallow) |
| **Good (gut)** | All 5 tasks complete and correct; interpretations are substantive and reference specific values from outputs; country choices in Task 2 and question in Task 5 are clearly motivated |
| **Very good (sehr gut)** | Good + 1–2 extension tasks completed correctly with substantive interpretation |
| **Excellent (ausgezeichnet)** | Good + 3+ extension tasks, OR 1–2 extensions completed with exceptional depth, nuance, and reflection |

### What "substantive interpretation" means

A substantive interpretation:
- References specific values from the output ("Germany's Gini coefficient was 0.32 in 2018, compared to a regional mean of 0.29")
- Goes beyond restating what the plot shows ("the bar for Europe is shorter") to explaining what it means
- Acknowledges limitations or alternative explanations
- Connects patterns to broader context

A shallow interpretation:
- Paraphrases the visual without adding anything ("the line goes up over time")
- Makes claims unsupported by the output
- Is generic enough that it could describe any analysis

### Grading speed

The report structure is identical across all students. Grading a single report should take approximately 10–15 minutes:
- Knit the `.Rmd` to check that the code runs (~2 min)
- Scan each of the five tasks (~5 min)
- Read the conclusion and reflection section (~2 min)
- Check which extensions were attempted (~2 min)


---

## Anti-AI Measures

The report is designed so that genuine analysis is harder to fake than it is to do. The following features make AI-generated submissions detectable:

1. **Numbers in text.** Interpretations must reference specific values from the student's own output. Since every student chooses different countries, years, and indicators, AI-generated text will either hallucinate numbers or be generic. Graders can cross-check any number against the code in seconds.

2. **Justification of personal choices.** Tasks 2 and 5 require students to explain why they chose specific countries or formulated a specific question. Genuine motivation is personal and specific; AI responses are generic.

3. **Surprise and reflection.** The conclusion requires students to describe something that surprised them in their own analysis. This is nearly impossible to fake without having run the analysis.

4. **Sociological connections.** The reflection section asks: *"What connections do you see between what you found and other theories or research areas from your first year of courses?"* This requires drawing on specific content from other seminars — something an AI cannot do for a specific student in a specific program.

5. **Oral examination clause.** Students are informed at the start of the semester that they may be asked to explain their analyses in person. This is written into the syllabus and the report instructions. The possibility of a brief follow-up conversation is a strong deterrent — a student who did not write their own code cannot explain it under simple questioning.

6. **Code–text consistency check.** A student who outsources the writing but runs the code themselves (or vice versa) will produce mismatches between output values and written interpretation. These are quick to spot.

**Note:** A student who uses AI to understand concepts, debug errors, or get suggestions — but runs their own analysis and writes their own interpretation — will produce a perfectly good report. The anti-AI measures target wholesale outsourcing, not responsible use.


---

## Reflection Section (required for all students)

At the end of the report, before the conclusion, students write a short reflection (~1 paragraph, not graded for content but required for submission):

> - What was the most difficult part of this analysis?
> - What did you learn about working with real-world data that you didn't expect?
> - What connections do you see between your findings and other theories or research areas from your first year of courses? (E.g., sociological theories of inequality, development economics, political science, environmental sociology — any genuine connection is valid.)
> - If you had more time, what would you investigate next?

This section serves both pedagogical and anti-AI purposes. It is not graded for correctness or depth, but absence or obvious AI generation (generic, non-specific text) is noted.


---

## Open Design Questions (to resolve during session development)

- [ ] **Region variable**: Must be added to the OWID dataset before the report template is written. Task 3 depends on it.
- [ ] **Year recommendation**: Guide students toward 2010–2018 window for inequality variables (best coverage). Build this into the report instructions with a data documentation note.
- [ ] **Filtering non-country entities**: The dataset contains ~411 entities including regional aggregates (e.g., "Africa (UN)", "High-income countries"). Students need guidance on how to filter to sovereign countries only. Add to report instructions and/or data cleaning task in early homework.
- [ ] **Report template**: Create a starter project (not just an `.Rmd`) with the full folder structure: `.Rproj`, `abschlussbericht.Rmd`, `scripts/01_datenvorbereitung.R`, `scripts/02_analyse.R`, `data/` (empty, with a README explaining what goes here). Students fill in the analysis. All paths use `here::here()`. The `.Rmd` sources the scripts with `source(here("scripts/..."))`.
- [ ] **Submission format**: Zipped project folder. Students include their filtered data subset (not the full OWID file) in `data/`. Grader opens the `.Rproj` and knits — no path adjustments needed.
- [ ] **Oral exam clause**: Exact wording to be added to syllabus and report instructions.
- [ ] **Submission mechanism**: Confirm whether submission is via LMS, shared folder, or GitHub. Public submissions allow peer review but need a privacy check.
- [ ] **Final report scaffolding in Session 13**: Design the in-class session around reviewing the template, answering questions, and letting students begin the analysis with instructor support.
- [ ] **Two-tier rubric detail**: Expand the grade tier table above into a formal rubric once session design is complete and we know exactly which techniques students have been taught.
