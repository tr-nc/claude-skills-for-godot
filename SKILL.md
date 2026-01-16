---
name: "Godot CLI"
description: "Create and build Godot games using command-line only, without the Godot Editor GUI. Includes CLI documentation, export automation, script-first workflows, and headless development."
---

# Godot CLI Development

This skill helps you create Godot games using **command-line only**, without the Godot Editor GUI.

## Quick Start

**Before using this skill, the documentation must be bootstrapped.**

If the `docs/` folder is empty or doesn't exist:

### Option 1: Let Claude Bootstrap (Recommended)

Ask Claude to help bootstrap this skill, and Claude will run the bootstrap script for you:
- "Please bootstrap the Godot skill"
- "Run the bootstrap script for this skill"

### Option 2: Manual Bootstrap

Run these commands in your terminal:

```bash
cd ~/.claude/skills/godot
./bootstrap.sh
```

Once bootstrapped, see `docs/MENU.md` for CLI-relevant topics navigation.

## When to Use This Skill

Activate this skill when you need to:
- Create or manage Godot projects from the terminal
- Export games without using the editor
- Write scripts to generate scenes and resources programmatically
- Run games in headless mode for testing or CI/CD
- Look up Godot CLI commands and flags

## Core Documentation

- **Command Reference**: See `docs/cli/commands.md` for all Godot CLI commands and flags
- **Export Automation**: See `docs/export/` for platform-specific export guides
- **Scripting**: See `docs/scripting/` for GDScript and programmatic workflows
- **API Reference**: See `docs/classes/` for full class documentation

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

## CLI Development Tips

1. **Scene Files**: `.tscn` files are text-based - edit them directly
2. **Resources**: `.tres` files are also text - create them programmatically
3. **Project Settings**: Edit `project.godot` directly for configuration
4. **Hot Reload**: Use `--reload-scripts` flag for live updates
5. **Logging**: Output goes to stdout/stderr for CI/CD integration

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
└── SKILL.md        # This file
```
