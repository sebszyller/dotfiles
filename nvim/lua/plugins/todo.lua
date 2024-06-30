return {
	"sebszyller/todo-comments.nvim",
	commit = "d08a7d5b779fd799dcc563772e1b794b1b0f5018",
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
        -- stylua: ignore
		vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>", { noremap = true, silent = true, desc = "List TODOs" })
	end,
}
