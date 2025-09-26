-- Leader/local leader; lazy.nvim needs these set first
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

Globals = {
    map = vim.keymap.set,
    extend = function(base_table, new_options)
        return vim.tbl_deep_extend("force", base_table, new_options)
    end,
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    change_detection = { notify = false },
    defaults = {
        version = "*",
        lazy = true,
    },
    install = { missing = false },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "netrwPlugin",
                "rplugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    rocks = { enabled = false },
    ui = { border = "rounded" },
})

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.highlights")

require("telescope").load_extension("fzf")
