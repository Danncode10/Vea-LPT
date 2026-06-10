# LET EXAM — OUTPUT TEMPLATE (clean, shuffled)

> Format every generated exam exactly like this. Multiple choice, 4 options
> (A–D), one best answer. Items are **shuffled across topics** (no topic
> banners). Answer key + rationale go at the end. Must preview cleanly in
> Markdown. BEED / Elementary, no specialization.

---

## HEADER (top of each file)

```markdown
# LICENSURE EXAMINATION FOR TEACHERS (LET)
## <General Education | Professional Education> — BEED (Elementary)

**Total Items:** 150  ·  **Time:** 180 minutes  ·  **Difficulty:** Hard
**Name:** ______________________  **Date:** ____________

*Take the test first. The answer key and rationale are at the end.*

---
```

## ITEM FORMAT (clean Markdown — previews well)

Bold the number, put each option on its own line as a bullet with a bold letter.
Blank line between items.

```markdown
**1.** <Concise stem, ~8–30 words.>
   - **A.** option
   - **B.** option
   - **C.** option
   - **D.** option

**2.** <next item>
   - **A.** ...
```

Rules (see `.claude/commands/make-let-exam.md` for the full strict list):
- **No topic banners / no grouping.** Items 1–150 are shuffled so topics are
  interleaved; the reader cannot tell the topic from the layout.
- **Balance the key:** correct answer ≈25% per letter, no run of the same letter
  longer than 3.
- **No length give-away:** keep all four options parallel in length; the correct
  answer must NOT default to the longest option.
- Stems concise; options short and parallel; one clearly best answer.
- **Prof Ed: ≥60% situational** — a 1–2 sentence classroom scenario then a
  judgment question.
- For Filipino items, write stem and options entirely in Filipino.
- Math: multi-step, solvable.

## ANSWER KEY (end of file)

Use a **table** — renders cleanly in Markdown preview. 5 pairs per row, 30 rows for 150 items.

```markdown
## ANSWER KEY

| No. | Ans | No. | Ans | No. | Ans | No. | Ans | No. | Ans |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|  1  |  C  |  2  |  B  |  3  |  D  |  4  |  A  |  5  |  B  |
|  6  |  C  |  7  |  A  |  8  |  D  |  9  |  B  | 10  |  C  |
| 11  |  A  | 12  |  D  | 13  |  B  | 14  |  C  | 15  |  A  |
...
| 146 |  C  | 147 |  A  | 148 |  D  | 149 |  B  | 150 |  C  |
```

## RATIONALE (after the key)

```markdown
## RATIONALE (selected difficult items)

- **3 (D):** "Inalienable rights" cannot be renounced or transferred …
- **46 (B):** 800 × 0.75 = 600; 600 × 0.90 = 540 …
```

---

## EXAMPLE (2 shuffled items, mixed topics, clean render)

```markdown
**1.** Teacher Lia notices that a pupil who reads aloud fluently cannot answer
"why" questions about the story. What should she target next?
   - **A.** decoding speed
   - **B.** reading comprehension
   - **C.** penmanship
   - **D.** spelling

**2.** A sack of rice dropped from ₱2,000 to ₱1,750. What is the percent decrease?
   - **A.** 10.5%
   - **B.** 12.5%
   - **C.** 14%
   - **D.** 15%
```
