local name = "nvim-treesitter"

vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    name = name,
    version = "main",
  },
})

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == name then
      if not ev.data.active then
        vim.cmd.packadd(name)
      end
      vim.cmd("TSUpdate")
    end
  end,
})

require(name).install({
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
  "yaml",
})
