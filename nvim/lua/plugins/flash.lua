return {
	"folke/flash.nvim",
	version = "1.18.3",
	event = "VeryLazy",
	config = function()
		require("flash").setup({
			jump = {
				nohlsearch = true,
				autojump = true,
			},
			highlight = {
				backdrop = false,
			},
			modes = {
				char = {
					enabled = false,
				},
			},
		})
        -- stylua: ignore
		vim.keymap.set( { "n", "x", "o" }, "m", "<cmd>lua require('flash').jump()<CR>", { noremap = true, silent = true, desc = "Jump" })
	end,
}
