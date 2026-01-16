#!/bin/bash

# extract.sh - Extracts the Godot documentation zip file to cache.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
CACHE_DIR="$ROOT_DIR/cache"
ZIP_FILE="$CACHE_DIR/godot-docs-html-stable.zip"

# Check if the zip file exists
if [ ! -f "$ZIP_FILE" ]; then
    echo "Error: $ZIP_FILE not found. Please run tools/download.sh first."
    exit 1
fi

# Prepare cache directory and unzip there
echo "Extracting documentation to $CACHE_DIR..."
mkdir -p "$CACHE_DIR"
unzip -q -o "$ZIP_FILE" -d "$CACHE_DIR"

echo "Success: Documentation extracted to $CACHE_DIR/godot-docs-html-stable/"
