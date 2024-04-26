return {
    "ellisonleao/gruvbox.nvim",
    version = "2.0.0",
    name = "gruvbox",
    lazy = false,
    priority = 1000,
    config = function()
        local palette = require("gruvbox").palette
        require("gruvbox").setup({
            overrides = {
                SignColumn = { bg = palette.light0 },
                GitSignsAdd = { bg = palette.light0, fg = palette.faded_green },
                GitSignsChange = { bg = palette.light0, fg = palette.faded_blue },
                GitSignsDelete = { bg = palette.light0, fg = palette.faded_red },
                ["@text.quote.markdown"] = { fg = palette.gray, italic = true },
                ["@text.reference.markdown_inline"] = { fg = palette.faded_blue, underline = true },
                -- H1
                ["@text.title.1.marker.markdown"] = { fg = palette.faded_blue, bold = true },
                ["@text.title.1.markdown"] = { fg = palette.faded_blue, bold = true },
                -- H2
                ["@text.title.2.marker.markdown"] = { fg = palette.faded_aqua, bold = true },
                ["@text.title.2.markdown"] = { fg = palette.faded_aqua, bold = true },
                -- H3
                ["@text.title.3.marker.markdown"] = { fg = palette.faded_aqua, bold = true },
                ["@text.title.3.markdown"] = { fg = palette.faded_aqua, bold = true },
                -- H4
                ["@text.title.4.marker.markdown"] = { fg = palette.faded_aqua, bold = true },
                ["@text.title.4.markdown"] = { fg = palette.faded_aqua, bold = true },
                -- ["@text.emphasis.markdown_inline"] = { fg = "text", italic = true },
                -- ["@text.strong.markdown_inline"] = { fg = "text", bold = true },
            }
        })
        vim.o.background = "light"
        vim.cmd("colorscheme gruvbox")
    end
}
