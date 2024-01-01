return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
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
