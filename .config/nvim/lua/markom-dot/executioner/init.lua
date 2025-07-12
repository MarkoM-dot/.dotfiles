local args = { "echo", "hello", "from", "the", "executioner" }

vim.keymap.set("n", "<leader>e", function()
  -- set args to something else
  vim.ui.input({ prompt = "Enter command: " }, function(input)
    if input then
      args = vim.split(input, " ")
    end
  end)
end)

vim.keymap.set("n", "<leader>x", function()
  vim.api.nvim_cmd({ cmd = "term", args = args }, {})
end)
