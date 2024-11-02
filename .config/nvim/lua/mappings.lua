local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim" -- path where its going to be installed
vim.opt.rtp:prepend(lazypath)
require "plugins"


local map = vim.keymap.set
local options = { noremap = true, silent = true }
local fzf_lua = require('fzf-lua')

map("n", "<Esc>", "<cmd> :noh <CR>")
map("i", "<C-e>", "<C-o>w")

map("i", "<C-f>", "<Right>")
map("i", "<C-b>", "<Left>")

map("n", "<leader>q", "<cmd> :bd! <CR>",            { desc = "Close current buffer" })

-- Move group of lines
map('v', "K", ":m '<-2<CR>gv=gv", options)
map('v', "J", ":m '>+1<CR>gv=gv", options)

-- Copy to System Clipboard
map({ 'n', 'v' }, "<leader>z", "\"+y", { desc = "Copy Text to System Clipboard" })

-- keeps what in paste register as is is 
map('v', "<leader>p", "\"_dP" )
map('v', "<leader>p", "\"_dP" )

-- Delete forever !!!
map({ 'n', 'v' }, "<leader>d", "\"_d",{ desc = "Delete Text forever" })

-- Matching Pairs
map('i' , "(", "()<Left>")
map('i' , "[", "[]<Left>")
map('i' , "{", "{}<Left>")
map('i' , "'", "''<Left>")
map('i' , "\"", "\"\"<Left>")
map('i' , "`", "``<Left>")

-- Buffers
map("n", "<Tab>", "<cmd> bnext <CR>")
map('n', '<leader>1', '<Cmd>LualineBuffersJum 1<CR>', options)
map('n', '<leader>2', '<Cmd>LualineBuffersJum 2<CR>', options)
map('n', '<leader>3', '<Cmd>LualineBuffersJum 3<CR>', options)
map('n', '<leader>4', '<Cmd>LualineBuffersJum 4<CR>', options)
map('n', '<leader>5', '<Cmd>LualineBuffersJum 5<CR>', options)
map('n', '<leader>6', '<Cmd>LualineBuffersJum 6<CR>', options)
map('n', '<leader>7', '<Cmd>LualineBuffersJum 7<CR>', options)
map('n', '<leader>8', '<Cmd>LualineBuffersJum 8<CR>', options)

-- Replacing current word with another
map({'n',  'x'}, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],  { desc = "Replace Word Under cursor" })

-- comment.nvim
map("n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end ,                 { desc = "Comment Current line" })
map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>" , { desc = "Comment Current Block" })

-- Fzf-lua & Telescope Keymaps 
map({ "n", "v", "i" }, "<C-x><C-f>", function() fzf_lua.complete_path() end , { desc = "Fuzzy complete path" }                    , options)
map('n', "<leader>ff",  function() fzf_lua.files() end                      , { desc = "Find files" }                             , options)
map('n', "<leader>fl",  function() fzf_lua.resume() end                     , { desc = "Resume fzf_lua" }                         , options)
map('n', "<leader>fg",  function() fzf_lua.live_grep_resume() end           , { desc = "Live Grep with last search" }             , options)
map('n', "<leader>fh",  function() fzf_lua.files({cwd = "~"}) end           , { desc = "Find files from ~" }                      , options)
map('n', "<leader>fb",  function() fzf_lua.buffers() end                    , { desc = "List Buffers" }                           , options)
map('n', "<leader>fr",  function() fzf_lua.registers() end                  , { desc = "Show Registers" }                         , options)
map('n', "<leader>fs",  function() fzf_lua.lsp_document_symbols() end       , { desc = "List Document Symbols" }                  , options)
map('n', "<leader>fo",  function() fzf_lua.oldfiles() end                   , { desc = "Search old files" }                       , options)
-- map('n', "<leader>lr",  function() fzf_lua.lsp_references() end         , { desc = "List References"                        , options)
map('n', "<leader>fm" ,   function() fzf_lua.man_pages() end                , { desc = "Show man_pages" }                         , options)
map('n', "<leader>fc" ,   function() fzf_lua.command_history() end          , { desc = "Show Command History" }                   , options)
map("n", "<leader>S" ,  "<cmd>SymbolsOutline <cr>"                          , { desc = "Start SymbolsOutline" }                   , options)
map("n", "gr", vim.lsp.buf.references                                       , { desc = "Go to references" }                       , options)

-- Git keymaps
map("n", "<leader>gd", "<cmd> Gitsigns diffthis <CR>"                   , { desc = "Diff Buffer" })
map("n", "<leader>gr", "<cmd> Gitsigns reset_buffer <CR>"               , { desc = "Reset Buffer" })
map("n", "<leader>ga", "<cmd> Gitsigns stage_buffer<CR>"                , { desc = "Stage Buffer" })
map("n", "<leader>gs", "<cmd> FzfLua git_status <CR>"                   , { desc = "Display git status" })
map("n", "<leader>gc", function() require("tinygit").smartCommit() end  , { desc = "git commit " })
map("n", "<leader>gp", function() require("tinygit").push() end         , { desc = "git push" })

-- Navigate Windows from terminal mode
-- map('t', '<Esc>', '<C-\\><C-n>'       , options)
map('t', '<C-h>', '<C-\\><C-n><C-w>h' , options)
map('t', '<C-j>', '<C-\\><C-n><C-w>j' , options)
map('t', '<C-k>', '<C-\\><C-n><C-w>k' , options)
map('t', '<C-l>', '<C-\\><C-n><C-w>l' , options)

-- Resize Buffers
map("n", "<Up>"    , ":resize +3<CR>"      , options)
map("n", "<Down>"  , ":resize -3<CR>"      , options)
map("n", "<Right>" , ":vert resize -3<CR>" , options)
map("n", "<Left>"  , ":vert resize +3<CR>" , options)

-- Stay in indent mode  
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)

-- To Move among windows
map("n", "<C-h>", ":wincmd h <cr>")
map("n", "<C-j>", ":wincmd j <cr>")
map("n", "<C-k>", ":wincmd k <cr>")
map("n", "<C-l>", ":wincmd l <cr>")

-- To Move among nvim and tmux panes
map("n", "<C-h>", ":TmuxNavigateLeft  <cr>")
map("n", "<C-j>", ":TmuxNavigateDown  <cr>")
map("n", "<C-k>", ":TmuxNavigateUp    <cr>")
map("n", "<C-l>", ":TmuxNavigateRight <cr>")

map("n", "-", function() require("oil").toggle_float() end, { desc = "Open parent directory as a Buffer" })

local build = require("CustomScripts.build")

map("n", "<F7>", function () build.test() end, options)

local functions = require('my_functions')

-- Opening a termial window from Nvim (just a tmux pane)
map('n', '<leader>,' , function () functions.toggle_quickfix() end  , { desc = "Toggle Quickfix list " }                          , options)
map('n', '<leader>n' , ":cnext <CR>"                                , { desc = "Toggle Quickfix list " }                          , options)
map('n', '<leader>m' , ":cpre <CR>"                                 , { desc = "Toggle Quickfix list " }                          , options)
map('n', '<leader>tv', function () functions.open_tmux_pane(1) end  , { desc = "Open Vertical Tmux Pane in current file dir" }    , options)
map('n', '<leader>th', function () functions.open_tmux_pane(0) end  , { desc = "Open Horizontal Tmux Pane in current file dir" }    , options)
map('n', '<leader>ee', ":VimuxPromptCommand <CR>"                   , { desc = "Prompt command to run in tmux pane" }             , options)
map('n', '<leader>ei', ":VimuxZoomRunner <CR>"                      , { desc = "Open Vertical Tmux Pane in current file dir" }    , options)
map('n', '<leader>et', ":VimuxTogglePane <CR>"                      , { desc = "Open Vertical Tmux Pane in current file dir" }    , options)
