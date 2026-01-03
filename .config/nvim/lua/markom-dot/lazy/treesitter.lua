return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
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
