return {
    "lewis6991/gitsigns.nvim",
    version = "1.0.2",
    event = "BufReadPre",
    opts = {
        signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "-" },
            topdelete = { text = "-" },
            changedelete = { text = "~" },
            untracked = { text = "" },
        },
    },
}
