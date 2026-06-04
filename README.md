# VEA LPT — LET Review Repository

Personal review repository for **Vea Amor Lopez**, aiming for **top notcher** in the
Licensure Examination for Teachers (LET) — **BEED (Elementary), no specialization**.

---

## Folder Structure

```
VEA LPT/
├── _EXAM_ENGINE/              # AI exam-generation engine
│   ├── BLUEPRINT.md           # Official PRC TOS (2022): item counts per area
│   ├── TEMPLATE.md            # Output format spec (shuffled, balanced key)
│   ├── GEN_ED/                # Source corpus — 10 Gen Ed subjects
│   │   ├── 01_english/
│   │   ├── 02_filipino/
│   │   ├── 03_philippine_history/
│   │   ├── 04_rizal/
│   │   ├── 05_contemporary_world/
│   │   ├── 06_art_appreciation/
│   │   ├── 07_science_technology/
│   │   ├── 08_mathematics/
│   │   ├── 09_ethics/
│   │   ├── 10_understanding_the_self/
│   │   └── _comprehensive/
│   ├── PROF_ED/               # Source corpus — 5 Prof Ed areas
│   │   ├── 01_teaching_profession/
│   │   ├── 02_curriculum_and_methods/
│   │   ├── 03_child_and_adolescent/
│   │   ├── 04_assessment_of_learning/
│   │   ├── 05_field_study/
│   │   └── _comprehensive/
│   ├── STYLE_BANK/            # Real past-LET phrasing & difficulty samples
│   │   ├── gen_ed/
│   │   └── prof_ed/
│   └── _comprehensive_mixed/  # Cross-domain reviewers
│
├── _EXAMS/                    # Generated mock exams
│   ├── mock-1/
│   │   ├── gen_ed.md          # 150 items · Gen Ed
│   │   └── prof_ed.md         # 150 items · Prof Ed
│   └── mock-2/
│       ├── gen_ed.md          # 150 items · Gen Ed
│       └── prof_ed.md         # 150 items · Prof Ed
│
├── _ARCHIVE/                  # Binary originals (.docx, .pdf) for reference
├── VEA LET COMPILATIONS/      # Raw source compilations (Gurong Pinoy, etc.)
└── README.md
```

---

## Exam Engine

The `/make-let-exam` command generates a complete, maximally hard BEED mock LET:

| File | Items | Areas covered |
|------|------:|---------------|
| `gen_ed.md` | 150 | English · Filipino · Science & Tech · Math · Phil. History · Rizal · Ethics · Contemporary World · Art Appreciation · Understanding the Self (15 each) |
| `prof_ed.md` | 150 | Teaching Profession 23 · Curriculum/Methods/EdTech 45 · Child & Adolescent 30 · Assessment 22 · Field Study 30 |

**Quality controls applied to every exam:**
- Items shuffled — no topic banners, topics interleaved like the real LET
- Answer key balanced: each letter (A–D) ≈ 25%, no run of the same letter > 3
- Hard difficulty: BEST / MOST / LEAST / EXCEPT framing, misconception distractors, multi-step Math
- Prof Ed ≥ 60% classroom situational items
- Filipino items written entirely in Filipino
- Updated to MATATAG (2023), K-12 RA 10533, PPST DO 42 s.2017, RA 7836/9293, RA 4670, RA 10627, RA 10157
- Each file ends with a compact **Answer Key** grid + **Rationale** for the trickiest items

---

## Generated Exams

| Exam | Gen Ed | Prof Ed | Date |
|------|--------|---------|------|
| mock-1 | 150 items | 150 items | 2026-06-04 |
| mock-2 | 150 items | 150 items | 2026-06-04 |

---

## Goal

**Top Notcher** — LET examination.

> "The secret of getting ahead is getting started." — Mark Twain
