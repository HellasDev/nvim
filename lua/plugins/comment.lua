-- ================================================================
-- Comment Plugin - Έξυπνο commenting κώδικα
-- ================================================================
-- Παρέχει προηγμένες δυνατότητες για commenting/uncommenting κώδικα:
-- • Treesitter integration για context-aware comments
-- • Custom keymaps: 'zz' για line comments, 'bb' για block comments
-- • Multi-language support με διαφορετικά comment styles
-- • Visual mode selection commenting για ολόκληρα τμήματα
-- • Smart detection για JSX, Vue, embedded languages
-- • Integration με ts-context-commentstring για ακριβή syntax
-- • Extra commands: gcO (comment above), gco (below), gcA (end of line)
-- ================================================================

return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	
	config = function()
		require("Comment").setup({
			padding = true,
			sticky = true,
			ignore = nil,
			toggler = {
				line = "zz",
				block = "bb",
			},
			opleader = {
				line = "ZZ",
				block = "BB",
			},
			extra = {
				above = "gcO",
				below = "gco",
				eol = "gcA",
			},
			mappings = {
				basic = true,
				extra = true,
			},
			pre_hook = nil,
		})
	end,
}