vim.g.mapleader = " "

vim.keymap.set("i", "<Del>", "_x")
vim.keymap.set("i", "<C-d>", "<Del>")
vim.keymap.set("i", "<C-p>", "<Esc>pa")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "p", "pgvy")

vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("n", "<C-j>", "10jzz")
vim.keymap.set("n", "<C-k>", "10kzz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<Esc>", "<Esc>:nohl<CR>")
vim.keymap.set("n", "<C-c>", "<C-c>:nohl<CR>")
vim.keymap.set("n", "<leader>f", "/")
vim.keymap.set("n", "<leader>e", "$")
vim.keymap.set("n", "<leader>q", ":q!<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
