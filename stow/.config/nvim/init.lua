-- Leader/local leader - lazy.nvim needs these set first
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

_map = vim.keymap.set

function _add_opts(base_table, new_options)
    local result_table = {}

    for k, v in pairs(base_table) do
        result_table[k] = v
    end

    for k, v in pairs(new_options) do
        result_table[k] = v
    end

    return result_table
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "--branch stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.runtimepath:prepend(lazypath)

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
