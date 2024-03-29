local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

vim.g.mapleader = " "

-- Power <Esc>
vim.keymap.set("n", "<Esc>", "<Esc>:nohl<CR>", opts)
vim.keymap.set({ "i", "v" }, "<C-c>", "<Esc>", opts)

-- Move blocks around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("v", "p", "pgvy", opts)

-- Pasting and deleting
vim.keymap.set("i", "<Del>", "_x", opts)
vim.keymap.set("i", "<C-d>", "<Del>", opts)
vim.keymap.set("i", "<C-p>", "<Esc>pa", opts)

-- TMUX fix
vim.keymap.set("i", "<C-f>", "<Right>", opts)
vim.keymap.set("i", "<C-b>", "<Left>", opts)

-- New-line remaps
vim.keymap.set("i", "<C-o>", "<Esc>mzO<Esc>`za", opts)

-- Convenience for navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "J", "mzJ`z", opts)

-- Pane navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>sh", ":split<CR>", opts)

-- Pane resize
vim.keymap.set('n', '<S-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<S-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<S-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<S-Right>', ':vertical resize +2<CR>', opts)

-- Misc. leader
vim.keymap.set("n", "<leader>q", ":q<CR>", opts)
vim.keymap.set("n", "<leader>wq", ":wq<CR>", opts)
vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<leader>wr", ":set wrap!<CR>", opts)
