return {
    "ellisonleao/gruvbox.nvim",
    version = "2.0.0",
    name = "gruvbox",
    lazy = false,
    priority = 1000,
    config = function()
        local palette = require("gruvbox").palette
        palette.light1 = "#f5eecb"
        require("gruvbox").setup({
            contrast = "hard",
            overrides = {
                Conditional = { fg = palette.faded_red, italic = true },
                Function = { link = "GruvboxGreen" },
                Identifier = { link = "GruvboxFg1" },
                Keyword = { fg = palette.faded_red, italic = true },
                Pmenu = { bg = palette.light1 },
                Statement = { fg = palette.faded_red, italic = true },
                String = { fg = palette.faded_yellow, italic = true },
                Type = { fg = palette.faded_aqua, italic = true },

                GitSignsAdd = { bg = palette.light0_hard, fg = palette.faded_green },
                GitSignsChange = { bg = palette.light0_hard, fg = palette.faded_blue },
                GitSignsDelete = { bg = palette.light0_hard, fg = palette.faded_red },
                SignColumn = { bg = palette.light0_hard },

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
            }
        })
        vim.o.background = "light"
        vim.cmd("colorscheme gruvbox")
    end
}
