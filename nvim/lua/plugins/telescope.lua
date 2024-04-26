return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            commit = "dae2eac9d91464448b584c7949a31df8faefec56",
            build = "make",
        },
        { "nvim-lua/plenary.nvim", commit = "2d9b06177a975543726ce5c73fca176cedbffe9d" },
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
                selection_caret = "❚ ",
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
        })
        local opts = { noremap = true, silent = true }
        -- stylua: ignore start
        _map("n", "<leader>fc", builtin.command_history, { desc = "Command history", unpack(opts) })
        _map("n", "<leader>fd", builtin.find_files, { desc = "Find files", unpack(opts) })
        _map("n", "<leader>fg", builtin.live_grep, { desc = "Grep in files", unpack(opts) })
        -- stylua: ignore start
    end,
}
