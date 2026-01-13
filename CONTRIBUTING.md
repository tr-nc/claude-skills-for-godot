# Contributing

Contributions are welcome! This project focuses on **command-line only** Godot development.

## Development Workflow

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with `./bootstrap.sh`
5. Submit a pull request

## Adding New Content

### Documentation

When adding CLI documentation:
1. Update `bootstrap.sh` to include new files
2. Add entries to the generated `MENU.md`
3. Test with `./bootstrap.sh`

### Examples

Add examples to the `examples/` folder:
- Scene files (`.tscn`)
- Scripts (`.gd`)
- Resource files (`.tres`)
- README explaining the example

## Coding Style

- Follow the commit style in `CLAUDE.md`
- Use clear, descriptive names
- Add comments for complex logic
- Keep CLI-focused (no GUI dependencies)

## Testing

Test your changes:

```bash
# Clean and re-bootstrap
find docs/ -mindepth 1 -not -name ".gitkeep" -delete
./bootstrap.sh

# Verify structure
ls docs/
cat docs/MENU.md
```

## CLI-Only Philosophy

This project emphasizes:
- **No GUI editor** - Everything via terminal
- **Text-based files** - `.tscn`, `.tres`, `project.godot` are editable
- **Automation** - Scripts over manual work
- **CI/CD** - Automated testing and builds

When contributing, ask:
- Can this be done from the CLI?
- Does it require the editor? (if yes, don't include it)
- Can it be automated?
