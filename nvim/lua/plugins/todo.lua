return {
	"sebszyller/todo-comments.nvim",
	-- version = "1.1.0",
	lazy = true,
	event = "BufReadPre",
	config = function()
		require("todo-comments").setup({
			signs = false,
			highlight = {
				keyword = "bg",
				after = "",
				pattern = [[.*<((KEYWORDS):)]],
			},
		})
		vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>", { noremap = true, silent = true })
	end,
}
