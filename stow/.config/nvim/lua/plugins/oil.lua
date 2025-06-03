return {
    "stevearc/oil.nvim",
    version = "2.15.0",
    lazy = false,
    config = function()
        require("oil").setup({
            columns = { "icon" },
            default_file_explorer = false,
            keymaps = {
                ["<C-h>"] = false,
                ["<C-l>"] = false,
                ["<C-p>"] = {
                    callback = function()
                        local oil = require("oil")
                        oil.open_preview({ vertical = true, split = "botright" })
                    end,
                },
            },
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
            },
            win_options = {
                signcolumn = "yes",
            },
        })

        -- stylua: ignore
        Globals.map("n", "-", "<CMD>Oil<CR>", { desc = "Oil", noremap = true, silent = true })
    end,
}
