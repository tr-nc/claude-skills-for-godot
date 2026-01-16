#!/bin/bash

# bootstrap.sh - Orchestrates download, extraction, and processing of Godot documentation.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
CACHE_DIR="$ROOT_DIR/cache"
ZIP_FILE="$CACHE_DIR/godot-docs-html-stable.zip"
EXTRACTED_DIR="$CACHE_DIR/godot-docs-html-stable"

# 1. Ensure zip file exists
if [ ! -f "$ZIP_FILE" ]; then
    echo "Documentation zip not found. Downloading..."
    "$SCRIPT_DIR/download.sh"
else
    echo "Found cached zip: $ZIP_FILE"
fi

# 2. Ensure documentation is extracted
if [ ! -d "$EXTRACTED_DIR" ]; then
    echo "Documentation not extracted. Extracting..."
    "$SCRIPT_DIR/extract.sh"
else
    echo "Found extracted docs in cache."
fi

# 3. Process the documentation
echo "Processing documentation..."
"$SCRIPT_DIR/process.sh"

echo "Bootstrap complete! Processed reference is in docs/godot-docs/"
