# Godot CLI Development

Help developers create Godot games using **command-line only**, without the Godot Editor GUI.

## Quick Start

1. Run `./bootstrap.sh` to download and prepare the documentation
2. The `docs/MENU.md` file provides a navigation menu for CLI-relevant topics

## What This Skill Provides

- **CLI Documentation**: Curated Godot docs with only command-line relevant content
- **Command Reference**: All Godot CLI commands and flags
- **Export Automation**: Build and export projects from the terminal
- **Script-First Workflow**: Create scenes, resources, and projects via code
- **Headless Development**: Run and test games without the editor

## Common Commands

```bash
# Initialize a new project
godot --headless --editor --path /path/to/project

# Run a game
godot --path /path/to/project

# Export a project
godot --headless --export "Windows Desktop" output/game.exe

# Run a script
godot --headless --script main.gd
```

## Documentation

See `docs/MENU.md` for the complete documentation index.

## Project Structure

```
.
├── bootstrap.sh    # Download and prepare docs
├── docs/           # CLI-curated documentation
│   ├── MENU.md     # Documentation navigation
│   ├── cli/        # Command line essentials
│   ├── scripting/  # GDScript and programming
│   ├── export/     # Export guides per platform
│   └── classes/    # Full API reference
└── skill.md        # This file
```

## Tips for CLI Development

1. **Scene Files**: `.tscn` files are text-based - edit them directly
2. **Resources**: `.tres` files are also text - create them programmatically
3. **Project Settings**: Edit `project.godot` directly for configuration
4. **Hot Reload**: Use `--reload-scripts` flag for live updates
5. **Logging**: Output goes to stdout/stderr for CI/CD integration
