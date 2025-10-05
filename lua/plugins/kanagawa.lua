-- ================================================================
-- Kanagawa Theme - Κύριο χρωματικό σχήμα του Neovim
-- ================================================================
-- Kanagawa theme εμπνευσμένο από την ιαπωνική ζωγραφική με:
-- • 24-bit true color support για βαθιά και πλούσια χρώματα
-- • Italic comments για καλύτερη αναγνωσιμότητα του κώδικα
-- • Custom highlights για floating windows
-- • Wave (σκούρο), Dragon (πολύ σκούρο), Lotus (ανοιχτό) variants
-- • Terminal integration για consistent χρώματα
-- • Theme toggle με <leader>th που θυμάται την επιλογή
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

		-- Φόρτωση αποθηκευμένου theme preference
		local cache_file = vim.fn.stdpath("cache") .. "/theme_bg"
		if vim.fn.filereadable(cache_file) == 1 then
			local saved_bg = vim.fn.readfile(cache_file)[1]
			vim.o.background = saved_bg or "dark"
		else
			vim.o.background = "dark"
		end

		vim.cmd("colorscheme kanagawa")
	end,
}