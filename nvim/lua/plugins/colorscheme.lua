return {
    "zenbones-theme/zenbones.nvim",
    commit = "006f15ad3437d85884ad50347bcbc60c9a377640",
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
