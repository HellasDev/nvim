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
	"navarasu/onedark.nvim",
	name = "onedark",
	lazy = false,
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "dark",
			transparent = false,
			term_colors = true,
			ending_tildes = false,
			cmp_itemkind_reverse = false,
			code_style = {
				comments = "italic",
				keywords = "none",
				functions = "none",
				strings = "none",
				variables = "none",
			},
			lualine = {
				transparent = false,
			},
			highlights = {
				OilFloat = { bg = "#282C34", fg = "#ABB2BF" },
				OilFloatBorder = { bg = "#282C34", fg = "#61AFEF" },
				TerminalFloat = { bg = "#282C34", fg = "#ABB2BF" },
				TerminalFloatBorder = { bg = "#282C34", fg = "#61AFEF" },
				NormalFloat = { bg = "#282C34", fg = "#ABB2BF" },
				FloatBorder = { bg = "#282C34", fg = "#61AFEF" },
			},
			diagnostics = {
				darker = true,
				undercurl = true,
				background = false,
			},
		})
		require("onedark").load()
		vim.o.termguicolors = true
		vim.o.background = "dark"
		vim.cmd("colorscheme onedark")
		vim.defer_fn(function()
			vim.api.nvim_set_hl(0, "OilFloat", { bg = "#282C34", fg = "#ABB2BF" })
			vim.api.nvim_set_hl(0, "OilFloatBorder", { bg = "#282C34", fg = "#61AFEF" })
			vim.api.nvim_set_hl(0, "TerminalFloat", { bg = "#282C34", fg = "#ABB2BF" })
			vim.api.nvim_set_hl(0, "TerminalFloatBorder", { bg = "#282C34", fg = "#61AFEF" })
		end, 100)
	end,
}