#!/bin/bash

set -e

# Download the Godot documentation zip file
echo "Downloading Godot documentation..."
curl -L -o godot-docs-html-stable.zip https://nightly.link/godotengine/godot-docs/workflows/build_offline_docs/master/godot-docs-html-stable.zip

# Unzip the downloaded file
echo "Extracting documentation..."
unzip -q godot-docs-html-stable.zip

# Remove the zip file
rm godot-docs-html-stable.zip

# Move content to docs/ (handle both extraction formats)
mkdir -p docs
if [ -d "godot-docs-html-stable" ]; then
    mv godot-docs-html-stable/* docs/
    rmdir godot-docs-html-stable
else
    mv _downloads _images _sources _static about classes community engine_details getting_started tutorials *.html docs/ 2>/dev/null || true
fi

# Remove GUI-specific documentation
echo "Removing GUI-specific documentation..."
cd docs

# Remove entire GUI-focused directories
rm -rf tutorials/ui
rm -rf tutorials/2d
rm -rf tutorials/3d
rm -rf tutorials/animation
rm -rf getting_started

# Remove specific editor GUI tutorials
rm -f tutorials/editor/inspector_dock.html
rm -f tutorials/editor/project_manager.html
rm -f tutorials/editor/using_the_android_editor.html
rm -f tutorials/editor/using_the_web_editor.html
rm -f tutorials/editor/using_the_xr_editor.html
rm -f tutorials/editor/customizing_editor.html
rm -f tutorials/editor/default_key_mapping.html

# Remove visual shader tutorials
rm -f tutorials/shaders/your_first_shader.html
rm -f tutorials/shaders/visual_shaders.html

# Remove image assets (not needed for CLI reference)
rm -rf _images
rm -rf _sources
rm -rf _static

# Remove download assets
rm -rf _downloads

# Reorganize docs into CLI-friendly structure
echo "Reorganizing documentation..."
mkdir -p cli scripting assets export

# Move CLI essentials
mkdir -p cli
cp tutorials/editor/command_line_tutorial.html cli/ 2>/dev/null || true
cp tutorials/export/exporting_projects.html cli/ 2>/dev/null || true
cp tutorials/export/exporting_pcks.html cli/ 2>/dev/null || true

# Move scripting content
mkdir -p scripting
cp -r tutorials/scripting/gdscript/* scripting/ 2>/dev/null || true
cp tutorials/scripting/filesystem.html scripting/ 2>/dev/null || true
cp tutorials/scripting/resources.html scripting/ 2>/dev/null || true
cp tutorials/scripting/*.html scripting/ 2>/dev/null || true

# Move asset pipeline
mkdir -p assets
cp tutorials/assets_pipeline/import_process.html assets/ 2>/dev/null || true
cp tutorials/assets_pipeline/*.html assets/ 2>/dev/null || true

# Move export guides
mkdir -p export
cp tutorials/export/*.html export/ 2>/dev/null || true

# Remove original tutorials folder after reorganization
rm -rf tutorials

# Create MENU.md navigation
cat > MENU.md << 'EOF'
# Godot CLI Documentation Menu

This documentation is curated for **command-line only** Godot development.

## Quick Start

1. **[Command Line Tutorial](cli/command_line_tutorial.html)** - Essential CLI commands
2. **[GDScript Basics](scripting/gdscript_basics.html)** - Scripting fundamentals
3. **[Exporting Projects](cli/exporting_projects.html)** - Build and export from CLI

## Command Line Essentials

- **[Command Line Tutorial](cli/command_line_tutorial.html)** - Complete CLI reference
- **[Exporting Projects](cli/exporting_projects.html)** - Export from command line
- **[Exporting PCKs](cli/exporting_pcks.html)** - Pack files and resources

## Scripting

- **[GDScript Basics](scripting/gdscript_basics.html)** - Language fundamentals
- **[GDScript Advanced](scripting/gdscript_advanced.html)** - Advanced features
- **[Static Typing](scripting/static_typing.html)** - Type hints and safety
- **[File System](scripting/filesystem.html)** - File operations
- **[Resources](scripting/resources.html)** - Resource management

## Asset Pipeline

- **[Import Process](assets/import_process.html)** - Asset import automation

## Export Platforms

### Desktop
- **[Windows](export/exporting_for_windows.html)**
- **[macOS](export/exporting_for_macos.html)**
- **[Linux/BSD](export/exporting_for_linuxbsd.html)**

### Mobile
- **[Android](export/exporting_for_android.html)**
- **[iOS](export/exporting_for_ios.html)**

### Web
- **[Web](export/exporting_for_web.html)**

## API Reference

- **[Classes Index](classes/)** - Full API reference (1000+ classes)

## Other Topics

- **[Debugging](scripting/debug/overview_of_debugging_tools.html)**
- **[Performance](tutorials/performance/)**
- **[Best Practices](tutorials/best_practices/)**
EOF

cd ..

echo "Documentation bootstrap complete!"
echo "CLI-ready docs are in: docs/"
