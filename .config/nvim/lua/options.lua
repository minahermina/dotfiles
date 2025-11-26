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
vim.opt.listchars = { tab = '> ', trail = '-', extends = '›', precedes = '‹', nbsp = '·' }

vim.g.neovide_cursor_trail_length = 0.0
vim.g.neovide_cursor_vfx_mode = "" -- Railgun particles behind cursor
vim.g.neovide_cursor_vfx_opacity = 0.0
vim.g.neovide_cursor_vfx_particle_lifetime = 0.0
vim.g.neovide_cursor_vfx_particle_density = 0.0
vim.g.neovide_cursor_vfx_particle_speed = 0.0
vim.g.neovide_cursor_vfx_particle_phase = 0.0
vim.g.neovide_cursor_vfx_particle_curl = 0.0
vim.g.neovide_cursor_unfocused_outline_width = 0.0
vim.g.neovide_scale_factor = 0.7

vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0
vim.g.neovide_cursor_animation_length = 0.01

if vim.g.neovide then
    vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end

vim.g.neovide_scroll_animation_length = 0.9

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

