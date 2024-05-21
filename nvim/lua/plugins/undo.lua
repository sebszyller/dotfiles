return {
	"mbbill/undotree",
	version = "0.8.1",
	lazy = true,
	event = "BufReadPre",
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end,
}
