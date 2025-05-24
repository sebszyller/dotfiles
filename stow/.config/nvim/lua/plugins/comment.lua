return {
    {
        "numToStr/Comment.nvim",
        version = "0.8.0",
        event = "BufReadPre",
        opts = {},
    },
    {
        "sebszyller/todo-comments.nvim",
        commit = "1638949",
        event = "BufReadPre",
        config = function()
            require("todo-comments").setup({
                default_fg = {
                    dark = "#FFFFFF",
                },
                highlight = {
                    keyword = "bg",
                    after = "",
                    pattern = [[.*<((KEYWORDS):)]],
                },
                search = {
                    args = {
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--hidden",
                    },
                },
                signs = false,
            })
            -- stylua: ignore
            _map("n", "<leader>td", ":TodoTelescope<CR>", { noremap = true, silent = true, desc = "List TODOs" })
        end,
    },
}
