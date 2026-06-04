---
description: Generate a full, very-hard BEED LET practice exam (Gen Ed 150 + Prof Ed 150) with answer keys
argument-hint: [optional exam title, e.g. mock-3]
allowed-tools: Read, Write, Bash, Glob, Grep
---

You are an expert LET (Licensure Examination for Teachers) item writer for the
**BEED / Elementary** level. Generate a complete, **maximally difficult** mock
LET exam that mirrors the real PRC examination, with answer keys.

## Hard requirements (do not deviate)

- **Course = BEED (Elementary). NO field of specialization.** Two parts only:
  General Education and Professional Education.
- Follow `_EXAM_ENGINE/BLUEPRINT.md` exactly for item counts and the
  Bloom/difficulty mix. Follow `_EXAM_ENGINE/TEMPLATE.md` for output format.
- Every item: 4 options **A–D**, exactly one correct answer.
- **Two files, in one new folder**, both in Markdown:
  - `gen_ed.md` — **exactly 150 items** + answer key
  - `prof_ed.md` — **exactly 150 items** + answer key

## Step 1 — Read the blueprint & sources

1. Read `_EXAM_ENGINE/BLUEPRINT.md` (item counts per subject/area + difficulty mix).
2. Read `_EXAM_ENGINE/TEMPLATE.md` (the required output format).
3. For each subject/area, read several `.md` files from its source folder (see the
   mapping table in BLUEPRINT). For thin subjects (Rizal, Art Appreciation, Ethics,
   Contemporary World, Understanding the Self, Field Study), also pull from
   `_EXAM_ENGINE/*/_comprehensive/`, `_EXAM_ENGINE/_comprehensive_mixed/`, and
   `_EXAM_ENGINE/STYLE_BANK/`.
4. Sample `STYLE_BANK/gen_ed/` and `STYLE_BANK/prof_ed/` to match the **phrasing,
   tone, and difficulty** of real past-LET items. Do NOT copy items verbatim —
   write fresh ones in that style.

## Step 2 — Item counts (from the 2022 Enhanced TOS = 2026 LET)

**gen_ed.md — 150 items, 15 per subject:**
1. Purposive Communication in English — 15
2. Malayuning Komunikasyon sa Wikang Filipino — 15  *(write these items in Filipino)*
3. Science and Technology — 15
4. Mathematics — 15
5. Readings in Philippine History and Society — 15
6. The Life and Works of Rizal — 15
7. Ethics — 15
8. The Contemporary World — 15
9. Art Appreciation — 15
10. Understanding the Self — 15

**prof_ed.md — 150 items:**
- A. Teaching Profession — 23
- B. The Teacher & the School Curriculum, Methods & Strategies, Educational Technology — 45
- C. The Child & Adolescent Learners and Learning Principles — 30
- D. Assessment of Learning — 22
- E. Field Study and Teaching Internship — 30

**Difficulty mix per part:** Easy 30% (Remember/Understand), Moderate 50% (Apply),
Difficult 20% (Analyze/Evaluate/Create).

## Step 3 — MAKE IT HARD (this is the priority)

Within the official mix, push every item to the top of its band:
- Minimize trivial recall. Favor **application, analysis, and evaluation**:
  situational classroom scenarios, "Which is the **BEST/MOST appropriate/LEAST
  likely**…", "All of the following EXCEPT…", multi-concept integration.
- **Distractors must all be plausible** — common misconceptions and near-misses,
  not obvious throwaways. No "all/none of the above" unless authentic.
- **Mathematics:** multi-step computation (algebra, geometry, statistics,
  number theory, problem solving) — not single-operation items.
- **Prof Ed:** realistic teaching dilemmas requiring judgment, not definitions.
- **Filipino:** authentic, idiomatic items written entirely in Filipino.
- Vary the position of the correct answer (don't cluster on one letter).

## Step 4 — Keep it UPDATED

Reflect the most current Philippine education context:
- **MATATAG Curriculum** (2023 K-12 revision) and the K-12 framework (RA 10533).
- **PPST** (DepEd Order 42, s. 2017), Code of Ethics for Professional Teachers.
- Relevant laws: RA 7836 & RA 9293 (teacher licensure), RA 4670 (Magna Carta for
  Teachers), RA 10627 (Anti-Bullying), RA 10157 (Kindergarten), RA 11476 (GMRC),
  RA 10533, child protection policy (DO 40, s. 2012).
- Current events / contemporary world references through 2026 where relevant.

## Step 5 — Output format

Create the folder and files:

```
_EXAMS/<TITLE>/
├── gen_ed.md     # 150 items, then "## ANSWER KEY" with answers + brief rationale
└── prof_ed.md    # 150 items, then "## ANSWER KEY" with answers + brief rationale
```

- `<TITLE>` = `$ARGUMENTS` if provided (slugified); otherwise use the current
  date, e.g. `_EXAMS/LET-2026-06-04/`. If the folder exists, append `-2`, `-3`, …
- Each file starts with the header from `TEMPLATE.md` (exam title, part, total
  items, time, name/date line).
- Group items by subject/area with a banner, e.g.
  `----- PART I: PURPOSIVE COMMUNICATION IN ENGLISH (Items 1–15) -----`.
- Number items continuously 1–150 within each file.
- Put the **ANSWER KEY at the very end** of each file (so it can be taken as a
  practice test first), formatted as a compact grid, followed by a
  **RATIONALE** section explaining the tricky/difficult items.

## Step 6 — Verify before finishing

- Confirm `gen_ed.md` has exactly 150 numbered items and `prof_ed.md` exactly 150.
- Confirm each subject/area hit its required count.
- Confirm every item has A–D and an answer-key entry.
- Report the output folder path and a one-line summary (counts per part) to the user.

Begin now. If $ARGUMENTS is empty, title the exam by today's date.
