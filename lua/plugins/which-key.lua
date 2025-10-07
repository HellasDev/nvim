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

		-- Απόκρυψη συγκεκριμένων keymaps από το which-key menu
		wk.add({
			{ "<leader>w", hidden = true },
			{ "<leader>q", hidden = true },
			{ "<leader>e", hidden = true },
			{ "<leader>th", hidden = true },
		})

		wk.add({
			-- ============================================
			-- 📁 ΑΡΧΕΙΑ & ΑΝΑΖΗΤΗΣΗ (Telescope)
			-- ============================================
			{ "<leader>f", group = "📁 Αρχεία & Αναζήτηση" },
			{ "<leader>ff", desc = "📄 Εύρεση αρχείων" },
			{ "<leader>ft", desc = "🔍 Αναζήτηση κειμένου" },
			{ "<leader>fb", desc = "📚 Λίστα buffers" },
			{ "<leader>fo", desc = "🕰️ Πρόσφατα αρχεία" },
			{ "<leader>fm", desc = "🖼️ Media files" },

			-- ============================================
			-- 🐹 GO DEVELOPMENT
			-- ============================================
			{ "<leader>g", group = "🐹 Go Development" },
			{ "<leader>gr", desc = "🏃 Run αρχείου" },
			{ "<leader>gb", desc = "🔨 Build πακέτου" },
			{ "<leader>gm", desc = "🧹 Mod tidy" },
			{ "<leader>gi", desc = "📦 Import" },
			{ "<leader>ge", desc = "🌳 Git status" },

			-- Go Testing
			{ "<leader>gt", group = "🧪 Testing" },
			{ "<leader>gT", desc = "🎯 Test κάτω από κέρσορα" },
			{ "<leader>gtr", desc = "🏃 Τρέχον test" },
			{ "<leader>gtf", desc = "📄 Tests αρχείου" },
			{ "<leader>gts", desc = "📊 Summary" },
			{ "<leader>gto", desc = "📝 Output" },

			-- Go Code Actions
			{ "<leader>ga", group = "⚡ Actions" },
			{ "<leader>gfs", desc = "🧩 Fill struct" },
			{ "<leader>gat", desc = "🏷️ Add tags" },
			{ "<leader>grt", desc = "🗑️ Remove tags" },
			{ "<leader>gie", desc = "⚠️ If err" },
			{ "<leader>gal", desc = "🔄 Alt test/source" },

			-- Go Coverage
			{ "<leader>gc", desc = "📊 Coverage load" },
			{ "<leader>gC", desc = "🔍 Coverage toggle" },
			{ "<leader>gcs", desc = "📈 Coverage summary" },

			-- ============================================
			-- 🐛 DEBUGGING
			-- ============================================
			{ "<leader>d", group = "🐛 Debug" },
			{ "<leader>db", desc = "🔴 Breakpoint" },
			{ "<leader>dB", desc = "⚙️ Conditional breakpoint" },
			{ "<leader>dr", desc = "▶️ Continue" },
			{ "<leader>ds", desc = "⏭️ Step over" },
			{ "<leader>di", desc = "⏬ Step into" },
			{ "<leader>do", desc = "⏪ Step out" },
			{ "<leader>dt", desc = "⏹️ Terminate" },
			{ "<leader>du", desc = "📺 Debug UI" },
			{ "<leader>dh", desc = "📄 Hover" },
			{ "<leader>dp", desc = "🔍 Preview" },
			{ "<leader>df", desc = "🖼️ Frames" },
			{ "<leader>dS", desc = "🔍 Scopes" },

			-- Debug Go Tests
			{ "<leader>dg", group = "🧪 Go Tests" },
			{ "<leader>dgt", desc = "🧪 Debug test" },
			{ "<leader>dgT", desc = "🔄 Debug last test" },

			-- ============================================
			-- 🔍 GO TO NAVIGATION
			-- ============================================
			{ "g", group = "🎯 Go to" },
			{ "gd", desc = "🎯 Definition" },
			{ "gr", desc = "🔗 References" },
			{ "gi", desc = "🔧 Implementation" },

			-- ============================================
			-- 📝 MARKDOWN
			-- ============================================
			{ "<leader>m", group = "📝 Markdown" },
			{ "<leader>mr", desc = "📝 Toggle render" },

			-- ============================================
			-- 🌐 WEB & LIVE SERVER
			-- ============================================
			{ "<leader>l", group = "🌐 Live/LSP" },
			{ "<leader>lv", desc = "🌐 Live Server" },

			-- ============================================
			-- 🖼️ IMAGE & LINKS
			-- ============================================
			{ "<leader>i", group = "🖼️ Image" },
			{ "<leader>ip", desc = "🖼️ Preview" },

			-- ============================================
			-- 🔧 ΑΛΛΑ
			-- ============================================
			{ "<leader>a", group = "🔧 Actions" },
			{ "<leader>al", desc = "🔗 Open link" },
			{ "<leader>aa", desc = "📄 Select all" },

			{ "<leader>s", group = "🔄 Search/Replace" },
			{ "<leader>ss", desc = "🔄 Replace word" },

			{ "<leader>t", group = "🚑 Trouble" },
			{ "<leader>th", desc = "🎨 Toggle theme" },

			{ "<leader>c", group = "💻 Code" },
			{ "<leader>ca", desc = "⚙️ Code actions" },

			{ "<leader>r", group = "🏷️ Rename" },
			{ "<leader>rn", desc = "🏷️ Rename symbol" },

			-- ============================================
			-- ⌨️ ΒΑΣΙΚΕΣ ΕΝΤΟΛΕΣ
			-- ============================================
			{ "U", desc = "↪️ Redo" },
			{ "<C-x>", desc = "📱 Terminal tab" },
			{ "<C-z>", desc = "💻 Float term" },
		})
	end,
}
