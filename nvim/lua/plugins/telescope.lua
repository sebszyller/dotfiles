return {
    "nvim-telescope/telescope-file-browser.nvim",
    commit = "26b5e86cb8509a3ca2ebaa652630396c8e3396b2",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim", tag = "0.1.5" }
    },
    config = function()
        local builtin = require("telescope.builtin")
        local telescope = require("telescope")
        telescope.setup({
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                },
            },
        })
        vim.keymap.set("n", "<leader>fd", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", telescope.extensions.file_browser.file_browser, {})
    end
}
