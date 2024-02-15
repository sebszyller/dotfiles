return {
    "lewis6991/gitsigns.nvim",
    version = "0.7",
    init = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "" }
            },
        })
    end
}
