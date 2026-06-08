# Wangnov Homebrew Tap

Homebrew formulas and casks for Wangnov projects.

## Installation

```bash
brew tap wangnov/tap
```

### codex-asr

Unofficial Codex Desktop ASR CLI and local Whisper-compatible REST shim.

```bash
brew install codex-asr
codex-asr --help
```

### Airis

AI-powered image processing CLI tool.

```bash
brew install --cask airis
```

### Codex App Manager

Install, update, and uninstall the official Codex desktop app — with built-in, China-reachable self-update.

```bash
brew install --cask codex-app-manager
```

## Usage

After installation, the `airis` command will be available in your terminal:

```bash
# Show help
airis --help

# Analyze image
airis analyze info photo.jpg

# Edit image
airis edit resize image.png -w 800
airis edit filter blur photo.jpg -r 10

# Generate image with AI
airis gen draw "a beautiful sunset" -o sunset.png
```

## Requirements

- macOS 14.0 (Sonoma) or later
- Apple Silicon or Intel Mac

## Features

- 🎨 **51 commands** for image analysis, detection, editing, and generation
- 🤖 **AI image generation** powered by Gemini 2.0 Flash
- 👁️ **Apple Vision framework** for face/pose/text recognition
- 🖼️ **Professional editing** with filters, adjustments, cropping, format conversion
- 🌍 **Bilingual support** (Chinese/English)

## Note

The `analyze safe` command (sensitive content detection) is not available in this distribution due to Apple's provisioning restrictions. If you need this feature, please build from source using Xcode.

## License

MIT License
