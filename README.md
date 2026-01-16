# Godot CLI Skill for Claude Code

A Claude Code skill for creating and building Godot games from the command line—no editor required.

> **Platform Support**: macOS and Linux only. Windows is not currently supported.

## Quick Start

### 1. Install

```bash
mkdir -p ~/.claude/skills
git clone https://github.com/tr-nc/claude-skills-for-godot ~/.claude/skills/godot
```

### 2. Bootstrap

Run the bootstrap script to download and prepare the documentation:

```bash
cd ~/.claude/skills/godot
./bootstrap.sh
```

### 3. Use

Ask Claude to help you with Godot CLI tasks:

- *"Create a new Godot project from the terminal"*
- *"Export my game for Windows Desktop"*
- *"Show me Godot CLI command flags"*

## What This Skill Does

- **CLI Documentation**: Command-line references for all Godot features
- **Export Automation**: Build and export projects without the editor
- **Script-First Workflow**: Create scenes and resources via code
- **Headless Development**: Run and test games without GUI

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
├── tools/          # Bootstrap scripts
└── SKILL.md        # Skill instructions for Claude
```

## Contributing

Contributions are welcome! Feel free to open a pull request.

## License

MIT
