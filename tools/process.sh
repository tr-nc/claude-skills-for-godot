#!/bin/bash

# process.sh - Converts extracted Godot documentation to a compact, LLM-readable format.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
CACHE_DIR="$ROOT_DIR/cache"
DOCS_DIR="$ROOT_DIR/docs"
SOURCE_DIR="$CACHE_DIR/godot-docs-html-stable/_sources"
OUTPUT_DIR="$DOCS_DIR/godot-docs"

# Find the source directory if not in default location
if [ ! -d "$SOURCE_DIR" ]; then
    FOUND_DIR=$(find "$CACHE_DIR" -maxdepth 3 -type d -name "godot-docs-html-stable" -not -path "*/.*" | head -n 1)
    if [ -n "$FOUND_DIR" ]; then
        SOURCE_DIR="$FOUND_DIR/_sources"
    else
        echo "Error: Godot documentation sources not found in $CACHE_DIR. Please run tools/extract.sh first."
        exit 1
    fi
fi

echo "Source: $SOURCE_DIR"
echo "Target: $OUTPUT_DIR"

# Prepare output directory
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# Process files
echo "Processing files..."
# Skip 404.rst.txt as it contains no useful engine knowledge
find "$SOURCE_DIR" -type f -name "*.rst.txt" -not -name "404.rst.txt" | while read -r file; do
    rel_path="${file#$SOURCE_DIR/}"
    target_file="$OUTPUT_DIR/${rel_path%.rst.txt}.txt"
    mkdir -p "$(dirname "$target_file")"
    
    # Cleaning logic:
    cat "$file" | \
    # 1. Convert important directives to labels
    sed -E 's/^[[:space:]]*\.\. (note|warning|tip|important)::/ \1: /i' | \
    # 2. Remove anchors
    sed -E '/^[[:space:]]*\.\.[[:space:]]*_[a-zA-Z0-9_-]+:[[:space:]]*$/d' | \
    # 3. Remove metadata and directive arguments
    sed -E '/^[[:space:]]*:[a-z_]+:/d' | \
    # 4. Remove purely formatting/meta directives
    sed -E '/^[[:space:]]*\.\.[[:space:]]+(rst-class|css_class|container|meta|index|figure|image|include|raw|toctree|table|list-table):/d' | \
    # 5. Remove RST substitution pipes
    sed -E 's/\|([a-z]+)\|/\1/g' | \
    # 6. Simplify links
    sed -E 's/:(ref|doc):`([^<]*)<[^>]*>`/\2/g' | \
    sed -E 's/:(ref|doc):`([^`]*)`/\2/g' | \
    # 7. Unescape characters
    sed 's/\\//g' | \
    # 8. Replace double backticks with single backticks
    sed -E 's/``/`/g' | \
    # 9. Strip ASCII table borders
    sed -E 's/^[[:space:]]*[\+\-]{5,}.*$//g' | \
    # 10. Clean up table pipes
    sed -E 's/^[[:space:]]*\|[[:space:]]*//g' | \
    sed -E 's/[[:space:]]*\|[[:space:]]*$//g' | \
    sed -E 's/[[:space:]]*\|[[:space:]]*/ | /g' | \
    # 11. Squeeze multiple blank lines
    cat -s > "$target_file"
done

echo "Success: Processed reference created in '$OUTPUT_DIR/'"
