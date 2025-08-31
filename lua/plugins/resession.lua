-- ================================================================
-- Resession Plugin - Αυτόματη διαχείριση sessions
-- ================================================================
-- Αποθηκεύει και επαναφέρει αυτόματα την κατάσταση του Neovim:
-- • Autosave session on exit και autoload on enter
-- • Session name βασισμένο στο directory και το git branch
-- • Αποθηκεύει ανοιχτά buffers, window layout, cursor position
-- • Αποκλείει ειδικούς τύπους buffer (help, quickfix)
-- • Integration με Lualine για εμφάνιση του session name
-- • Commands για χειροκίνητη αποθήκευση/φόρτωση/διαγραφή
-- • Minimal configuration με έξυπνες προεπιλογές
-- ================================================================

return {
	"stevearc/resession.nvim",
	config = function()
		local resession = require("resession")
		resession.setup({
			autosave = {
				enabled = true,
				interval = 60,
				notify = false,
			},
			buf_filter = function(bufnr)
				local buftype = vim.bo[bufnr].buftype
				if buftype == "help" then
					return true
				end
				if buftype ~= "" and buftype ~= "acwrite" then
					return false
				end
				if vim.api.nvim_buf_get_name(bufnr) == "" then
					return false
				end
				return true
			end,
		})

		local function get_session_name()
			local name = vim.fn.getcwd()
			local branch = vim.trim(vim.fn.system("git branch --show-current"))
			if vim.v.shell_error == 0 then
				return name .. branch
			else
				return name
			end
		end

		vim.api.nvim_create_autocmd("VimLeavePre", {
			callback = function()
				resession.save(get_session_name(), { notify = false })
			end,
		})

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				if vim.fn.argc() == 0 then
					resession.load(get_session_name(), { silence_errors = true })
				end
			end,
		})
	end,
}
