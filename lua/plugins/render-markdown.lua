-- ================================================================
-- Render Markdown - Όμορφο rendering για Markdown αρχεία
-- ================================================================
-- Μετατρέπει το markdown σε όμορφη εμφάνιση με:
-- • Headings με διαφορετικά μεγέθη και χρώματα
-- • Code blocks με syntax highlighting
-- • Lists με bullets
-- • Bold/Italic formatting
-- • Links με icons
-- • Tables rendering
-- • Checkboxes
-- ================================================================

return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	ft = "markdown",
	config = function()
		require("render-markdown").setup({
			heading = {
				enabled = true,
				sign = true,
				icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
				backgrounds = {
					"RenderMarkdownH1Bg",
					"RenderMarkdownH2Bg",
					"RenderMarkdownH3Bg",
					"RenderMarkdownH4Bg",
					"RenderMarkdownH5Bg",
					"RenderMarkdownH6Bg",
				},
				foregrounds = {
					"RenderMarkdownH1",
					"RenderMarkdownH2",
					"RenderMarkdownH3",
					"RenderMarkdownH4",
					"RenderMarkdownH5",
					"RenderMarkdownH6",
				},
			},
			code = {
				enabled = true,
				sign = true,
				style = "full",
				left_pad = 2,
				right_pad = 2,
				width = "block",
				border = "thin",
			},
			bullet = {
				enabled = true,
				icons = { "●", "○", "◆", "◇" },
				highlight = "RenderMarkdownBullet",
			},
			checkbox = {
				enabled = true,
				unchecked = { icon = "󰄱 " },
				checked = { icon = "󰱒 " },
			},
			quote = {
				enabled = true,
				icon = "▋",
				highlight = "RenderMarkdownQuote",
			},
			pipe_table = {
				enabled = true,
				style = "full",
				cell = "padded",
				border = {
					"┌", "┬", "┐",
					"├", "┼", "┤",
					"└", "┴", "┘",
					"│", "─",
				},
			},
			callout = {
				note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
				tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
				important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
				warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
				caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
			},
		})

		-- Keymap για toggle rendering
		vim.keymap.set("n", "<leader>mr", ":RenderMarkdown toggle<CR>", {
			desc = "📝 Toggle Markdown Rendering",
		})
	end,
}
