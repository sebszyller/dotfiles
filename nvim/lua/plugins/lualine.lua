return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    component_separators = '|',
                    icons_enabled = false,
                    section_separators = '',
                    theme = "ayu_dark",
                },
            })
        end
    }
}
