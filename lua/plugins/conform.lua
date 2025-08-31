-- ================================================================
-- Conform Plugin - Σύγχρονο code formatting engine
-- ================================================================
-- Lightweight αλλά ισχυρό formatter plugin με υποστήριξη για:
-- • Auto-formatting on save με intelligent fallback στο LSP
-- • Πολλαπλούς formatters ανά γλώσσα (prettier/prettierd, gofmt, stylua)
-- • Go: goimports + gofmt για imports και formatting
-- • JavaScript/TypeScript: prettier/prettierd με fallback
-- • Python: isort + black pipeline, Lua: stylua
-- • FormatEnable/FormatDisable commands για selective formatting
-- • Per-buffer και global disable options
-- • 500ms timeout για γρήγορη ανταπόκριση
-- ================================================================

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "goimports", "gofmt" },
				lua = { "stylua" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier" } },
				yaml = { { "prettierd", "prettier" } },
				python = { "isort", "black" },
				sh = { "shfmt" },
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_fallback = true }
			end,
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		})

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}