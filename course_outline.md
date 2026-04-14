# Introduction to R for Sociological Data Analysis — Course Outline

## Course Philosophy and Learning Approach

- The course focuses on **learning by doing** rather than memorizing commands.
- Each session follows a complete analysis workflow: **Data → Transform → Visualization → (Model) → Summary → Interpretation → Reporting**. This workflow structures both in-class exercises and applied work. The workflows are very simple at the beginning and become gradually more sophisticated.
- New techniques are introduced gradually and revisited repeatedly. Students are oriented throughout: "Where are we in the workflow?"
- Early emphasis is placed on **visualization** to provide immediate, interpretable results.
- Templates that come up in the final report should be implicitly introduced through exercises and homework, in order to familiarize students with typical avenues of inquiry.
- Students are encouraged to view code as a **reusable research asset**, not a one-time tool.
- **Errors and debugging** are treated as a normal and productive part of data analysis.
- Each session has a **hook**: an exciting application or a cool plot that students will be able to produce by the end.
- **From Session 2 onward, students produce a tangible output** they can be proud of — even if it comes from code they didn't fully write themselves yet.


## Core + Bonus Add-On Structure

From Session 7 onward, every session is split into two clearly marked tracks:

- **Core track**: The essential skills and exercises that every student completes. Designed so that a student who has been struggling can still finish, feel accomplished, and build toward the final report. This is the baseline for grading.
- **Bonus add-ons**: Modular extensions for students who finish the core quickly. These deepen understanding, introduce more advanced techniques, or pose more open-ended challenges. Students choose which add-ons to tackle. Bonus material enriches the final report but is not required for a passing grade.

The split between core and bonus is **crystal clear** in every session's instructions, exercises, homework, and the final report rubric. Students who only complete core material across the semester can produce a solid final report. Students who engage with bonus material produce a more sophisticated one.

This structure also applies to **homework**: each assignment has core tasks (mandatory) and bonus tasks (optional). And to the **final report**: the rubric defines baseline requirements (achievable with core-only skills) and extension criteria (for students who used bonus techniques).

Sessions 1–6 do not need a formal core/bonus split — the scaffolding is tight enough that most students can complete the full session. However, each session still has open-ended tasks at the end that serve as natural extensions for faster students.


## Software and Tools

- R and RStudio (Windows and macOS — all instructions cover both platforms)
- RStudio Projects for file and folder management
- Core packages from the tidyverse (dplyr, tidyr, ggplot2)
- Additional packages as needed (e.g., janitor, broom, here, patchwork, forcats, stringr)
- R Markdown for reproducible reporting (introduced gradually, starting Session 4)


## Data

The course has the substantive topic **"Global Inequalities"** and uses **Our World in Data (OWID)** as the main data source. The main dataset is a country-year panel (~75,000 rows, 46 variables) compiled from different OWID sources.


**Toy data progression (illustrative):**

For each session, we curate **toy datasets**: small, hand-picked subsets where relevant variables are populated and NAs appear only where intended for pedagogical purposes. This is one of the most critical prep tasks.

| Session | Toy data features |
|---------|-------------------|
| 2 | 3–5 countries, 1–2 variables, no NAs |
| 3 | Same structure, loaded from file |
| 4 | + missing values (intentional) |
| 5 | + multiple countries, logical subsetting needed |
| 6 | + grouping variable (region), multiple groups |
| 7 | + multiple indicators for visualization variety |
| 8 | (consolidation — reuses data from earlier sessions) |
| 9 | + messy labels, wide format, needs reshaping |

In homework, students work with the **full OWID dataset** but filter for specific subsets that mirror the session's scope. As the semester progresses, they use the data more fully.

**Additional datasets** (optional, for later sessions):

- **GRID data** (~31,000 rows): country-year-gender-age panel with top income shares. Useful for inequality deep dives.
- **AI data** (~120 rows): cross-sectional country-level data on AI investment and patents. Useful for Sessions 10–12.
- Codebooks for these will be completed if and when they are integrated.


## Support Structure

There are **no teaching assistants**. Support is organized as follows:

1. **Buddy system**: Students who grasp concepts quickly are paired with 1–2 students who need more time. Buddies help each other during exercises and homework. Pairs are formed in Sessions 1–2 and may rotate.
2. **Self-directed session design**: Sessions are designed so that most of the time, students follow detailed instructions and exercises from the GitHub repo autonomously. This frees the instructor to roam and troubleshoot.
3. **Troubleshooting resources**: The repo contains a prominent, detailed troubleshooting section covering common errors, setup problems, and recovery procedures. Every session's instructions link to it.
4. **All instructions are ELI5**: Every instruction, every step, every file path is spelled out in painstaking detail. Students should be able to follow along without instructor help for the majority of the session.


## Grading

Grading is designed to **minimize instructor workload** while ensuring meaningful engagement:

1. **Homework (pass/fail)**
   - Weekly homework assignments tied to each session.
   - Each homework has **core tasks** (mandatory) and **bonus tasks** (optional).
   - Graded pass/fail: Did the student submit? Does it show genuine engagement with the core tasks?
   - Submission folder is **public** so students can review each other's solutions.
   - Sets the baseline for course participation.

2. **Final report**
   - A cumulative R Markdown analysis report due **after the teaching period ends**, before the new semester begins.
   - Scaffolding for the report is provided progressively during the semester and explicitly in Session 13.
   - Must include code, figures, tables, and written interpretation.
   - The rubric has two tiers:
     - **Baseline requirements**: achievable using only core-track skills from the semester. A solid report at this level earns a good grade.
     - **Extension criteria**: more sophisticated analyses, visualizations, or techniques from the bonus add-ons. These earn a higher grade.
   - Needs **design features that require genuine engagement** — not easily outsourced to AI entirely. (Specific anti-AI measures to be designed.)

3. **Buddy feedback (optional/encouraged)**
   - Students are encouraged to exchange feedback on each other's work.
   - Organized by students themselves; scaffolding and guidelines provided by the course.


## Exercises

### Goals

**Technical skills:**

- Break problems into smaller steps
- Write code
- Inspect data and objects
- Debug: read and interpret error messages
- Use RStudio's help system
- Search documentation and online resources
- Use generative AI tools responsibly

**Data skills:**

- Transform data
- Conduct plausibility checks
- Create plots and tables

**Analytical thinking:**

- Compare groups
- Identify patterns
- Ask meaningful questions
- Choose appropriate summaries
- Build a narrative
- Interpret results in context
- Reflect on effect sizes and magnitude of differences

**Statistical reasoning:**

- Apply introductory statistics concepts: distributions, mean, median, SD, min/max, IQR and outliers, Cohen's d, Pearson's r, chi-squared, Cramer's V, regression, hypothesis testing
- Interpret measures (r, d, chi-squared, regression coefficients)
- Understand uncertainty

### Types of Exercises

| Type | Description | Example |
|------|-------------|---------|
| **Guided execution** | "Run this and observe." Reduces fear, builds familiarity. | Run a working ggplot script |
| **Fill-in-the-blanks** | Scaffolded coding. Low cognitive load. | Complete the `aes()` call |
| **Code modification** | Change something meaningful. | "Modify the plot to compare regions instead of countries" |
| **Write from scratch** | Clear task, no code given. | "Create a plot showing inequality over time" |
| **Debugging / bug hunt** | Find and fix errors. | Fix a script with a typo in a variable name |
| **Reverse engineering** | Given output, infer code. | "What code produces this plot?" |
| **Plausibility check** | Verify output structure and content. | "Are values in expected range?" |
| **Mini research question** | Substantive question requiring analysis. | "Is inequality higher in richer countries?" |
| **Interpretation** | No coding, only thinking. | "What does this plot suggest about inequality trends?" |
| **Read code** | Comprehension without execution. | "What does this code do?" |
| **Map out strategy** | Plan steps before coding. | "To accomplish Y, I need X1, X2, X3. Output looks like Z." |

### Exercise Architecture (per session)

1. **Warm-up**: Guided execution → fill in the blanks → small code modification
2. **Core skill** (new concept): Fill in the blanks → bigger code modification → small debugging → reverse engineering
3. **Application** (use tool to answer a question): Small debugging → big code modification → reverse engineering → bug hunt (broken code, typical mistakes)
4. **Open task**: Mini research question → interpretation → write from scratch → reverse engineering

From Session 7 onward, steps 1–3 are **core** and step 4 transitions into **bonus add-ons**.

### Output Types

- Data queries
- Plots
- Tables
- Short written interpretation: "Write 2–3 sentences explaining your result"


## Homework Structure

- Mirrors the session structure but is slightly more open.
- Extends the analytical question from class (e.g., session: compare regions → homework: compare regions over time).
- Each assignment has **core tasks** (mandatory, pass/fail) and **bonus tasks** (optional, enriches the final report).
- Students work in the **core project** with real OWID data.
- Through homework, students gradually build a **cumulative R Markdown report** that integrates code, tables, figures, and text.
- Over the semester, homework introduces professional project workflows:
  - Organizing analyses across multiple scripts
  - Sourcing scripts with `source()` (introduced gradually, not from the start)
  - Relative paths and `here::here()`
  - Separating analysis and reporting
  - Scaling up from small examples to larger projects
- In the early weeks, students work in standalone scripts. The `source()` workflow is introduced once they are comfortable with scripts and R Markdown individually.
- Homework is submitted to a **public folder** so students can review each other's solutions.


---

## Session Overview

### Session 1 — Course Overview and Motivation

**Core questions:**

- Why learn R? Why code instead of point-and-click?
- What will we be able to do by the end of this course?

**Main content:**

- Motivation for using R in sociological research
- Course overview and syllabus
- How sessions work: structure, buddy system, expectations
- Code of Conduct
- Homework and grading (core + bonus structure explained)
- Resources: cookbooks, cheatsheets, DataCamp, online resources
- **Responsible AI use policy**: Use AI to explain things you don't understand. Do NOT use it to write your homework code.
- Connect with each other: form buddy pairs
- Use student motivation survey as example (some complete before class, some in class)
- Show a "highlight reel" of cool outputs they'll create this semester

**Hook:** A gallery of compelling plots and analyses students will be able to produce.

---

### Session 2 — Setting Up R and First Steps

**Core questions:**

- What are R and RStudio, and how do they work together?
- Can I get R to do something today?

**Main content:**

- Ensure everyone has R and RStudio installed and running
  - Students who are set up get a warm-up exercise; those with issues get support
- R vs RStudio: the engine vs the dashboard
- The console: arithmetic, simple expressions
- Objects and assignment (`<-`)
  - Objects live in memory
  - Nothing changes unless assigned
- Running a **pre-written script** that produces a compelling plot
  - Students don't need to understand every line — the goal is a tangible output and the feeling of "I made R do something"
- Very basic troubleshooting: "What to do when something goes wrong"

**New concepts:**

- R vs RStudio
- Console
- Objects and assignment (`<-`)

**Output to be proud of:** A rendered plot from a pre-written script.

**No pipes, no ggplot coding, no R Markdown yet.**

---

### Session 3 — Scripts, Functions, and First Visualization

**Core questions:**

- How do scripts, data, and output fit together?
- How can I create my own plot?

**Main content:**

- Scripts vs console: why save your code?
- RStudio Projects, paths, and file organization
- Functions: take input, return output
- Pipes (`|>` or `%>%`): basic introduction
- Loading data: `read_csv()` with a small toy dataset
- First student-written ggplot: histogram or bar plot
- How functions relate to data types: not all functions work with all objects
- **How and why to comment code**
  - Comments are for humans, not for R — they explain *why* a decision was made, not *what* the code does
  - Bad comment: `# filter to year 2015` (just restates the code)
  - Good comment: `# 2015 has the best data coverage for the Gini variable (~178 countries)`
  - Section headers in scripts using `# ---` or `# ====` (RStudio folds these for navigation)
  - Rule of thumb: if someone else opened your script tomorrow, could they follow your reasoning?

**New concepts:**

- Scripts
- RStudio Projects
- Functions
- Pipes (basic)
- `read_csv()`
- First ggplot (student-written)
- Code commenting (what, why, how)

**Tools:** RStudio Projects, tidyverse, ggplot2

**Data:** Small toy dataset (3–5 countries, 1–2 variables, no NAs), created inline or loaded from file.

**In-class analysis:** Make a simple plot (e.g., bar plot of GDP by country, or histogram of life expectancy).

**Exercises:**

- Run working example
- Fill in missing `aes()` or variable names
- Modify plot (color, labels)
- Bug hunt: object not found / typo

---

### Session 4 — Data Structures, Variable Types, and Missing Values

**Core questions:**

- What is a dataset in R?
- Why does `NA` break things?
- How do I turn analysis into a document?

**Main content:**

- Data frames and tibbles
- Tidy data concept
- Variable types and their implications: numeric, character, factor, logical
- Missing values (`NA`) and basic handling
- Inspecting data: `glimpse()`, `summary()`
- Reading errors and debugging (error message ladder)
- **Introduction to R Markdown** using a working template
  - Students knit without touching chunk options
  - Goal: see that code + text = document

**New concepts:**

- Tibbles / data frames
- Variable types
- Missing values (`NA`)
- `glimpse()`, `summary()`
- R Markdown basics (knit a template)

**Tools:** tibble, dplyr, R Markdown

**In-class analysis:**

- Summarize inequality indicators
- Plot with missing values handled explicitly
- Use mean, median, SD

**Exercises:**

- Identify variable types
- Fix NA-related errors
- Knit an R Markdown template
- Add a sentence interpreting a plot

---

### Session 5 — Filtering, Sorting, and Focused Comparisons

**Core questions:**

- How do we focus on relevant cases?
- How do comparisons shape sociological conclusions?

**Main content:**

- Subsetting data with `filter()`
- Sorting and ranking with `arrange()`
- Logical conditions and operators
- Comparing groups through plots and summaries
- Adding figures and interpretation to R Markdown
- Simple trend line via `geom_smooth()`
- Technique: map out output structure by hand (pen and paper) before coding

**New concepts:**

- `filter()`
- `arrange()`
- Logical operators (`==`, `!=`, `>`, `<`, `&`, `|`, `%in%`)
- Conditional subsetting

**Tools:** dplyr, ggplot2

**In-class analysis:**

- Compare countries or income groups
- Focused plots: subset data → plot → interpret

**Exercises:**

- Fill in filters
- Create comparison plot
- Bug hunt: logical error / missing parentheses

**Markdown:** Add one figure + interpretation paragraph.

---

### Session 6 — Grouped Summaries and Crosstabs

**Core questions:**

- How do we summarize inequality across groups?
- How do tables and plots relate?

**Main content:**

- Grouped data analysis with `group_by()` and `summarise()`
- Counts and proportions
- Crosstabs using `janitor::tabyl()`
- Linking tables and visualizations
- Interpreting group differences
- Cohen's d (conceptual introduction)

**New concepts:**

- `group_by()` + `summarise()`
- `count()`
- `janitor::tabyl()`
- Proportions

**Tools:** dplyr, janitor, ggplot2

**In-class analysis:**

- Crosstab: region × income group
- Bar plot of proportions
- Mean differences → Cohen's d (conceptual)

**Exercises:**

- Fill in grouped summaries
- Match table ↔ plot
- Bug hunt: forgetting `group_by()`

**Markdown:** Table + plot, both interpreted.

---

### Session 7 — Visualization and Plot Customization

**Core questions:**

- How do I make my plots clearer, more professional, and more informative?
- How do design choices affect what a reader takes away?
- How do I make my code as readable as my output?

**Main content (core):**

- Practical ggplot customization: labels, axis formatting, titles, captions
- Themes: built-in themes, `theme()` for fine-tuning
- Color palettes (viridis, brewer, manual scales)
- Choosing appropriate plot types for different questions
- Faceting vs grouping: when to use which
- Writing clear plot interpretations
- **Code style and automatic formatting with `styler`**
  - Why code style matters: readable code is considerate to others (and to yourself in 3 months)
  - The tidyverse style guide as the course standard: consistent spacing, indentation, line length
  - `styler::style_file()` and the RStudio Addin ("Style active file") — one click reformats a script
  - What `styler` does and does not do: it fixes layout, not logic. It cannot make bad code good, but it makes good code easier to read.
  - Brief demo: before/after styling a messy script

**Bonus add-ons:**

- Combining multiple plots with patchwork
- Recreating a published plot (e.g., "what a catastrophe"-style)
- Heatmaps with `geom_tile()`
- Animated plots with gganimate

**New concepts (core):**

- Themes and `theme()` customization
- Color palettes and color scales
- Faceting (`facet_wrap()`, `facet_grid()`)
- Code style principles (tidyverse style guide)
- `styler` for automatic code formatting

**New concepts (bonus):**

- patchwork for plot composition
- `geom_tile()` for heatmaps
- gganimate (extracurricular)

**Tools:** ggplot2, styler, (bonus: patchwork, viridis/RColorBrewer, gganimate)

**In-class analysis:**

- Take a plot from a previous session and progressively improve it
- Compare "before and after" versions

**Exercises (core):**

- Apply color palettes to an existing plot
- Customize labels, theme, and axis formatting
- Choose appropriate plot types for different data questions
- Bug hunt: mismatched aesthetics

**Exercises (bonus):**

- Combine two plots with patchwork
- Recreate a target visualization from a screenshot
- Create a heatmap of indicators × regions

**Markdown:** Polished plot with caption + interpretive paragraph.

---

### Session 8 — Practice and Consolidation

**Core questions:**

- Can I apply what I've learned so far to answer a real question?
- What do I still find confusing?

**Main content:**

- **No new concepts.** This session is dedicated to practice, consolidation, and catching up.
- Structured review exercises covering Sessions 2–7: objects, scripts, data types, NAs, filtering, grouping, summarizing, plotting, customization
- Guided mini-analysis: a small research question that requires chaining together multiple skills (filter → group → summarize → plot → interpret)
- Debugging practice: a set of broken scripts with common errors
- Time to work on the core project and catch up on homework
- Buddy check-in: pairs review each other's progress and help with sticking points

**Why this session exists:** Sessions 2–7 build the foundation. Before moving into more demanding material (reshaping, modeling), students need a moment to consolidate. Slower students catch up. Faster students deepen their skills through bonus material or get ahead on the core project.

**For faster students:**

- Tackle any bonus add-ons from Session 7 they haven't tried yet
- Work ahead on the core project
- Help their buddy partners
- Attempt a more open-ended analysis challenge (provided as an optional exercise)

**Exercises:**

- Guided mini-analysis (core)
- Debugging gauntlet: 5–6 broken code snippets to fix (core)
- Open-ended analysis challenge (bonus)
- Reverse engineering: "What code produced this output?" (bonus)

---

### Session 9 — Reshaping Data and Dealing with Messiness

**Core questions:**

- Why is real data messy?
- Why does data shape matter for analysis and plotting?

**Main content (core):**

- Wide vs long data formats: why shape matters for ggplot
- `pivot_longer()`: the essential reshape operation
  - One simple case: multiple indicator columns → long format
- Faceted visualizations with reshaped data

**Bonus add-ons:**

- `pivot_wider()`: reshaping in the other direction
- Basic string cleaning with stringr (e.g., fixing inconsistent country names)
- Factor ordering for polished plots (forcats)

**New concepts (core):**

- Wide vs long data
- `pivot_longer()`

**New concepts (bonus):**

- `pivot_wider()`
- String cleaning (stringr basics)
- Factor ordering (forcats basics)

**Tools:** tidyr, (bonus: stringr, forcats)

**In-class analysis (core):**

- Multiple inequality indicators → long format → faceted plot

**Exercises (core):**

- Reshape a small dataset from wide to long
- Create a faceted plot from reshaped data
- Bug hunt: wrong variable names after pivot

**Exercises (bonus):**

- Reshape data back to wide with `pivot_wider()`
- Clean messy country names with `str_replace()` or `str_trim()`
- Reorder factor levels for a cleaner bar plot

**Markdown:** Faceted plot with caption.

**Design note:** `join()` and/or `across()` may be introduced here or nearby, depending on final session design.

---

### Session 10 — Modeling and Interpretation

**Core questions:**

- How do models relate to descriptive analysis?
- What does a coefficient mean in context?

**Main content (core):**

- Models as extensions of descriptive analysis: "You've been doing this visually with `geom_smooth()` — now we make it explicit"
- One simple linear regression with `lm()`
- Using `broom::tidy()` to get readable output
- Interpreting the coefficient and p-value in plain language

**Bonus add-ons:**

- Model objects and their structure (`summary()`, `coef()`, `confint()`)
- Connecting model output to a plot (fitted line + scatterplot)
- Multiple regression (adding one predictor)
- Comparing model coefficients across subgroups

**New concepts (core):**

- Simple linear regression
- `broom::tidy()`

**New concepts (bonus):**

- Model objects in depth
- Multiple regression
- `broom::glance()`

**Tools:** stats::lm(), broom

**In-class analysis (core):**

- Inequality indicator ~ GDP per capita
- Interpret the output in 2–3 sentences

**Exercises (core):**

- Run a regression, extract tidy output, write interpretation
- Match model output to a scatterplot with `geom_smooth()`
- Bug hunt: wrong formula syntax

**Exercises (bonus):**

- Add a second predictor and compare models
- Visualize model predictions
- Interpret interaction effects (conceptual)

**Markdown:** Model table + plain-language interpretation.

---

### Session 11 — Working with Your Own Data

**Core questions:**

- What happens when you work with data you collected yourself?
- How do you clean messy, real-world survey data?

**Main content:**

- Work with **pre-collected survey data** (instructor runs a Google Form survey before class and distributes the CSV)
- Data cleaning workflow: inconsistent responses, missing values, free-text fields, type mismatches
- Building a small analysis pipeline from import to output
- Plausibility checks on self-collected data
- Discussion: what makes survey data different from curated datasets?

**Note:** The full Google Forms → R pipeline (authentication, API access, automated import) is documented in a **standalone walkthrough** in the resources folder. Students who want to collect and import their own data in future projects can follow it independently.

**Exercises:**

- Clean the survey data
- Produce a summary table and plot
- Identify and fix data quality issues

---

### Session 12 — AI-Supported Coding

**Core questions:**

- What can AI do for your coding workflow?
- How do you verify that AI-generated code actually works?

**Main content:**

- Which AI models are useful for R coding?
- What kinds of tasks can AI help with? (explain, generate, debug, refactor)
- How to prompt effectively
- Hands-on: **"Let the dogs off the leash"** — students use AI to accomplish a coding task end-to-end
- Critical evaluation: Does the output run? Is it correct? Does it do what you intended?
- Reflection: When is AI helpful? When is it dangerous?

**Note:** Responsible AI use is introduced in Session 1. This session builds on 11 weeks of coding experience so students can critically evaluate AI output.

---

### Session 13 — Wrap-Up and Next Steps

**Core questions:**

- What have we learned?
- How does R fit into sociological research going forward?
- How do we keep learning?

**Main content:**

- Review of the semester: skills acquired, workflow mastered
- **Scaffolding for the final report**: template, expectations, timeline, tips
  - Final report is due after the teaching period ends, before the new semester begins
  - Provide clear structure and rubric so students can work independently
- Clean project folder check
- Reflecting on challenges and breakthroughs
- Connecting the workflow to future coursework and research
- Resources for continued learning
- Buddy feedback exchange (optional — students organize this themselves)

**Deliverable:** Students leave with a clear plan, template, and scaffolding for their final report.

---


## Design Decisions to Finalize During Session Design

- **`join()`**: Introduce when students need it (e.g., adding region variable to OWID data). Likely fits around Session 5–6 or Session 9. Decide during session design.
- **`across()`**: Fold into a session where students need to apply operations to multiple columns. Likely fits in Session 6 (grouped summaries) or Session 9 (reshaping). Could be bonus material. Decide during session design.
- **`source()` workflow**: Introduce gradually. Students start with standalone scripts (Sessions 2–6), then transition to sourcing scripts in R Markdown (around Sessions 7–9). Exact timing to be decided during session design.
- **GRID and AI datasets**: Decide whether to integrate and where. If used, complete codebooks first.
- **Toy data subsets**: Curate for each session during session design. Ensure NAs only appear where pedagogically intended.
- **Final report**: Design template, rubric, anti-AI safeguards, and the two-tier grading criteria (baseline vs. extension).
- **Google Forms walkthrough**: Create as a standalone resource document.


## Resources to Create

- [ ] Troubleshooting guide (reset & recover)
- [ ] Cookbooks: ggplot, dplyr patterns, data wrangling
- [ ] Cheatsheets: RStudio shortcuts (incl. copy/paste, run line, source script, restart R, run chunks), tidyverse overview, ggplot reference
- [ ] Supporting materials: how to ask for help, how to read error messages, responsible AI use, common beginner mistakes
- [ ] Google Forms → R walkthrough (standalone)
- [ ] Final report template and rubric (two-tier: baseline + extension)
- [ ] Plot/table interpretation workflow guide
- [ ] Buddy feedback guidelines and scaffolding
