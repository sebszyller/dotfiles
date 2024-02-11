return {
    "rose-pine/neovim",
    version = "3.0.1",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        require("rose-pine").setup({
            highlight_groups = {
                ["@text.emphasis.markdown_inline"] = { fg = "rose", italic = true },
                ["@text.strong.markdown_inline"] = { fg = "rose", bold = true },
                ["@text.reference.markdown_inline"] = { fg = "gold" }
              }
        })
        vim.cmd("colorscheme rose-pine")
    end
}
