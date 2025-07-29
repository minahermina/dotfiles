-- local bg_dark = "#1f2335"
local fg = "#ffffff"
local bg_color = "#070707"

local custom_theme = {
    normal = {
        a = { bg = bg_color, fg = fg },
        b = { bg = bg_color, fg = fg },
        c = { bg = bg_color, fg = fg },
        x = { bg = bg_color, fg = fg },
        y = { bg = bg_color, fg = fg },
        z = { bg = bg_color, fg = fg },
    },
    insert = {
        a = { bg = bg_color, fg = fg },
        b = { bg = bg_color, fg = fg },
        c = { bg = bg_color, fg = fg },
        x = { bg = bg_color, fg = fg },
        y = { bg = bg_color, fg = fg },
        z = { bg = bg_color, fg = fg },
    },
    visual = {
        a = { bg = bg_color, fg = fg },
        b = { bg = bg_color, fg = fg },
        c = { bg = bg_color, fg = fg },
        x = { bg = bg_color, fg = fg },
        y = { bg = bg_color, fg = fg },
        z = { bg = bg_color, fg = fg },
    },
    replace = {
        a = { bg = bg_color, fg = fg },
        b = { bg = bg_color, fg = fg },
        c = { bg = bg_color, fg = fg },
        x = { bg = bg_color, fg = fg },
        y = { bg = bg_color, fg = fg },
        z = { bg = bg_color, fg = fg },
    },
    command = {
        a = { bg = bg_color, fg = fg },
        b = { bg = bg_color, fg = fg },
        c = { bg = bg_color, fg = fg },
        x = { bg = bg_color, fg = fg },
        y = { bg = bg_color, fg = fg },
        z = { bg = bg_color, fg = fg },
    },
    inactive = {
        a = { bg = bg_color, fg = fg },
        b = { bg = bg_color, fg = fg },
        c = { bg = bg_color, fg = fg },
        x = { bg = bg_color, fg = fg },
        y = { bg = bg_color, fg = fg },
        z = { bg = bg_color, fg = fg },
    },
}

require("lualine").setup {
    options = {
        globalstatus = true,
        theme = custom_theme
    },
    sections = {
        -- a b c     x y z
        lualine_a = {
            -- "mode",
            {
                "filename",
                icons_enabled = true,
                path = 4,
                separator = { left = '', right = ''}
            },
            {
                "progress", padding = { left = 1, right = 1 },
            },
            {
                "branch",
            },
        },
        lualine_c =  {
        },
        lualine_b = {
        },
        lualine_x = {
            {
                'location',
            },
            {
                'searchcount',
                maxcount = 999,
                timeout = 10000,
            },
        },
        lualine_y = {
            {
                "filetype",
            },
        },
        lualine_z = {
            {
                'encoding',
                -- Show '[BOM]' when the file has a byte-order mark
                show_bomb = false,
            },
        },
    },
}
