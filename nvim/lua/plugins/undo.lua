return {
	"mbbill/undotree",
	version = "0.8.1",
	event = "BufReadPre",
	config = function()
        -- stylua: ignore
		_map("n", "<leader>u", vim.cmd.UndotreeToggle, { noremap = true, silent = true, desc = "Undo tree" })
	end,
}
