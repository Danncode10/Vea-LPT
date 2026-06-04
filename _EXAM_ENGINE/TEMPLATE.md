# LET EXAM — OUTPUT TEMPLATE

> This is the format every generated exam must follow. It mirrors the real
> Licensure Examination for Teachers (LET): multiple choice, 4 options (A–D),
> one correct answer, with a separate answer key + rationale.
>
> The `/make-let-exam` command reads `BLUEPRINT.md` for item counts per subject,
> draws facts from the `GEN_ED/` `PROF_ED/` `ENGLISH_MAJOR/` folders, and matches
> phrasing/difficulty to real items in `STYLE_BANK/`.

---

## HEADER (print at top of every exam)

```
LICENSURE EXAMINATION FOR TEACHERS (LET)
<GENERAL EDUCATION | PROFESSIONAL EDUCATION | ENGLISH MAJOR>
Total Items: <N>     Time: <minutes>
Name: ______________________________    Date: ____________
```

---

## ITEM FORMAT

Each item = a numbered stem followed by four choices labelled A–D.
Exactly one choice is correct. Distractors must be plausible (common
misconceptions), not obviously wrong.

```
1. <Question stem written in clear LET style.>
   A. <option>
   B. <option>
   C. <option>
   D. <option>
```

Guidelines (match the real exam):
- Vary cognitive level: ~40% recall, ~40% comprehension/application,
  ~20% analysis/situational ("Teacher A does X… which is best?").
- Include situational/scenario items for Prof Ed.
- For Math, include solvable computational items.
- For Filipino items, write the stem and options in Filipino.
- Keep one clearly best answer; avoid "all of the above" unless authentic.

---

## SECTIONING

Group items by subject in the BLUEPRINT order. Print a subject banner before
each block, e.g.:

```
----- PART I: PURPOSIVE COMMUNICATION IN ENGLISH (Items 1–15) -----
```

---

## ANSWER KEY (separate section at the end)

```
ANSWER KEY
1. C   2. A   3. D   4. B   5. A   ...
```

Optionally followed by rationale for tricky items:

```
RATIONALE
3. D — "Inalienable rights" cannot be renounced or transferred (cf. RA…).
```

---

## EXAMPLE (2 items, Professional Education)

```
1. In mastery learning, the definition of an acceptable standard of
   performance is called the ______.
   A. SMART objective
   B. condition
   C. criterion measure
   D. behavior

2. Teacher B clears his throat to signal disapproval of a student's
   behavior. Which influence technique is this?
   A. proximity control
   B. interest boosting
   C. signal interference
   D. direct appeal

ANSWER KEY
1. C   2. C
```
