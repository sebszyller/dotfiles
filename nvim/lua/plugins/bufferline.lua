return {
    "akinsho/bufferline.nvim",
    version = "4.5.0",
    lazy = false,
    event = "ColorScheme",
    config = function()
        local bufferline = require("bufferline")
        local highlights = require('rose-pine.plugins.bufferline')
        bufferline.setup({
            highlights = highlights,
            options = {
                style_preset = bufferline.style_preset.minimal,
            }
        })
        vim.keymap.set("n", "<leader>bl", ":BufferLinePick<CR>", { silent = true })
        vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { silent = true })
    end
}
