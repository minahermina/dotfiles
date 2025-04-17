require "plugins"

local map = vim.keymap.set
local options = { noremap = true, silent = true }
local fzf_lua = require('fzf-lua')

map("n", "<Esc>", "<cmd> :noh <CR>")
map("i", "<C-e>", "<C-o>w")

-- Emacs like Movement in Insert mode
map('i', '<C-f>', '<Right>')
map('i', '<C-b>', '<Left>')

map('n', 'gl', '$')
map('n', 'gh', '0')

map('n', '<leader>q', '<cmd> :bd! <CR>',     { desc = 'Close current buffer' })
map({'n', 'i'}, '<M-w>', '<cmd>w<CR><Esc>',  { desc = 'Write File' })


-- Move group of lines
map('v', 'K', ":m '<-2<CR>gv=gv", options)
map('v', 'J', ":m '>+1<CR>gv=gv", options)

-- Copy to System Clipboard
map({ 'n', 'v' }, '<leader>z', '\"+y', { desc = 'Copy Text to System Clipboard' })

-- keeps what in paste register as is is 
map('v', '<leader>p', '\"_dP' )
map('v', '<leader>p', '\"_dP' )

-- Delete forever !!!
map({ 'n', 'v' }, "<leader>d", "\"_d",{ desc = "Delete Text forever" })

-- Matching Pairs
map('i' , '(', '()<Left>')
map('i' , '[', '[]<Left>')
map('i' , '{', '{}<Left>')
map('i' , "'", "''<Left>")
map('i' , "\"", "\"\"<Left>")
map('i' , '`', '``<Left>')

-- Buffers
map('n', '<Tab>', '<cmd> bnext <CR>', options)
map('n', '<leader>1', '<Cmd>LualineBuffersJum 1<CR>', options)
map('n', '<leader>2', '<Cmd>LualineBuffersJum 2<CR>', options)
map('n', '<leader>3', '<Cmd>LualineBuffersJum 3<CR>', options)
map('n', '<leader>4', '<Cmd>LualineBuffersJum 4<CR>', options)
map('n', '<leader>5', '<Cmd>LualineBuffersJum 5<CR>', options)
map('n', '<leader>6', '<Cmd>LualineBuffersJum 6<CR>', options)
map('n', '<leader>7', '<Cmd>LualineBuffersJum 7<CR>', options)
map('n', '<leader>8', '<Cmd>LualineBuffersJum 8<CR>', options)

map('n', "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],  { desc = "Replace Word Under cursor" })
map('x', "<leader>s", [["zy:%s/<C-r>z/<C-r>z/gI<Left><Left><Left>]],           { desc = "Replacing visually highlighted text" })

map('n', '<leader>gg', ':silent grep <C-r><C-w> <CR>',                { desc = 'Grep word Under cursor' }, options)
map('v', '<leader>gg', 'y:silent grep -rn "<C-R>""<CR>',              { desc = 'Grep highlighted Text' }, options)

-- comment.nvim
map('n', '<leader>/', function() require('Comment.api').toggle.linewise.current() end ,                  { desc = 'Comment Current line' })
map('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>" , { desc = 'Comment Current Block' })

-- Fzf-lua & Telescope Keymaps
map({ 'n', 'v', 'i' }, '<M-f>', function() fzf_lua.complete_path() end , { desc = 'Fuzzy complete path' }                    , options)
map('n', '<leader>ff',  function() fzf_lua.files() end                      , { desc = 'Find files' }                             , options)
map('n', '<leader>fl',  function() fzf_lua.resume() end                     , { desc = 'Resume fzf_lua' }                         , options)
map('n', '<leader>fg',  function() fzf_lua.live_grep_resume() end           , { desc = 'Live Grep with last search' }             , options)
map('n', '<leader>fh',  function() fzf_lua.files({cwd = '~'}) end           , { desc = 'Find files from ~' }                      , options)
map('n', '<leader>fb',  function() fzf_lua.buffers() end                    , { desc = 'List Buffers' }                           , options)
map('n', '<leader>fr',  function() fzf_lua.registers() end                  , { desc = 'Show Registers' }                         , options)
map('n', '<leader>fs',  function() fzf_lua.lsp_document_symbols() end       , { desc = 'List Document Symbols' }                  , options)
map('n', '<leader>fo',  function() fzf_lua.oldfiles() end                   , { desc = 'Search old files' }                       , options)
-- map('n', '<leader>lr',  function() fzf_lua.lsp_references() end         , { desc = 'List References'                        , options)
map('n', '<leader>fm' ,   function() fzf_lua.man_pages() end                , { desc = 'Show man_pages' }                         , options)
map('n', '<leader>fc' ,   function() fzf_lua.command_history() end          , { desc = 'Show Command History' }                   , options)
map('n', '<leader>S' ,  '<cmd>SymbolsOutline <cr>'                          , { desc = 'Start SymbolsOutline' }                   , options)
map('n', 'gr', vim.lsp.buf.references                                       , { desc = 'Go to references' }                       , options)

-- Git keymaps
map('n', '<leader>gd', '<cmd> Gitsigns diffthis <CR>'     , { desc = 'Diff Buffer' })
map('n', '<leader>gr', '<cmd> Gitsigns reset_buffer <CR>' , { desc = 'Reset Buffer' })
map('n', '<leader>ga', '<cmd> Gitsigns stage_buffer<CR>'  , { desc = 'Stage Buffer' })
map('n', '<leader>gs', '<cmd> FzfLua git_status <CR>'     , { desc = 'Display git status' })

-- Navigate Windows from terminal mode
-- map('t', '<Esc>', '<C-\\><C-n>'       , options)
map('t', '<C-h>', '<C-\\><C-n><C-w>h' , options)
map('t', '<C-j>', '<C-\\><C-n><C-w>j' , options)
map('t', '<C-k>', '<C-\\><C-n><C-w>k' , options)
map('t', '<C-l>', '<C-\\><C-n><C-w>l' , options)
map('t', '<leader>e', '<C-\\><C-n>' , options)

-- Resize Buffers
map('n', '<M-K>' , ':resize +3<CR>'      , options)
map('n', '<M-J>' , ':resize -3<CR>'      , options)
map('n', '<M-L>' , ':vert resize -3<CR>' , options)
map('n', '<M-H>' , ':vert resize +3<CR>' , options)

-- Stay in indent mode  
map('v', '<', '<gv', options)
map('v', '>', '>gv', options)

-- To Move among windows
map('n', '<C-h>', ':wincmd h <cr>')
map('n', '<C-j>', ':wincmd j <cr>')
map('n', '<C-k>', ':wincmd k <cr>')
map('n', '<C-l>', ':wincmd l <cr>')

-- To Move among nvim and tmux panes
map('n', '<C-h>', ':TmuxNavigateLeft  <cr>')
map('n', '<C-j>', ':TmuxNavigateDown  <cr>')
map('n', '<C-k>', ':TmuxNavigateUp    <cr>')
map('n', '<C-l>', ':TmuxNavigateRight <cr>')
map('n', '<C-]>', ':TmuxNavigatePrevious <cr>')

map('n', '-', function() require('oil').open_float() end, { desc = 'Open parent directory as a Buffer' })

local build = require('CustomScripts.build')

map('n', '<leader>e', function () build.test() end, options)

vim.keymap.set('n', '<leader>r', function()
  vim.cmd('copen')
  vim.cmd('make')
end, options)

map('n', '<leader>c', function () build.run_shell_command() end, options)

map('n', '<leader>ww', ":Compile<CR>" , options)
map('n', '<leader>wr', ":Recompile<CR>"   , options)

local functions = require('my_functions')

map('n', '<leader>,' , function () functions.toggle_quickfix() end  ,{ desc = 'Toggle Quickfix list ' }                          ,options)

-- C-r in quickfixt list to run :silent make
vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.keymap.set(
            "n",              -- Normal mode
            "<C-r>",          -- Ctrl-R
            ":silent make<CR>",      -- Runs :make
            { buffer = true, silent = true } -- Buffer-local and silent
        )
    end,
})

map('n', '<leader>n' , ':cnext <CR>'                                ,{ desc = 'Move to next error' }                             ,options)
map('n', '<leader>m' , ':cpre <CR>'                                 ,{ desc = 'Move to previous error' }                         ,options)
map('n', '<leader>tv', function () functions.open_tmux_pane(1) end  ,{ desc = 'Open Vertical Tmux Pane in current file dir' }    ,options)
map('n', '<leader>th', function () functions.open_tmux_pane(0) end  ,{ desc = 'Open Horizontal Tmux Pane in current file dir' }  ,options)
