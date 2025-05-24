local set = vim.opt

-- Misc.
set.clipboard = "unnamedplus"
set.completeopt = "menu,menuone,noselect"
set.spelllang = "en_gb"
set.termguicolors = true

-- CMD
set.cmdheight = 0
set.report = 10
set.ruler = false
set.showcmd = false
set.showmode = false

-- Line options
set.breakindent = true
set.smartindent = true
set.cursorline = true
set.cursorlineopt = "number"
set.nu = true
set.relativenumber = true
set.scrolloff = 5
set.signcolumn = "yes"
set.wrap = false

-- Search
set.hlsearch = true
set.ignorecase = true
set.incsearch = true
set.showmatch = true
set.smartcase = true

-- Splits
set.splitright = true
set.splitbelow = true

-- Tabs
set.expandtab = true
set.shiftwidth = 4
set.softtabstop = 4
set.tabstop = 4

-- Timeout
set.timeout = true
set.timeoutlen = 500
set.updatetime = 50

-- Undo
set.backup = false
set.swapfile = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true
