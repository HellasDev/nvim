-- ================================================================
-- Yazi.nvim Plugin - Yazi terminal file manager integration
-- ================================================================  
-- Ενσωμάτωση του Yazi file manager στο Neovim με floating window:
-- • Yazi floating window με όλα τα splits ως tabs
-- • Συγχρονισμός αρχείων με open buffers και LSP servers  
-- • Integration με telescope, fzf-lua για search functionality
-- • Highlight sync μεταξύ Yazi και Neovim
-- • Plugin management support μέσα από Neovim
-- • Rounded borders και modern UI
-- ================================================================

return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- Άνοιγμα Yazi σε floating window
    {
      "<leader>e",
      "<cmd>Yazi<cr>",
      desc = "🦆 Yazi - Άνοιγμα file manager"
    },
    -- Άνοιγμα Yazi στο directory του current buffer  
    {
      "<leader>E",
      "<cmd>Yazi cwd<cr>",
      desc = "🦆 Yazi - Directory τρέχοντος αρχείου"
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    -- Άνοιγμα σε floating window με rounded borders
    open_for_directories = true,
    keymaps = {
      show_help = '<f1>',
    },
    floating_window_border = "rounded",
    floating_window_winblend = 0,
  },
}