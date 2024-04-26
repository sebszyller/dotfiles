return {
    "christoomey/vim-tmux-navigator",
    commit = "d847ea942a5bb4d4fab6efebc9f30d787fd96e65",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
    },
    keys = {
        { "<C-h>", "<CMD><C-u>TmuxNavigateLeft<CR>" },
        { "<C-j>", "<CMD><C-u>TmuxNavigateDown<CR>" },
        { "<C-k>", "<CMD><C-u>TmuxNavigateUp<CR>" },
        { "<C-l>", "<CMD><C-u>TmuxNavigateRight<CR>" },
    },
}
