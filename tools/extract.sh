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

# Create a temp directory for extraction
TEMP_DIR="$CACHE_DIR/temp_extract"
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"

echo "Extracting documentation to temp directory..."
unzip -q -o "$ZIP_FILE" -d "$TEMP_DIR"

# Move contents to the target directory
# The zip may contain files directly in the root or in a subdirectory
# We'll move everything to godot-docs-html-stable/
TARGET_DIR="$CACHE_DIR/godot-docs-html-stable"
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

# If there's a single subdirectory in the temp dir, move its contents up
if [ "$(find "$TEMP_DIR" -mindepth 1 -maxdepth 1 -type d | wc -l)" -eq 1 ]; then
    SINGLE_DIR=$(find "$TEMP_DIR" -mindepth 1 -maxdepth 1 -type d)
    mv "$SINGLE_DIR"/* "$TARGET_DIR/"
else
    # Otherwise move all contents directly
    mv "$TEMP_DIR"/* "$TARGET_DIR/"
fi

# Clean up temp directory
rm -rf "$TEMP_DIR"

echo "Success: Documentation extracted to $TARGET_DIR/"
