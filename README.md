# 🚀 Neovim Configuration - Hellas Dev's Setup

Μια σύγχρονη και πλήρως διαμορφωμένη εγκατάσταση Neovim με εστίαση στην Go ανάπτυξη και γενική χρήση προγραμματισμού. Περιλαμβάνει πάνω από 25 plugins, LSP integration, debugging, και πολλά προηγμένα features για μια επαγγελματική εμπειρία development.

## 📋 Περιεχόμενα

- [Χαρακτηριστικά](#-χαρακτηριστικά)
- [Screenshots](#-screenshots)
- [Προαπαιτούμενα](#-προαπαιτούμενα)
- [Εγκατάσταση για Arch Linux](#-εγκατάσταση-για-arch-linux)
- [Εγκατάσταση για macOS](#-εγκατάσταση-για-macos)
- [Plugins που περιλαμβάνονται](#-plugins-που-περιλαμβάνονται)
- [Keymaps και Navigation](#-keymaps-και-navigation)
- [Go Development](#-go-development)
- [Debugging](#-debugging)
- [Troubleshooting](#-troubleshooting)

## ✨ Χαρακτηριστικά

- 🎨 **OneDark Theme** με consistent styling σε όλα τα UI elements
- 🔍 **Telescope** για γρήγορη αναζήτηση αρχείων και κειμένου
- 🌲 **Treesitter** για προηγμένο syntax highlighting
- 🛠️ **LSP Integration** με Mason για αυτόματη εγκατάσταση servers
- 🐹 **Ολοκληρωμένη Go υποστήριξη** με debugging, testing, και code coverage
- 📁 **Oil.nvim** για σύγχρονη διαχείριση αρχείων
- 🧩 **Autocompletion** με nvim-cmp και snippets
- 🔧 **Code formatting** με Conform για πολλές γλώσσες
- 📊 **Git integration** με Gitsigns
- 🎯 **Which-key** για διαδραστικό keymap guide
- 🔄 **Session management** με αυτόματη αποθήκευση/φόρτωση
- 🎮 **Left-handed friendly** (j/k keys swapped)
- 🖼️ **Image preview** με external viewer (eog) για Hyprland
- 🔗 **Smart link opening** για local files και URLs

## 📸 Screenshots

*Θα προσθέσεις εδώ screenshots της εγκατάστασής σου*

## 📦 Προαπαιτούμενα

Πριν την εγκατάσταση, βεβαιώσου ότι έχεις εγκατεστημένα τα ακόλουθα:

### Βασικά Εργαλεία
- **Neovim** >= 0.9.0
- **Git** για το cloning του repository
- **ripgrep** (rg) για γρήγορη αναζήτηση κειμένου
- **fd** για γρήγορη αναζήτηση αρχείων
- **Node.js** >= 16.0 και **npm** για LSP servers
- **Go** >= 1.21 για Go development tools
- **Make** για compilation των extensions
- **chafa** για image preview στο Telescope

### Optional αλλά Συνιστώμενα
- **TMUX** για seamless navigation με Navigator.nvim
- **Delta** για καλύτερα git diffs
- **Lazygit** για Git GUI integration

## 🐧 Εγκατάσταση για Arch Linux

### Βήμα 1: Εγκατάσταση Βασικών Πακέτων

```bash
# Ενημέρωση του συστήματος
sudo pacman -Syu

# Εγκατάσταση βασικών εργαλείων
sudo pacman -S neovim git ripgrep fd make nodejs npm go tmux

# Εγκατάσταση chafa για image preview στο Telescope
sudo pacman -S chafa

# Εγκατάσταση optional εργαλείων
sudo pacman -S git-delta lazygit
```

### Βήμα 2: Εγκατάσταση Go Tools

```bash
# Go development tools
go install golang.org/x/tools/cmd/goimports@latest
go install mvdan.cc/gofumpt@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/go-delve/delve/cmd/dlv@latest

# Προσθήκη του Go bin path στο PATH αν δεν υπάρχει ήδη
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
source ~/.bashrc
```


### Βήμα 3: Εγκατάσταση JavaScript/TypeScript Tools

```bash
# Formatters και linters για web development
npm install -g prettier @fsouza/prettierd eslint typescript

# Lua formatter
sudo pacman -S stylua
```

### Βήμα 4: Clone και Setup του Configuration

```bash
# Backup της υπάρχουσας εγκατάστασης (αν υπάρχει)
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
mv ~/.local/share/nvim ~/.local/share/nvim.backup 2>/dev/null || true

# Clone του repository
git clone https://github.com/HellasDev/nvim.git ~/.config/nvim

# Εκκίνηση του Neovim για αυτόματη εγκατάσταση plugins
nvim --headless "+Lazy! sync" +qa

# Δεύτερη εκκίνηση για εγκατάσταση LSP servers
nvim +"MasonInstallAll" +qa
```

## 🍎 Εγκατάσταση για macOS

### Βήμα 1: Εγκατάσταση Homebrew (αν δεν υπάρχει)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Βήμα 2: Εγκατάσταση Βασικών Πακέτων

```bash
# Ενημέρωση Homebrew
brew update

# Εγκατάσταση βασικών εργαλείων
brew install neovim git ripgrep fd make node go tmux

# Εγκατάσταση chafa για image preview στο Telescope
brew install chafa

# Εγκατάσταση optional εργαλείων
brew install git-delta lazygit
```

### Βήμα 3: Εγκατάσταση Go Tools

```bash
# Go development tools
go install golang.org/x/tools/cmd/goimports@latest
go install mvdan.cc/gofumpt@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/go-delve/delve/cmd/dlv@latest

# Προσθήκη του Go bin path στο PATH
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.zshrc
source ~/.zshrc
```

### Βήμα 4: Εγκατάσταση JavaScript/TypeScript Tools

```bash
# Formatters και linters για web development
npm install -g prettier @fsouza/prettierd eslint typescript

# Lua formatter
brew install stylua
```

### Βήμα 5: Clone και Setup του Configuration

```bash
# Backup της υπάρχουσας εγκατάστασης (αν υπάρχει)
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
mv ~/.local/share/nvim ~/.local/share/nvim.backup 2>/dev/null || true

# Clone του repository
git clone https://github.com/HellasDev/nvim.git ~/.config/nvim

# Εκκίνηση του Neovim για αυτόματη εγκατάσταση plugins
nvim --headless "+Lazy! sync" +qa

# Δεύτερη εκκίνηση για εγκατάσταση LSP servers
nvim +"MasonInstallAll" +qa
```

## 🔌 Plugins που περιλαμβάνονται

### 🎨 UI & Theming
- **onedark.nvim** - Κύριο theme με custom highlights
- **lualine.nvim** - Όμορφη status line με git info
- **bufferline.nvim** - Browser-style tabs για buffers
- **noice.nvim** + **nvim-notify** - Σύγχρονο UI για messages
- **which-key.nvim** - Διαδραστικό keymap guide

### 🔍 Navigation & Search
- **telescope.nvim** - Fuzzy finder για αρχεία και κείμενο
- **telescope-media-files.nvim** - Image preview στο Telescope
- **oil.nvim** - Σύγχρονος file manager
- **Navigator.nvim** - TMUX integration για seamless navigation

### 🛠️ Development Tools
- **nvim-lspconfig** + **mason.nvim** - LSP setup και management
- **nvim-cmp** - Autocompletion engine με multiple sources
- **LuaSnip** - Snippet engine με VSCode compatibility
- **conform.nvim** - Code formatting για πολλές γλώσσες
- **nvim-treesitter** - Syntax highlighting και text objects

### 🐹 Go Development
- **go.nvim** - Ολοκληρωμένα Go tools και commands
- **nvim-dap** + **nvim-dap-go** - Debugging με DAP
- **nvim-dap-ui** - Visual debugging interface
- **neotest** + **neotest-go** - Test runner με UI
- **nvim-coverage** - Code coverage visualization

### 🔧 Code Quality & Git
- **gitsigns.nvim** - Git integration με visual indicators
- **Comment.nvim** - Smart commenting με treesitter
- **trouble.nvim** - Diagnostics management
- **hlchunk.nvim** - Visual indentation και block highlighting

### 🎯 Productivity
- **resession.nvim** - Session management με auto-save/load
- **colorizer.nvim** - Live color preview για CSS/hex codes
- **fidget.nvim** - LSP progress notifications

### 🖼️ Image Preview
- **telescope-media-files.nvim** - Image preview στο Telescope με chafa
- **External viewer integration** - Άνοιγμα εικόνων με eog σε floating window

## ⌨️ Keymaps και Navigation

### Βασικά Keymaps (Leader: Space)

| Keymap | Περιγραφή |
|--------|-----------|
| `<leader>w` | 💾 Αποθήκευση αρχείου |
| `<leader>q` | ❌ Κλείσιμο buffer |
| `<leader>e` | 📁 Oil file manager |
| `<leader>v` | 🧩 Κάθετο χωρισμός |
| `<leader>h` | 🧱 Οριζόντιος χωρισμός |
| `<leader>al` | 🔗 Άνοιγμα link κάτω από κέρσορα |

### Telescope Search

| Keymap | Περιγραφή |
|--------|-----------|
| `<leader>ff` | 📄 Εύρεση αρχείων |
| `<leader>ft` | 🔍 Αναζήτηση κειμένου |
| `<leader>fm` | 🖼️ Media files με preview |
| `<leader>fb` | 🔍 Λίστα buffers |
| `<leader>fo` | 🕰️ Πρόσφατα αρχεία |

### LSP Commands

| Keymap | Περιγραφή |
|--------|-----------|
| `<leader><space>` | 📄 LSP hover |
| `<leader>rn` | ✏️ LSP rename |
| `<leader>ca` | 🔧 Code actions |
| `<leader>f` | 🎨 Format code |
| `gd` | 🎯 Go to definition |
| `gr` | 🔗 Find references |

### Navigation (Left-handed optimized)

| Keymap | Περιγραφή |
|--------|-----------|
| `j` | ⬆️ Κίνηση προς τα πάνω |
| `k` | ⬇️ Κίνηση προς τα κάτω |
| `Shift+↑/↓` | 📄 Page scroll |
| `Shift+←/→` | 🔄 Buffer navigation |
| `Ctrl+Arrow` | 🪟 Window switching |

### Image Preview

| Keymap | Περιγραφή |
|--------|-----------|
| `<leader>ip` | 🖼️ Άνοιγμα εικόνας με eog |
| `<leader>fm` | 📂 Telescope media files browser |

**Υποστηριζόμενα formats:**
- PNG, JPEG, GIF, WebP, AVIF, HEIC, HEIF
- SVG, BMP, ICO, TIFF
- RAW formats (CR2, NEF, ARW, κτλ.)
- **Telescope preview** - γρήγορη αναζήτηση εικόνων με chafa
- **External viewer** - άνοιγμα σε floating window με eog
- **Smart detection** - αναγνώριση image paths στον κώδικα

## 🐹 Go Development

### Go Commands

| Keymap | Περιγραφή |
|--------|-----------|
| `<leader>gr` | 🏃 Εκτέλεση Go αρχείου |
| `<leader>gt` | ✅ Tests πακέτου |
| `<leader>gT` | 🎯 Test κάτω από κέρσορα |
| `<leader>gb` | 🔨 Build Go πακέτου |
| `<leader>gm` | 🧹 Go mod tidy |
| `<leader>gi` | 📦 Προσθήκη imports |
| `<leader>gfs` | 🧩 Συμπλήρωση struct |
| `<leader>gat` | 🏷️ Προσθήκη struct tags |
| `<leader>grt` | 🗑️ Αφαίρεση struct tags |
| `<leader>gal` | 🔄 Εναλλαγή test/source |
| `<leader>gc` | 📊 Φόρτωση coverage |
| `<leader>gC` | 🔍 Εναλλαγή coverage |
| `<leader>gnp` | 🏗️ Δημιουργία νέου Go project |

### Go LSP Features

- **gopls** με πλήρη configuration για:
  - Inlay hints για types και parameters
  - Code lenses για tests και dependencies
  - Advanced analysis (fieldalignment, nilness, unusedparams)
  - gofumpt formatting integration
  - Complete unimported packages
  - Staticcheck integration (optional)

## 🐛 Debugging

### Debug Commands

| Keymap | Περιγραφή |
|--------|-----------|
| `<leader>db` | 🔴 Toggle breakpoint |
| `<leader>dr` | ▶️ Start/Continue debug |
| `<leader>ds` | ⏭️ Step over |
| `<leader>di` | ⏬ Step into |
| `<leader>do` | ⏪ Step out |
| `<leader>dt` | ⏹️ Terminate debug |
| `<leader>du` | 📺 Toggle Debug UI |
| `<leader>dgt` | 🧪 Debug Go test |

### Debug Features

- **DAP Integration** με nvim-dap για Go debugging
- **Visual UI** με panels για scopes, variables, call stack
- **Virtual text** για inline variable inspection
- **Breakpoint management** με visual indicators
- **Remote debugging** support για Docker containers

## 🔧 Troubleshooting

### Συχνά Προβλήματα

#### LSP Servers δεν λειτουργούν
```bash
# Έλεγχος εγκατάστασης των LSP servers
nvim +"Mason" +qa

# Επανεγκατάσταση όλων των servers
nvim +"MasonInstallAll" +qa
```

#### Go tools δεν βρίσκονται
```bash
# Έλεγχος του Go PATH
go env GOPATH
echo $PATH | grep -o "$(go env GOPATH)/bin"

# Αν δεν υπάρχει, προσθήκη στο PATH
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Formatting δεν λειτουργεί
```bash
# Έλεγχος εγκατάστασης formatters
which prettier
which stylua
which gofumpt

# Επανεγκατάσταση αν χρειάζεται
npm install -g prettier
sudo pacman -S stylua  # ή brew install stylua για macOS
go install mvdan.cc/gofumpt@latest
```

### Επαναφορά Configuration

Αν κάτι πάει στραβά, μπορείς να επαναφέρεις την παλιά εγκατάσταση:

```bash
# Επαναφορά backup
rm -rf ~/.config/nvim
mv ~/.config/nvim.backup ~/.config/nvim

rm -rf ~/.local/share/nvim
mv ~/.local/share/nvim.backup ~/.local/share/nvim
```

## 📝 Customization

### Προσθήκη Custom Snippets

Δημιούργησε τον φάκελο `~/.config/nvim/snippets` και προσθες VSCode-compatible snippets:

```bash
mkdir -p ~/.config/nvim/snippets
# Προσθήκη custom Go snippets στο snippets/go.json
```

### Αλλαγή Theme

Στο αρχείο `lua/plugins/onedark.lua`, μπορείς να αλλάξεις το style:

```lua
style = "dark", -- ή "darker", "cool", "deep", "warm", "warmer"
```

### Custom Keymaps

Προσθήκη custom keymaps στο `lua/config/keymaps.lua`.

## 🤝 Contributing

Αν θες να συνεισφέρεις στο configuration:

1. Fork το repository
2. Δημιούργησε ένα feature branch
3. Κάνε τις αλλαγές σου
4. Δοκίμασε ότι όλα λειτουργούν σωστά
5. Στείλε ένα Pull Request

## 📄 License

Αυτό το configuration είναι διαθέσιμο υπό την MIT License. Μπορείς να το χρησιμοποιήσεις και να το τροποποιήσεις ελεύθερα.

## 🙏 Acknowledgments

Ευχαριστίες σε όλους τους developers των plugins που χρησιμοποιούνται σε αυτό το configuration. Ιδιαίτερες ευχαριστίες στην Neovim community για τη συνεχή ανάπτυξη και βελτίωση του editor.

---

**Καλή διασκέδαση με το Neovim! 🚀**

*Αν αντιμετωπίσεις προβλήματα ή έχεις ερωτήσεις, μη διστάσεις να ανοίξεις ένα issue στο GitHub repository.*