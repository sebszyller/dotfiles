return {
	"kylechui/nvim-surround",
	version = "2.1.8",
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup()
	end,
}
