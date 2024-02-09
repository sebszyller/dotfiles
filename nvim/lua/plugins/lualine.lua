return {
    "nvim-lualine/lualine.nvim",
    init = function()
        local lualine = require("lualine")
        lualine.setup({
            options = {
                theme = "rose-pine",
            },
        })
    end
}
