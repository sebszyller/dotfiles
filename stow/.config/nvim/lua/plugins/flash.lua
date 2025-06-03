return {
    "folke/flash.nvim",
    version = "2.1.0",
    event = "VeryLazy",
    config = function()
        require("flash").setup({
            jump = {
                nohlsearch = true,
                autojump = true,
            },
            highlight = { backdrop = false },
            modes = {
                char = { enabled = false },
                search = { enabled = false },
            },
        })
        -- stylua: ignore
		Globals.map( { "n", "x", "o" }, "m", "<CMD>lua require('flash').jump()<CR>", { noremap = true, silent = true, desc = "Jump" })
    end,
}
