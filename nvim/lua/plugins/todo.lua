return {
	"folke/todo-comments.nvim",
	version = "1.1.0",
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
	end,
}
