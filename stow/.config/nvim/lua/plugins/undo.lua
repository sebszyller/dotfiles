return {
    "mbbill/undotree",
    commit = "2556c6800b210b2096b55b66e74b4cc1d9ebbe4f",
    event = "BufReadPre",
    config = function()
        vim.g.undotree_WindowLayout = 3
        vim.g.undotree_SplitWidth = 60
        -- stylua: ignore
		Globals.map("n", "<leader>u", vim.cmd.UndotreeToggle, { noremap = true, silent = true, desc = "Undo tree" })
    end,
}
