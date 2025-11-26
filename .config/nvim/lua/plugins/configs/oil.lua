require("oil").setup({
    constrain_cursor = "name",
    use_default_keymaps = false,
    watch_for_changes = true,

    keymaps = {
        ["<CR>"] = "actions.select",
        ["g."] = "actions.toggle_hidden",
        ["<leader>h"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        ["<leader>v"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
        ["q"] = "actions.close",
    },

    view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
    },

    --[[ float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 120,
        max_height = 40,
        border = "rounded",
        win_options = {
            winblend = 0,
        },
    }, ]]

    columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
})
