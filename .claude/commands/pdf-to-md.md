# pdf-to-md

Convert PDF, DOCX, and DOC files into plain-text `.md` files for use as LPT exam-generator source material.

## Usage
```
/pdf-to-md <path-to-file-or-folder>
```

## What it handles

| File type | Tool used | Handles images/scans? |
|-----------|-----------|----------------------|
| PDF with real text | `pdftotext` | ✅ Text layer only |
| Scanned PDF (image-based) | `tesseract` OCR via `pdftoppm` | ✅ OCR fallback |
| DOCX / DOC | `textutil` (macOS built-in) | ✅ Text + embedded text |
| PPTX | Skipped (no tool available) | ⚠️ Listed in report |
| Images IN PDFs | Skipped (not extractable) | ⚠️ Noted in output |

> Images that are purely decorative (charts, photos) are skipped — only readable text is extracted.

## Instructions

The user will pass `$ARGUMENTS` — a path to a single file or a directory to scan recursively.

Run this bash logic exactly:

```bash
TARGET="$ARGUMENTS"
TARGET=$(realpath "$TARGET" 2>/dev/null || echo "$TARGET")

CONVERTED=0; SKIPPED=0; FAILED=0; OCR_COUNT=0; UNSUPPORTED=()

convert_pdf() {
  local src="$1"
  local out="${src%.pdf}.md"

  # Skip if already up-to-date
  if [ -f "$out" ] && [ "$out" -nt "$src" ]; then
    echo "SKIP: $out"; ((SKIPPED++)); return
  fi

  # Try pdftotext first
  pdftotext -layout -enc UTF-8 "$src" - 2>/dev/null > "$out"
  local chars=$(wc -c < "$out" | tr -d ' ')

  # If output is too small (<200 chars), it's likely a scanned PDF — use OCR
  if [ "$chars" -lt 200 ]; then
    echo "  → Scanned PDF detected, running OCR: $(basename "$src")"
    local tmpdir=$(mktemp -d)
    # Convert PDF pages to images
    pdftoppm -r 200 -png "$src" "$tmpdir/page" 2>/dev/null
    # OCR each page
    > "$out"
    for img in "$tmpdir"/page-*.png; do
      [ -f "$img" ] || continue
      tesseract "$img" stdout -l eng 2>/dev/null >> "$out"
    done
    rm -rf "$tmpdir"
    local chars2=$(wc -c < "$out" | tr -d ' ')
    if [ "$chars2" -lt 200 ]; then
      rm -f "$out"
      echo "FAIL (no text even after OCR): $(basename "$src")"; ((FAILED++)); return
    fi
    echo "OCR OK: $out"; ((OCR_COUNT++)); ((CONVERTED++))
  else
    echo "OK: $out"; ((CONVERTED++))
  fi
}

convert_doc() {
  local src="$1"
  local out="${src%.*}.md"

  if [ -f "$out" ] && [ "$out" -nt "$src" ]; then
    echo "SKIP: $out"; ((SKIPPED++)); return
  fi

  textutil -convert txt -encoding UTF-8 -stdout "$src" 2>/dev/null > "$out"
  local chars=$(wc -c < "$out" | tr -d ' ')
  if [ "$chars" -lt 50 ]; then
    rm -f "$out"
    echo "FAIL: $(basename "$src")"; ((FAILED++)); return
  fi
  echo "OK: $out"; ((CONVERTED++))
}

process_file() {
  local f="$1"
  local ext="${f##*.}"
  case "${ext,,}" in
    pdf)  convert_pdf "$f" ;;
    doc|docx) convert_doc "$f" ;;
    pptx|ppt) UNSUPPORTED+=("$(basename "$f")"); echo "SKIP (pptx not supported yet): $(basename "$f")" ;;
  esac
}

if [ -f "$TARGET" ]; then
  process_file "$TARGET"
elif [ -d "$TARGET" ]; then
  find "$TARGET" \( -iname "*.pdf" -o -iname "*.docx" -o -iname "*.doc" -o -iname "*.pptx" -o -iname "*.ppt" \) | sort | while read -r f; do
    process_file "$f"
  done
else
  echo "ERROR: '$TARGET' is not a valid file or directory."
  exit 1
fi
```

After running, report a clean summary:
- ✅ Converted (text PDFs + Word docs): count
- 🔍 OCR converted (scanned PDFs): count  
- ⏭️ Skipped (already up-to-date): count
- ❌ Failed (empty even after OCR): count — these are image-only files with no readable text
- ⚠️ Unsupported (PPTX): list the filenames

Then tell the user: the generated `.md` files are ready to use as source material for the LPT exam generator.
