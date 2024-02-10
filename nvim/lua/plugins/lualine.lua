return {
    "nvim-lualine/lualine.nvim",
    init = function()
        local lualine = require("lualine")
        lualine.setup({
            options = {
                theme = "rose-pine",
            },
            sections = {
                lualine_a = {"mode"},
                lualine_b = {"branch", "diff", "diagnostics"},
                lualine_c = {"filename"},
                lualine_x = {"encoding",},
                lualine_y = {},
                lualine_z = {"filetype"}
            }
        })
    end
}
