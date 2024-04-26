local opts = {
    noremap = true,
    silent = true,
}

vim.g.mapleader = " "

-- Misc. leader
_map("n", "<leader>q", ":q<CR>", { desc = "Quit", unpack(opts) })
_map("n", "<leader>Q", ":q!<CR>", { desc = "Quit (discard)", unpack(opts) })
_map("n", "<leader>w", ":w<CR>", { desc = "Write", unpack(opts) })
_map("n", "<leader>wq", ":wq<CR>", { desc = "Write & quit", unpack(opts) })
_map("n", "<leader>do", ":DiffviewOpen<CR>", { desc = "Diff open", unpack(opts) })
_map("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Diff close", unpack(opts) })

-- Clear highlights
_map("n", "gh", ":nohl<CR>", { desc = "Clear highlights", unpack(opts) })

-- Line text-objects
_map({ "o", "x" }, "il", ":<C-u>normal! $v^<CR>", { desc = "Select inside line", unpack(opts) })
_map({ "o", "x" }, "al", ":<C-u>normal! $v0<CR>", { desc = "Select around line", unpack(opts) })

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
_map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split V", unpack(opts) })
_map("n", "<leader>sh", ":split<CR>", { desc = "Split H", unpack(opts) })
_map("n", ";s", "<C-w>q", { desc = "Close split", unpack(opts) })
_map("n", ";S", "<C-w>o", { desc = "Close other splits", unpack(opts) })

-- Pane resize
_map("n", "<S-Up>", ":resize -2<CR>", opts)
_map("n", "<S-Down>", ":resize +2<CR>", opts)
_map("n", "<S-Left>", ":vertical resize -2<CR>", opts)
_map("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Pasting and deleting
_map("i", "<Del>", "_x", opts)
_map("i", "<C-d>", "<Del>", opts)
_map("i", "<C-p>", "<Esc>pa", opts)
_map("n", "gy", "yygccp", { desc = "Comment & paste", silent = true, remap = true })
_map("v", "gy", "ygvgc'>+1P", { desc = "Comment & paste", silent = true, remap = true })
_map("v", "p", "pgvy", opts)

-- Quickfix list
_map("n", "<M-j>", ":cnext<CR>zz", { desc = "Next", unpack(opts) })
_map("n", "<M-k>", ":cprev<CR>zz", { desc = "Previous", unpack(opts) })
_map("n", ";c", ":cclose<CR>", { desc = "Close quickfix", unpack(opts) })

-- Searching
_map("n", "<leader>gc", ":silent vimgrep //g %<CR>:copen<CR>", { desc = "Search to quickfix", unpack(opts) })
-- stylua: ignore start
_map("n", "<leader>gt",
    function ()
        vim.cmd("normal! gny")
        local search_text = vim.fn.getreg('"')
        require("telescope.builtin").live_grep({ default_text = search_text })
    end,
    { desc = "Search to telescope", unpack(opts) })
-- stylua: ignore start
--
-- TMUX fix
_map("i", "<C-f>", "<Right>", opts)
_map("i", "<C-b>", "<Left>", opts)

vim.api.nvim_create_user_command("Wrap", ":set wrap!", {})
vim.api.nvim_create_user_command("Spell", ":set spell!", {})
