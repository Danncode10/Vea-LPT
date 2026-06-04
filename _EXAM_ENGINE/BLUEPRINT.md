# LET BLUEPRINT — BEED (Elementary), No Specialization

> **Source:** PRC *Enhanced Table of Specifications* (Annex A), issued 2022,
> in force from March 2023 onward — this is the **same TOS governing the
> September 2026 LET**. Original: `_ARCHIVE/NEW LET TOS 2022 -11 Annex A PTeacher.md`.
>
> **Scope (RA 7836, Sec. 14):** The elementary (BEED) examination has **two parts
> only** — General Education and Professional Education. **No field of
> specialization** (that is secondary/BSED only). The `/make-let-exam` command
> uses ONLY the two tables below.

Philippine Qualifications Framework Level 6.

---

## Difficulty model (applies to BOTH parts)

| Band | Share | Bloom levels it maps to |
|------|------:|-------------------------|
| Easy | 30% | Remember + Understand |
| Moderate | 50% | Apply |
| Difficult | 20% | Analyze + Evaluate + Create |

---

## PART 1 — GENERAL EDUCATION (Elementary) — 150 items

Bloom counts are given **per competency area**. Each subject inside an area gets
an equal share (**15 items per subject**, 10 subjects total).

| Area | Wt | Items | Rem | Und | App | Ana | Eva | Cre | Subjects (15 items each) |
|------|---:|------:|----:|----:|----:|----:|----:|----:|--------------------------|
| **A. Intellectual Competencies** | 40% | 60 | 7 | 9 | 30 | 6 | 4 | 4 | 1. Purposive Communication in English · 2. Malayuning Komunikasyon sa Wikang Filipino · 3. Science and Technology · 4. Mathematics |
| **B. Personal & Civic Responsibilities** | 30% | 45 | 7 | 7 | 22 | 5 | 2 | 2 | 5. Readings in Philippine History and Society · 6. The Life and Works of Rizal · 7. Ethics |
| **C. Practical Skills Development** | 30% | 45 | 8 | 7 | 23 | 4 | 2 | 1 | 8. The Contemporary World · 9. Art Appreciation · 10. Understanding the Self |
| **TOTAL** | 100% | **150** | 22 | 23 | 75 | 15 | 8 | 7 | |

---

## PART 2 — PROFESSIONAL EDUCATION (Elementary) — 150 items

| Area | Wt | Items | Rem | Und | App | Ana | Eva | Cre |
|------|---:|------:|----:|----:|----:|----:|----:|----:|
| **A. Teaching Profession** | 15% | 23 | 3 | 3 | 12 | 3 | 1 | 1 |
| **B. The Teacher & the School Curriculum, Methods & Strategies of Teaching, Educational Technology** | 30% | 45 | 6 | 6 | 25 | 4 | 2 | 2 |
| **C. The Child & Adolescent Learners and Learning Principles** | 20% | 30 | 5 | 5 | 15 | 3 | 1 | 1 |
| **D. Assessment of Learning** | 15% | 22 | 3 | 3 | 12 | 2 | 1 | 1 |
| **E. Field Study and Teaching Internship** | 20% | 30 | 5 | 5 | 15 | 3 | 1 | 1 |
| **TOTAL** | 100% | **150** | 22 | 22 | 79 | 15 | 6 | 6 |

---

## Where the generator pulls content (engine folders)

| BLUEPRINT subject/area | Source folder(s) in `_EXAM_ENGINE/` |
|------------------------|--------------------------------------|
| Gen Ed 1. English | `GEN_ED/01_english/` |
| Gen Ed 2. Filipino | `GEN_ED/02_filipino/` |
| Gen Ed 3. Science & Technology | `GEN_ED/07_science_technology/` |
| Gen Ed 4. Mathematics | `GEN_ED/08_mathematics/` |
| Gen Ed 5. Phil. History | `GEN_ED/03_philippine_history/` |
| Gen Ed 6. Rizal | `GEN_ED/04_rizal/` |
| Gen Ed 7. Ethics | `GEN_ED/09_ethics/` |
| Gen Ed 8. Contemporary World | `GEN_ED/05_contemporary_world/` |
| Gen Ed 9. Art Appreciation | `GEN_ED/06_art_appreciation/` |
| Gen Ed 10. Understanding the Self | `GEN_ED/10_understanding_the_self/` |
| Prof Ed A. Teaching Profession | `PROF_ED/01_teaching_profession/` |
| Prof Ed B. Curriculum/Methods/EdTech | `PROF_ED/02_curriculum_and_methods/` |
| Prof Ed C. Child & Adolescent | `PROF_ED/03_child_and_adolescent/` |
| Prof Ed D. Assessment | `PROF_ED/04_assessment_of_learning/` |
| Prof Ed E. Field Study | `PROF_ED/05_field_study/` |
| Whole-domain reviewers (any area) | `*/_comprehensive/`, `_comprehensive_mixed/` |
| Real past-LET phrasing & difficulty | `STYLE_BANK/gen_ed/`, `STYLE_BANK/prof_ed/` |
