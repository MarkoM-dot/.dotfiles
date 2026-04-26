return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    commit = "90cd6580",
    lazy = false,
    config = function()
      require("nvim-treesitter").install({
        "bash",
        "c",
        "css",
        "dockerfile",
        "go",
        "html",
        "javascript",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "racket",
        "rust",
        "sql",
        "typescript",
        "vim",
        "vimdoc",
      })
    end,
  },
}
