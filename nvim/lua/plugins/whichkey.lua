return {
    "folke/which-key.nvim",
    version = "1.6.0",
    event = "VeryLazy",
    config = function()
        require("which-key").setup()
    end,
}
