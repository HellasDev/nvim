------------------------------------------------------------------------------------------------------------------------
-- keymaps.lua
------------------------------------------------------------------------------------------------------------------------
-- Αυτό το αρχείο περιέχει όλες τις συντομεύσεις πληκτρολογίου (keymaps) του Neovim.
-- Είναι οργανωμένο σε ενότητες για καλύτερη διαχείριση.
------------------------------------------------------------------------------------------------------------------------

-- [[ Γενικές Ρυθμίσεις ]]
------------------------------------------------------------------------------------------------------------------------

-- Ορισμός του πλήκτρου leader στο κενό (space)
-- Το <nop> σημαίνει "No Operation", δηλαδή δεν κάνει τίποτα από μόνο του, απλά περιμένει το επόμενο πλήκτρο.
vim.keymap.set("n", "<leader>", "<nop>")
vim.keymap.set("v", "<leader>", "<nop>")

-- Αντικατάσταση του Tab με 2 κενά σε Insert Mode
vim.keymap.set("i", "<Tab>", "  ", { noremap = true, desc = "⌨️ Εισαγωγή 2 κενών" })

-- Επιλογή όλου του κειμένου
vim.keymap.set(
	"n",
	"<leader>aa",
	"ggVG",
	{ noremap = true, silent = true, desc = "📄 Επιλογή όλου του κειμένου" }
)

-- Redo (Αντί για U που είναι το default undo σε γραμμή)
vim.keymap.set("n", "U", "<C-r>", { desc = "↪️ Επανάληψη (Redo)" })

-- Αποθήκευση αρχείου
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { silent = false, desc = "💾 Αποθήκευση αρχείου" })

-- Κλείσιμο ενεργού buffer
vim.keymap.set("n", "<leader>q", ":bwipeout<CR>", { silent = false, desc = "❌ Κλείσιμο buffer" })

-- Επικόλληση από το clipboard του συστήματος
vim.keymap.set(
	{ "n", "v" },
	"p",
	'"+p',
	{ noremap = true, silent = true, desc = "📋 Επικόλληση από clipboard" }
)

-- Αντικατάσταση λέξης κάτω από τον κέρσορα με floating window
vim.keymap.set("n", "<leader>ss", function()
	local word = vim.fn.expand("<cword>")
	local buf = vim.api.nvim_create_buf(false, true)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "cursor",
		width = 40,
		height = 1,
		col = 0,
		row = 1,
		style = "minimal",
		border = "rounded",
		title = " Αντικατάσταση ",
		title_pos = "center",
	})
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, { word })
	vim.bo[buf].modifiable = true
	vim.keymap.set("n", "<CR>", function()
		local new_word = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
		vim.api.nvim_win_close(win, true)
		if new_word and #new_word > 0 and new_word ~= word then
			vim.cmd(":%s\\<" .. word .. "\\>/" .. new_word .. "/gI")
		end
	end, { buffer = buf })
	vim.keymap.set("n", "<Esc>", function()
		vim.api.nvim_win_close(win, true)
	end, { buffer = buf })
end, { desc = "🔄 Αντικατάσταση λέξης" })

-- [[ Πλοήγηση ]]
------------------------------------------------------------------------------------------------------------------------

-- Αντιστροφή j/k για αριστερόχειρα
vim.keymap.set(
	{ "n", "v" },
	"j",
	"k",
	{ noremap = true, desc = "⬆️ Πλοήγηση πάνω (αριστερόχειρα)" }
)
vim.keymap.set(
	{ "n", "v" },
	"k",
	"j",
	{ noremap = true, desc = "⬇️ Πλοήγηση κάτω (αριστερόχειρα)" }
)

-- Πλοήγηση μεταξύ buffers
vim.keymap.set("n", "<S-Right>", ":bnext<CR>", { silent = false, desc = "➡️ Επόμενο buffer" })
vim.keymap.set("n", "<S-Left>", ":bprevious<CR>", { silent = false, desc = "⬅️ Προηγούμενο buffer" })

-- Κύλιση σελίδας με κεντράρισμα του κέρσορα
vim.keymap.set("n", "<S-Up>", "<C-u>zz", { desc = "🔼 Κύλιση σελίδας πάνω" })
vim.keymap.set("n", "<S-Down>", "<C-d>zz", { desc = "🔽 Κύλιση σελίδας κάτω" })

-- Κεντράρισμα κατά την πλοήγηση στα αποτελέσματα αναζήτησης
vim.keymap.set("n", "n", "nzzzv", { desc = "🔍 Επόμενο αποτέλεσμα" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "🔎 Προηγούμενο αποτέλεσμα" })

-- Μετακίνηση επιλεγμένου κειμένου σε Visual Mode
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "⬇️ Μετακίνηση επιλογής κάτω" })
vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "⬆️ Μετακίνηση επιλογής πάνω" })

-- [[ Διαχείριση Παραθύρων (Splits) ]]
------------------------------------------------------------------------------------------------------------------------

-- Δημιουργία κάθετου split
vim.keymap.set(
	"n",
	"<leader>v",
	":vsplit<CR>",
	{ noremap = true, silent = true, desc = "🧩 Κάθετο χωρισμός" }
)

-- Δημιουργία οριζόντιου split
vim.keymap.set(
	"n",
	"<leader>h",
	":split<CR>",
	{ noremap = true, silent = true, desc = "🧱 Οριζόντιος χωρισμός" }
)

-- Πλοήγηση μεταξύ splits
vim.keymap.set("n", "<C-Left>", ":wincmd h<CR>", { desc = "⬅️ Παράθυρο αριστερά" })
vim.keymap.set("n", "<C-Right>", ":wincmd l<CR>", { desc = "➡️ Παράθυρο δεξιά" })

-- Αλλαγή μεγέθους παραθύρων
vim.keymap.set(
	"n",
	"<A-Left>",
	"<cmd>vertical resize -2<CR>",
	{ noremap = true, silent = true, desc = "⇤ Μείωση πλάτους παραθύρου" }
)
vim.keymap.set(
	"n",
	"<A-Right>",
	"<cmd>vertical resize +2<CR>",
	{ noremap = true, silent = true, desc = "⇥ Αύξηση πλάτους παραθύρου" }
)
vim.keymap.set(
	"n",
	"<A-Up>",
	"<cmd>resize +2<CR>",
	{ noremap = true, silent = true, desc = "⇧ Αύξηση ύψους παραθύρου" }
)
vim.keymap.set(
	"n",
	"<A-Down>",
	"<cmd>resize -2<CR>",
	{ noremap = true, silent = true, desc = "⇩ Μείωση ύψους παραθύρου" }
)

-- [[ Plugins ]]
------------------------------------------------------------------------------------------------------------------------

-- Plugin: Trouble
vim.keymap.set(
	"n",
	"<leader>t",
	":Trouble diagnostics toggle focus=true<cr>",
	{ silent = false, desc = "🚑 Trouble - Λίστα προβλημάτων" }
)


-- Plugin: Telescope (Fuzzy Finder)
vim.keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, { desc = "🔍 Telescope - Λίστα buffers" })
vim.keymap.set("n", "<leader>fo", function()
	require("telescope.builtin").oldfiles()
end, { desc = "🕰️ Telescope - Πρόσφατα αρχεία" })
vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "📄 Telescope - Εύρεση αρχείων" })
vim.keymap.set("n", "<leader>ft", function()
	require("telescope.builtin").live_grep()
end, { desc = "🔍 Telescope - Αναζήτηση κειμένου" })
vim.keymap.set("n", "<leader>fm", function()
	require("telescope").extensions.media_files.media_files()
end, { desc = "🖼️ Telescope - Media files" })
vim.keymap.set({ "n", "x" }, "<leader>br", function()
	require("telescope").extensions.refactoring.refactors()
end, { desc = "🔄 Telescope - Refactoring" })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopePrompt",
	callback = function(args)
		local actions = require("telescope.actions")
		vim.keymap.set("i", "<C-S-h>", function()
			actions.move_selection_previous()
		end, { buffer = args.buf, desc = "⬆️ Πάνω στη λίστα" })
		vim.keymap.set("i", "<C-S-l>", function()
			actions.move_selection_next()
		end, { buffer = args.buf, desc = "⬇️ Κάτω στη λίστα" })
		vim.keymap.set("i", "<C-q>", function()
			actions.send_selected_to_qflist()
			actions.open_qflist()
		end, { buffer = args.buf, desc = "📄 Αποστολή στο quickfix" })
		vim.keymap.set("i", "<C-x>", function()
			actions.delete_buffer()
		end, { buffer = args.buf, desc = "❌ Διαγραφή buffer" })
	end,
})

-- [[ Image Preview ]]
------------------------------------------------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>ip", function()
  local function get_image_path_under_cursor()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2] + 1
    
    -- Πρώτα ψάχνω για οποιοδήποτε src/href attribute
    local patterns = {
      'src%s*=%s*["\']([^"\']+)["\']',
      'href%s*=%s*["\']([^"\']+)["\']'
    }
    
    for _, pattern in ipairs(patterns) do
      local start_pos, end_pos, captured = line:find(pattern)
      while start_pos do
        local quote_start = line:find('["\']', start_pos)
        local quote_end = line:find('["\']', quote_start + 1)
        
        if quote_start and quote_end and col >= quote_start + 1 and col <= quote_end - 1 then
          -- Έλεγχος αν είναι image path
          local ext = captured:match("%.([^%.]+)$")
          if ext then
            ext = ext:lower()
            local image_extensions = { 
              "png", "jpg", "jpeg", "gif", "webp", "svg", "bmp", "ico", "avif", 
              "tiff", "tif", "pnm", "pbm", "pgm", "ppm", "xbm", "xpm", "pcx", 
              "tga", "ras", "sgi", "sun", "bmpf", "fax", "g3", "hdr", "pic",
              "pict", "psd", "xcf", "fits", "fts", "cr2", "crw", "nef", "orf",
              "sr2", "srf", "arw", "dng", "raf", "x3f", "rw2", "srw", "pef",
              "nrw", "iiq", "3fr", "ari", "bay", "cap", "dcs", "dcr", "drf",
              "eip", "erf", "fff", "mef", "mos", "mrw", "ptx", "r3d", "rdc",
              "rwl", "rwz", "x3f", "heic", "heif", "jxl"
            }
            if vim.tbl_contains(image_extensions, ext) then
              return captured
            end
          end
        end
        start_pos, end_pos, captured = line:find(pattern, end_pos + 1)
      end
    end
    return nil
  end
  
  local image_path = get_image_path_under_cursor()
  local file_path
  
  if image_path then
    local current_dir = vim.fn.expand("%:p:h")
    if image_path:match("^/") then
      file_path = image_path
    elseif image_path:match("^%./") then
      file_path = current_dir .. "/" .. image_path:gsub("^%./", "")
    else
      file_path = current_dir .. "/" .. image_path
    end
  else
    file_path = vim.fn.expand("%:p")
    local ext = vim.fn.expand("%:e"):lower()
    local image_extensions = { 
      "png", "jpg", "jpeg", "gif", "webp", "svg", "bmp", "ico", "avif", 
      "tiff", "tif", "pnm", "pbm", "pgm", "ppm", "xbm", "xpm", "pcx", 
      "tga", "ras", "sgi", "sun", "bmpf", "fax", "g3", "hdr", "pic",
      "pict", "psd", "xcf", "fits", "fts", "cr2", "crw", "nef", "orf",
      "sr2", "srf", "arw", "dng", "raf", "x3f", "rw2", "srw", "pef",
      "nrw", "iiq", "3fr", "ari", "bay", "cap", "dcs", "dcr", "drf",
      "eip", "erf", "fff", "mef", "mos", "mrw", "ptx", "r3d", "rdc",
      "rwl", "rwz", "x3f", "heic", "heif", "jxl"
    }
    
    if not vim.tbl_contains(image_extensions, ext) then
      vim.notify("Δεν βρέθηκε image path κάτω από κέρσορα και το current file δεν είναι εικόνα", vim.log.levels.WARN)
      return
    end
  end
  
  if vim.fn.filereadable(file_path) == 1 then
    -- Άνοιγμα του imv για προεπισκόπηση εικόνας
    local cmd = "imv \"" .. file_path .. "\" &"
    vim.fn.system(cmd)
    vim.notify("Image preview: " .. vim.fn.fnamemodify(file_path, ":t"), vim.log.levels.INFO)
  else
    vim.notify("Το αρχείο δεν υπάρχει: " .. file_path, vim.log.levels.ERROR)
  end
end, { desc = "🖼️ Image preview" })

-- 🔧 LSP (Language Server Protocol)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = {}

		vim.keymap.set("n", "<leader><space>", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, { desc = "📄 Πληροφορίες hover" })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "🎯 Πήγαινε στον ορισμό" })
		vim.keymap.set(
			"n",
			"gi",
			vim.lsp.buf.implementation,
			{ desc = "🔧 Πήγαινε στην υλοποίηση" }
		)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "🔖 Ορισμός τύπου" })
		vim.keymap.set(
			{ "n", "v" },
			"<leader>ca",
			vim.lsp.buf.code_action,
			{ desc = "⚙️ Ενέργειες κώδικα" }
		)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "🔗 Εύρεση αναφορών" })
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, { desc = "🎨 Μορφοποίηση κώδικα" })
		vim.keymap.set("n", "<leader>d", function()
			vim.diagnostic.open_float({ border = "rounded" })
		end, { desc = "⚠️ Εμφάνιση διαγνωστικών" })
		vim.keymap.set("n", "<leader>rn", function()
			local curr_name = vim.fn.expand("<cword>")
			local buf = vim.api.nvim_create_buf(false, true)
			local win = vim.api.nvim_open_win(
				buf,
				true,
				{
					relative = "cursor",
					width = 30,
					height = 1,
					col = 0,
					row = 1,
					style = "minimal",
					border = "rounded",
					title = " Μετονομασία ",
					title_pos = "center",
				}
			)
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, { curr_name })
			vim.bo[buf].modifiable = true
			vim.keymap.set("n", "<CR>", function()
				local new_name = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
				vim.api.nvim_win_close(win, true)
				if new_name and #new_name > 0 and new_name ~= curr_name then
					vim.lsp.buf.rename(new_name)
				end
			end, { buffer = buf })
			vim.keymap.set("n", "<Esc>", function()
				vim.api.nvim_win_close(win, true)
			end, { buffer = buf })
		end, { desc = "🏷️ Μετονομασία (rename)" })
	end,
})

-- [[ Terminal ]]
------------------------------------------------------------------------------------------------------------------------

-- Άνοιγμα νέου tab με terminal
vim.keymap.set("n", "<C-x>", function()
	vim.cmd("tabnew | terminal")
	vim.cmd("startinsert")
end, { noremap = true, silent = true, desc = "📱 Νέο tab με terminal" })

-- Floating terminal
local state = { float = { win = -1, buf = -1 } }
local function toggle_floating_terminal()
	local file_dir = vim.fn.expand("%:p:h")
	if vim.fn.isdirectory(file_dir) == 1 then
		vim.cmd("cd " .. vim.fn.fnameescape(file_dir))
	end
	if vim.api.nvim_win_is_valid(state.float.win) then
		vim.api.nvim_set_current_buf(vim.api.nvim_create_buf(false, true))
		vim.api.nvim_win_close(state.float.win, true)
		state.float.win = -1
		return
	end
	if not vim.api.nvim_buf_is_valid(state.float.buf) then
		state.float.buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_call(state.float.buf, function()
			vim.cmd("terminal")
		end)
		vim.bo[state.float.buf].buflisted = false
		vim.bo[state.float.buf].swapfile = false
		vim.bo[state.float.buf].bufhidden = "hide"
	end
	local width = math.floor(vim.o.columns * 0.8)
	local height = 15
	local row = vim.o.lines - height - 2
	local col = math.floor((vim.o.columns - width) / 2)
	state.float.win = vim.api.nvim_open_win(
		state.float.buf,
		true,
		{
			relative = "editor",
			width = width,
			height = height,
			row = row,
			col = col,
			style = "minimal",
			border = "rounded",
		}
	)
	vim.wo[state.float.win].number = false
	vim.wo[state.float.win].relativenumber = false
	vim.wo[state.float.win].signcolumn = "no"
	vim.api.nvim_set_current_buf(state.float.buf)
	vim.cmd("startinsert")
end
vim.api.nvim_create_user_command("Floaterminal", toggle_floating_terminal, {})
vim.keymap.set({ "n", "t" }, "<C-z>", toggle_floating_terminal, { desc = "💻 Εναλλαγή floating terminal" })

-- [[ 🐹 Go Development ]]
------------------------------------------------------------------------------------------------------------------------

-- Go Commands
vim.keymap.set("n", "<leader>gr", ":GoRun<cr>", { desc = "🏃 Εκτέλεση Go αρχείου" })
vim.keymap.set("n", "<leader>gt", ":GoTest<cr>", { desc = "✅ Tests πακέτου" })
vim.keymap.set("n", "<leader>gT", ":GoTestFunc<cr>", { desc = "🎯 Test κάτω από κέρσορα" })
vim.keymap.set("n", "<leader>gb", ":GoBuild<cr>", { desc = "🔨 Build Go πακέτου" })
vim.keymap.set("n", "<leader>gm", ":GoMod tidy<cr>", { desc = "🧹 Go mod tidy" })
vim.keymap.set("n", "<leader>gi", ":GoImport<cr>", { desc = "📦 Προσθήκη imports" })
vim.keymap.set("n", "<leader>gfs", ":GoFillStruct<cr>", { desc = "🧩 Συμπλήρωση struct" })
vim.keymap.set("n", "<leader>gat", ":GoAddTag<cr>", { desc = "🏷️ Προσθήκη struct tags" })
vim.keymap.set("n", "<leader>grt", ":GoRmTag<cr>", { desc = "🗑️ Αφαίρεση struct tags" })
vim.keymap.set("n", "<leader>gie", ":GoIfErr<cr>", { desc = "⚠️ Generate if err" })
vim.keymap.set("n", "<leader>gal", ":GoAlt<cr>", { desc = "🔄 Εναλλαγή test/source" })

-- Go Testing με Neotest
vim.keymap.set("n", "<leader>gtr", function()
	require("neotest").run.run()
end, { desc = "🏃 Τρέχον test (Neotest)" })
vim.keymap.set("n", "<leader>gtf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "📄 Tests αρχείου (Neotest)" })
vim.keymap.set("n", "<leader>gts", function()
	require("neotest").summary.toggle()
end, { desc = "📊 Test summary (Neotest)" })
vim.keymap.set("n", "<leader>gto", function()
	require("neotest").output.open()
end, { desc = "📝 Test output (Neotest)" })

-- Go Coverage
vim.keymap.set("n", "<leader>gc", function()
	require("coverage").load(true)
end, { desc = "📊 Φόρτωση coverage" })
vim.keymap.set("n", "<leader>gC", function()
	require("coverage").toggle()
end, { desc = "🔍 Εναλλαγή coverage" })
vim.keymap.set("n", "<leader>gcs", function()
	require("coverage").summary()
end, { desc = "📈 Coverage summary" })

-- Go Debugging
vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "🔴 Breakpoint (toggle)" })
vim.keymap.set("n", "<leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "⚙️ Breakpoint (υπό συνθήκη)" })
vim.keymap.set("n", "<leader>dr", function()
	require("dap").continue()
end, { desc = "▶️ Εκκίνηση/Συνέχεια debug" })
vim.keymap.set("n", "<leader>ds", function()
	require("dap").step_over()
end, { desc = "⏭️ Step over (πάνω από)" })
vim.keymap.set("n", "<leader>di", function()
	require("dap").step_into()
end, { desc = "⏬ Μπες μέσα (step into)" })
vim.keymap.set("n", "<leader>do", function()
	require("dap").step_out()
end, { desc = "⏪ Βγες έξω (step out)" })
vim.keymap.set("n", "<leader>dt", function()
	require("dap").terminate()
end, { desc = "⏹️ Τερματισμός debug" })
vim.keymap.set("n", "<leader>du", function()
	require("dapui").toggle()
end, { desc = "📺 Εναλλαγή Debug UI" })
vim.keymap.set("n", "<leader>dh", function()
	require("dap.ui.widgets").hover()
end, { desc = "📄 Πληροφορίες hover" })
vim.keymap.set("n", "<leader>dp", function()
	require("dap.ui.widgets").preview()
end, { desc = "🔍 Προεπισκόπηση debug" })
vim.keymap.set("n", "<leader>df", function()
	require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)
end, { desc = "🖼️ Πλαίσια (frames)" })
vim.keymap.set("n", "<leader>dS", function()
	require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)
end, { desc = "🔍 Εμβέλεια (scopes)" })

-- Go Debugging Tests
vim.keymap.set("n", "<leader>dgt", function()
	require("dap-go").debug_test()
end, { desc = "🧪 Debug Go test" })
vim.keymap.set("n", "<leader>dgT", function()
	require("dap-go").debug_last_test()
end, { desc = "🔄 Debug τελευταίο Go test" })

-- [[ Αυτόματη Αποθήκευση ]]
------------------------------------------------------------------------------------------------------------------------

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	pattern = "*",
	callback = function()
		if vim.bo.modified and vim.bo.filetype ~= "gitcommit" then
			vim.cmd("silent! write")
		end
	end,
})

-- [[ Link Handler ]]
------------------------------------------------------------------------------------------------------------------------

-- Συνάρτηση για εύρεση href links κάτω από τον κέρσορα
local function get_link_under_cursor()
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2] + 1
	local row = vim.api.nvim_win_get_cursor(0)[1]

	-- Πρώτα ελέγχω αν ο κέρσορας είναι απευθείας πάνω σε file path στη γραμμή
	local file_patterns = {
		"[%w-._~/]+/[%w-._~/]+", -- paths με slashes
		"[%w-._]+%.[%w]+", -- files με extensions
		"%.%./[%w-._~/]+", -- relative paths ../
		"%./[%w-._~/]+", -- relative paths ./
	}

	for _, pattern in ipairs(file_patterns) do
		local start_pos, end_pos = line:find(pattern)
		while start_pos do
			if col >= start_pos and col <= end_pos then
				local match = line:sub(start_pos, end_pos)
				-- Έλεγχος αν είναι όντως file path
				if match:match("/") or match:match("%.%w+$") then
					return match
				end
			end
			start_pos, end_pos = line:find(pattern, end_pos + 1)
		end
	end

	-- Αν δεν βρέθηκε στη γραμμή, ψάξε για multi-line HTML tags
	-- Αναζήτηση προς τα πάνω για άνοιγμα tag
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local tag_start_row = nil
	local tag_end_row = nil

	-- Αναζήτηση για άνοιγμα tag (προς τα πάνω)
	for i = row, math.max(1, row - 10), -1 do
		if lines[i] and lines[i]:match("<%s*[%w]+") then
			tag_start_row = i
			break
		end
	end

	-- Αναζήτηση για κλείσιμο tag (προς τα κάτω)
	for i = row, math.min(#lines, row + 10) do
		if lines[i] and (lines[i]:match("/>") or lines[i]:match("</[%w]+>")) then
			tag_end_row = i
			break
		end
	end

	-- Αν βρέθηκε tag, ψάξε για src/href στις γραμμές μεταξύ
	if tag_start_row and tag_end_row then
		local tag_content = ""
		for i = tag_start_row, tag_end_row do
			if lines[i] then
				tag_content = tag_content .. lines[i] .. " "
			end
		end

		-- Αναζήτηση για attributes στο συνολικό tag content
		local attribute_patterns = {
			'src%s*=%s*"([^"]+)"',
			"src%s*=%s*'([^']+)'",
			'href%s*=%s*"([^"]+)"',
			"href%s*=%s*'([^']+)'",
		}

		for _, pattern in ipairs(attribute_patterns) do
			local captured = tag_content:match(pattern)
			if captured then
				return captured
			end
		end
	end

	-- Single-line attribute search (για τα περισσότερα cases)
	local attribute_patterns = {
		{ attr = "href", pattern = 'href%s*=%s*"([^"]+)"' },
		{ attr = "href", pattern = "href%s*=%s*'([^']+)'" },
		{ attr = "src", pattern = 'src%s*=%s*"([^"]+)"' },
		{ attr = "src", pattern = "src%s*=%s*'([^']+)'" },
	}

	for _, attr_info in ipairs(attribute_patterns) do
		local pattern = attr_info.pattern
		local start_pos, end_pos, captured = line:find(pattern)
		
		while start_pos do
			-- Βρες τη θέση των quotes
			local quote_start = line:find('["\']', start_pos + #attr_info.attr)
			local quote_end = line:find('["\']', quote_start + 1)
			
			if quote_start and quote_end and col >= quote_start + 1 and col <= quote_end - 1 then
				return captured
			end
			
			-- Συνέχισε την αναζήτηση
			start_pos, end_pos, captured = line:find(pattern, end_pos + 1)
		end
	end

	-- Standalone URLs
	local url_patterns = {
		"https?://[%w-._~:/?#%[%]@!$&'()*+,;=%%]+",
		"www%.[%w-._~:/?#%[%]@!$&'()*+,;=%%]+",
	}

	for _, pattern in ipairs(url_patterns) do
		local start_pos, end_pos = line:find(pattern)
		while start_pos do
			if col >= start_pos and col <= end_pos then
				return line:sub(start_pos, end_pos)
			end
			start_pos, end_pos = line:find(pattern, end_pos + 1)
		end
	end

	return nil
end

-- Συνάρτηση για άνοιγμα link
local function open_link()
	local link = get_link_under_cursor()
	if not link then
		vim.notify("Δεν βρέθηκε link κάτω από τον κέρσορα", vim.log.levels.WARN)
		return
	end

	-- Αν είναι URL (ξεκινάει με http/https ή www)
	if link:match("^https?://") or link:match("^www%.") then
		local cmd = "xdg-open '" .. link .. "'"
		vim.fn.system(cmd)
		vim.notify("Άνοιγμα στον browser: " .. link, vim.log.levels.INFO)

	-- Αν είναι local file path
	elseif link:match("^%./") or link:match("^%.%./") or link:match("^/") or 
		   link:match("/") or link:match("%.%w+$") then
		-- Βρες το απόλυτο path
		local current_dir = vim.fn.expand("%:p:h")
		local file_path

		if link:match("^/") then
			-- Absolute path
			file_path = link
		elseif link:match("^%./") then
			-- Relative path με ./
			file_path = current_dir .. "/" .. link:gsub("^%./", "")
		elseif link:match("^%.%./") then
			-- Relative path με ../
			file_path = current_dir .. "/" .. link
		else
			-- Relative path χωρίς ./ (π.χ. assets/portfolio-projects/go.jpeg)
			file_path = current_dir .. "/" .. link
		end

		-- Έλεγχος αν υπάρχει το αρχείο
		if vim.fn.filereadable(file_path) == 1 then
			vim.cmd("edit " .. vim.fn.fnameescape(file_path))
			vim.notify("Άνοιγμα αρχείου: " .. file_path, vim.log.levels.INFO)
		else
			vim.notify("Το αρχείο δεν υπάρχει: " .. file_path, vim.log.levels.ERROR)
		end
	else
		vim.notify("Μη αναγνωρίσιμος τύπος link: " .. link, vim.log.levels.WARN)
	end
end

-- Keymap για άνοιγμα link με <leader>gx
vim.keymap.set("n", "<leader>al", open_link, { desc = "🔗 Άνοιγμα link κάτω από κέρσορα" })

return {}