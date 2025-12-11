local opts = {
    noremap = true,
    silent = true,
}

vim.g.mapleader = " "

-- Misc. leader
Globals.map("n", "<leader>q", ":q<CR>", Globals.extend(opts, { desc = "Quit" }))
Globals.map("n", "<leader>Q", ":q!<CR>", Globals.extend(opts, { desc = "Quit (discard)" }))
Globals.map("n", "<leader>w", ":w<CR>", Globals.extend(opts, { desc = "Write" }))
Globals.map("n", "<leader>wq", ":wq<CR>", Globals.extend(opts, { desc = "Write & quit" }))
Globals.map("n", "<leader>do", ":DiffviewOpen<CR>", Globals.extend(opts, { desc = "Diff open" }))
Globals.map("n", "<leader>dc", ":DiffviewClose<CR>", Globals.extend(opts, { desc = "Diff close" }))

-- Clear highlights
Globals.map("n", "gh", ":nohl<CR>", Globals.extend(opts, { desc = "Clear highlights" }))

-- Line text-objects
Globals.map({ "o", "x" }, "il", ":<C-u>normal! $v^<CR>", Globals.extend(opts, { desc = "Select inside line" }))
Globals.map({ "o", "x" }, "al", ":<C-u>normal! $v0<CR>", Globals.extend(opts, { desc = "Select around line" }))

-- Move blocks around
Globals.map("v", "J", ":m '>+1<CR>gv=gv", opts)
Globals.map("v", "K", ":m '<-2<CR>gv=gv", opts)
Globals.map("v", "<", "<gv", opts)
Globals.map("v", ">", ">gv", opts)

-- Navigation
Globals.map("n", "<C-d>", "<C-d>zz", opts)
Globals.map("n", "<C-u>", "<C-u>zz", opts)
Globals.map("n", "n", "nzz", opts)
Globals.map("n", "N", "Nzz", opts)
Globals.map("n", "J", "mzJ`z", opts)
Globals.map("n", "gi", "gi<Esc>zzi", Globals.extend(opts, { desc = "Goto Insert location" }))

-- Pane navigation
Globals.map("n", "<leader>sv", ":vsplit<CR>", Globals.extend(opts, { desc = "Split V" }))
Globals.map("n", "<leader>sh", ":split<CR>", Globals.extend(opts, { desc = "Split H" }))
Globals.map("n", ";s", "<C-w>q", Globals.extend(opts, { desc = "Close split" }))
Globals.map("n", ";S", "<C-w>o", Globals.extend(opts, { desc = "Close other splits" }))

-- Pane resize
Globals.map("n", "<S-Up>", ":resize -2<CR>", opts)
Globals.map("n", "<S-Down>", ":resize +2<CR>", opts)
Globals.map("n", "<S-Left>", ":vertical resize -2<CR>", opts)
Globals.map("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Pasting and deleting
Globals.map("i", "<Del>", "_x", opts)
Globals.map("i", "<C-d>", "<Del>", opts)
Globals.map("i", "<C-p>", "<Esc>pa", opts)
Globals.map("n", "gy", "yygccp", { desc = "Comment & paste", remap = true, silent = true })
Globals.map("v", "gy", "ygvgc'>]p", { desc = "Comment & paste", remap = true, silent = true })
Globals.map("n", "vA", "$Gvgg0", Globals.extend(opts, { desc = "Highlight all" }))
Globals.map("v", "p", "pgvy", opts)

-- Quickfix list
Globals.map("n", "<M-j>", ":cnext<CR>zz", Globals.extend(opts, { desc = "Next" }))
Globals.map("n", "<M-k>", ":cprev<CR>zz", Globals.extend(opts, { desc = "Previous" }))
Globals.map("n", ";c", ":cclose<CR>", Globals.extend(opts, { desc = "Close quickfix" }))
Globals.map("n", ";C", ":copen<CR>", Globals.extend(opts, { desc = "Open quickfix" }))

-- Searching
-- stylua: ignore start
Globals.map("n", "<leader>gc", ":silent vimgrep //g %<CR>:copen<CR>", Globals.extend(opts, { desc = "Search to quickfix" }))
Globals.map("n", "<leader>gt",
    function ()
        vim.cmd("normal! gny")
        local search_text = vim.fn.getreg('"')
        require("telescope.builtin").live_grep({ default_text = search_text })
    end,
    Globals.extend(opts, { desc = "Search to telescope" }))
-- stylua: ignore end

-- TMUX fix
Globals.map("i", "<C-f>", "<Right>", opts)
Globals.map("i", "<C-b>", "<Left>", opts)

vim.api.nvim_create_user_command("Wrap", ":set wrap!", {})
vim.api.nvim_create_user_command("Spell", ":set spell!", {})
