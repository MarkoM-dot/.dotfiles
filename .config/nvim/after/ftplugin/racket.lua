vim.treesitter.start()

local map = vim.keymap.set
map(
  "n",
  "<leader>x",
  ":w<CR>:!racket %<CR>",
  { buffer = true, silent = true, desc = "Run current Racket file" }
)
