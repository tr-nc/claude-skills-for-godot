# Quick Start Guide

Get started with Godot CLI development in 5 minutes.

## Prerequisites

Install Godot Engine (any version 4.x+):
```bash
# macOS
brew install godot

# Linux
# Download from https://godotengine.org/download/linux

# Or use the official builds
```

## 1. Bootstrap This Repo

```bash
git clone https://github.com/tr-nc/claude-skills-for-godot.git
cd claude-skills-for-godot
./bootstrap.sh
```

This downloads and organizes the CLI documentation.

## 2. Create Your First Project

```bash
mkdir my_game && cd my_game

# Create project.godot
cat > project.godot << 'EOF'
config_version=5

[application]

config/name="My CLI Game"
run/main_scene="res://main.tscn"

[display]

window/size/viewport_width=800
window/size/viewport_height=600
EOF

# Create a simple scene
cat > main.tscn << 'EOF'
[gd_scene load_steps=1 format=3 uid="uid://main"]

[node name="Main" type="Node2D"]
EOF

# Create the main script
cat > main.gd << 'EOF'
extends Node2D

func _ready():
	print("Hello from CLI!")
	print("Press Ctrl+C to exit")

func _process(delta):
	print("Running... delta: ", delta)
EOF
```

## 3. Run Your Game

```bash
# Run with window
godot --path .

# Run headless (no window, just output)
godot --headless --path .
```

## 4. Next Steps

1. **Read the docs**: Check `docs/MENU.md` for CLI documentation
2. **Explore examples**: Look in `examples/` for more patterns
3. **Learn GDScript**: Read `docs/scripting/gdscript_basics.html`
4. **Export**: Use `docs/cli/exporting_projects.html` to build your game

## Common Commands

```bash
# Validate scenes without editor
godot --headless --check-only main.tscn

# Export for Windows
godot --headless --export "Windows Desktop" my_game.exe

# Run a test script
godot --headless --script test.gd

# See all options
godot --help
```

## Troubleshooting

**"command not found: godot"**
- Make sure Godot is in your PATH
- Or use full path: `/path/to/godot`

**Bootstrap fails**
- Check internet connection
- Verify the download URL is still valid

**Scene won't load**
- Validate with `--check-only` first
- Check for syntax errors in `.tscn` file

## Need Help?

- Documentation: `docs/MENU.md`
- Contributing: `CONTRIBUTING.md`
- Godot Forums: https://forum.godotengine.org/
