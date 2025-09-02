local plugins = {
    {
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
    },

    {
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
        "minahermina/project.nvim",
        lazy = false,
        config = function()
            require("project_nvim").setup {}
        end
    },

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

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",

        },
        config = function()
            require("plugins.configs.cmp")
        end,
    },

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
}

require("lazy").setup(plugins, require "plugins.configs.lazy")
-- require("plugins.configs.lsp-signature")
