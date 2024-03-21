return {
    "epwalsh/obsidian.nvim",
    tag = "v3.7.4",
    lazy = true,
    event = {
        "BufReadPre " .. vim.fn.expand "~" .. "/obsidian/**.md",
        "BufNewFile " .. vim.fn.expand "~" .. "/obsidian/**.md"
    },
    config = function()
        require("obsidian").setup({
            workspaces = {
                { name = "knowledge-base", path = "~/obsidian" },
            },
            log_level = vim.log.levels.WARN,
            disable_frontmatter = true,
            ui = {
                reference_text = {},
                external_link_icon = { char = "" },
            },
        })
        local opts = { noremap = false, silent = true }
        vim.keymap.set("n", "<leader>obl", ":ObsidianBacklinks<CR>", opts)
        vim.keymap.set("n", "<leader>ofl", ":ObsidianFollowLink<CR>", opts)
        vim.keymap.set("n", "<leader>onn", ":ObsidianNew<CR>", opts)
    end
}
