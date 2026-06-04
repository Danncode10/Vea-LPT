# VEA LPT — Reorganization Plan (for AI LET Exam Generation)

> Goal: reorganize the repo so a future `/make-let-exam` command can navigate
> easily and generate exams that mirror the real Licensure Examination for
> Teachers (LET). Branch: `reorg/exam-engine`. Each phase = one commit.

---

## Key findings that shaped this plan (verified)

1. **The exam command consumes Markdown.** Claude reads `.md` natively, reads
   PDF expensively/messily, and **cannot read `.docx/.pptx/.doc` at all.** So the
   repo is organized around Markdown for the AI, with binaries kept as a
   human-only archive.
2. **`8. RANDOM FOLDERS` is NOT a duplicate** — it holds ~1,400 of the ~2,091
   `.md` files (the largest AI-readable corpus). It is preserved, not deleted.
3. **`Vea Notes/` had zero Markdown** (316 PDF + 194 DOCX + 26 PPTX, etc.).
   It is converted to `.md` (Phase 1) so its content becomes usable.

---

## Target structure

```
VEA LPT/
├── _EXAM_ENGINE/                  ← 100% Markdown. The ONLY thing the command reads.
│   ├── BLUEPRINT.md               ← from LET COVERAGE.md (items per subject)
│   ├── TEMPLATE.md                ← exact output format of a finished exam
│   ├── STYLE_BANK/                ← real past LET questions (.md) for tone/difficulty
│   │   ├── gen_ed/
│   │   └── prof_ed/
│   ├── GEN_ED/
│   │   ├── 01_english/
│   │   ├── 02_filipino/
│   │   ├── 03_philippine_history/
│   │   ├── 04_rizal/
│   │   ├── 05_contemporary_world/
│   │   ├── 06_art_appreciation/
│   │   ├── 07_science_technology/
│   │   ├── 08_mathematics/
│   │   ├── 09_ethics/
│   │   └── 10_understanding_the_self/
│   ├── PROF_ED/
│   │   ├── 01_teaching_profession/
│   │   ├── 02_curriculum_and_methods/
│   │   ├── 03_child_and_adolescent/
│   │   ├── 04_assessment_of_learning/
│   │   └── 05_field_study/
│   └── ENGLISH_MAJOR/
│       ├── linguistics/
│       ├── literature/
│       └── language_programs/
│
├── _ARCHIVE/                      ← human-only originals (PDF/DOCX/PPTX). AI ignores.
│   └── by_source/                 (gurong_pinoy, sir_melvin, sir_drei, lilet,
│                                    teach_pinas, lorimar, cbrc, pnu, blept,
│                                    fm_2026, met, lovely_rubio, other)
│
├── scripts/convert_to_md.sh
├── PLAN.md
└── README.md                      ← rewritten for the new two-tier layout
```

---

## Execution phases

**Phase 0 — Safety & cleanup**
- Branch `reorg/exam-engine` (done).
- Delete `~$*` Word lock files and `.DS_Store`.

**Phase 1 — Convert Vea Notes** (recover ~536 files into Markdown)
- Run `scripts/convert_to_md.sh "Vea Notes"`.

**Phase 2 — Build `_EXAM_ENGINE/`**
- Create the engine tree.
- Move subject-relevant `.md` into `GEN_ED` / `PROF_ED` / `ENGLISH_MAJOR` by topic.
- Gather actual-question `.md` (BOOSTERS, exam drills, "ACTUAL QUESTIONS",
  BLEPT mock) into `STYLE_BANK/`.
- `BLUEPRINT.md` ← copy of `LET COVERAGE.md`.
- Author `TEMPLATE.md` from the real STYLE_BANK drill format.

**Phase 3 — Build `_ARCHIVE/`**
- Move every `.pdf/.docx/.pptx/.doc/.ppt/.jpg/.png` into `_ARCHIVE/by_source/…`.
- Collapse the three overlapping hierarchies (`VEA LET COMPILATIONS`,
  `8. RANDOM FOLDERS`, `Vea Notes`); drop `Copy of …` duplicates.

**Phase 4 — Cleanup & docs**
- Remove empty old folders.
- Rewrite `README.md` to document the layout and how `/make-let-exam` uses it.

---

## How the future command works

`/make-let-exam gen_ed` →
1. read `_EXAM_ENGINE/BLUEPRINT.md` (10 subjects × 15 = 150 items)
2. for each subject, read `.md` in `GEN_ED/<subject>/` for source facts
3. sample `STYLE_BANK/gen_ed/` to match real LET phrasing & difficulty
4. emit a 150-item exam + answer key using `TEMPLATE.md`
