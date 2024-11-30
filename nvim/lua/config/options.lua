local vo = vim.opt

vo.clipboard = "unnamedplus"
vo.completeopt = "menu,menuone,noselect"
vo.scrolloff = 5
vo.signcolumn = "yes"
vo.termguicolors = true

vo.cmdheight = 0
vo.report = 10
vo.showcmd = false
vo.showmode = false

vo.timeout = true
vo.timeoutlen = 500
vo.updatetime = 50

vo.cursorline = true
vo.cursorlineopt = "number"
vo.nu = true
vo.relativenumber = true

vo.expandtab = true
vo.shiftwidth = 4
vo.softtabstop = 4
vo.tabstop = 4

vo.breakindent = true
vo.smartindent = true

vo.splitright = true
vo.splitbelow = true

vo.wrap = false

vo.backup = false
vo.swapfile = false
vo.undodir = os.getenv("HOME") .. "/.vim/undodir"
vo.undofile = true

vo.hlsearch = true
vo.ignorecase = true
vo.incsearch = true
vo.showmatch = true
vo.smartcase = true
