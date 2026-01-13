# Claude Code Skills for Godot

A comprehensive skill set for developing Godot games using **command-line only**, without the Godot Editor GUI.

## Goal

Enable developers to build complete Godot games entirely through terminal commands, scripts, and code. This enables:
- Headless/server builds
- CI/CD integration
- Automated testing pipelines
- Vim/Emacs-based development workflows
- Remote development environments

## Development Plan

### Phase 1: Documentation Curation
- [ ] Keep CLI-relevant documentation
  - Command line tutorial (`tutorials/editor/command_line_tutorial.html`)
  - Export from CLI (`tutorials/export/exporting_projects.html`)
  - Asset pipeline automation (`tutorials/assets_pipeline/`)
  - Project configuration files
  - Scripting references (GDScript, C#)

- [ ] Delete GUI-specific documentation
  - `tutorials/ui/` - Visual UI editor
  - `tutorials/2d/` - 2D viewport editor
  - `tutorials/3d/` - 3D viewport editor
  - `tutorials/animation/` - Animation timeline editor
  - `tutorials/editor/inspector_dock.html`
  - `tutorials/editor/project_manager.html`
  - `getting_started/` - GUI-based tutorials

### Phase 2: Core Skills
- [ ] `godot-init` - Initialize new project from CLI
- [ ] `godot-run` - Run game with CLI flags
- [ ] `godot-export` - Export to target platforms
- [ ] `godot-test` - Run tests in headless mode
- [ ] `godot-bundle` - Create PCK/ZIP packs

### Phase 3: Scene Management Skills
- [ ] `godot-scene-create` - Create .tscn files programmatically
- [ ] `godot-scene-add-node` - Add nodes to scenes via CLI
- [ ] `godot-resource-create` - Create .tres resource files
- [ ] `godot-project-config` - Modify project.godot settings

### Phase 4: Asset Pipeline Skills
- [ ] `godot-import` - Import assets via CLI
- [ ] `godot-export-asset` - Export 3D scenes
- [ ] `godot-asset-bundle` - Bundle asset packs

### Phase 5: Development Skills
- [ ] `godot-hot-reload` - Live reload during development
- [ ] `godot-debug-cli` - Debug output to terminal
- [ ] `godot-profile` - Performance profiling from CLI
- [ ] `godot-log` - Parse and filter game logs

### Phase 6: CI/CD Integration
- [ ] GitHub Actions workflows
- [ ] Docker build environments
- [ ] Automated testing suites
- [ ] Multi-platform export automation

## CLI Reference

### Essential Commands

```bash
# Run project
godot --path /path/to/project --headless

# Export project
godot --headless --export "preset_name" output_path

# Run script
godot --headless --script main.gd

# Edit project from CLI
godot --headless --editor

# Check version
godot --version

# List command line options
godot --help
```

## Documentation Key

### Keep (CLI-Relevant)
- `tutorials/editor/command_line_tutorial.html`
- `tutorials/export/exporting_projects.html`
- `tutorials/export/exporting_pcks.html`
- `tutorials/assets_pipeline/import_process.html`
- `tutorials/scripting/filesystem.html`
- `tutorials/scripting/gdscript/`
- `classes/` - API reference

### Delete (GUI-Specific)
- `tutorials/ui/`
- `tutorials/2d/`
- `tutorials/3d/`
- `tutorials/animation/`
- `tutorials/editor/inspector_dock.html`
- `tutorials/editor/project_manager.html`
- `getting_started/`

## Setup

```bash
# Bootstrap documentation
./bootstrap.sh

# Skills will be installed to ~/.config/claude/skills/
```

## Contributing

This project prioritizes terminal-first workflows. All skills should work without the Godot Editor GUI.

## License

MIT
