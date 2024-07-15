return {
	"zenbones-theme/zenbones.nvim",
	commit = "e9ba8305f65524f9355515cdd8704b2c6ba2def6",
	dependencies = { "rktjmp/lush.nvim" },
	lazy = false,
	priority = 1000,
	config = function()
		vim.o.background = "dark"
		vim.g.zenbones = { transparent_background = true }
		vim.cmd("colorscheme zenbones")
	end,
}
