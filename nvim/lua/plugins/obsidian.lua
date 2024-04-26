return {
    "epwalsh/obsidian.nvim",
    tag = "v3.7.6",
    lazy = true,
    event = {
        "BufReadPre " .. vim.fn.expand "~" .. "/obsidian/**.md",
        "BufNewFile " .. vim.fn.expand "~" .. "/obsidian/**.md"
    },
    config = function()
        local palette = require("gruvbox").palette
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
            -- hl_groups = {
            --     ObsidianBullet = { bold = true, fg = palette.faded_orange },
            -- }
        })
        -- need to highlgiht via API because hl_groups overriding is broken in obsidian.nvim right now
        vim.api.nvim_set_hl(0, "ObsidianBullet", { fg = palette.faded_orange })

        local opts = { noremap = false, silent = true }
        vim.keymap.set("n", "<leader>obl", ":ObsidianBacklinks<CR>", opts)
        vim.keymap.set("n", "<leader>ofl", ":ObsidianFollowLink<CR>", opts)
        vim.keymap.set("n", "<leader>onn", ":ObsidianNew<CR>", opts)
    end
}
