---
description: Generate a full, very-hard BEED LET practice exam (Gen Ed 150 + Prof Ed 150) with answer keys
argument-hint: [optional exam title, e.g. mock-2]
allowed-tools: Read, Write, Bash, Glob, Grep
---

You are an expert LET (Licensure Examination for Teachers) item writer for the
**BEED / Elementary** level. Generate a complete, **maximally difficult** mock
LET exam that mirrors the real PRC examination, with answer keys.

Read `_EXAM_ENGINE/BLUEPRINT.md` (counts + difficulty mix) and
`_EXAM_ENGINE/TEMPLATE.md` (the exact output format) FIRST, then follow the
STRICT RULES below. They are mandatory — do not deviate.

---

## STRICT RULES

### 1. Scope
- Course = **BEED (Elementary). NO specialization.** Two files only: `gen_ed.md`
  (150 items) and `prof_ed.md` (150 items), each with an answer key.
- Hit the exact per-subject / per-area counts in `BLUEPRINT.md`:
  - **Gen Ed:** 15 items each for English, Filipino *(write in Filipino)*, Science
    & Technology, Mathematics, Phil. History, Rizal, Ethics, Contemporary World,
    Art Appreciation, Understanding the Self.
  - **Prof Ed:** Teaching Profession 23 · Curriculum/Methods/EdTech 45 · Child &
    Adolescent 30 · Assessment 22 · Field Study 30.

### 2. SHUFFLE — do NOT arrange by topic
- After writing the required number per topic, **randomly interleave all items**
  so topics are mixed throughout (like the real LET).
- **Never print topic/part banners or section headers** (no
  `----- PART I ... -----`, no "English (Items 1–15)"). The reader must not be
  able to tell the topic from the layout. Just number 1–150 continuously.

### 3. Answer-key balance (avoid give-away patterns)
- Distribute the correct answer roughly evenly across A, B, C, D (each ≈ 25%,
  ~37–38 times in 150). **No more than 3 of the same letter in a row.**
- **The correct answer must NOT correlate with length.** Do NOT let the longest
  option be the answer by default. Keep all four options **parallel and similar
  in length**; across the exam, the correct option should sometimes be the
  shortest, sometimes the longest, most often the same length as the others.
- Vary where the answer falls — do not cluster on B.

### 4. Item style & length (match the Exam Engine resources)
- Keep stems **concise: ~8–30 words.** Options short and parallel. Match the
  phrasing of real items in `_EXAM_ENGINE/STYLE_BANK/`. Do NOT copy verbatim.
- Every item: 4 options **A–D**, exactly one best answer. No "all/none of the
  above" unless authentic.

### 5. HARD difficulty (the priority)
- Minimize trivial recall. Favor application, analysis, evaluation: "Which is the
  **BEST / MOST appropriate / LEAST likely**…", "All of the following EXCEPT…",
  multi-concept integration, strong (plausible) distractors built from common
  misconceptions.
- **Mathematics:** multi-step computation, not single operations.
- **Filipino:** authentic, idiomatic, entirely in Filipino.

### 6. Professional Education MUST be heavily situational
- **At least 60% of the 150 Prof Ed items** must be **classroom situational**
  items: a brief scenario ("Teacher Lia notices that…", "During a Grade 3
  reading lesson…") followed by a judgment question (best response, principle
  applied, likely cause, next step). Keep scenarios to 1–2 short sentences, like
  the resources. Spread these across all five Prof Ed areas.
- The remaining items may be concept/principle questions, still applied.

### 7. Keep it UPDATED
- Reflect MATATAG Curriculum (2023), K-12 (RA 10533), PPST (DO 42, s. 2017),
  Code of Ethics, RA 7836/9293, RA 4670, RA 10627, RA 10157, RA 11476, DO 40
  s. 2012 child protection. Use current contemporary-world references through 2026.

---

## STEPS

1. Read `BLUEPRINT.md` and `TEMPLATE.md`.
2. For each subject/area, read several `.md` files from its source folder (mapping
   table in `BLUEPRINT.md`). For thin subjects (Rizal, Art, Ethics, Contemporary
   World, Understanding the Self, Field Study) also pull from `*/_comprehensive/`,
   `_comprehensive_mixed/`, and `STYLE_BANK/`. Sample `STYLE_BANK/` to match real
   phrasing, length, and difficulty. You may invent fresh items, but ground them
   in these resources.
3. Write items per topic to hit the counts, then **shuffle** into one 1–150 run
   per file (no banners).
4. Output to a new folder (clean Markdown that previews well — see TEMPLATE):
   ```
   _EXAMS/<TITLE>/
   ├── gen_ed.md    # 150 shuffled items, then "## ANSWER KEY" + "## RATIONALE"
   └── prof_ed.md   # 150 shuffled items, then "## ANSWER KEY" + "## RATIONALE"
   ```
   `<TITLE>` = `$ARGUMENTS` (slugified) if given, else today's date
   (`LET-YYYY-MM-DD`). If the folder exists, append `-2`, `-3`, …
5. End each file with `## ANSWER KEY` (compact grid) then
   `## RATIONALE (selected difficult items)` explaining the trickiest items.

## VERIFY before finishing
- Exactly 150 numbered items per file; numbering continuous 1–150; no topic banners.
- Each subject/area hit its required count (track internally even though shuffled).
- Answer-key letter distribution is balanced (each letter ~22–40 times, no run > 3).
- Correct answers are NOT systematically the longest option.
- Prof Ed: ≥ 60% situational. Report the folder path + a one-line summary
  (counts per part, answer-letter distribution).

Begin now. If $ARGUMENTS is empty, title the exam by today's date.
