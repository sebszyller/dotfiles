return {
	"akinsho/bufferline.nvim",
	dependencies = { { "nvim-tree/nvim-web-devicons", commit = "7f30f2da3c3641841ceb0e2c150281f624445e8f" } },
	version = "4.6.0",
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
		vim.keymap.set("n", ";q", ":bp|bd #<CR>", { desc = "Close buffer", unpack(opts) })
		vim.keymap.set("n", ";Q", ":bp|bd! #<CR>", { desc = "Close buffer (discard)", unpack(opts) })
		vim.keymap.set( "n", ";1", "<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>", { desc = "Buffer 1", unpack(opts) })
		vim.keymap.set( "n", ";2", "<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>", { desc = "Buffer 2", unpack(opts) })
		vim.keymap.set( "n", ";3", "<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>", { desc = "Buffer 3", unpack(opts) })
		vim.keymap.set( "n", ";4", "<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>", { desc = "Buffer 4", unpack(opts) })
		vim.keymap.set( "n", ";5", "<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>", { desc = "Buffer 5", unpack(opts) })
		vim.keymap.set( "n", ";6", "<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>", { desc = "Buffer 6", unpack(opts) })
		vim.keymap.set( "n", ";7", "<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>", { desc = "Buffer 7", unpack(opts) })
		vim.keymap.set( "n", ";8", "<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>", { desc = "Buffer 8", unpack(opts) })
		vim.keymap.set( "n", ";9", "<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>", { desc = "Buffer 9", unpack(opts) })
		vim.keymap.set("n", ";o", ":BufferLineCloseOthers<CR>", { desc = "Close other buffers", unpack(opts) })
		-- stylua: ignore end
	end,
}
