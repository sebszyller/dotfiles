local opts = {
    noremap = true,
    silent = true,
}

vim.g.mapleader = " "

-- Misc. leader
_map("n", "<leader>q", ":q<CR>", _add_opts(opts, { desc = "Quit" }))
_map("n", "<leader>Q", ":q!<CR>", _add_opts(opts, { desc = "Quit (discard)" }))
_map("n", "<leader>w", ":w<CR>", _add_opts(opts, { desc = "Write" }))
_map("n", "<leader>wq", ":wq<CR>", _add_opts(opts, { desc = "Write & quit" }))
_map("n", "<leader>do", ":DiffviewOpen<CR>", _add_opts(opts, { desc = "Diff open" }))
_map("n", "<leader>dc", ":DiffviewClose<CR>", _add_opts(opts, { desc = "Diff close" }))

-- Clear highlights
_map("n", "gh", ":nohl<CR>", _add_opts(opts, { desc = "Clear highlights" }))

-- Line text-objects
_map({ "o", "x" }, "il", ":<C-u>normal! $v^<CR>", _add_opts(opts, { desc = "Select inside line" }))
_map({ "o", "x" }, "al", ":<C-u>normal! $v0<CR>", _add_opts(opts, { desc = "Select around line" }))

-- Move blocks around
_map("v", "J", ":m '>+1<CR>gv=gv", opts)
_map("v", "K", ":m '<-2<CR>gv=gv", opts)
_map("v", "<", "<gv", opts)
_map("v", ">", ">gv", opts)

-- Navigation
_map("n", "<C-d>", "<C-d>zz", opts)
_map("n", "<C-u>", "<C-u>zz", opts)
_map("n", "n", "nzz", opts)
_map("n", "N", "Nzz", opts)
_map("n", "J", "mzJ`z", opts)

-- Pane navigation
_map("n", "<leader>sv", ":vsplit<CR>", _add_opts(opts, { desc = "Split V" }))
_map("n", "<leader>sh", ":split<CR>", _add_opts(opts, { desc = "Split H" }))
_map("n", ";s", "<C-w>q", _add_opts(opts, { desc = "Close split" }))
_map("n", ";S", "<C-w>o", _add_opts(opts, { desc = "Close other splits" }))

-- Pane resize
_map("n", "<S-Up>", ":resize -2<CR>", opts)
_map("n", "<S-Down>", ":resize +2<CR>", opts)
_map("n", "<S-Left>", ":vertical resize -2<CR>", opts)
_map("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Pasting and deleting
_map("i", "<Del>", "_x", opts)
_map("i", "<C-d>", "<Del>", opts)
_map("i", "<C-p>", "<Esc>pa", opts)
_map("n", "gy", "yygccp", { desc = "Comment & paste", remap = true, silent = true })
_map("v", "gy", "ygvgc'>+1P", { desc = "Comment & paste", remap = true, silent = true })
_map("v", "p", "pgvy", opts)

-- Quickfix list
_map("n", "<M-j>", ":cnext<CR>zz", _add_opts(opts, { desc = "Next" }))
_map("n", "<M-k>", ":cprev<CR>zz", _add_opts(opts, { desc = "Previous" }))
_map("n", ";c", ":cclose<CR>", _add_opts(opts, { desc = "Close quickfix" }))

-- Searching
_map("n", "<leader>gc", ":silent vimgrep //g %<CR>:copen<CR>", _add_opts(opts, { desc = "Search to quickfix" }))
-- stylua: ignore start
_map("n", "<leader>gt",
    function ()
        vim.cmd("normal! gny")
        local search_text = vim.fn.getreg('"')
        require("telescope.builtin").live_grep({ default_text = search_text })
    end,
    _add_opts(opts, { desc = "Search to telescope" }))
-- stylua: ignore start

-- TMUX fix
_map("i", "<C-f>", "<Right>", opts)
_map("i", "<C-b>", "<Left>", opts)

vim.api.nvim_create_user_command("Wrap", ":set wrap!", {})
vim.api.nvim_create_user_command("Spell", ":set spell!", {})
