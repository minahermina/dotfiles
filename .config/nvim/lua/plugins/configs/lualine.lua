-- local bg_dark = "#1f2335"
local fg = "#ffffff"
local white = "#888888"
require("lualine").setup {

    options = {
        globalstatus = true,
        -- theme = 'auto'
    },

    sections = {
        -- a b c     x y z
        lualine_a = {
            -- "mode",
        },

        lualine_c =  {
            {
                use_mode_colors = true,
                buffers_color = {
                    active = { bg = '', fg = '#fff' },
                    inactive = { bg = '', fg = fg_gutter },
                }
            }
        },

        lualine_b = {
            {
                'buffers',
                mode = 2,
                use_mode_colors = true,
                buffers_color = {
                    active = { bg = '', fg = fg },
                    inactive = { bg = '', fg = white },
                }

            },
        },

        lualine_x = {
            {
                'searchcount',
                maxcount = 999,
                timeout = 10000,
            },

                "branch" ,
            { "filename", path = 4 },
        },

        lualine_y = {
            { "filetype" },
            { "progress", padding = { left = 1, right = 1 } },
            -- { "location", padding = { left = 0, right = 1 } },
        },

    },
}
