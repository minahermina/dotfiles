local opt = vim.opt
vim.g.mapleader = " "
vim.g.base16_colorspace = 256
vim.diagnostic.config({virtual_text=false})


if vim.g.neovide then
    -- Font and cursor settings
    vim.g.gui_font_face = "IosevkaTerm Nerd Font"
    vim.g.gui_font_default_size = 10
    vim.g.gui_font_size = vim.g.gui_font_default_size
    vim.o.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)

    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_cursor_vfx_particle_speed = 1.0
    vim.g.neovide_cursor_animation_length = 0.02

    local function RefreshGuiFont()
        vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
    end

    local function ResizeGuiFont(delta)
        vim.g.gui_font_size = vim.g.gui_font_size + delta
        RefreshGuiFont()
    end

    local function ResetGuiFont()
        vim.g.gui_font_size = vim.g.gui_font_default_size
        RefreshGuiFont()
    end

    ResetGuiFont()

    -- Keymaps for font resizing
    local opts = { noremap = true, silent = true }
    vim.keymap.set({'n', 'i'}, "<C-+>", function() ResizeGuiFont(1) end, opts)
    vim.keymap.set({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end, opts)
    vim.keymap.set({'n', 'i'}, "<C-BS>", function() ResetGuiFont() end, opts)
end




-- vim.g.neovide_scale_factor = 0.7

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
            opt.listchars = { tab = '  ', leadmultispace = '·', nbsp = '␣' , trail =  ' '    }
-- opt.listchars = { tab = '   ', leadmultispace = ' ', nbsp = '␣',   trail = '•'  }                    


-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

