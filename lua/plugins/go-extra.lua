-- ================================================================
-- Go Extra Tools - Προηγμένα εργαλεία για Go testing & coverage
-- ================================================================
-- Εξειδικευμένα plugins για professional Go development:
-- • Neotest: Σύγχρονο testing framework με interactive UI
-- • Table-driven tests support και live test results
-- • nvim-coverage: Visual code coverage με inline indicators
-- • Coverage highlighting (πράσινο: covered, κόκκινο: uncovered)
-- • Test summary panels και detailed output windows
-- • Integration με Go's built-in testing tools
-- • Real-time coverage updates καθώς τρέχουν τα tests
-- • FixCursorHold για stable performance σε μεγάλα projects
-- ================================================================

return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-go",
		},
		ft = { "go" },
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-go")({
						experimental = {
							test_table = true,
						},
						args = { "-count=1", "-timeout=60s" },
					}),
				},
			})
		end,
	},
	{
		"andythigpen/nvim-coverage",
		ft = { "go" },
		config = function()
			require("coverage").setup({
				commands = true,
				highlights = {
					covered = { fg = "#C3E88D" },
					uncovered = { fg = "#F07178" },
				},
				signs = {
					covered = { hl = "CoverageCovered", text = "▎" },
					uncovered = { hl = "CoverageUncovered", text = "▎" },
				},
				summary = {
					min_coverage = 80.0,
				},
				lang = {
					go = {
						coverage_file = "coverage.out",
					},
				},
			})
		end,
	},
}