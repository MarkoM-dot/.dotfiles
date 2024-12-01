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

    map("v", "<leader>r", function()
      -- Set visually selected text in register and pass it to live_grep
      vim.api.nvim_exec2('noau normal! "vy"', {})
      local register = vim.fn.getreg("v")
      local text = string.gsub(register, "\n", "")
      return builtin.grep_string({
        prompt_title = "Visual Grep",
        default_text = text,
      })
    end, {})

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

    vim.api.nvim_create_user_command("FindPEP", function()
      builtin.find_files({
        prompt_title = "Python Enhancement Proposals",
        cwd = "~/oss/peps/peps/",
      })
    end, { desc = "Find PEP files." })

    vim.api.nvim_create_user_command("GrepPEP", function()
      builtin.live_grep({
        prompt_title = "Python Enhancement Proposals",
        cwd = "~/oss/peps/peps/",
      })
    end, { desc = "Grep PEP files." })

    vim.api.nvim_create_user_command("FindPythonDoc", function()
      builtin.find_files({
        prompt_title = "Python Documentation",
        cwd = "~/oss/cpython/Doc",
      })
    end, { desc = "Find Python documentation files." })

    vim.api.nvim_create_user_command("GrepPythonDoc", function()
      builtin.live_grep({
        prompt_title = "Python Documentation",
        cwd = "~/oss/cpython/Doc/",
      })
    end, { desc = "Grep Python Documentation files." })
  end,
}
