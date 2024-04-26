return {
    "akinsho/bufferline.nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons", commit = "7f30f2da3c3641841ceb0e2c150281f624445e8f" } },
    version = "4.5.2",
    lazy = true,
    event = "ColorScheme",
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                numbers = "ordinal",
                show_buffer_icons = true,
                color_icons = true
            },
        })
        vim.keymap.set("n", "t1", "<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>", {silent = true})
        vim.keymap.set("n", "t2", "<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>", {silent = true})
        vim.keymap.set("n", "t3", "<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>", {silent = true})
        vim.keymap.set("n", "t4", "<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>", {silent = true})
        vim.keymap.set("n", "t5", "<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>", {silent = true})
        vim.keymap.set("n", "t6", "<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>", {silent = true})
        vim.keymap.set("n", "t7", "<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>", {silent = true})
        vim.keymap.set("n", "t8", "<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>", {silent = true})
        vim.keymap.set("n", "t9", "<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>", {silent = true})
        vim.keymap.set("n", "T", ":BufferLineCloseOthers<CR>", { silent = true })
    end
}
