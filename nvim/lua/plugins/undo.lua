return {
    "mbbill/undotree",
    commit = "9dbbf3b7d19dda0d22ceca461818e4739ad8154d",
    lazy = false,
    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
}
