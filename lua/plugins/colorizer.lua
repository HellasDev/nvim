-- ================================================================
-- Colorizer Plugin - Live προεπισκόπηση χρωμάτων στον κώδικα
-- ================================================================
-- Εμφανίζει τα χρώματα κατευθείαν στον editor με υποστήριξη για:
-- • HEX codes (#FF0000, #abc123) με background highlighting
-- • RGB/RGBA values (rgb(255,0,0), rgba(255,0,0,0.5))
-- • HSL και HSV color formats για CSS/SCSS/Stylus
-- • CSS named colors (red, blue, green, orange κλπ)
-- • Tailwind CSS class names και CSS variables (--primary-color)
-- • Real-time updates καθώς επεξεργάζεσαι τον κώδικα
-- • Αποκλείει lazy.nvim buffer για καθαρότερη εμπειρία
-- ================================================================

return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("colorizer").setup({
			filetypes = {
				"*",
				"!lazy",
			},
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = false,
				RRGGBBAA = true,
				AARRGGBB = false,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
				css_fn = true,
				mode = "background",
				tailwind = true,
				sass = { enable = true, parsers = { "css" } },
				virtualtext = "■",
				always_update = false,
			},
			buftypes = {},
		})
	end,
}