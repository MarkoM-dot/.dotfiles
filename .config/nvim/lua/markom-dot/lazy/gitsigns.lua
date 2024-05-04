return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      local map = vim.keymap.set
      local common = require("markom-dot.common")
      map(
        "n",
        "<leader>B",
        common.command({ cmd = "Gitsigns", args = { "preview_hunk" } })
      )
      map(
        "n",
        "<leader>b",
        common.command({ cmd = "Gitsigns", args = { "blame_line" } })
      )
    end,
  },
}
