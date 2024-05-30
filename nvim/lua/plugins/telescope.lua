return {
	"nvim-telescope/telescope-file-browser.nvim",
	commit = "3bece973c5d80e7da447157822d5b0e73558d361",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim", tag = "0.1.7" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		local telescope = require("telescope")
		require("telescope.pickers.layout_strategies").horizontal_merged = function(
			picker,
			max_columns,
			max_lines,
			layout_config
		)
			local layout =
				require("telescope.pickers.layout_strategies").horizontal(picker, max_columns, max_lines, layout_config)

			layout.prompt.title = ""
			layout.prompt.borderchars = { "─", "│", "─", "│", "┌", "┬", "┤", "├" }

			layout.results.title = ""
			layout.results.borderchars = { "─", "│", "─", "│", "├", "┤", "┴", "└" }
			layout.results.line = layout.results.line - 1
			layout.results.height = layout.results.height + 1

			layout.preview.title = ""
			layout.preview.borderchars = { "─", "│", "─", " ", "─", "┐", "┘", "─" }

			return layout
		end
		require("telescope.pickers.layout_strategies").vertical_merged = function(
			picker,
			max_columns,
			max_lines,
			layout_config
		)
			local layout =
				require("telescope.pickers.layout_strategies").vertical(picker, max_columns, max_lines, layout_config)

			layout.prompt.title = ""
			layout.prompt.borderchars = { "─", "│", "─", "│", "┌", "┐", "┤", "├" }

			layout.results.title = ""
			layout.results.borderchars = { "─", "│", "─", "│", "├", "┤", "┘", "└" }
			layout.results.line = layout.results.line - 1
			layout.results.height = layout.results.height + 1

			return layout
		end
		telescope.setup({
			defaults = {
				get_status_text = function(picker)
					return ""
				end,
				layout_strategy = "horizontal_merged",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.6,
						height = 0.8,
					},
				},
				sorting_strategy = "ascending",
			},
			pickers = {
				command_history = {
					layout_strategy = "vertical_merged",
					layout_config = {
						height = 0.5,
						prompt_position = "top",
					},
				},
			},
			extensions = {
				file_browser = {
					hijack_netrw = true,
					grouped = true,
				},
			},
		})
		vim.keymap.set("n", "<leader>fd", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fc", builtin.command_history, {})
		vim.keymap.set("n", "<leader>fb", telescope.extensions.file_browser.file_browser, {})
	end,
}
