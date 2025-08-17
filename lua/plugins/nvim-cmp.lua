-- ================================================================
-- Nvim-CMP - Προηγμένο autocompletion system
-- ================================================================
-- Σύγχρονο completion framework με πολλαπλές πηγές και smart features:
-- • LSP completion με function signatures και documentation
-- • LuaSnip integration για VSCode-compatible snippets και custom snippets
-- • Buffer completion από λέξεις σε άλλα ανοιχτά αρχεία
-- • Path completion για αρχεία και directories
-- • Ghost text για preview των completions
-- • Priority-based source ordering (LSP > snippets > buffer)
-- • Bordered windows με όμορφα icons για κάθε completion type
-- • Intelligent Tab/Shift-Tab navigation με snippet expansion
-- ================================================================

return {
	{
		"L3MON4D3/LuaSnip",
		event = "InsertCharPre",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = { vim.fn.stdpath("config") .. "/snippets" },
			})
			luasnip.config.set_config({
				history = true,
				delete_check_events = "TextChanged",
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind_icons = {
							Text = "󰉿",
							Method = "󰊕",
							Function = "󰊕",
							Constructor = "",
							Field = "󰜢",
							Variable = "󰀫",
							Class = "󰠱",
							Interface = "",
							Module = "",
							Property = "󰜢",
							Unit = "󰑭",
							Value = "󰎠",
							Enum = "",
							Keyword = "󰌋",
							Snippet = "",
							Color = "󰏘",
							File = "󰈙",
							Reference = "󰈇",
							Folder = "󰉋",
							EnumMember = "",
							Constant = "󰏿",
							Struct = "󰙅",
							Event = "",
							Operator = "󰆕",
							TypeParameter = "",
						}
						vim_item.kind = (kind_icons[vim_item.kind] or "") .. " " .. vim_item.kind
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							luasnip = "[Snippet]",
							buffer = "[Buffer]",
							path = "[Path]",
						})[entry.source.name]
						return vim_item
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expandable() then
							luasnip.expand()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp", priority = 1000 },
					{ name = "luasnip", priority = 750 },
					{ name = "path", priority = 250 },
				}, {
					{ name = "buffer", priority = 250, keyword_length = 3 },
				}),
				experimental = {
					ghost_text = true,
				},
			})
		end,
	},
}