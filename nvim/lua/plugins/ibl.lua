return {
	"lukas-reineke/indent-blankline.nvim",
	version = "3.6.1",
	name = "ibl",
	lazy = true,
	event = "BufReadPre",
	config = function()
		require("ibl").setup({
			scope = { enabled = false },
		})
	end,
}
