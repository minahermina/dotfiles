require("nvim-treesitter.configs").setup {
    ensure_installed =
        {
            "c",
            "cpp",
            "java",
            "rust",
            "scheme",
            "python",
            "lua",
            "typst",
            "html",
            "css",
            "make",
            "toml",
            "markdown",
            "dockerfile",
        },

    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = { enable = true },
}
