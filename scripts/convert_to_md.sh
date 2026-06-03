#!/usr/bin/env bash
# =============================================================================
# convert_to_md.sh  —  Convert PDF, DOCX, DOC, PPTX, PPT to plain-text .md
#
# Usage:
#   ./scripts/convert_to_md.sh                  # converts entire project
#   ./scripts/convert_to_md.sh "some/folder"    # converts one folder
#   ./scripts/convert_to_md.sh "file.pdf"       # converts one file
#
# Tools used (all pre-installed):
#   pdftotext  — digital PDFs
#   pdftoppm + tesseract — scanned/image PDFs (OCR fallback)
#   textutil   — DOCX, DOC  (macOS built-in)
#   python3 + pptx — PPTX, PPT
# =============================================================================

set -euo pipefail

# ── Config ────────────────────────────────────────────────────────────────────
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-$REPO_ROOT}"          # default: whole project
OCR_DPI=200                        # resolution for scanned PDF pages
MIN_CHARS=200                      # below this → treat PDF as scanned
SKIP_IF_NEWER=true                 # skip if .md is already up-to-date

# ── Counters ─────────────────────────────────────────────────────────────────
converted=0; skipped=0; failed=0; ocr_count=0; pptx_count=0

# ── Helpers ───────────────────────────────────────────────────────────────────
log()  { echo "$1"; }
ok()   { echo "  ✓  $1"; }
skip() { echo "  –  $1 (skipped)"; }
fail() { echo "  ✗  $1"; }
ocrk() { echo "  ◎  $1 (OCR)"; }

convert_pdf() {
    local src="$1"
    local out="${src%.pdf}.md"

    if $SKIP_IF_NEWER && [ -f "$out" ] && [ "$out" -nt "$src" ]; then
        skip "$(basename "$src")"; ((skipped++)) || true; return
    fi

    pdftotext -layout -enc UTF-8 "$src" - 2>/dev/null > "$out"
    local chars; chars=$(wc -c < "$out" | tr -d ' ')

    if [ "$chars" -lt "$MIN_CHARS" ]; then
        # Scanned PDF — fall back to OCR
        local tmpdir; tmpdir=$(mktemp -d)
        pdftoppm -r "$OCR_DPI" -png "$src" "$tmpdir/page" 2>/dev/null
        > "$out"
        for img in "$tmpdir"/page-*.png; do
            [ -f "$img" ] && tesseract "$img" stdout -l eng 2>/dev/null >> "$out"
        done
        rm -rf "$tmpdir"
        local chars2; chars2=$(wc -c < "$out" | tr -d ' ')
        if [ "$chars2" -lt "$MIN_CHARS" ]; then
            rm -f "$out"; fail "$(basename "$src") — no text even after OCR"
            ((failed++)) || true
        else
            ocrk "$(basename "$src")"; ((converted++)) || true; ((ocr_count++)) || true
        fi
    else
        ok "$(basename "$src")"; ((converted++)) || true
    fi
}

convert_doc() {
    local src="$1"
    local out="${src%.*}.md"

    if $SKIP_IF_NEWER && [ -f "$out" ] && [ "$out" -nt "$src" ]; then
        skip "$(basename "$src")"; ((skipped++)) || true; return
    fi

    textutil -convert txt -encoding UTF-8 -stdout "$src" 2>/dev/null > "$out"
    local chars; chars=$(wc -c < "$out" | tr -d ' ')
    if [ "$chars" -lt 50 ]; then
        rm -f "$out"; fail "$(basename "$src")"; ((failed++)) || true
    else
        ok "$(basename "$src")"; ((converted++)) || true
    fi
}

convert_pptx() {
    local src="$1"
    local out="${src%.*}.md"

    if $SKIP_IF_NEWER && [ -f "$out" ] && [ "$out" -nt "$src" ]; then
        skip "$(basename "$src")"; ((skipped++)) || true; return
    fi

    python3 - "$src" "$out" <<'PYEOF'
import sys, pathlib
try:
    from pptx import Presentation
    src, out = sys.argv[1], sys.argv[2]
    prs = Presentation(src)
    lines = []
    for slide_num, slide in enumerate(prs.slides, 1):
        lines.append(f"\n--- Slide {slide_num} ---")
        for shape in slide.shapes:
            if shape.has_text_frame:
                for para in shape.text_frame.paragraphs:
                    text = para.text.strip()
                    if text:
                        lines.append(text)
    content = "\n".join(lines).strip()
    if content:
        pathlib.Path(out).write_text(content, encoding="utf-8")
        print("ok")
    else:
        print("empty")
except Exception as e:
    print(f"error: {e}")
PYEOF

    local result=$?
    if [ -f "$out" ] && [ "$(wc -c < "$out" | tr -d ' ')" -gt 50 ]; then
        ok "$(basename "$src")"; ((converted++)) || true; ((pptx_count++)) || true
    else
        rm -f "$out"; fail "$(basename "$src") — no text"; ((failed++)) || true
    fi
}

process_file() {
    local f="$1"
    # skip already-generated .md files and hidden/system files
    [[ "$f" == *".md" ]] && return
    [[ "$(basename "$f")" == .* ]] && return

    local ext; ext=$(echo "${f##*.}" | tr '[:upper:]' '[:lower:]')
    case "$ext" in
        pdf)           convert_pdf  "$f" ;;
        doc|docx)      convert_doc  "$f" ;;
        pptx|ppt)      convert_pptx "$f" ;;
        *)             return ;;
    esac
}

# ── Main ──────────────────────────────────────────────────────────────────────
log ""
log "=== convert_to_md.sh ==="
log "Target : $TARGET"
log ""

if [ -f "$TARGET" ]; then
    process_file "$TARGET"
elif [ -d "$TARGET" ]; then
    while IFS= read -r -d '' f; do
        process_file "$f"
    done < <(find "$TARGET" \
        \( -iname "*.pdf" -o -iname "*.docx" -o -iname "*.doc" \
           -o -iname "*.pptx" -o -iname "*.ppt" \) \
        -not -path "*/.git/*" \
        -print0 | sort -z)
else
    echo "ERROR: '$TARGET' is not a valid file or directory."
    exit 1
fi

# ── Summary ───────────────────────────────────────────────────────────────────
total=$((converted + skipped + failed))
log ""
log "=== SUMMARY ==="
log "  Total source files found : $total"
log "  ✓ Converted              : $converted  (of which OCR: $ocr_count, PPTX: $pptx_count)"
log "  – Skipped (up-to-date)   : $skipped"
log "  ✗ Failed                 : $failed"
log ""
log "Run 'git add -A && git commit' to commit the generated .md files."
