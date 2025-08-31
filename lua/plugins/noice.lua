-- ================================================================
-- Noice Plugin - Προηγμένο UI για messages, cmdline και notifications
-- ================================================================
-- Αντικαθιστά το default UI του Neovim με ένα πιο μοντέρνο:
-- • Όμορφα popups για command line και search
-- • Integration με nvim-notify για notifications
-- • LSP progress indicators με custom spinners
-- • Virtual text για lsp hover και signature help
-- • Command palette για εύκολη πρόσβαση σε εντολές
-- • Πλήρως παραμετροποιήσιμο με custom views και presets
-- • Rounded borders και consistent styling με το OneDark theme
-- ================================================================

return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        config = function()
          require("notify").setup({
            background_colour = "#282C34",
            stages = "fade_in_slide_out",
            fps = 60,
          })
          vim.notify = require("notify")
        end,
      },
    },
    config = function()
      vim.opt.termguicolors = true
      vim.o.lazyredraw = false

      require("noice").setup({
        lsp = {
          progress = { enabled = false },
        },
        presets = {
          bottom_search = false,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
        views = {
          cmdline_popup = {
            position = { row = "50%", col = "50%" },
            size = { width = 40, height = "auto" },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
            },
          },
          popupmenu = {
            backend = "cmp",
            border = { style = "rounded" },
            win_options = {
              winhighlight = { Pmenu = "Pmenu", PmenuSel = "PmenuSel" },
            },
          },
        },
      })

      local set_hl = vim.api.nvim_set_hl
      set_hl(0, "NoiceCmdLinePopupBorder", { fg = "#61AFEF", bg = "NONE" })
      set_hl(0, "NoiceCmdLinePopup", { bg = "#282C34" })
      set_hl(0, "NoicePopupmenuBorder", { fg = "#61AFEF", bg = "NONE" })
      set_hl(0, "NoicePopupmenu", { bg = "#282C34" })
      set_hl(0, "NoiceNotifyBorder", { fg = "#61AFEF", bg = "NONE" })
      set_hl(0, "NoiceNotify", { bg = "#282C34" })
    end,
  },
}

