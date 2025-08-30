<div align="center">

# 🚀 Neovim Configuration - Hellas Dev's Setup

[![Neovim](https://img.shields.io/badge/Neovim-0.9+-57A143?style=flat&logo=neovim&logoColor=white)](https://neovim.io/)
[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=flat&logo=lua&logoColor=white)](https://www.lua.org/)
[![Go](https://img.shields.io/badge/Go-Optimized-00ADD8?style=flat&logo=go&logoColor=white)](https://golang.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat)](LICENSE)
[![LSP](https://img.shields.io/badge/LSP-Enabled-blueviolet?style=flat)](https://microsoft.github.io/language-server-protocol/)
[![Sponsor](https://img.shields.io/badge/Sponsor-❤️-ff69b4?style=flat&logo=github-sponsors)](https://github.com/sponsors/HellasDev)

_A modern and fully configured Neovim setup focused on Go development and general programming use._  
_Includes 25+ plugins, LSP integration, debugging, and many advanced features for a professional development experience._

</div>

---

## 📋 Table of Contents

- [Features](#-features)
- [Screenshots](#-screenshots)
- [Prerequisites](#-prerequisites)
- [Installation for Arch Linux](#-installation-for-arch-linux)
- [Installation for macOS](#-installation-for-macos)
- [Included Plugins](#-included-plugins)
- [Keymaps and Navigation](#-keymaps-and-navigation)
- [Go Development](#-go-development)
- [Debugging](#-debugging)
- [Troubleshooting](#-troubleshooting)

## ✨ Features

- 🎨 **OneDark Theme** with consistent styling across all UI elements
- 🔍 **Telescope** for fast file and text searching
- 🌲 **Treesitter** for advanced syntax highlighting
- 🛠️ **LSP Integration** with Mason for automatic server installation
- 🐹 **Comprehensive Go support** with debugging, testing, and code coverage
- 📁 **Oil.nvim** for modern file management
- 🧩 **Autocompletion** with nvim-cmp and snippets
- 🔧 **Code formatting** with Conform for multiple languages
- 📊 **Git integration** with Gitsigns
- 🎯 **Which-key** for interactive keymap guide
- 🔄 **Session management** with auto-save/load
- 🎮 **Left-handed friendly** (j/k keys swapped)
- 🖼️ **Image preview** with external viewer (eog) for Hyprland
- 🔗 **Smart link opening** for local files and URLs

## 📸 Screenshots

*Add screenshots of your setup here*

## 📦 Prerequisites

Before installation, ensure you have the following installed:

### Essential Tools
- **Neovim** >= 0.9.0
- **Git** for cloning the repository
- **ripgrep** (rg) for fast text searching
- **fd** for fast file searching
- **Node.js** >= 16.0 and **npm** for LSP servers
- **Go** >= 1.21 for Go development tools
- **Make** for building extensions
- **chafa** for image preview in Telescope

### Optional but Recommended
- **TMUX** for seamless navigation with Navigator.nvim
- **Delta** for better git diffs
- **Lazygit** for Git GUI integration

## 🐧 Installation for Arch Linux

### Step 1: Install Essential Packages

```bash
# Update system
sudo pacman -Syu

# Install essential tools
sudo pacman -S neovim git ripgrep fd make nodejs npm go tmux

# Install chafa for image preview in Telescope
sudo pacman -S chafa

# Install optional tools
sudo pacman -S git-delta lazygit
```

### Step 2: Install Go Tools

```bash
# Go development tools
go install golang.org/x/tools/cmd/goimports@latest
go install mvdan.cc/gofumpt@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/go-delve/delve/cmd/dlv@latest

# Add Go bin path to PATH if not already present
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
source ~/.bashrc
```

### Step 3: Install JavaScript/TypeScript Tools

```bash
# Formatters and linters for web development
npm install -g prettier @fsouza/prettierd eslint typescript

# Lua formatter
sudo pacman -S stylua
```

### Step 4: Clone and Setup Configuration

```bash
# Backup existing installation (if present)
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
mv ~/.local/share/nvim ~/.local/share/nvim.backup 2>/dev/null || true

# Clone repository
git clone https://github.com/HellasDev/nvim.git ~/.config/nvim

# Start Neovim for automatic plugin installation
nvim --headless "+Lazy! sync" +qa

# Second startup for LSP server installation
nvim +"MasonInstallAll" +qa
```

## 🍎 Installation for macOS

### Step 1: Install Homebrew (if not present)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Step 2: Install Essential Packages

```bash
# Update Homebrew
brew update

# Install essential tools
brew install neovim git ripgrep fd make node go tmux

# Install chafa for image preview in Telescope
brew install chafa

# Install optional tools
brew install git-delta lazygit
```

### Step 3: Install Go Tools

```bash
# Go development tools
go install golang.org/x/tools/cmd/goimports@latest
go install mvdan.cc/gofumpt@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/go-delve/delve/cmd/dlv@latest

# Add Go bin path to PATH
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.zshrc
source ~/.zshrc
```

### Step 4: Install JavaScript/TypeScript Tools

```bash
# Formatters and linters for web development
npm install -g prettier @fsouza/prettierd eslint typescript

# Lua formatter
brew install stylua
```

### Step 5: Clone and Setup Configuration

```bash
# Backup existing installation (if present)
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
mv ~/.local/share/nvim ~/.local/share/nvim.backup 2>/dev/null || true

# Clone repository
git clone https://github.com/HellasDev/nvim.git ~/.config/nvim

# Start Neovim for automatic plugin installation
nvim --headless "+Lazy! sync" +qa

# Second startup for LSP server installation
nvim +"MasonInstallAll" +qa
```

## 🔌 Included Plugins

### 🎨 UI & Theming
- **onedark.nvim** - Main theme with custom highlights
- **lualine.nvim** - Beautiful status line with git info
- **bufferline.nvim** - Browser-style tabs for buffers
- **noice.nvim** + **nvim-notify** - Modern UI for messages
- **which-key.nvim** - Interactive keymap guide

### 🔍 Navigation & Search
- **telescope.nvim** - Fuzzy finder for files and text
- **telescope-media-files.nvim** - Image preview in Telescope
- **oil.nvim** - Modern file manager
- **Navigator.nvim** - TMUX integration for seamless navigation

### 🛠️ Development Tools
- **nvim-lspconfig** + **mason.nvim** - LSP setup and management
- **nvim-cmp** - Autocompletion engine with multiple sources
- **LuaSnip** - Snippet engine with VSCode compatibility
- **conform.nvim** - Code formatting for multiple languages
- **nvim-treesitter** - Syntax highlighting and text objects

### 🐹 Go Development
- **go.nvim** - Comprehensive Go tools and commands
- **nvim-dap** + **nvim-dap-go** - Debugging with DAP
- **nvim-dap-ui** - Visual debugging interface
- **neotest** + **neotest-go** - Test runner with UI
- **nvim-coverage** - Code coverage visualization

### 🔧 Code Quality & Git
- **gitsigns.nvim** - Git integration with visual indicators
- **Comment.nvim** - Smart commenting with treesitter
- **trouble.nvim** - Diagnostics management
- **hlchunk.nvim** - Visual indentation and block highlighting

### 🎯 Productivity
- **resession.nvim** - Session management with auto-save/load
- **colorizer.nvim** - Live color preview for CSS/hex codes
- **fidget.nvim** - LSP progress notifications

### 🖼️ Image Preview
- **telescope-media-files.nvim** - Image preview in Telescope with chafa
- **External viewer integration** - Open images with eog in floating window

## ⌨️ Keymaps and Navigation

### Basic Keymaps (Leader: Space)

| Keymap | Description |
|--------|-------------|
| `<leader>w` | 💾 Save file |
| `<leader>q` | ❌ Close buffer |
| `<leader>e` | 📁 Oil file manager |
| `<leader>v` | 🧩 Vertical split |
| `<leader>h` | 🧱 Horizontal split |
| `<leader>al` | 🔗 Open link under cursor |

### Telescope Search

| Keymap | Description |
|--------|-------------|
| `<leader>ff` | 📄 Find files |
| `<leader>ft` | 🔍 Search text |
| `<leader>fm` | 🖼️ Media files with preview |
| `<leader>fb` | 🔍 Buffer list |
| `<leader>fo` | 🕰️ Recent files |

### LSP Commands

| Keymap | Description |
|--------|-------------|
| `<leader><space>` | 📄 LSP hover |
| `<leader>rn` | ✏️ LSP rename |
| `<leader>ca` | 🔧 Code actions |
| `<leader>f` | 🎨 Format code |
| `gd` | 🎯 Go to definition |
| `gr` | 🔗 Find references |

### Navigation (Left-handed optimized)

| Keymap | Description |
|--------|-------------|
| `j` | ⬆️ Move up |
| `k` | ⬇️ Move down |
| `Shift+↑/↓` | 📄 Page scroll |
| `Shift+←/→` | 🔄 Buffer navigation |
| `Ctrl+Arrow` | 🪟 Window switching |

### Image Preview

| Keymap | Description |
|--------|-------------|
| `<leader>ip` | 🖼️ Open image with eog |
| `<leader>fm` | 📂 Telescope media files browser |

**Supported formats:**
- PNG, JPEG, GIF, WebP, AVIF, HEIC, HEIF
- SVG, BMP, ICO, TIFF
- RAW formats (CR2, NEF, ARW, etc.)
- **Telescope preview** - fast image searching with chafa
- **External viewer** - open in floating window with eog
- **Smart detection** - recognize image paths in code

## 🐹 Go Development

### Go Commands

| Keymap | Description |
|--------|-------------|
| `<leader>gr` | 🏃 Run Go file |
| `<leader>gt` | ✅ Package tests |
| `<leader>gT` | 🎯 Test under cursor |
| `<leader>gb` | 🔨 Build Go package |
| `<leader>gm` | 🧹 Go mod tidy |
| `<leader>gi` | 📦 Add imports |
| `<leader>gfs` | 🧩 Fill struct |
| `<leader>gat` | 🏷️ Add struct tags |
| `<leader>grt` | 🗑️ Remove struct tags |
| `<leader>gal` | 🔄 Alternate test/source |
| `<leader>gc` | 📊 Load coverage |
| `<leader>gC` | 🔍 Toggle coverage |
| `<leader>gnp` | 🏗️ Create new Go project |

### Go LSP Features

- **gopls** with full configuration for:
  - Inlay hints for types and parameters
  - Code lenses for tests and dependencies
  - Advanced analysis (fieldalignment, nilness, unusedparams)
  - gofumpt formatting integration
  - Complete unimported packages
  - Staticcheck integration (optional)

## 🐛 Debugging

### Debug Commands

| Keymap | Description |
|--------|-------------|
| `<leader>db` | 🔴 Toggle breakpoint |
| `<leader>dr` | ▶️ Start/Continue debug |
| `<leader>ds` | ⏭️ Step over |
| `<leader>di` | ⏬ Step into |
| `<leader>do` | ⏪ Step out |
| `<leader>dt` | ⏹️ Terminate debug |
| `<leader>du` | 📺 Toggle Debug UI |
| `<leader>dgt` | 🧪 Debug Go test |

### Debug Features

- **DAP Integration** with nvim-dap for Go debugging
- **Visual UI** with panels for scopes, variables, call stack
- **Virtual text** for inline variable inspection
- **Breakpoint management** with visual indicators
- **Remote debugging** support for Docker containers

## 🔧 Troubleshooting

### Common Issues

#### LSP Servers not working
```bash
# Check LSP server installation
nvim +"Mason" +qa

# Reinstall all servers
nvim +"MasonInstallAll" +qa
```

#### Go tools not found
```bash
# Check Go PATH
go env GOPATH
echo $PATH | grep -o "$(go env GOPATH)/bin"

# If not present, add to PATH
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Formatting not working
```bash
# Check formatter installation
which prettier
which stylua
which gofumpt

# Reinstall if needed
npm install -g prettier
sudo pacman -S stylua  # or brew install stylua for macOS
go install mvdan.cc/gofumpt@latest
```

### Reset Configuration

If something goes wrong, you can restore the old installation:

```bash
# Restore backup
rm -rf ~/.config/nvim
mv ~/.config/nvim.backup ~/.config/nvim

rm -rf ~/.local/share/nvim
mv ~/.local/share/nvim.backup ~/.local/share/nvim
```

## 📝 Customization

### Adding Custom Snippets

Create the `~/.config/nvim/snippets` folder and add VSCode-compatible snippets:

```bash
mkdir -p ~/.config/nvim/snippets
# Add custom Go snippets to snippets/go.json
```

### Changing Theme

In the `lua/plugins/onedark.lua` file, you can change the style:

```lua
style = "dark", -- or "darker", "cool", "deep", "warm", "warmer"
```

### Custom Keymaps

Add custom keymaps to `lua/config/keymaps.lua`.

## 🤝 Contributing

If you want to contribute to this configuration:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test that everything works correctly
5. Send a Pull Request

## 📄 License

This configuration is available under the MIT License. You can use and modify it freely.

## 🙏 Acknowledgments

Thanks to all plugin developers used in this configuration. Special thanks to the Neovim community for continuous development and improvement of the editor.

---

**Happy coding with Neovim! 🚀**

*If you encounter issues or have questions, don't hesitate to open an issue on the GitHub repository.*