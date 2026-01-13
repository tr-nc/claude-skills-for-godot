#!/bin/bash

# Download the Godot documentation zip file
curl -L -o godot-docs-html-stable.zip https://nightly.link/godotengine/godot-docs/workflows/build_offline_docs/master/godot-docs-html-stable.zip

# Unzip the downloaded file
unzip godot-docs-html-stable.zip

# Remove the zip file
rm godot-docs-html-stable.zip

# Create docs folder and move extracted content
mkdir docs
mv _downloads _images _sources _static about classes community engine_details getting_started tutorials *.html docs/ 2>/dev/null || true
# Also handle case where files are in a subfolder
mv godot-docs-html-stable/* docs/ 2>/dev/null || true
rmdir godot-docs-html-stable 2>/dev/null || true
