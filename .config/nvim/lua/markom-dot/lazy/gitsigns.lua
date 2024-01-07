return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      local map = vim.keymap
      map.set("n", "<leader>d", ":Gitsigns preview_hunk<CR>")
      map.set("n", "<leader>b", ":Gitsigns blame_line<CR>")
    end,
  },
}
