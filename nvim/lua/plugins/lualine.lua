return {
    "nvim-lualine/lualine.nvim",
    commit = "b5e8bb642138f787a2c1c5aedc2a78cb2cebbd67",
    lazy = false,
    config = function()
        local lualine = require("lualine")
        local custom_gruvbox = require("lualine.themes.gruvbox")
        custom_gruvbox.normal.c.bg = require("gruvbox").palette.light1

        lualine.setup({
            options = {
                theme = custom_gruvbox,
            },
            sections = {
                lualine_a = {"mode"},
                lualine_b = {"branch", "diff", "diagnostics"},
                lualine_c = {"filename"},
                lualine_x = {"encoding",},
                lualine_y = {},
                lualine_z = { {"filetype", icons_enabled = false} }
            }
        })
    end
}
