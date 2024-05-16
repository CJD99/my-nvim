vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- search settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

-- appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
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

-- folding options
vim.opt.fillchars = { fold = " " }
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99

vim.cmd [[ let &t_ut='' ]]

vim.cmd([[ autocmd VimEnter * set titlestring= ]])

vim.cmd([[
  augroup NoAutoComment
    au!
    au FileType * setlocal formatoptions-=cro
  augroup end
]])

