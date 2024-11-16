return {
	"sebszyller/todo-comments.nvim",
	commit = "1638949",
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
			default_fg = {
				dark = "#FFFFFF",
			},
		})
        -- stylua: ignore
		vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>", { noremap = true, silent = true, desc = "List TODOs" })
	end,
}
