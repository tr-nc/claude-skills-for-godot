# Claude Code Skills for Godot

A comprehensive skill set for developing Godot games using **command-line only**, without the Godot Editor GUI.

## Goal

Enable Claude Code to develop complete Godot games entirely through terminal commands and code. The skill set provides:

1. **Curated CLI Documentation** - Clean, filtered Godot docs with only CLI-relevant content
2. **Reference Menu** - Easy navigation for Claude to find the right documentation
3. **Command-Line Workflows** - All operations possible without the GUI editor
4. **Drop-In Integration** - Clone, bootstrap, and it just works

## Quick Start

**New to Godot CLI?** See [QUICKSTART.md](QUICKSTART.md) for a 5-minute getting started guide.

## How It Works

```
1. Clone this repo
2. Run ./bootstrap.sh (downloads, filters, organizes docs)
3. Copy to ~/.config/claude/skills/godot/
4. Claude Code can now develop Godot games!
```

The `bootstrap.sh` script:
- Downloads the official Godot HTML documentation
- **Removes GUI-specific tutorials** (2D/3D editor, UI, Animation timeline)
- **Keeps CLI-relevant content** (command line, export, scripting, API reference)
- Creates an organized navigation menu (MENU.md)
- Produces a clean, referenceable documentation structure

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

## Documentation Structure

After bootstrapping, the `docs/` folder contains:

```
docs/
├── MENU.md                    # Navigation menu for Claude
├── cli/                       # Command-line essentials
│   ├── command_line_tutorial.html
│   └── exporting_projects.html
├── scripting/                 # GDScript and programming
│   ├── gdscript_basics.html
│   ├── filesystem.html
│   └── resources.html
├── assets/                    # Asset pipeline automation
│   └── import_process.html
├── classes/                   # Full API reference (1000+ classes)
└── export/                    # Platform-specific export guides
    ├── android.html
    ├── ios.html
    ├── web.html
    └── ...
```

### Removed (GUI-Specific)
- `tutorials/ui/` - Visual UI editor tutorials
- `tutorials/2d/` - 2D viewport editor
- `tutorials/3d/` - 3D viewport editor
- `tutorials/animation/` - Animation timeline editor
- `getting_started/` - GUI-based first game tutorials
- `tutorials/editor/inspector_dock.html`
- `tutorials/editor/project_manager.html`

## Development

### Testing Bootstrap

```bash
# Clean docs folder (keep .gitkeep)
find docs/ -mindepth 1 -not -name ".gitkeep" -delete

# Run bootstrap
./bootstrap.sh
```

## Contributing

This project prioritizes terminal-first workflows. All skills should work without the Godot Editor GUI.

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## Resources

- **[Quick Start Guide](QUICKSTART.md)** - Get started in 5 minutes
- **[skill.md](skill.md)** - Skill descriptor for Claude Code
- **[Examples](examples/)** - Sample scenes and scripts
- **[.github/workflows/godot-ci.yml](.github/workflows/godot-ci.yml)** - CI/CD example

## License

MIT
