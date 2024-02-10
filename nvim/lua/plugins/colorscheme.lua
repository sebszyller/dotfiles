return {
    "rose-pine/neovim",
    version = "3.0.1",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd("colorscheme rose-pine")
    end
}
