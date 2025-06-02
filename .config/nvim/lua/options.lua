local opt = vim.opt
vim.g.mapleader = " "
vim.g.base16_colorspace = 256
vim.diagnostic.config({virtual_text=false})

opt.laststatus = 3 -- global statusline
opt.numberwidth = 1
opt.showmode = true
opt.cursorline = true
opt.cmdheight = 1
opt.guicursor= "i:block"

opt.timeoutlen=1000
opt.ttimeoutlen=0

-- Indenting
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.swapfile = false

opt.ignorecase = true
opt.smartcase = true
opt.mouse = ""

-- Numbers
opt.number = true
opt.relativenumber = true
opt.ruler = false

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.undofile = true

opt.scrolloff = 8
opt.updatetime = 250
opt.list = true

vim.opt.list = true


-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

