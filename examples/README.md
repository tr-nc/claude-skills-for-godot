# Examples

This folder contains example files showing how to create Godot projects using only the command line.

## Minimal Example

A simple "Hello World" style project demonstrating:
- Scene structure (`.tscn` files are text-based)
- GDScript basics
- Project configuration

### Files

- `project.godot` - Project configuration
- `minimal_scene.tscn` - Scene definition
- `main.gd` - Script attached to the root node

### Running the Example

```bash
# Create a new project directory
mkdir my_game && cd my_game

# Copy the example files
cp ../examples/project.godot .
cp ../examples/minimal_scene.tscn .
cp ../examples/main.gd .

# Run the game
godot --path .

# Run in headless mode (no window)
godot --headless --path .
```

## Creating Scenes Programmatically

You can also create `.tscn` files using scripts. See the Godot documentation at `docs/cli/` for more information.

### Scene File Format

`.tscn` files use a simple text format (similar to INI):

```ini
[gd_scene load_steps=2 format=3 uid="uid://..."]

[ext_resource type="Script" path="res://main.gd" id="1"]

[node name="Main" type="Node2D"]
script = ExtResource("1")

[node name="Child" type="Node2D" parent="."]
position = Vector2(100, 200)
```

### Key Concepts

1. **Nodes**: Defined with `[node]` sections
2. **Resources**: External files referenced with `[ext_resource]`
3. **Properties**: Set as key=value pairs
4. **Hierarchy**: Use `parent="."` to nest nodes
