local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
local map = vim.keymap.set

vim.g.mapleader = " "

-- Power <Esc>
map("n", "<Esc>", "<Esc>:nohl<CR>", opts)
map({ "i", "v" }, "<C-c>", "<Esc>", opts)

-- Move blocks around
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("v", "p", "pgvy", opts)

-- Pasting and deleting
map("i", "<Del>", "_x", opts)
map("i", "<C-d>", "<Del>", opts)
map("i", "<C-p>", "<Esc>pa", opts)

-- TMUX fix
map("i", "<C-f>", "<Right>", opts)
map("i", "<C-b>", "<Left>", opts)

-- Quickfix list
map("n", "[p", ":cprev<CR>zz", opts)
map("n", "]p", ":cnext<CR>zz", opts)

-- Convenience for navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "J", "mzJ`z", opts)

-- Pane navigation
map("n", "<leader>sv", ":vsplit<CR>", opts)
map("n", "<leader>sh", ":split<CR>", opts)

-- Pane resize
map("n", "<S-Up>", ":resize -2<CR>", opts)
map("n", "<S-Down>", ":resize +2<CR>", opts)
map("n", "<S-Left>", ":vertical resize -2<CR>", opts)
map("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Misc. leader
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>wq", ":wq<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>wr", ":set wrap!<CR>", opts)
