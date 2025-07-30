local M = {}

local group = vim.api.nvim_create_augroup("AbstractAutoCmdsGroup", { clear = true })

-- -----------------------------------------------------

function M.create_autocmd(events, opts)
    opts = vim.tbl_extend("force", opts, { group = group })
    vim.api.nvim_create_autocmd(events, opts)
end

-- -----------------------------------------------------

function M.opts_extend(default, opts)
    return vim.tbl_extend("force", default, opts ~= nil and opts or {})
end

-- Compile dmenu, dwm, and st after :w in config.def.h || config.h
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = {"config.def.h"},
    callback = function()
        local dir = vim.fn.expand('%:p:h')
        vim.cmd('cd ' .. dir)
        vim.opt.makeprg = 'rm -rf config.h && doas make install clean'
        vim.cmd('silent make')
        vim.opt.makeprg = 'make'
    end,
})


vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Auto-generate ctags when saving C, C++, Python, and Java files
--[[ vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {"*.c", "*.h", "*.cpp", "*.hpp", "*.cc", "*.java"},
  callback = function()
    local exclude_dirs = {
      "node_modules",
      ".git",
      "build",
      "dist",
      "vendor",
      "venv",
      "__pycache__",
      "target"  -- for Rust/Java projects
    }

    local exclude_args = ""
    for _, dir in ipairs(exclude_dirs) do
      exclude_args = exclude_args .. "--exclude=" .. dir .. " "
    end

    -- Get the current working directory
    local cwd = vim.fn.getcwd()

    -- Run ctags in the current working directory
    vim.fn.jobstart("cd " .. vim.fn.shellescape(cwd) .. " && ctags -R " .. exclude_args .. " .", {detach = true})
  end,
  desc = "Auto-generate ctags for C, C++, Python, and Java files on save",
}) ]]

-- Compiles any latex file
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = {"*.tex", "*.latex"},
    callback = function()
        -- Get the current file's directory and filename
        local dir = vim.fn.expand('%:p:h')  -- Directory of the current file
        local file = vim.fn.expand('%:t')  -- Filename of the current file
        vim.cmd('cd ' .. dir)
        vim.opt.makeprg = "pdflatex -interaction=nonstopmode " .. file
        vim.cmd('silent make!')
        vim.opt.makeprg = 'make'
    end,
})

-- -----------------------------------------------------
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup('my-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- -----------------------------------------------------
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
    desc = "don't auto comment new line",
    pattern = "*",
    group = vim.api.nvim_create_augroup('dont-comment', { clear = true }),
    command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})


-- -----------------------------------------------------
vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})
-- --------------------------------------------------

return M
