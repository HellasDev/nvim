-- -- ========================================================================================================================
-- options.lua - Κεντρικό αρχείο ρυθμίσεων Neovim
-- -- ========================================================================================================================
-- Αυτό το αρχείο περιέχει όλες τις γενικές ρυθμίσεις του Neovim.
-- Κάθε ρύθμιση έχει λεπτομερή σχόλια για το τι κάνει και γιατί χρησιμοποιείται.
-- Οργανωμένο σε θεματικές ενότητες για εύκολη συντήρηση και προσαρμογή.
-- ========================================================================================================================


-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- 🎯 ΒΑΣΙΚΕΣ ΡΥΘΜΙΣΕΙΣ EDITOR
-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- Ορισμός του πλήκτρου leader - το βασικό prefix για custom commands
-- Το space είναι εύκολο στην πρόσβαση και δεν συγκρούεται με vim defaults
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Μείωση του χρόνου αναμονής για την ενεργοποίηση των plugins και events
-- Χαμηλότερη τιμή = πιο responsive interface, αλλά περισσότερη χρήση CPU
vim.opt.updatetime = 50

-- Ενεργοποίηση μόνιμου undo history που αποθηκεύεται στον δίσκο
-- Επιτρέπει undo ακόμα και μετά το κλείσιμο και επαναφορά του αρχείου
vim.opt.undofile = true

-- Αύξηση του μεγέθους του undo history buffer για περισσότερα levels
-- Χρήσιμο για μεγάλες αλλαγές και refactoring sessions
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000

-- Βελτιωμένη εμπειρία autocompletion popup
-- menuone: εμφάνιση menu ακόμα κι αν υπάρχει μόνο μία επιλογή
-- noselect: δεν επιλέγει αυτόματα πρώτη επιλογή (καλύτερος έλεγχος)
vim.opt.completeopt = { "menuone", "noselect" }

-- ΣΗΜΕΙΩΣΗ: Το lazyredraw είναι απενεργοποιημένο στο noice.lua (line 22)
-- γιατί το noice plugin χρειάζεται real-time redraws για τα UI messages
-- vim.opt.lazyredraw = true  -- Βελτίωση απόδοσης για μεγάλα αρχεία

-- Ενεργοποίηση mouse support σε όλα τα modes για καλύτερη εμπειρία χρήσης
vim.opt.mouse = "a"

-- Απόκρυψη command line όταν δεν χρησιμοποιείται (καθαρότερο interface)
vim.opt.cmdheight = 1

-- Εμφάνιση μερικών matches κατά τη συμπλήρωση commands (βοηθάει στην εκμάθηση)
vim.opt.wildmenu = true
vim.opt.wildmode = { "longest:full", "full" }


-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- 📝 ΚΕΙΜΕΝΟ & INDENTATION
-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- Απενεργοποίηση αναδίπλωσης κειμένου για καλύτερη ανάγνωση κώδικα
-- Στον προγραμματισμό προτιμάμε horizontal scrolling από wrapping
vim.opt.wrap = false

-- Ρυθμίσεις tabs και spaces - βασική διαμόρφωση (επαναπροσδιορίζεται ανά γλώσσα)
-- Παρότι το default είναι 4 spaces, κάθε γλώσσα μπορεί να έχει τις δικές της ρυθμίσεις
vim.opt.tabstop = 4      -- Πόσα κενά φαίνονται σαν ένα tab character
vim.opt.softtabstop = 4  -- Πόσα κενά εισάγονται όταν πατάς Tab
vim.opt.shiftwidth = 2   -- Πόσα κενά χρησιμοποιούνται για auto-indentation (>, <, ==)
vim.opt.expandtab = true -- Μετατροπή tabs σε spaces (καλύτερη consistency)

-- Έξυπνη αυτόματη εσοχή που προσαρμόζεται στο context του κώδικα
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Διατήρηση εσοχής όταν οι γραμμές σπάνε (καλύτερη ανάγνωση)
vim.opt.breakindent = true

-- Εμφάνιση whitespace characters για καλύτερη ορατότητα formatting
-- Χρήσιμο για debugging formatting issues
vim.opt.list = false
vim.opt.listchars = {
  tab = "▸ ", -- Tabs φαίνονται σαν βέλη
  trail = "·", -- Trailing spaces σαν κουκκίδες
  nbsp = "␣", -- Non-breaking spaces
  extends = "›", -- Όταν το κείμενο συνεχίζει δεξιά
  precedes = "‹" -- Όταν το κείμενο συνεχίζει αριστερά
}


-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- 🔍 ΑΝΑΖΗΤΗΣΗ & NAVIGATION
-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- Εμφάνιση αποτελεσμάτων αναζήτησης σε πραγματικό χρόνο καθώς πληκτρολογείς
vim.opt.incsearch = true

-- Highlight όλων των matches στην αναζήτηση (καλύτερη οπτική ανατροφοδότηση)
vim.opt.hlsearch = true

-- Έξυπνη αναζήτηση case sensitivity:
-- Αγνοεί case αν αναζητάς με πεζά, σεβαστεί case αν χρησιμοποιείς κεφαλαία
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Προσθήκη του ** στο path για recursive αναζήτηση αρχείων σε υποφακέλους
-- Χρήσιμο για :find commands και file completion
vim.opt.path:append("**")

-- Κυκλική αναζήτηση (όταν φτάσεις στο τέλος, συνεχίζει από την αρχή)
vim.opt.wrapscan = true


-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- 🎨 ΕΜΦΑΝΙΣΗ & USER INTERFACE
-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- Ενεργοποίηση 24-bit χρωμάτων για καλύτερη εμφάνιση themes
vim.opt.termguicolors = true

-- Ενεργοποίηση αρίθμησης γραμμών με relative numbers για εύκολη πλοήγηση
vim.opt.number = true         -- Εμφάνιση απόλυτου αριθμού στην τρέχουσα γραμμή
vim.opt.relativenumber = false -- Relative numbers για τις υπόλοιπες γραμμές

-- Μόνιμη εμφάνιση της στήλης των σημαδιών (gitsigns, diagnostics, breakpoints)
-- Αποφεύγει το "πήδημα" του κειμένου όταν εμφανίζονται/εξαφανίζονται signs
vim.opt.signcolumn = "yes"

-- Απόκρυψη του mode indicator (-- INSERT --, -- VISUAL -- κλπ)
-- Το statusline plugin θα το δείξει με καλύτερο τρόπο
vim.opt.showmode = false

-- Απενεργοποίηση highlight της τρέχουσας γραμμής (προσωπική προτίμηση)
-- Μπορεί να ενεργοποιηθεί αν επιθυμείς cursorline = true
vim.opt.cursorline = false

-- Διατήρηση περιθωρίου κατά την κύλιση για καλύτερο context
-- 8 γραμμές πάνω/κάτω από τον κέρσορα θα είναι πάντα ορατές
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Καλύτερη προτίμηση για νέα splits (πιο φυσικό για αριστερά-προς-δεξιά γλώσσες)
vim.opt.splitbelow = true -- Οριζόντια splits ανοίγουν κάτω
vim.opt.splitright = true -- Κάθετα splits ανοίγουν δεξιά

-- Εμφάνιση column guide σε συγκεκριμένες θέσεις για code style
-- Βοηθάει στην τήρηση coding standards για μήκος γραμμής
-- vim.opt.colorcolumn = "80,120"

-- Βελτίωση του τρόπου εμφάνισης των tab pages
vim.opt.showtabline = 2

-- Καλύτερη εμφάνιση των matching brackets/parentheses
vim.opt.showmatch = true
vim.opt.matchtime = 1


-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- 📋 CLIPBOARD & SYSTEM INTEGRATION
-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- Χρήση του clipboard του συστήματος για seamless copy/paste με άλλες εφαρμογές
vim.opt.clipboard = "unnamedplus"


-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- 🌍 ΚΩΔΙΚΟΠΟΙΗΣΗ & ΔΙΕΘΝΟΠΟΙΗΣΗ
-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- Σειρά προτίμησης για την αυτόματη ανίχνευση κωδικοποίησης αρχείων
-- Ειδική υποστήριξη για ελληνικά αρχεία (iso-8859-7)
vim.opt.fileencodings = { "utf-8", "iso-8859-7", "ucs-bom", "latin1" }

-- Βασική κωδικοποίηση του Neovim - πάντα UTF-8
vim.opt.encoding = "utf-8"

-- Προεπιλεγμένη κωδικοποίηση για νέα αρχεία
vim.opt.fileencoding = "utf-8"


-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- ⚡ PERFORMANCE & OPTIMIZATION
-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- Βελτίωση απόδοσης για μεγάλα αρχεία
vim.opt.synmaxcol = 300 -- Syntax highlighting μόνο στα πρώτα 300 characters ανά γραμμή
vim.opt.ttyfast = true  -- Γρηγορότερη redraw για γρήγορα terminals

-- Backup και swap file settings για καλύτερη αξιοπιστία
vim.opt.backup = false      -- Δεν δημιουργούμε backup files (χρησιμοποιούμε git)
vim.opt.writebackup = false -- Δεν δημιουργούμε temporary backup κατά την εγγραφή
vim.opt.swapfile = false    -- Απενεργοποίηση swap files (χρησιμοποιούμε undofile)

-- Βελτίωση responsiveness για CursorHold events (χρησιμοποιείται από plugins)
vim.opt.updatecount = 0

-- Timeout settings για key sequences (καλύτερη εμπειρία με which-key)
vim.opt.timeoutlen = 300 -- Χρόνος αναμονής για mapped sequences
vim.opt.ttimeoutlen = 0  -- Χρόνος αναμονής για key codes (αμεσότερο)


-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- 🔄 AUTO-COMMANDS & EVENTS
-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- Highlight του κειμένου που αντιγράφεται (visual feedback για yank operations)
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  desc = "Highlight selection on yank για καλύτερη visual feedback",
  callback = function()
    vim.highlight.on_yank({
      timeout = 200,       -- Διάρκεια highlight σε milliseconds
      visual = true        -- Highlight και σε visual mode
    })
  end,
})

-- Αυτόματη διατήρηση του cursor position όταν επαναφέρεις αρχείο
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("restore_cursor", { clear = true }),
  pattern = "*",
  desc = "Restore cursor position όταν ανοίγεις αρχείο",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Αυτόματη δημιουργία directories όταν αποθηκεύεις αρχείο σε νέο path
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  pattern = "*",
  desc = "Αυτόματη δημιουργία directories αν δεν υπάρχουν",
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    -- Skip special protocol buffers
    if bufname:match("^%w+://") then
      return
    end
    local dir = vim.fn.fnamemodify(bufname, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})


-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- 🐹 GO DEVELOPMENT OPTIMIZATIONS
-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- Ειδικές ρυθμίσεις για Go αρχεία που ακολουθούν τα Go conventions
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  group = vim.api.nvim_create_augroup("go_settings", { clear = true }),
  desc = "Ειδικές ρυθμίσεις για Go development που ακολουθούν Go conventions",
  callback = function()
    -- Χρήση tabs αντί για spaces (Go convention)
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4

    -- Εμφάνιση whitespace για καλύτερη ορατότητα του Go formatting
    vim.opt_local.list = true
    vim.opt_local.listchars = {
      tab = "▸ ", -- Tabs φαίνονται σαν βέλη
      trail = "·", -- Trailing spaces
      nbsp = "␣" -- Non-breaking spaces
    }

    -- Column guide στα 120 characters (Go standard line length)
    vim.opt_local.colorcolumn = "120"

    -- Ρύθμιση για automatic line breaking στα 120 characters
    vim.opt_local.textwidth = 120

    -- Απενεργοποίηση spell checking (δεν χρειάζεται στον κώδικα)
    vim.opt_local.spell = false

    -- Ενεργοποίηση folding για καλύτερη πλοήγηση σε μεγάλα αρχεία
    vim.opt_local.foldmethod = "syntax"
    vim.opt_local.foldlevel = 99     -- Αρχικά όλα ξεδιπλωμένα
  end,
})

-- Auto-formatting και import organization για Go αρχεία κατά την αποθήκευση
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  group = vim.api.nvim_create_augroup("go_format", { clear = true }),
  desc = "Αυτόματο formatting και import organization για Go αρχεία",
  callback = function()
    -- Organize imports πρώτα
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)

    if result then
      for cid, res in pairs(result) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
            vim.lsp.util.apply_workspace_edit(r.edit, enc)
          end
        end
      end
    end

    -- Format το αρχείο
    vim.lsp.buf.format({ async = false })
  end,
})


-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- 🔧 ΔΙΑΓΝΩΣΤΙΚΑ & ERROR HANDLING
-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- Ρυθμίσεις για καλύτερη εμφάνιση των LSP diagnostics
vim.diagnostic.config({
  virtual_text = {
    enabled = true,
    source = "if_many", -- Εμφάνιση source όταν υπάρχουν πολλά διαγνωστικά
    spacing = 2, -- Κενό μεταξύ κειμένου και virtual text
    prefix = "●", -- Σύμβολο πριν το diagnostic text
  },
  float = {
    enabled = true,
    source = "always",      -- Πάντα εμφάνιση του source
    border = "rounded",     -- Όμορφα rounded borders
    header = "",            -- Χωρίς header text
    prefix = "",            -- Χωρίς prefix
  },
  signs = {
    enabled = true,     -- Εμφάνιση signs στην signcolumn
  },
  underline = {
    enabled = true,           -- Underline των diagnostic locations
  },
  update_in_insert = false,   -- Όχι updates στο insert mode (μπορεί να είναι ενοχλητικό)
  severity_sort = true,       -- Ταξινόμηση κατά σοβαρότητα
})


-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- 🎭 ΕΞΕΙΔΙΚΕΥΜΕΝΕΣ ΡΥΘΜΙΣΕΙΣ ΑΝΑ FILETYPE
-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- JSON αρχεία: καλύτερη εμφάνιση και formatting
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  group = vim.api.nvim_create_augroup("json_settings", { clear = true }),
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt_local.conceallevel = 0     -- Εμφάνιση όλων των quotes στο JSON
  end,
})

-- YAML αρχεία: strict indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "yaml", "yml" },
  group = vim.api.nvim_create_augroup("yaml_settings", { clear = true }),
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt_local.indentkeys:remove("<:>")     -- Αποφυγή auto-dedent για colons
  end,
})

-- Markdown αρχεία: καλύτερη εμπειρία συγγραφής
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "md" },
  group = vim.api.nvim_create_augroup("markdown_settings", { clear = true }),
  callback = function()
    vim.opt_local.wrap = true          -- Wrapping για καλύτερη ανάγνωση
    vim.opt_local.linebreak = true     -- Word wrapping αντί για character
    vim.opt_local.spell = true         -- Spell checking για γραφή
    vim.opt_local.conceallevel = 2     -- Καλύτερη εμφάνιση markdown syntax
  end,
})


-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════
-- 🏁 ΤΕΛΟΣ ΡΥΘΜΙΣΕΩΝ
-- ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════

-- ΣΗΜΕΙΩΣΗ: Debug message απενεργοποιημένο για καθαρότερο startup
-- Μπορείτε να ενεργοποιήσετε προσθέτοντας vim.g.debug_config = true στο init.lua
-- if vim.g.debug_config then
--     print("✅ options.lua loaded successfully - όλες οι ρυθμίσεις ενεργοποιήθηκαν")
-- end

