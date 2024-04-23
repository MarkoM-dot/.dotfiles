return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      local map = vim.keymap.set
      local command = require("markom-dot.common.commands").command
      map("n", "<leader>B", command({ cmd = "Gitsigns", args = { "preview_hunk" } }))
      map("n", "<leader>b", command({ cmd = "Gitsigns", args = { "blame_line" } }))
    end,
  },
}
