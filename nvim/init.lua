-- Leader/local leader - lazy.nvim needs these set first
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end
local a = "advertizment"

print(a)

vim.opt.runtimepath:prepend(lazypath)
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local default_group = augroup("DefaultGroup", {})

require("lazy").setup("plugins", {
    defaults = { lazy = true },
    change_detection = { notify = false },
})

require("config.options")
require("config.keymaps")

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

autocmd({"BufWritePre"}, {
    group = default_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

local map = vim.keymap.set
autocmd("LspAttach", {
    group = default_group,
    callback = function(e)
        local opts = {
            buffer = e.buf,
            noremap = true,
            silent = true
        }
        map("n", "gd", function() vim.lsp.buf.definition() end, opts)
        map("n", "K", function() vim.lsp.buf.hover() end, opts)
        map("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        map("n", "<leader>va", function() vim.lsp.buf.code_action() end, opts)
        map("n", "<leader>vr", function() vim.lsp.buf.references() end, opts)
        map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        -- map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        -- map("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    end
})

autocmd({"VimLeave"}, {
    group = default_group,
    pattern = "*",
    command = [[set guicursor= | call chansend(v:stderr, "\x1b[ q")]],
})

autocmd({"TextYankPost"}, {
    group = default_group,
    pattern = "*",
    command = [[silent! lua vim.highlight.on_yank {higroup=(vim.fn["hlexists"]("HighlightedyankRegion") > 0 and "HighlightedyankRegion" or "IncSearch"), timeout=500}]],
})

autocmd({"FileType"}, {
    group = default_group,
    pattern = "markdown",
    command = [[set conceallevel=1]],
})

