return {
	"numToStr/Comment.nvim",
	dependencies = { { "folke/todo-comments.nvim", version = "1.1.0" } },
	version = "0.8.0",
	lazy = true,
	event = "BufReadPre",
	config = function()
		require("todo-comments").setup({
			signs = false,
			highlight = {
				keyword = "wide_fg",
				after = "",
			},
		})
		vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>", { noremap = true, silent = true })

		require("Comment").setup({
			opleader = {
				line = "gc",
				block = "gb",
			},
			mappings = {
				basic = true,
				extra = true,
			},
			toggler = {
				line = "gcc",
				block = "gbc",
			},
		})

		local comment_ft = require("Comment.ft")
		comment_ft.set("lua", { "--%s", "--[[%s]]" })
	end,
}
