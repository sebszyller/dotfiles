return {
    "folke/which-key.nvim",
    version = "1.6.0",
    event = "VeryLazy",
    init = function()
        require("which-key").setup()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
}
