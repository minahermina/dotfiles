require("fzf-lua").setup({
    'default',
    fzf_opts = {
        ["--ansi"]           = true,
        ["--info"]           = "inline-right",
        ["--height"]         = "100%",
        ["--layout"]         = "reverse",
        ["--border"]         = "none",
        ["--highlight-line"] = true,
    },
    oldfiles = {
        -- include_current_session = true,
    },

    winopts = {
        width = 0.7,
        height = 0.6,
        border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        preview = {
            hidden = 'hidden',
        }
    },

})
