return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim", tag = "0.1.5" }
    },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>fd", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.api.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser<CR>", { noremap = true })
    end
}
