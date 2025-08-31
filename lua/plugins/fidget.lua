-- ================================================================
-- Fidget Plugin - LSP progress notifications
-- ================================================================
-- Εμφανίζει όμορφα notifications για LSP operations:
-- • Real-time progress indicators για LSP indexing, formatting
-- • Non-intrusive notifications στη γωνία της οθόνης
-- • Rounded borders για consistent UI styling
-- • Automatic fade-out όταν ολοκληρώνεται η διαδικασία
-- • Integration με όλους τους LSP servers (gopls, lua_ls κλπ)
-- • Customizable notification window με adjustable transparency
-- • Minimal CPU footprint και smooth animations
-- ================================================================

return {
	"j-hui/fidget.nvim",
	event = "LspAttach",
	config = function()
		require("fidget").setup({
			notification = {
				window = {
					border = "rounded",
					winblend = 0,
				},
			},
		})
	end,
}