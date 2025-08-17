# 🐹 Go Development Guide for Neovim

Αυτό το Neovim configuration είναι πλήρως βελτιστοποιημένο για Go development με όλα τα σύγχρονα εργαλεία.

## 🔧 Βασικές Βελτιώσεις

### 1. LSP Configuration (Enhanced)
- **gopls** με advanced features:
  - Inlay hints για types και parameters
  - Code lenses για tests, generate, tidy κλπ
  - Static analysis με fieldalignment, nilness
  - gofumpt formatting
  - Semantic tokens

### 2. Go-Specific Plugins
- **go.nvim**: Ολοκληρωμένα Go commands
- **neotest-go**: Advanced testing framework με UI
- **nvim-coverage**: Code coverage visualization
- **nvim-dap-go**: Debugging με Delve integration
- **vim-go**: Struct tags και επιπλέον εργαλεία

### 3. Development Tools
- **Project scaffolding**: Αυτόματη δημιουργία Go project structure
- **Custom snippets**: 20+ Go snippets (iferr, struct, interface, test κλπ)
- **Auto-formatting**: Format on save με import organization
- **Debugging**: Visual debugging με breakpoints και UI

## 🎯 Key Features

### 📁 Project Management
- `<leader>gnp` - Δημιουργία νέου Go project με πλήρη structure
- Auto-generation: main.go, go.mod, Makefile, README, .gitignore, CI/CD

### 🚀 Go Commands
- `<leader>gr` - Go run
- `<leader>gt` - Go test package
- `<leader>gT` - Go test function
- `<leader>gb` - Go build
- `<leader>gm` - Go mod tidy
- `<leader>gi` - Add imports
- `<leader>gfs` - Fill struct
- `<leader>gat` / `<leader>grt` - Add/Remove struct tags
- `<leader>gie` - Generate if err
- `<leader>gal` - Alternate test/source file

### 🧪 Testing & Coverage
- `<leader>gtr` - Run current test
- `<leader>gtf` - Run file tests
- `<leader>gts` - Test summary
- `<leader>gto` - Test output
- `<leader>gc` - Load coverage
- `<leader>gC` - Toggle coverage display
- `<leader>gcs` - Coverage summary

### 🐛 Debugging
- `<leader>db` - Toggle breakpoint
- `<leader>dB` - Conditional breakpoint
- `<leader>dr` - Start/Continue debugging
- `<leader>ds` - Step over
- `<leader>di` - Step into
- `<leader>do` - Step out
- `<leader>dt` - Terminate
- `<leader>du` - Toggle debug UI
- `<leader>dgt` - Debug test
- `<leader>dgT` - Debug last test

### 💡 Code Intelligence
- **Auto-completion**: Context-aware suggestions
- **Hover information**: `<leader><space>`
- **Go to definition**: `gd`
- **Find references**: `gr`
- **Rename**: `<leader>rn`
- **Code actions**: `<leader>ca`
- **Diagnostics**: `<leader>d`

## 📝 Code Snippets

Πληκτρολόγησε τα εξής prefixes και πάτα `Tab`:

### Error Handling
- `iferr` - Basic error handling
- `iferrl` - Error with log.Fatal
- `iferrm` - Error with custom message

### Structures
- `structjson` - Struct with JSON tags
- `interface` - Interface definition
- `method` - Method definition

### Testing
- `test` - Test function
- `benchmark` - Benchmark function
- `tabletest` - Table driven test

### Concurrency
- `go` - Goroutine
- `chan` - Channel creation
- `select` - Select statement
- `ctxtimeout` - Context with timeout
- `ctxcancel` - Context with cancel

### Utilities
- `httphandler` - HTTP handler
- `httpserver` - Basic HTTP server
- `jsonmarshal` / `jsonunmarshal` - JSON operations
- `forr` - For range loop
- `loginfo` - Formatted logging

## ⚙️ Go-Specific Settings

### File-Specific Options
- **Tabs**: Χρήση tabs αντί για spaces (Go convention)
- **Column guide**: 120 characters
- **Whitespace visualization**: Εμφάνιση tabs και trailing spaces
- **Auto-format**: Automatic formatting και import organization on save

### LSP Features
- **Inlay hints**: Types και parameter names
- **Code lenses**: Test run, generate, mod tidy buttons
- **Semantic highlighting**: Enhanced syntax coloring
- **Static analysis**: Advanced error detection

## 🔍 Troubleshooting

### Common Issues
1. **LSP not working**: Restart LSP με `:LspRestart`
2. **Tests not found**: Ensure you're in a Go module (`go.mod` exists)
3. **Debugging fails**: Check that `delve` is installed (`go install github.com/go-delve/delve/cmd/dlv@latest`)
4. **Coverage not showing**: Run tests with coverage first (`<leader>gc`)

### Performance Tips
- Χρήση `:GoMod tidy` τακτικά για καθαρό dependency tree
- Enable/disable features στο `go.nvim` config αν χρειάζεται
- Χρήση `:GoTest` αντί για `go test` για καλύτερη integration

## 🎨 Customization

### Προσθήκη custom Go commands:
```lua
vim.keymap.set("n", "<leader>gx", ":!go run .<cr>", { desc = "🐹 Go: Custom run" })
```

### Αλλαγή debugging layout:
```lua
-- Στο lua/plugins/go.lua, αλλάξτε το dapui.setup()
```

### Προσθήκη custom snippets:
```json
// Στο ~/.config/nvim/snippets/go.json
```

## 📚 Resources

- [Go.nvim Documentation](https://github.com/ray-x/go.nvim)
- [gopls Settings](https://github.com/golang/tools/blob/master/gopls/doc/settings.md)
- [Neotest Documentation](https://github.com/nvim-neotest/neotest)
- [DAP Configuration](https://github.com/mfussenegger/nvim-dap)

---

**Tip**: Πάτα `<leader>` και περίμενε να δεις όλα τα διαθέσιμα commands με which-key!