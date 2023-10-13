vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs & identation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.smartindent = true

-- search settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

-- appearance
vim.opt.termguicolors = true
vim.opt.background = ""
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

-- backspace
vim.opt.backspace = "indent,eol,start"

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- others
vim.opt.swapfile = false
vim.opt.wrap = false
vim.o.mouse = 'a'
vim.o.undofile = true
vim.o.updatetime = 150
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.opt.isfname:append("@-@")
vim.opt.showmode = false
vim.opt.cmdheight = 0
vim.opt.iskeyword:append("-")
