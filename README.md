# Claude Skills for Godot

A plain-text Godot engine reference optimized for LLM readability. This repository provides a compact, text-only version of the Godot documentation, making it easy for AI agents to understand every feature and API of the engine.

## Setup

The easiest way to get started is to run the bootstrap script:

```bash
./tools/bootstrap.sh
```

This will automatically handle downloading, extracting, and processing the documentation.

### Individual Steps

If you need more control, you can run the steps manually:

1. **Download**: `./tools/download.sh` (Downloads zip to `cache/`)
2. **Extract**: `./tools/extract.sh` (Unzips into `cache/`)
3. **Process**: `./tools/process.sh` (Generates LLM-ready docs in `docs/godot-docs/`)

## Usage

Provide the `docs/godot-docs/` folder to your LLM. It contains a comprehensive knowledge base:

- **API Reference**: `docs/godot-docs/classes/`
- **Tutorials**: `docs/godot-docs/tutorials/`
- **Getting Started**: `docs/godot-docs/getting_started/`

## Project Structure

- `tools/`: Scripts for downloading, extracting, and processing.
- `cache/`: (Gitignored) Raw zip and extracted source files.
- `docs/godot-docs/`: The final processed reference for AI use.
