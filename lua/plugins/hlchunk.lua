-- ================================================================
-- HLChunk Plugin - Visual indentation και code block highlighting
-- ================================================================
-- Παρέχει όμορφη visualization για code structure με:
-- • Real-time highlighting των code blocks που περιβάλλουν τον κέρσορα
-- • Treesitter integration για ακριβή detection των blocks
-- • Animated transitions με configurable duration και delay
-- • Custom characters για horizontal/vertical lines (╭─╮╯)
-- • Multi-color support για nested blocks
-- • Error detection και visual indicators για syntax errors
-- • Performance optimization για μεγάλα αρχεία (1MB limit)
-- • Indent guide lines (προαιρετικά) για καθαρότερη structure
-- ================================================================

return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				priority = 15,
				style = {
					{ fg = "#61AFEF" },
					{ fg = "#F07178" },
				},
				use_treesitter = true,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = ">",
				},
				textobject = "",
				max_file_size = 1024 * 1024,
				error_sign = true,
				duration = 200,
				delay = 300,
			},
			indent = {
				enable = false,
				priority = 10,
				style = {
					{ fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") },
				},
				use_treesitter = false,
				chars = { "│", "¦", "┆", "┊" },
				ahead_lines = 5,
				delay = 100,
			},
			line_num = {
				enable = false,
				style = "#806d9c",
				priority = 10,
				use_treesitter = false,
			},
			blank = {
				enable = false,
				priority = 9,
				style = {
					{ bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("cursorline")), "bg", "gui") },
					{ bg = "", fg = "" },
				},
				chars = { " " },
			},
		})
	end,
}