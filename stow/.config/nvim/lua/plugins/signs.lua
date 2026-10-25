return {
    "lewis6991/gitsigns.nvim",
    version = "2.1.0",
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
