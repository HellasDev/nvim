-- ================================================================
-- Lualine Plugin - Προηγμένη status line για Neovim
-- ================================================================
-- Όμορφη και λειτουργική status bar στο κάτω μέρος της οθόνης με:
-- • Git branch information με custom icon και χρώματα
-- • Filename με file status indicators (modified, readonly, new)
-- • Filetype icons με automatic detection
-- • LSP diagnostics με colored counters (errors, warnings, info, hints)
-- • Git diff indicators (+, ~, -) για modified lines
-- • Ημερομηνία και ώρα με emoji icons
-- • OneDark theme integration για consistent styling
-- • Global statusline και extensions για oil, trouble, mason
-- ================================================================

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = "onedark",
			component_separators = "",
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
			lualine_b = {
				{
					"branch",
					icon = "",
					color = { fg = "#e06c75" },
				},
				{
					"filename",
					file_status = true,
					newfile_status = false,
					path = 1,
					shorting_target = 40,
					-- for other components.
					symbols = {
						modified = "",
						readonly = "󱚫",
						unnamed = "",
						newfile = "󰎔",
					},
				},
				{
					"filetype",
					colored = true,
					icon_only = true,
					icon = { align = "right" },
				},
			},
			lualine_c = {},
			lualine_x = {
				{
					"diff",
					colored = true,
					diff_color = {
						added = "LuaLineDiffAdd",
						modified = "LuaLineDiffChange",
						removed = "LuaLineDiffDelete",
					},
					symbols = { added = " ", modified = " ", removed = " " },
					source = nil,
				},
			},
			lualine_y = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					sections = { "error", "warn", "info", "hint" },
					symbols = {
						error = "󱍌 ",
						warn = "󱍊 ",
						info = "󱌸 ",
						hint = "󱍄 ",
					},
					colored = true,
					update_in_insert = true,
					always_visible = true,
					-- separator removed to use theme defaults
					-- remove explicit background to use theme defaults
				},
			},
			lualine_z = {
				{
					function()
						return os.date("󰥔 %H:%M   %a-%d-%m")
					end,
					separator = { right = "" },
					left_padding = 2,
				},
			},
		},
		inactive_sections = {
			lualine_a = {
				{
					"filename",
					file_status = true,
					newfile_status = false,
					path = 1,
					shorting_target = 40,
					symbols = {
						modified = "",
						readonly = "",
						unnamed = "",
						newfile = "󰎔",
					},
				},
			},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {
				function()
					return os.date("%a %d %b %Y")
				end,
			},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}
