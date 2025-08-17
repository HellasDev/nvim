-- ================================================================
-- Go.nvim Plugin - Ολοκληρωμένα εργαλεία Go development
-- ================================================================
-- Modern Go plugin με πλήρη υποστήριξη για Go development:
-- • Go commands: GoRun, GoTest, GoBuild, GoImport, GoFillStruct
-- • Struct tag management και code generation utilities
-- • Integration με treesitter για accurate syntax highlighting
-- • gofumpt formatting και imports organization
-- • Test runner με verbose output και error integration
-- • DAP debugging integration με visual breakpoints
-- • Floating windows για αποτελέσματα και error messages
-- • LuaSnip integration για Go-specific snippets
-- • Alternative file switching (test ↔ source)
-- ================================================================

return {
	"ray-x/go.nvim",
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
	config = function()
		require("go").setup({
			goimports = "goimports",
			gofmt = "gofumpt",
			tag_transform = false,
			tag_options = "json=omitempty",
			gotests_template = "",
			gotests_template_dir = "",
			comment_placeholder = "   ",
			icons = { breakpoint = "🧘", currentpos = "🏃" },
			verbose = false,
			lsp_cfg = false,
			lsp_gofumpt = true,
			lsp_on_attach = nil,
			dap_debug = true,
			dap_debug_keymap = false,
			dap_debug_gui = true,
			dap_debug_vt = true,
			build_tags = "",
			textobjects = true,
			test_runner = "go",
			verbose_tests = true,
			run_in_floaterm = false,
			floaterm = {
				position = "right",
				width = 0.45,
				height = 0.98,
			},
			trouble = true,
			test_efm = false,
			luasnip = true,
			iferr_vertical_shift = 4,
		})
	end,
}
