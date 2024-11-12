require("fzf-lua").setup({
    'fzf-tmux',
    fzf_opts = {
        ["--ansi"]           = true,
        ["--info"]           = "inline-right",
        ["--height"]         = "100%",
        ["--layout"]         = "reverse",
        ["--border"]         = "none",
        ["--highlight-line"] = true,
    },
    oldfiles = {
        include_current_session = true,
    },

    winopts = {
        width = 0.7,
        border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
    },

    preview_wrap = 'nowrap:hidden',
})
