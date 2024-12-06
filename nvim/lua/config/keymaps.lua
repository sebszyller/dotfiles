local opts = {
	noremap = true,
	silent = true,
}
local map = vim.keymap.set

vim.g.mapleader = " "

-- Misc. leader
map("n", "<leader>q", ":q<CR>", { desc = "Quit", unpack(opts) })
map("n", "<leader>Q", ":q!<CR>", { desc = "Quit (discard)", unpack(opts) })
map("n", "<leader>w", ":w<CR>", { desc = "Write", unpack(opts) })
map("n", "<leader>wq", ":wq<CR>", { desc = "Write & quit", unpack(opts) })
map("n", "<leader>do", ":DiffviewOpen<CR>", { desc = "Diff open", unpack(opts) })
map("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Diff close", unpack(opts) })

-- Move blocks around
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Navigation
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "J", "mzJ`z", opts)

-- Pane navigation
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split V", unpack(opts) })
map("n", "<leader>sh", ":split<CR>", { desc = "Split H", unpack(opts) })
map("n", ";s", "<C-w>q", { desc = "Close split", unpack(opts) })

-- Pane resize
map("n", "<S-Up>", ":resize -2<CR>", opts)
map("n", "<S-Down>", ":resize +2<CR>", opts)
map("n", "<S-Left>", ":vertical resize -2<CR>", opts)
map("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Pasting and deleting
map("i", "<Del>", "_x", opts)
map("i", "<C-d>", "<Del>", opts)
map("i", "<C-p>", "<Esc>pa", opts)
map("v", "p", "pgvy", opts)

-- Power <Esc>
map("n", "<Esc>", "<Esc>:nohl<CR>", opts)
map({ "i", "v" }, "<C-c>", "<Esc>", opts)

-- Quickfix list
map("n", "[p", ":cprev<CR>zz", { desc = "Previous", unpack(opts) })
map("n", "]p", ":cnext<CR>zz", { desc = "Next", unpack(opts) })
map("n", ";c", ":cclose<CR>", { desc = "Close quickfix", unpack(opts) })

-- TMUX fix
map("i", "<C-f>", "<Right>", opts)
map("i", "<C-b>", "<Left>", opts)

vim.api.nvim_create_user_command("Wrap", ":set wrap!", {})
