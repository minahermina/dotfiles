local opt = vim.opt

vim.g.mapleader = " "
vim.g.base16_colorspace = 256

vim.g.neovide_cursor_vfx_mode = "railgun"
vim.o.guifont = "IosevkaTerm Nerd Font:h9" -- text below applies for VimScript


opt.laststatus = 3 -- global statusline
opt.numberwidth = 1 -- global statusline
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
opt.mouse = "a"
-- opt.foldmethod = "syntax"
-- Assuming g:netrw_browsex_viewer is a global variable for a plugin
-- vim.g.netrw_browsex_viewer = "brave"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.ruler = true

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

opt.scrolloff = 8
opt.timeoutlen = 400
opt.updatetime = 250
opt.list = true
opt.listchars = { tab = '  ', leadmultispace = '» ', nbsp = '␣' }


-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

