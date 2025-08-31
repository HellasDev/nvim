-- ================================================================
-- Telescope Plugin - Fuzzy finder και file searcher
-- ================================================================
-- Το κύριο εργαλείο αναζήτησης και navigation στο Neovim με:
-- • Fuzzy finding αρχείων με rg backend για γρηγορότερα αποτελέσματα
-- • Live grep για αναζήτηση κειμένου σε όλο το codebase
-- • Buffer explorer με delete support και dropdown theme
-- • UI-Select extension για όμορφα LSP code action menus
-- • Git integration με git_files και untracked file detection
-- • Intelligent ignore patterns για node_modules, build, dist
-- • Rounded borders και customizable layout με preview support
-- • FZF native sorter για ultra-fast searching performance
-- ================================================================

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-media-files.nvim",
	},
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"yarn.lock",
					".git",
					".sl",
					"_build",
					".next",
					"dist",
					".yarn",
					"logs",
					"*.log",
					"build",
					"coverage",
					"target",
					"vendor",
				},
				prompt_prefix = "🔍 ",
				selection_caret = "➤ ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				border = true,
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				use_less = true,
				path_display = {},
				set_env = { ["COLORTERM"] = "truecolor" },
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					hidden = true,
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
				git_files = {
					show_untracked = true,
				},
				live_grep = {
					additional_args = function()
						return { "--hidden" }
					end,
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
					initial_mode = "normal",
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer,
						},
						n = {
							["dd"] = actions.delete_buffer,
						},
					},
				},
				colorscheme = {
					enable_preview = true,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				media_files = {
					filetypes = {"png", "webp", "jpg", "jpeg", "gif", "svg", "bmp", "ico", "tiff", "heic", "heif"},
					find_cmd = "rg",
					chafa = {
						size = "40x30",
						format = "symbols",
						symbols = "block+border+space-wide+half+solid+stipple",
						dither = "ordered",
						colors = "256",
						work = 9,
					}
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "media_files")
	end,
}