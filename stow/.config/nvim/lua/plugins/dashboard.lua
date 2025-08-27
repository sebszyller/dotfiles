return {
    "nvimdev/dashboard-nvim",
    commit = "000448d837f6e7a47f8f342f29526c4d7e49e9ce",
    event = "VimEnter",
    opts = {
        shortcut_type = "letter",
        theme = "hyper",
        disable_move = true,
        config = {
            footer = {},
            mru = { enable = true, cwd_only = true, limit = 5 },
            packages = { enable = true },
            project = { enable = false },
            week_header = { enable = true },
            shortcut = {
                -- stylua: ignore start
                { desc = "Files",   group = "DiagnosticError", action = "Telescope find_files",                           key = "f", },
                { desc = "Grep",    group = "DiagnosticOk",    action = "Telescope live_grep",                            key = "g", },
                { desc = "Session", group = "DiagnosticInfo",  action = "lua require('sesh').load_sesh(vim.fn.getcwd())", key = "s", },
                { desc = "Lazy",    group = "DiagnosticHint",  action = "Lazy",                                           key = "l", },
                -- stylua: ignore end
            },
        },
    },
}
