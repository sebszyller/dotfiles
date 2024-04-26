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
		_map("n", ";q", ":bp|bd #<CR>", { desc = "Close buffer", unpack(opts) })
		_map("n", ";Q", ":bp|bd! #<CR>", { desc = "Close buffer (discard)", unpack(opts) })
		_map("n", ";1", "<CMD>lua require('bufferline').go_to_buffer(1, true)<CR>", { desc = "Buffer 1", unpack(opts) })
		_map("n", ";2", "<CMD>lua require('bufferline').go_to_buffer(2, true)<CR>", { desc = "Buffer 2", unpack(opts) })
		_map("n", ";3", "<CMD>lua require('bufferline').go_to_buffer(3, true)<CR>", { desc = "Buffer 3", unpack(opts) })
		_map("n", ";4", "<CMD>lua require('bufferline').go_to_buffer(4, true)<CR>", { desc = "Buffer 4", unpack(opts) })
		_map("n", ";5", "<CMD>lua require('bufferline').go_to_buffer(5, true)<CR>", { desc = "Buffer 5", unpack(opts) })
		_map("n", ";6", "<CMD>lua require('bufferline').go_to_buffer(6, true)<CR>", { desc = "Buffer 6", unpack(opts) })
		_map("n", ";7", "<CMD>lua require('bufferline').go_to_buffer(7, true)<CR>", { desc = "Buffer 7", unpack(opts) })
		_map("n", ";8", "<CMD>lua require('bufferline').go_to_buffer(8, true)<CR>", { desc = "Buffer 8", unpack(opts) })
		_map("n", ";9", "<CMD>lua require('bufferline').go_to_buffer(9, true)<CR>", { desc = "Buffer 9", unpack(opts) })
		_map("n", ";o", ":BufferLineCloseOthers<CR>", { desc = "Close other buffers", unpack(opts) })
        -- stylua: ignore end
    end,
}
