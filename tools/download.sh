#!/bin/bash
# prepare.sh - Download Godot documentation to cache

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
CACHE_DIR="$ROOT_DIR/cache"

URL="https://nightly.link/godotengine/godot-docs/workflows/build_offline_docs/master/godot-docs-html-stable.zip"
ZIP_FILE="$CACHE_DIR/godot-docs-html-stable.zip"

mkdir -p "$CACHE_DIR"

echo "Downloading Godot documentation to cache/..."
curl -L -o "$ZIP_FILE" "$URL"

echo "Done. Zip file stored in $ZIP_FILE"
