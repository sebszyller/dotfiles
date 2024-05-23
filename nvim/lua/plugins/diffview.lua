return {
	"sindrets/diffview.nvim",
	name = "diffview",
	commit = "84164f7d5c022b4b90b1fb51e8fb66bc441e0966",
	lazy = "VeryLazy",
	event = "BufReadPre",
	config = function()
		require("diffview").setup({})
	end,
}
