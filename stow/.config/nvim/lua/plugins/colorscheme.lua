return {
    "zenbones-theme/zenbones.nvim",
    version = "4.10.0",
    dependencies = {
        { "rktjmp/lush.nvim", version = "1b66ab197b177aabc2270a2c9cb8019fa5a367df" },
    },
    lazy = false,
    priority = 1000,
    config = function()
        vim.o.background = "dark"
        vim.g.zenbones = { transparent_background = true }
        vim.cmd("colorscheme zenbones")
    end,
}
