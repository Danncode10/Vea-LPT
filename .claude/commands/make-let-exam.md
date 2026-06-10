---
description: Generate a full, very-hard BEED LET practice exam (Gen Ed 150 + Prof Ed 150) with answer keys
argument-hint: [optional exam title, e.g. mock-3]
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
- Passage clusters (see Rule 8) are an exception: keep passage + its items
  together even in the shuffle. A passage header is allowed; a topic banner is not.

### 3. Answer-key balance — STRICT anti-bias enforcement
- Distribute the correct answer roughly evenly across A, B, C, D (each ≈ 25%,
  ~37–38 times in 150). **No more than 3 of the same letter in a row.**
- **LENGTH BIAS IS FORBIDDEN.** The correct answer must NOT be the longest option
  more than 25% of the time. After writing every 10 items, check: if the longest
  option was correct more than 3 times in those 10, rewrite the distractors to
  fix it. The correct answer must be the **shortest** option at least 20% of the
  time, and **mid-length** most of the time.
- Keep all four options **parallel and similar in length**. If you notice the
  correct answer is longer than all three distractors, either shorten the correct
  answer or lengthen the distractors — never leave a length tell.
- Vary where the answer falls — do not cluster on any one letter.

### 4. Item format — MANDATORY
- Every item: 4 options labeled exactly as:

  ```
  A. [option]
  B. [option]
  C. [option]
  D. [option]
  ```

  **No bullet points. No dashes. No asterisks before A/B/C/D.** Just the letter,
  a period, a space, then the option text.
- **Do NOT include a `Difficulty:` tag, `[Hard]` label, or any metadata line**
  above or below any item. Items are numbered and lettered only.

### 5. HARD difficulty (the priority)
- Minimize trivial recall. Favor application, analysis, evaluation: "Which is the
  **BEST / MOST appropriate / LEAST likely**…", "All of the following EXCEPT…",
  multi-concept integration, strong (plausible) distractors built from common
  misconceptions.
- **Mathematics:** multi-step computation with embedded context — never bare
  equations.
- **Filipino:** authentic, idiomatic, entirely in Filipino.

### 6. Professional Education MUST be heavily situational
- **At least 60% of the 150 Prof Ed items** must be **classroom situational**
  items. Each situational stem must be **2–4 sentences**: set the scene, describe
  the teacher's action or the pupil's behavior, then state the specific challenge
  or observation. Example of the required depth:
  > *"Teacher Carmen is conducting a Grade 3 reading lesson when she notices that
  > three pupils consistently decode words correctly but give blank stares when
  > asked 'why' questions. She has already increased her reading-aloud time and
  > added more vocabulary drills over the past two weeks, but the problem persists.
  > What should Teacher Carmen prioritize next?"*
  Short one-liners ("Teacher notices that…") are **NOT acceptable** for situational
  items. Build context, describe what was already tried, and make the judgment
  genuinely hard.
- Spread situational items across all five Prof Ed areas.

### 7. Keep it UPDATED
- Reflect MATATAG Curriculum (2023), K-12 (RA 10533), PPST (DO 42, s. 2017),
  Code of Ethics, RA 7836/9293, RA 4670, RA 10627, RA 10157, RA 11476, DO 40
  s. 2012 child protection. Use current contemporary-world references through 2026.

### 8. PARAGRAPH-LENGTH STEMS — NON-NEGOTIABLE, ENFORCED STRICTLY

  This is the rule that separates a real LET from a toy quiz. **Every subject
  must demonstrate paragraph-length stems. If you produce short one-liners where
  this rule requires paragraphs, the exam fails review and must be rewritten.**

  **a) Reading passages (English & Filipino) — REQUIRED in every exam**
  - **English:** include at least **2 reading passages**, each **4–8 sentences**
    long, with **3–5 consecutive questions** immediately after. Label each cluster:
    *"Read the passage and answer items N–M."* (This is a navigation aid, not a
    topic banner.)
  - **Filipino:** include at least **1 literary excerpt** (tula, maikling prosa, o
    *salawikain* cluster) in Filipino, **4–6 sentences**, with **3–4 consecutive
    questions** after it.
  - Passages must be original or closely paraphrased — never verbatim from source
    files.

  **b) Long-scenario standalone items — REQUIRED minimums per subject**
  - **Math:** EVERY Math item must be a full word-problem paragraph of **3–6
    sentences** with embedded data, conditions, and narrative context. A bare
    equation or a single-sentence setup is an automatic violation.
  - **Science:** At least **8 of 15** Science items must open with a 2–4 sentence
    experiment, observation, or real-world situation before the question.
  - **Ethics:** At least **6 of 15** Ethics items must present a 2–3 sentence
    moral-dilemma scenario before the question.
  - **Prof Ed situational items:** see Rule 6 — every situational item must be
    2–4 sentences. One-liners are rejected.
  - **Phil. History, Rizal, Contemporary World:** at least **5 items each** must
    include a document excerpt, primary-source quote, or case-study paragraph
    (2–4 sentences) as stimulus material.
  - **Understanding the Self & Art Appreciation:** at least **4 items each** must
    open with a reflective scenario or artwork description (2–3 sentences).

  **c) Mix of lengths — target distribution**
  - 40% long-stem (full paragraph, 3+ sentences)
  - 40% medium (1–2 sentence setup + question)
  - 20% short (direct recall, grammar, vocab, definition)
  - Do not exceed 20% short items. If you are writing a short item where the
    rules above require a paragraph, replace it.

  **d) Self-check before outputting**
  - Count your paragraph-stem items per subject. If any subject falls below its
    minimum, rewrite items before outputting the file.

### 9. Answer key format — simple, one line per item

  At the end of each file, output the answer key in this exact format (no table,
  no markdown table syntax, no extra formatting):

  ```
  ## ANSWER KEY

  1. A
  2. B
  3. D
  4. C
  ...
  150. B
  ```

  One item per line. Number, period, space, letter. Nothing else on the line.

### 10. Title
- The **first line** of each file must be a Markdown heading using `$ARGUMENTS`
  (slugified title-cased). If `$ARGUMENTS` is `Mock 1`, output:

  ```
  # Mock 1 — General Education
  ```
  and
  ```
  # Mock 1 — Professional Education
  ```
- If `$ARGUMENTS` is empty, use today's date: `# LET YYYY-MM-DD — General Education`

---

## STEPS

**CRITICAL — TOKEN BUDGET:** You have a strict output token limit. To stay within
it you MUST write both files using the Write tool and keep your spoken responses
minimal. Do NOT print the exam content in your chat replies.

1. Read `BLUEPRINT.md` and `TEMPLATE.md`.
2. For each subject/area, read several `.md` files from its source folder (mapping
   table in `BLUEPRINT.md`). Also pull from `*/_comprehensive/`,
   `_comprehensive_mixed/`, and `STYLE_BANK/` for phrasing and difficulty
   calibration. Adapt real items from source files — do not copy verbatim.
3. Compose all 150 Gen Ed items internally (in your reasoning), shuffle them, then
   **use the Write tool** to write `gen_ed.md` directly to disk. Do not echo the
   file content in your reply.
4. Compose all 150 Prof Ed items internally, shuffle, then **use the Write tool**
   to write `prof_ed.md` directly to disk. Do not echo the file content in your reply.
5. Output folder:
   ```
   _EXAMS/<TITLE>/
   ├── gen_ed.md
   └── prof_ed.md
   ```
   `<TITLE>` = `$ARGUMENTS` (slugified) if given, else today's date
   (`LET-YYYY-MM-DD`). If the folder exists, append `-2`, `-3`, …
   Output goes to the **repo-root `_EXAMS/`**, NOT inside `_EXAM_ENGINE/`.
6. Each file ends with `## ANSWER KEY` (Rule 9 format). **No RATIONALE section.**
7. After both files are written, print a short summary (≤ 15 lines) to the chat:
   folder path, item counts per subject, answer-letter distribution (A/B/C/D
   totals), and any rule violations found during self-check.

## VERIFY before finishing
- Exactly 150 numbered items per file; numbering continuous 1–150; no topic banners.
- Each subject/area hit its required count.
- Answer-key letter distribution balanced (each letter ~37–38, no run > 3).
- Correct answer is NOT the longest option more than 25% of the time.
- Prof Ed: ≥ 60% situational, each with 2–4 sentence stems.
- At least 2 English reading passages + 1 Filipino literary excerpt present.
- All Math items have multi-sentence word-problem paragraphs.
- Science ≥ 8, Ethics ≥ 6, Phil. History/Rizal/CW ≥ 5, Self/Art ≥ 4 paragraph stems.
- No `Difficulty:` tags anywhere. No bullet points before A/B/C/D.
- First line of each file is the correct `#` title.
- Answer key is simple `N. X` format, one per line.

Begin now. If $ARGUMENTS is empty, title the exam by today's date.
