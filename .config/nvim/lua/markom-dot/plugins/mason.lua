vim.pack.add({
  {
    src = "https://github.com/mason-org/mason.nvim",
    name = "mason",
    version = "v2.3.1",
  },
})

require("mason").setup()
