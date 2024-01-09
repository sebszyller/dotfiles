local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

vim.g.mapleader = " "

vim.keymap.set("i", "<Del>", "_x", opts)
vim.keymap.set("i", "<C-d>", "<Del>", opts)
vim.keymap.set("i", "<C-p>", "<Esc>pa", opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "p", "pgvy", opts)

vim.keymap.set("n", "<C-a>", "ggVG", opts)
vim.keymap.set("n", "<C-j>", "10jzz", opts)
vim.keymap.set("n", "<C-k>", "10kzz", opts)
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "J", "mzJ`z", opts)

vim.keymap.set("n", "<Esc>", "<Esc>:nohl<CR>", opts)
vim.keymap.set("n", "<C-c>", "<C-c>:nohl<CR>", opts)
vim.keymap.set("n", "<leader>f", "/", opts)
vim.keymap.set("n", "<leader>e", "$", opts)
vim.keymap.set("n", "<leader>q", ":q<CR>", opts)
vim.keymap.set("n", "<leader>wq", ":wq<CR>", opts)
vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
