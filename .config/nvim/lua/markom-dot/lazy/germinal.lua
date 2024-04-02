return {
  {
    dir = "/home/markom-dot/research/germinal",
    event = "VeryLazy",
    config = function()
      local root_dir = "/home/markom-dot/notes"
      require("germinal").setup({
        root_dir = root_dir,
      })
      local builtin = require("telescope.builtin")
      vim.api.nvim_create_user_command("Notes", function()
        builtin.find_files({
          prompt_title = "Germinal Entries",
          cwd = root_dir,
        })
      end, { desc = "Find files in notes directory" })
      vim.api.nvim_create_user_command("GrepNotes", function()
        builtin.live_grep({
          prompt_title = "Germinal Entries",
          cwd = root_dir,
        })
      end, { desc = "Search through text in notes directory" })
    end,
  },
}
