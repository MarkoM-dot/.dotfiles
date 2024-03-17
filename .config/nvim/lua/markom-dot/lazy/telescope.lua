return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local map = vim.keymap
    local command = require("markom-dot.common.commands").command

    map.set("n", "<leader>f", command({ cmd = "Telescope", args = { "find_files" } }))
    map.set("n", "<leader>z", command({ cmd = "Telescope", args = { "oldfiles" } }))
    map.set("n", "<leader>r", command({ cmd = "Telescope", args = { "live_grep" } }))
    map.set("n", "<leader>v", command({ cmd = "Telescope", args = { "git_commits" } }))
    map.set("n", "<leader>c", command({ cmd = "Telescope", args = { "git_bcommits" } }))
    map.set("n", "<leader>K", command({ cmd = "Telescope", args = { "keymaps" } }))
    map.set("n", "<leader>S", command({ cmd = "Telescope", args = { "git_status" } }))
  end,
}
