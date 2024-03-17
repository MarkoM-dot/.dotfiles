return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("gitsigns").setup()
      local map = vim.keymap
      local command = require("markom-dot.common.commands").command
      map.set(
        "n",
        "<leader>B",
        command({ cmd = "Gitsigns", args = { "preview_hunk" } })
      )
      map.set("n", "<leader>b", command({ cmd = "Gitsigns", args = { "blame_line" } }))
    end,
  },
}
