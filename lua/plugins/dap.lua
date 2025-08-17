-- ================================================================
-- DAP Plugin - Debug Adapter Protocol για Go debugging
-- ================================================================
-- Ολοκληρωμένο debugging environment με πλήρη υποστήριξη για Go:
-- • Visual debugging με breakpoints, step over/into/out
-- • DAP UI με panels για scopes, variables, call stack, console
-- • Go-specific debugging με nvim-dap-go και Delve integration
-- • Virtual text για inline variable inspection
-- • Remote debugging support για Docker containers
-- • Auto-open/close UI όταν ξεκινάει/τελειώνει debugging session
-- • Debug Go tests με specialized commands
-- • Advanced features: conditional breakpoints, logpoints
-- ================================================================

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"leoluz/nvim-dap-go",
	},
	ft = { "go" },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup({
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.25 },
						{ id = "breakpoints", size = 0.25 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					position = "left",
					size = 40,
				},
				{
					elements = {
						{ id = "repl", size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					position = "bottom",
					size = 10,
				},
			},
			controls = {
				enabled = true,
				element = "repl",
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "↻",
					terminate = "□",
				},
			},
		})

		require("nvim-dap-virtual-text").setup({
			enabled = true,
			enabled_commands = true,
			highlight_changed_variables = true,
			highlight_new_as_changed = false,
			show_stop_reason = true,
			commented = false,
			only_first_definition = true,
			all_references = false,
			filter_references_pattern = "<module",
			virt_text_pos = "eol",
			all_frames = false,
			virt_lines = false,
			virt_text_win_col = nil,
		})

		require("dap-go").setup({
			dap_configurations = {
				{
					type = "go",
					name = "Attach remote",
					mode = "remote",
					request = "attach",
				},
			},
			delve = {
				path = "dlv",
				initialize_timeout_sec = 20,
				port = "${port}",
				args = {},
				build_flags = "",
				detached = vim.fn.has("win32") == 0,
				cwd = nil,
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}