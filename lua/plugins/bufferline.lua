-- ================================================================
-- BufferLine Plugin - Προηγμένη διαχείριση tabs και buffers
-- ================================================================
-- Δημιουργεί όμορφη γραμμή tabs στην κορυφή του Neovim με:
-- • Browser-style tabs με icons για κάθε ανοιχτό αρχείο
-- • LSP diagnostics integration (errors/warnings σε κάθε tab)
-- • Mouse support για κλικ, δεξί κλικ, middle click
-- • Smart sorting και persistent buffer order
-- • Visual indicators για modified files, buffer type
-- • Slant separators και animated hover effects
-- • Integration με nvim-web-devicons για όμορφα εικονίδια
-- ================================================================

return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				style_preset = require("bufferline").style_preset.default,
				themable = true,
				numbers = "none",
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator = {
					icon = "▎",
					style = "icon",
				},
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 30,
				max_prefix_length = 30,
				truncate_names = true,
				tab_size = 21,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				color_icons = true,
				get_element_icon = function(element)
					local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
					return icon, hl
				end,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				show_duplicate_prefix = true,
				duplicates_across_groups = true,
				persist_buffer_sort = true,
				move_wraps_at_ends = false,
				separator_style = "slant",
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				auto_toggle_bufferline = true,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				sort_by = "insert_after_current",
			},
		})
	end,
}