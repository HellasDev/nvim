-- ================================================================
-- OneDark Theme - Κύριο χρωματικό σχήμα του Neovim
-- ================================================================
-- Modern dark theme εμπνευσμένο από το Atom One Dark με:
-- • 24-bit true color support για βαθιά και πλούσια χρώματα
-- • Italic comments για καλύτερη αναγνωσιμότητα του κώδικα
-- • Custom highlights για floating windows (Oil, Terminal, popups)
-- • Consistent border colors (#61AFEF) σε όλα τα UI elements
-- • Lualine integration με matching theme colors
-- • Enhanced diagnostics με undercurl effects αλλά χωρίς backgrounds
-- • Terminal integration για consistent χρώματα και στο terminal
-- • Deferred highlight loading για optimal startup performance
-- ================================================================

return {
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	lazy = false,
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			compile = false,
			undercurl = true,
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = false },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = false,
			dimInactive = false,
			terminalColors = true,
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none"
						}
					}
				}
			},
			overrides = function(colors)
				local theme = colors.theme
				return {
					NormalFloat = { bg = theme.ui.bg },
					FloatBorder = { bg = theme.ui.bg, fg = theme.ui.fg_dim },
					FloatTitle = { bg = theme.ui.bg },
				}
			end,
			theme = "wave", -- dragon, wave, lotus
			background = {
				dark = "wave",
				light = "lotus"
			},
		})

		vim.o.termguicolors = true
		vim.o.background = "dark"
		vim.cmd("colorscheme kanagawa")
	end,
}