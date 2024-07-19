local vo = vim.opt

vo.clipboard = "unnamedplus"
vo.completeopt = "menuone,noselect"
vo.termguicolors = true
vo.signcolumn = "yes"
vo.showcmd = false
vo.cmdheight = 0
vo.report = 10

vo.updatetime = 50
vo.timeout = true
vo.timeoutlen = 500

vo.nu = true
vo.relativenumber = true
vo.cursorline = true
vo.cursorlineopt = "number"

vo.tabstop = 4
vo.softtabstop = 4
vo.shiftwidth = 4
vo.expandtab = true

vo.smartindent = true
vo.breakindent = true

vo.wrap = false

vo.swapfile = false
vo.backup = false
vo.undodir = os.getenv("HOME") .. "/.vim/undodir"
vo.undofile = true

vo.hlsearch = true
vo.incsearch = true
vo.showmatch = true
vo.ignorecase = true
vo.smartcase = true
