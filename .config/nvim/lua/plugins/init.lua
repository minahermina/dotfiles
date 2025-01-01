local plugins = {

    -- Themes
    { "RRethy/base16-nvim" },
    {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
        "nvim-telescope/telescope.nvim",
        -- "ibhagwan/fzf-lua",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        -- configuration goes here
    },
},
    -- { "EdenEast/nightfox.nvim" },

    --[[ {
        "ej-shafran/compile-mode.nvim",
        tag = "v5.3.1",
        -- you can just use the latest version:
        branch = "latest",
        -- or the most up-to-date updates:
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- if you want to enable coloring of ANSI escape codes in
            -- compilation output, add:
            { "m00qek/baleia.nvim" },
        },
        config = function()
            ---@type CompileModeOpts
            vim.g.compile_mode = {
                -- to add ANSI escape code support, add:
                baleia_setup = true,
            }
        end
    }, ]]

    --[[ {
        "m00qek/baleia.nvim",
        version = "*",
        config = function()
            vim.g.baleia = require("baleia").setup({ log = 'INFO' })

            -- Command to colorize the current buffer
            vim.api.nvim_create_user_command("BaleiaColorize", function()
                vim.g.baleia.once(vim.api.nvim_get_current_buf())
            end, { bang = true })

            -- Command to show logs
            vim.api.nvim_create_user_command("BaleiaLogs", vim.g.baleia.logger.show, { bang = true })
        end,
    }, ]]


    { "tpope/vim-dadbod" },

    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },



    {
        "mg979/vim-visual-multi"
    },

    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
    },

    --[[ {
        'stevearc/dressing.nvim',
        config = function()
            require('plugins.configs.dressing')
        end
    }, ]]

    {
        "ahmedkhalf/project.nvim",
        lazy = false,
        config = function()
            require("project_nvim").setup {}
        end
    },

    -- fill git integration in neovim

    --[[ {
        "chrisgrieser/nvim-tinygit",
        ft = { "gitrebase", "gitcommit" }, -- so ftplugins are loaded
        dependencies = {
            "stevearc/dressing.nvim",
            "ibhagwan/fzf-lua",
            "rcarriga/nvim-notify", -- optional, but will lack some features without it
        },
    }, ]]

    --[[ {
        "rcarriga/nvim-notify", -- optional, but will lack some features without it
        config = function()
            require("notify").setup {
                stages = 'fade_in_slide_out',
                background_colour = 'FloatShadow',
                timeout = 3000,
            }
            vim.notify = require('notify')
        end

    }, ]]

    {
        'brenoprata10/nvim-highlight-colors',
        lazy = false,
        config = function()
            require('nvim-highlight-colors').setup {}
        end
    },

    -- :SymbolsOutline -> get list of symobls
    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require("symbols-outline").setup()
        end,
    },


    {
        'stevearc/oil.nvim',
        config = function()
            require("plugins.configs.oil");
        end,
    },

    {
        "iamcco/markdown-preview.nvim",
        lazy = true,
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        config = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    -- file tree
    --[[ {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require("plugins.configs.nvim-tree");
        end,
    }, ]]

    -- icons, for UI related plugins
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    },

    -- syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end,
    },

    -- buffer + tab line
    -- {
    --     "akinsho/bufferline.nvim",
    --     event = "BufReadPre",
    --     config = function()
    --         require "plugins.configs.bufferline"
    --     end,
    -- },

    {
        'f-person/git-blame.nvim',
        lazy = true,
        cmd = { "GitBlameEnable", "GitBlameDisable" },
        config = function()
            -- require('gitblame').setup()
        end,
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require "plugins.configs.lualine"
        end,
    },

    -- we use cmp plugin only when in insert mode
    -- so lets lazyload it at InsertEnter event, to know all the events check h-events
    -- completion , now all of these plugins are dependent on cmp, we load them after cmp
    --[[ {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- cmp sources
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            -- "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",

            -- snippets
            --list of default snippets
            "rafamadriz/friendly-snippets",

            -- snippets engine
            {
                "L3MON4D3/LuaSnip",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },

        },
        config = function()
             require "plugins.configs.cmp"
        end,
    },  ]]

    -- Mason (package manager for LSP servers, Linters, Formatters, DAP servers)
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = { "Mason", "MasonInstall" },
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },

    -- lsp
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require "plugins.configs.lspconfig"
        end,
    },

    -- formatting , linting
    -- {
    --     "stevearc/conform.nvim",
    --     lazy = true,
    --     config = function()
    --         require "plugins.configs.conform"
    --     end,
    -- },


    -- fzf-lua
    {
        "ibhagwan/fzf-lua",
        config = function()
            require("plugins.configs.fzf-lua")
        end,
    },

    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },

     -- Telescope
     --[[ {
         "nvim-telescope/telescope.nvim",
         cmd = "Telescope",
         config = function()
             require "plugins.configs.telescope"
         end,
     }, ]]


    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("gitsigns").setup()
        end,
    },

    -- comment plugin
    {
        "numToStr/Comment.nvim",
        lazy = true,
        config = function()
            -- require('Comment').setup()
        end,
    },

    --[[ {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function()
            require "lsp_signature".on_attach()
        end,
    }, ]]
}

require("lazy").setup(plugins, require "plugins.configs.lazy")
-- require("plugins.configs.lsp-signature")
