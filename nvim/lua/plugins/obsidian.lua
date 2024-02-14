return {
    "epwalsh/obsidian.nvim",
    tag = "v3.2.0",
    lazy = true,
    ft = "markdown",
    opts = {
        workspaces = {
            { name = "knowledge-base", path = "/Users/seb/obsidian" },
        },
        log_level = vim.log.levels.WARN,
        disable_frontmatter = true
    },
    init = function()
        local opts = { noremap = false, silent = true }
        vim.keymap.set("n", "<leader>obl", ":ObsidianBacklinks<CR>", opts)
        vim.keymap.set("n", "<leader>ofl", ":ObsidianFollowLink<CR>", opts)
        vim.keymap.set("n", "<leader>onn", ":ObsidianNew<CR>", opts)
    end
}
