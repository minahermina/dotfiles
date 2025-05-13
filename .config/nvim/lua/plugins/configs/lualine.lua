-- local bg_dark = "#1f2335"
local fg = "#ffffff"
local bg_color = "#888888"
local black = "#070707"
require("lualine").setup {

    options = {
        globalstatus = true,
        -- theme = 'auto'
    },

    sections = {
        -- a b c     x y z
        lualine_a = {
            -- "mode",
            {
                "filename",
                path = 4,
                color = { bg = black, fg = '#ffffff' },
                separator = { left = '', right = ''}
            },
            {
                "progress", padding = { left = 1, right = 1 },
                color = { bg = black, fg = '#ffffff' },
            },

            {
                "branch",
                color = { bg = black, fg = '#ffffff' },
            },
        },

        lualine_c =  {
        },

        lualine_b = {
        },

        lualine_x = {
            {
                'searchcount',
                maxcount = 999,
                timeout = 10000,
                color = { bg = black, fg = '#ffffff' },
            },

        },

        lualine_y = {
            {
                "filetype",
                color = { bg = black, fg = '#ffffff' },
            },
        },

        lualine_z = {
            {
                'encoding',
                -- Show '[BOM]' when the file has a byte-order mark
                show_bomb = false,
                color = { bg = black, fg = '#ffffff' },
            },
        },

    },
}
