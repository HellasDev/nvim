-- ================================================================
-- Oil Plugin - Σύγχρονος file manager για Neovim
-- ================================================================
-- Revolutionary file explorer που μετατρέπει directories σε editable buffers:
-- • Edit directories σαν κανονικά αρχεία (rename, delete, move files)
-- • Floating window mode με preview support και rounded borders
-- • Trash integration για safer file deletion
-- • LSP file operations support για refactoring
-- • Columns για permissions, size, mtime information
-- • Hidden files toggle και smart filtering (.DS_Store, .git)
-- • Keyboard-driven workflow με vim-like navigation
-- • Integration με nvim-web-devicons για όμορφα file type icons
-- ================================================================

return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".DS_Store" or name == ".git"
				end,
			},
			float = {
				padding = 2,
				max_width = 110,
				max_height = 0,
			},
			win_options = {
				wrap = true,
				winblend = 0,
				winhighlight = "Normal:Normal,NormalNC:Normal",
			},
			keymaps = {
				["<C-c>"] = false,
				["q"] = "actions.close",
			},
		})
	end,
}
