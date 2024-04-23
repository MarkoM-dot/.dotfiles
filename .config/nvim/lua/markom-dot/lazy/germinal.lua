return {
  {
    dir = "/home/markom-dot/research/germinal",
    event = "VeryLazy",
    config = function()
      local root_dir = "/home/markom-dot/notes"
      local germinal = require("germinal")
      local example = require("germinal.examples")
      germinal.setup({
        root_dir = root_dir,
        sections = {
          journal = {
            filetype = "markdown",
            path = example.journal_path,
            filename = example.day_filename,
            prepend_lines = example.journal_prepend_lines,
          },
          meetings = {
            filetype = "markdown",
            path = example.meeting_path,
            filename = example.day_filename,
            prepend_lines = example.meeting_prepend_lines,
            append_lines = example.meeting_append_lines,
          },
          ["reading-list"] = {
            filetype = "markdown",
            path = function()
              return "/reading-list/"
            end,
            filename = function()
              return "index.md"
            end,
            prepend_lines = function()
              return { "# Reading List", "", "- [ ] " }
            end,
            append_lines = function()
              return { "- [ ] " }
            end,
          },
          lambdabread = {
            filetype = "markdown",
            path = function()
              return "/lambdabread/"
            end,
            filename = function()
              return "index.md"
            end,
            prepend_lines = function()
              return { "# Lambda Bread", "" }
            end,
            append_lines = example.meeting_append_lines,
          },
        },
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
