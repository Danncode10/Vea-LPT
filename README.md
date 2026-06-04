# VEA LPT — LET Review Repository

Personal review repository for **Vea Amor Lopez**, aiming for **top notcher** in
the Licensure Examination for Teachers (LET), September 20, 2026.

This repo is organized into two tiers so an AI command can generate practice
exams that mirror the real LET, while the original source files stay preserved.

---

## Layout

**Target course: BEED (Elementary) — no field of specialization.**

```
VEA LPT/
├── _EXAM_ENGINE/      ← AI-readable. 100% Markdown. The exam command reads ONLY this.
├── _EXAMS/            ← Generated practice exams (created by /make-let-exam).
├── _ARCHIVE/          ← Human reference. Original PDF/DOCX/PPTX/images (9 GB).
├── Vea Notes/         ← Personal session notes (kept as-is; partly Markdown).
├── scripts/           ← convert_to_md.sh (PDF/DOCX/PPTX → Markdown)
├── .claude/commands/  ← /make-let-exam slash command
├── PLAN.md            ← How this structure was built.
└── README.md
```

### `_EXAM_ENGINE/` (2,089 sorted markdown files)

| Folder | Contents | Files |
|--------|----------|------:|
| `BLUEPRINT.md` | LET table of specifications (items per subject) | — |
| `TEMPLATE.md` | Exact output format of a finished exam | — |
| `STYLE_BANK/{gen_ed,prof_ed}/` | Real past LET question banks (drills, boosters, actual, mock) — used to match tone & difficulty | 908 |
| `GEN_ED/01_english … 10_understanding_the_self/` | General Education source material by subject | 464 |
| `PROF_ED/01_teaching_profession … 05_field_study/` | Professional Education source material by area | 369 |
| `ENGLISH_MAJOR/{linguistics,literature,language_programs,_general}/` | English major specialization | 172 |
| `_comprehensive_mixed/` | Whole-domain reviewers covering both Gen Ed & Prof Ed | 176 |

Each subject folder may also contain a `_comprehensive/` bucket for reviewers
that span the whole domain rather than one subject.

### `_ARCHIVE/`
Original binaries (PDF, DOCX, PPTX, images, MP4) mirrored at their original
paths under `vea_let_compilations/`. The AI command ignores this folder; it
exists so the source documents are never lost.

---

## How the exam generator works

A future `/make-let-exam` command works entirely inside `_EXAM_ENGINE/`:

1. Read **`BLUEPRINT.md`** → how many items per subject
   (Gen Ed: 10 subjects × 15 = 150; Prof Ed: 150 across 5 areas).
2. For each subject, read the `.md` in its **`GEN_ED/` / `PROF_ED/`** folder for
   facts and concepts.
3. Sample **`STYLE_BANK/`** to match the phrasing and difficulty of real LET items.
4. Emit a full exam + answer key using **`TEMPLATE.md`**.

Because the engine is pure Markdown, the command never has to open a PDF or DOCX.

---

## LET Coverage (Sept 20, 2026)

- **General Education — 150 items:** Purposive Communication (English), Filipino,
  Philippine History, Rizal, Contemporary World, Art Appreciation, Science &
  Technology, Mathematics, Ethics, Understanding the Self.
- **Professional Education — 150 items:** Teaching Profession (23), Curriculum +
  Methods + EdTech (45), Child & Adolescent (30), Assessment (22), Field Study (30).

See `_EXAM_ENGINE/BLUEPRINT.md` for the full table of specifications.

---

## Goal

**Top Notcher** — LET examination.

> "The secret of getting ahead is getting started." — Mark Twain
