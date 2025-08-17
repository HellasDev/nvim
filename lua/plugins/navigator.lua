-- ================================================================
-- Navigator Plugin - TMUX integration για seamless navigation
-- ================================================================
-- Παρέχει ομαλή μετάβαση μεταξύ Neovim και TMUX panes:
-- • Unified navigation commands που λειτουργούν και στο Neovim και στο TMUX
-- • Auto-detection του TMUX environment και auto-configuration
-- • Seamless window switching χωρίς να χρειάζεται να θυμάσαι διαφορετικά keymaps
-- • Integration με τα default Neovim window navigation commands
-- • Smart detection για zoom mode και appropriate handling
-- • Minimal configuration με automatic multiplexer detection
-- • Support για tmux, screen και άλλους terminal multiplexers
-- ================================================================

return {
	"numToStr/Navigator.nvim",
	config = function()
		require("Navigator").setup({
			auto_save = nil,
			disable_on_zoom = false,
			mux = "auto",
		})
	end,
}