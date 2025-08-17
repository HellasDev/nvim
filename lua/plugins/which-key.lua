-- Which-Key Interactive Keymap Guide
-- Εμφανίζει διαδραστικό popup όταν πατάς το <leader> key με όλα τα διαθέσιμα keymaps:
-- - Οργανωμένες κατηγορίες με emojis (Αρχεία 📁, Go Development 🐹, Debugging 🐛)
-- - Ελληνικές περιγραφές για κάθε keymap να καταλαβαίνεις τι κάνει
-- - Αυτόματο grouping των συναφών εντολών (π.χ. όλες οι Go εντολές μαζί)
-- - Floating window με rounded borders και προσαρμοσμένο styling
-- - Υποστήριξη για όλα τα modes (normal, visual, insert) με διαφορετικά keymaps
-- - Integration με όλα τα plugins για unified keymap experience
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		
		wk.setup({
			preset = "modern",
			win = {
				border = "rounded",
				padding = { 1, 2 },
			},
			layout = {
				width = { min = 20, max = 50 },
				spacing = 3,
			},
			show_help = true,
			show_keys = true,
		})

		wk.add({
			{ "<leader>f", group = "📁 Αρχεία & Αναζήτηση" },
			{ "<leader>ff", desc = "📄 Εύρεση αρχείων" },
			{ "<leader>ft", desc = "🔍 Αναζήτηση κειμένου" },
			{ "<leader>fb", desc = "🔍 Λίστα buffers" },
			{ "<leader>fo", desc = "🕰️ Πρόσφατα αρχεία" },
			
			{ "<leader>g", group = "🐹 Go Development" },
			{ "<leader>gr", desc = "🏃 Εκτέλεση Go αρχείου" },
			{ "<leader>gt", desc = "✅ Tests πακέτου" },
			{ "<leader>gT", desc = "🎯 Test κάτω από κέρσορα" },
			{ "<leader>gb", desc = "🔨 Build Go πακέτου" },
			{ "<leader>gm", desc = "🧹 Go mod tidy" },
			{ "<leader>gi", desc = "📦 Προσθήκη imports" },
			{ "<leader>gfs", desc = "🧩 Συμπλήρωση struct" },
			{ "<leader>gat", desc = "🏷️ Προσθήκη struct tags" },
			{ "<leader>gal", desc = "🔄 Εναλλαγή test/source" },
			{ "<leader>grt", desc = "🗑️ Αφαίρεση struct tags" },
			{ "<leader>gie", desc = "⚠️ Generate if err" },
			{ "<leader>gc", desc = "📊 Φόρτωση coverage" },
			{ "<leader>gC", desc = "🔍 Εναλλαγή coverage" },
			{ "<leader>gnp", desc = "🏗️ Δημιουργία νέου Go project" },
			
			{ "<leader>d", group = "🐛 Debugging" },
			{ "<leader>db", desc = "🔴 Breakpoint (toggle)" },
			{ "<leader>dr", desc = "▶️ Εκκίνηση/Συνέχεια debug" },
			{ "<leader>ds", desc = "⏭️ Step over (πάνω από)" },
			{ "<leader>di", desc = "⏬ Μπες μέσα (step into)" },
			{ "<leader>do", desc = "⏪ Βγες έξω (step out)" },
			{ "<leader>dt", desc = "⏹️ Τερματισμός debug" },
			{ "<leader>du", desc = "📺 Εναλλαγή Debug UI" },
			{ "<leader>dgt", desc = "🧪 Debug Go test" },
			{ "<leader>dgT", desc = "🔄 Debug τελευταίο Go test" },
			
			{ "<leader>w", desc = "💾 Αποθήκευση αρχείου" },
			{ "<leader>q", desc = "❌ Κλείσιμο buffer" },
			{ "<leader>e", desc = "📁 Oil - Διαχειριστής αρχείων" },
			{ "<leader>v", desc = "🧩 Κάθετο χωρισμός" },
			{ "<leader>h", desc = "🧱 Οριζόντιος χωρισμός" },
			{ "<leader>t", desc = "🚑 Trouble - Λίστα προβλημάτων" },
			{ "<leader>f", desc = "🎨 Μορφοποίηση κώδικα" },
			{ "<leader>d", desc = "⚠️ Εμφάνιση διαγνωστικών" },
			{ "<leader>ss", desc = "🔄 Αντικατάσταση λέξης" },
			{ "<leader>aa", desc = "📄 Επιλογή όλου του κειμένου" },
			{ "<leader><space>", desc = "📄 Πληροφορίες hover" },
			
			{ "g", group = "🎯 Go to" },
			{ "gd", desc = "🎯 Πήγαινε στον ορισμό" },
			{ "gr", desc = "🔗 Εύρεση αναφορών" },
			{ "gi", desc = "🔧 Πήγαινε στην υλοποίηση" },
			
			{ "U", desc = "↪️ Επανάληψη (Redo)" },
			{ "<C-x>", desc = "📱 Νέο tab με terminal" },
			{ "<C-z>", desc = "💻 Εναλλαγή floating terminal" },
		})
	end,
}