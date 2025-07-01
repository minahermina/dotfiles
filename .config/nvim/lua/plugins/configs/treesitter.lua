require("nvim-treesitter.configs").setup {
  ensure_installed =
        {
        "c",
        "cpp",
        "toml",
        "python",
        "html",
        "java",
        "make",
        "markdown",
        "typst",
        },

  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
}
