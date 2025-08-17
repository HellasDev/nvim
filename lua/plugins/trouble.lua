-- ================================================================
-- Trouble Plugin - Diagnostics και error management
-- ================================================================
-- Centralized panel για τη διαχείριση όλων των diagnostics και errors:
-- • LSP diagnostics από όλους τους servers σε μία ενοποιημένη λίστα
-- • Quick navigation σε errors/warnings με j/k keys
-- • Split/vsplit/tab support για άνοιγμα αρχείων από τη λίστα
-- • Automatic grouping και folding των related diagnostics
-- • Severity filtering (errors, warnings, info, hints)
-- • Real-time updates καθώς αλλάζει ο κώδικας
-- • Integration με LSP references και definitions
-- • Rounded borders για consistent UI styling
-- ================================================================

return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({
      position = "bottom",
      height = 10,
      width = 50,
      icons = {},
      mode = "workspace_diagnostics",
      severity = nil,
      fold_open = "",
      fold_closed = "",
      group = true,
      padding = true,
      cycle_results = true,
      action_keys = {
        close = "q",
        cancel = "<esc>",
        refresh = "r",
        jump = { "<cr>", "<tab>", "<2-leftmouse>" },
        open_split = { "<c-x>" },
        open_vsplit = { "<c-v>" },
        open_tab = { "<c-t>" },
        jump_close = { "o" },
        toggle_mode = "m",
        switch_severity = "s",
        toggle_preview = "P",
        hover = "K",
        preview = "p",
        open_code_href = "c",
        close_folds = { "zM", "zm" },
        open_folds = { "zR", "zr" },
        toggle_fold = { "zA", "za" },
        previous = "k",
        next = "j",
        help = "?",
      },
      multiline = true,
      indent_lines = true,
      win_config = { border = "rounded" },
      auto_open = false,
      auto_close = false,
      auto_preview = true,
      auto_fold = false,
      auto_jump = { "lsp_definitions" },
      include_declaration = {
        "lsp_references",
        "lsp_implementations",
        "lsp_definitions",
      },
      signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "",
      },
      use_diagnostic_signs = false,
    })
  end,
}

