return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local map = vim.keymap.set
    local builtin = require("telescope.builtin")

    map("n", "<leader>f", builtin.find_files, {})
    map("n", "<leader>z", builtin.oldfiles, {})
    map("n", "<leader>r", builtin.live_grep, {})
    map("n", "<leader>v", builtin.git_commits, {})
    map("n", "<leader>c", builtin.git_bcommits, {})
    map("n", "<leader>K", builtin.keymaps, {})
    map("n", "<leader>S", builtin.git_status, {})

    vim.api.nvim_create_user_command("FindConfig", function()
      builtin.find_files({
        prompt_title = "nvim config",
        cwd = vim.fn.stdpath("config"),
      })
    end, { desc = "Find files in nvim config." })

    vim.api.nvim_create_user_command("GrepConfig", function()
      builtin.live_grep({
        prompt_title = "nvim config",
        cwd = vim.fn.stdpath("config"),
      })
    end, { desc = "Grep files in nvim config." })
  end,
}
