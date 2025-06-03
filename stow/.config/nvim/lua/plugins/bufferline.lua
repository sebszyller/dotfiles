return {
    "akinsho/bufferline.nvim",
    dependencies = { { "nvim-tree/nvim-web-devicons", commit = "7f30f2da3c3641841ceb0e2c150281f624445e8f" } },
    version = "4.9.1",
    event = "ColorScheme",
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                separator_style = { " ", " " },
                numbers = "ordinal",
                show_buffer_icons = true,
                color_icons = false,
                indicator = { style = "none" },
            },
        })
        local opts = { noremap = true, silent = true }
		-- stylua: ignore start
		Globals.map("n", ";q", ":bp|bd #<CR>",                                             Globals.extend(opts, { desc = "Close buffer" }))
		Globals.map("n", ";Q", ":bp|bd! #<CR>",                                            Globals.extend(opts, { desc = "Close buffer (discard)" }))
		Globals.map("n", ";1", "<CMD>lua require('bufferline').go_to_buffer(1, true)<CR>", Globals.extend(opts, { desc = "Buffer 1" }))
		Globals.map("n", ";2", "<CMD>lua require('bufferline').go_to_buffer(2, true)<CR>", Globals.extend(opts, { desc = "Buffer 2" }))
		Globals.map("n", ";3", "<CMD>lua require('bufferline').go_to_buffer(3, true)<CR>", Globals.extend(opts, { desc = "Buffer 3" }))
		Globals.map("n", ";4", "<CMD>lua require('bufferline').go_to_buffer(4, true)<CR>", Globals.extend(opts, { desc = "Buffer 4" }))
		Globals.map("n", ";5", "<CMD>lua require('bufferline').go_to_buffer(5, true)<CR>", Globals.extend(opts, { desc = "Buffer 5" }))
		Globals.map("n", ";6", "<CMD>lua require('bufferline').go_to_buffer(6, true)<CR>", Globals.extend(opts, { desc = "Buffer 6" }))
		Globals.map("n", ";7", "<CMD>lua require('bufferline').go_to_buffer(7, true)<CR>", Globals.extend(opts, { desc = "Buffer 7" }))
		Globals.map("n", ";8", "<CMD>lua require('bufferline').go_to_buffer(8, true)<CR>", Globals.extend(opts, { desc = "Buffer 8" }))
		Globals.map("n", ";9", "<CMD>lua require('bufferline').go_to_buffer(9, true)<CR>", Globals.extend(opts, { desc = "Buffer 9" }))
		Globals.map("n", ";o", ":BufferLineCloseOthers<CR>",                               Globals.extend(opts, { desc = "Close other buffers" }))
        -- stylua: ignore end
    end,
}
