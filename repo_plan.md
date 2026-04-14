# Intro to R 2026 — Repository Plan

## 1. Overall Approach

The course is organized around a single, well-documented **GitHub repository** that serves as a one-stop shop for students. The repository provides all materials needed for the course: setup instructions, scripts, datasets, exercises, homework, reference materials, and recovery options.

**Design priorities:**

- Ease of use for complete beginners
- A stable and familiar workflow
- Modularity across sessions
- Robustness to missed sessions or broken scripts
- Minimal instructor micromanagement during the semester
- **All instructions are ELI5**: every step is spelled out in painstaking detail so that students can follow along without instructor help for the majority of the session
- **Core + bonus add-on structure**: from Session 7 onward, every session, homework, and the final report have a clearly marked core track (everyone) and modular bonus add-ons (for faster students)

**Key constraints:**

- Students are **not required to use Git** actively. The repository must work equally well when downloaded as a ZIP file.
- Instructions must cover **both Windows and macOS** with platform-specific guidance where needed.
- All paths are relative (using RStudio Projects and `here::here()`).


## 2. Repository Structure

```
intro-to-r-sociology/
│
├── README.md
│   → Main landing page
│   → Includes: course overview, how to use the repo, "Start here",
│     prominent link to troubleshooting
│
├── syllabus/
│   ├── syllabus.pdf
│   └── course_overview.md
│   → Formal course information (static)
│
├── setup/
│   ├── install_r.md
│   ├── install_rstudio.md
│   ├── project_setup.md
│   └── working_with_files.md
│   → Beginner-friendly onboarding, no prior knowledge assumed
│   → Covers both Windows and macOS
│
├── core_project/
│   ├── intro-to-r.Rproj
│   ├── README_project.md
│   ├── data/
│   ├── scripts/
│   │   ├── 01_clean_data.R
│   │   ├── 02_analysis.R
│   │   └── 03_helpers.R
│   ├── reports/
│   │   └── analysis_report.Rmd
│   └── output/
│       ├── figures/
│       └── tables/
│   → Cumulative project built up over the semester
│   → Used for homework and applied work (NEVER for toy-data exercises)
│
├── core_project_snapshots/
│   ├── week_02/
│   ├── week_03/
│   └── ...
│   → Complete working versions of the core project at each stage
│   → Primary safety net for catching up, debugging, recovery
│
├── sessions/
│   ├── session_01/
│   │   ├── instructions.md
│   │   ├── exercises.md         ← clearly split into core + bonus from S7 on
│   │   ├── data/
│   │   │   └── toy_data.csv
│   │   ├── scripts/
│   │   │   └── session_script.R
│   │   └── solutions_optional/
│   ├── session_02/
│   ├── session_03/
│   └── ...
│   → Fully self-contained session sandboxes
│   → Use toy data (curated subsets)
│   → Does NOT interact with core_project/
│
├── homework/
│   ├── hw_01/
│   │   ├── instructions.md      ← core tasks + bonus tasks clearly marked
│   │   ├── data/
│   │   ├── template/
│   │   └── checklist.md
│   ├── hw_02/
│   └── ...
│   → Uses real OWID data in the core project
│   → Submissions go to a public folder (students can review each other)
│
└── resources/
    ├── troubleshooting/
    │   └── reset_and_recover.md          ← CRITICAL DOCUMENT
    ├── cookbooks/
    │   ├── ggplot_cookbook.Rmd
    │   ├── dplyr_patterns.Rmd
    │   └── data_wrangling_examples.Rmd
    ├── cheatsheets/
    │   ├── rstudio_shortcuts.md
    │   ├── tidyverse_overview.pdf
    │   └── ggplot_reference.pdf
    └── other/
        ├── how_this_data_works.md
        ├── asking_for_help.md
        ├── using_genai.md
        ├── common_errors.md
        ├── google_forms_walkthrough.md   ← Standalone guide for self-study
        ├── interpretation_workflow.md
        └── buddy_feedback_guide.md
```

Each top-level folder has a **single, clearly defined purpose**. Students should never have to guess where something belongs.


## 3. Top-Level Documentation

### README.md

The landing page of the repository. Includes:

- What the course is about
- How to use the repository
- A brief explanation of the overall workflow
- Clear statement that **Git is optional** (ZIP download works fine)
- A short "Where to start" section with links to:
  - Setup instructions
  - The core project
  - The current session folder
- Brief explanation of the **core + bonus structure** (so students understand from day one)
- **Table of Contents**
- **Prominent link to troubleshooting** (reset_and_recover.md)
- [World Inequality Report 2026](https://wir2026.wid.world/insight/executive-summary/) as a reference for what topics can be explored.
- Always have cheatsheet for keyboard shortcuts handy
- Tips for students with dyslexia and other conditions that may affect certain aspect of attending the course
  - https://dev.to/codemouse92/comment/mb03


This file assumes no prior experience with GitHub.

### syllabus/

Contains:

- Formal syllabus (PDF or Markdown)
- Course overview and learning objectives
- Grading structure: homework (pass/fail, core + bonus tasks) + final report (two-tier rubric)
- Expectations regarding collaboration, buddy system, and AI use

Mostly static once the course begins.


## 4. Setup and Onboarding

### setup/

All onboarding materials, written for complete beginners:

- Installing R (Windows and macOS instructions, with screenshots)
- Installing RStudio (Windows and macOS)
- Creating and opening an RStudio Project
- Very basic explanation of files and folders
- How the course project is structured
- What students should (and should not) edit
- **Visual diagram of the standard workflow**: session sandbox → learn concepts → core project → apply to real data → homework

Nothing here assumes prior technical knowledge. This is where early anxiety is reduced.

**Reference:** Include keyboard shortcuts cheatsheet link (copy/paste, undo/redo, run line, source script, restart R).

**Reference:** Check Gelman et al. 2020 for their Guide to R Installation.

### How updates reach students

Since Git is optional, students who download ZIP files need a simple protocol for getting new materials:

- Each week, the instructor announces which session folder is new.
- Students download only the new session folder (or re-download the full ZIP if needed).
- The core project is designed so that new materials are additive — nothing previously downloaded needs to change.
- For mid-semester fixes, the troubleshooting guide explains how to replace individual files.


## 5. The Core Project (Canonical Working Environment)

### core_project/

The main working project that students use throughout the semester. After session exercises (with toy data), students use class time to start a real-data assignment in the core project, and finish it at home. Assignments build on each other so that by the end, students have a complete data wrangling and analysis workflow.

```
core_project/
├── intro-to-r.Rproj
├── README_project.md
├── data/
├── scripts/
│   ├── 01_clean_data.R
│   ├── 02_analysis.R
│   └── 03_helpers.R
├── reports/
│   └── analysis_report.Rmd
└── output/
    ├── figures/
    └── tables/
```

**Purpose:**

- Provides continuity across sessions
- Models professional research workflows
- Serves as the default environment for homework

**Design principles:**

- One script = one purpose
- Scripts are run top-to-bottom
- Analysis scripts create objects, not outputs
- The report sources scripts and presents results (introduced gradually)
- File paths are always relative (using Projects and `here()`)

### Gradual introduction of the source() workflow

The `source()` pattern (analysis script creates objects → Markdown report sources script and presents results) is powerful but complex. It is introduced **gradually**:

| Phase | Sessions | Workflow |
|-------|----------|----------|
| Phase 1 | ~2–6 | Students write standalone scripts. R Markdown is used only with inline code, not sourcing. |
| Phase 2 | ~7–9 | Students begin sourcing a simple script from R Markdown. One script, one source call. |
| Phase 3 | ~10–13 | Full workflow: multiple scripts, sourced by a report that presents results. |

Exact session boundaries to be decided during detailed session design. The key principle: students experience each component (scripts, R Markdown) independently before combining them.

### README_project.md

Explains:

- What this project is
- How to work in it
- Where to write code
- How scripts, data, and output relate
- **Link to troubleshooting**
- **"You are here" diagram** showing the relationship between session sandboxes and the core project


## 6. Core Project Snapshots

### core_project_snapshots/

Contains complete, working versions of the core project at each stage of the semester.

```
core_project_snapshots/
├── week_02/
├── week_03/
├── week_04/
└── ...
```

Each folder represents the **expected state of the core project after that week's homework**.

**Used for:**

- Catching up after missing a session
- Debugging a broken core project
- Grading reference
- Recovery from accidental deletion or corruption

**Instructions for using snapshots** are included in:

- The troubleshooting guide (step-by-step, foolproof)
- Each session's instructions.md

This is the **primary safety net** of the course.


## 7. Session Structure

### sessions/

Each session has its own self-contained folder:

```
sessions/session_XX/
├── instructions.md
├── exercises.md
├── data/
│   └── toy_data.csv
├── scripts/
│   └── session_script.R
└── solutions_optional/
```

**Purpose:**

- Provide everything needed for that session
- Allow students to catch up or reset easily
- Keep sessions modular and self-contained

**Critical separation:** Session folders use toy data and do NOT interact with `core_project/`. No sourcing, no cross-references. Linear, simple scripts only.

### instructions.md

Each session's instructions include:

- Session goals
- Concepts introduced
- How the session fits into the overall workflow
- **"You are here" indicator** showing where this session sits in the semester
- Step-by-step guidance (ELI5 level of detail)
- **Link to troubleshooting**
- Platform-specific notes where relevant (Windows vs macOS)
- From Session 7 on: **clear marking of what is core vs. bonus**

### exercises.md

Includes:

- Guided examples
- Fill-in-the-blank tasks
- Open-ended exercises
- Short debugging tasks ("bug hunt")
- Interpretation tasks

From Session 7 onward, exercises are split into two clearly marked sections:

- **Core exercises** (everyone completes these)
- **Bonus add-ons** (choose from these if you finish the core)

Exercises reference the session's own scripts and data (not core_project/).

### solutions_optional/

- Released after the session (or after homework deadline)
- May contain partial solutions: correct outputs, hints, and common mistakes rather than full code
- Solutions cover both core and bonus exercises


## 8. Homework Structure

### homework/

Each homework assignment mirrors the session structure:

```
homework/hw_XX/
├── instructions.md
├── data/            (if additional data needed beyond core_project)
├── template/        (starting point for the assignment)
└── checklist.md     (self-assessment before submission)
```

**Design principles:**

- Homework uses the **core project** structure
- Students start from a clean template or continue from their own core project
- Focus is on analysis, not setup
- Clear expectations reduce clarification requests
- Instructions are detailed enough to complete without instructor help
- **Core tasks** (mandatory) and **bonus tasks** (optional) are clearly marked

**Submission:**

- Students submit to a **public folder** (exact mechanism TBD — could be a shared drive, LMS, or similar)
- Public submissions allow students to review each other's work
- Graded **pass/fail**: submission + genuine engagement with core tasks

**Solutions:**

- Full solutions are optional and released only after deadlines
- Prefer partial solutions: correct outputs, hints, and common mistakes


## 9. Resources

### troubleshooting/reset_and_recover.md

**The most critical support document in the repository.** Contains:

- "R doesn't start" fixes (Windows and macOS)
- "File not found" fixes
- "Package won't install" fixes
- How to reset the R environment
- How to reset the core project from a snapshot (step-by-step, with screenshots)
- Common error messages and what they mean
- "My script worked last week but not today" — systematic debugging steps

**Linked from:**

- README.md (prominently, at the top)
- Every session's instructions.md
- core_project/README_project.md

### cookbooks/

Example-driven reference materials. Code + output side by side.

- ggplot cookbook: plot types, customization patterns
- dplyr patterns: common data manipulation recipes
- Data wrangling examples: cleaning, reshaping, joining

These are **pattern libraries** students can copy from — not linear tutorials.

### cheatsheets/

Concise, high-value reference materials:

- RStudio keyboard shortcuts (including basics: copy/paste, undo/redo, run line, source script, restart R, run Markdown chunks)
- Tidyverse overview
- ggplot reference
- Tidyverse style guide summary (spacing, indentation, naming, line length, pipe formatting) — introduced in Session 7; linked from every session script template thereafter

The keyboard shortcuts cheatsheet reduces friction early and supports efficient workflow.

### other/

Supporting conceptual materials:

| Document | Purpose |
|----------|---------|
| `how_this_data_works.md` | Explains the OWID dataset, its structure, variables, and limitations |
| `asking_for_help.md` | How to ask for help effectively (in class, online, from AI) |
| `using_genai.md` | Responsible use of generative AI: what's encouraged, what's not, how to verify output |
| `common_errors.md` | Gallery of frequent beginner errors with explanations and fixes |
| `google_forms_walkthrough.md` | Standalone guide: how to set up a Google Form, authenticate in R, pull and clean data. For self-study — not required for the course. |
| `interpretation_workflow.md` | Step-by-step guide: how to interpret a plot or table and write about it |
| `buddy_feedback_guide.md` | Guidelines and scaffolding for peer feedback; students organize this themselves |
| `code_style.md` | Why code style and commenting matter; the tidyverse style guide in plain language; how to use `styler`; good vs. bad comment examples. Introduced in Sessions 3 and 7, referenced in all subsequent sessions and in final report instructions. |

These documents are referenced throughout the course.


## 10. Design Principles Summary

| Principle | Implementation |
|-----------|---------------|
| **ELI5 everything** | Every instruction step is explicit. No assumed knowledge. |
| **Two platforms** | All instructions cover Windows and macOS. |
| **Core + bonus** | Clear split from Session 7 on. Applies to sessions, homework, and final report. |
| **Safety nets everywhere** | Snapshots, troubleshooting links, reset instructions in every session. |
| **Separation of concerns** | Session sandboxes for learning; core project for real analysis. |
| **Gradual complexity** | Standalone scripts first; source() workflow later; full pipeline at the end. |
| **Self-directed sessions** | Students follow repo instructions autonomously; instructor roams to help. |
| **Buddy system** | Stronger students paired with those who need more time. |
| **Public homework** | Students can learn from each other's submissions. |
| **Modular updates** | New session folders are additive; nothing previously downloaded changes. |
