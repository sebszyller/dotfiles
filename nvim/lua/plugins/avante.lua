return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = "0.0.21",
    build = "make",
    dependencies = {
        { "stevearc/dressing.nvim", commit = "2d7c2db2507fa3c4956142ee607431ddb2828639" }, -- FIXME: dressing.nvim is archived
        { "MunifTanjim/nui.nvim", commit = "53e907ffe5eedebdca1cd503b00aa8692068ca46" },
    },
    config = function()
        require("avante").setup({
            provider = "copilot",
            behaviour = {
                auto_set_keymaps = false,
                enable_token_counting = false,
            },
            hints = { enabled = false },
        })

        local opts = {
            noremap = true,
            silent = true,
        }
        _map("n", "<leader>A", ":AvanteChat<CR>", { desc = "AvanteChat", unpack(opts) })
    end,
}
