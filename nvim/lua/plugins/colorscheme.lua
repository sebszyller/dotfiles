return {
    "rose-pine/neovim",
    version = "3.0.1",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        require("rose-pine").setup({
            highlight_groups = {
                ["@text.emphasis.markdown_inline"] = { fg = "text", italic = true },
                ["@text.strong.markdown_inline"] = { fg = "text", bold = true },
                ["@text.reference.markdown_inline"] = { fg = "pine", underline = true },
                ["@text.quote.markdown"] = { fg = "subtle", italic = true }
              }
        })
        vim.cmd("colorscheme rose-pine-dawn")
    end
}
