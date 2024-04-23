vim.keymap.set("n", "<leader>x", function()
  local cmd = "write | source " .. vim.fn.expand("%:p")
  vim.api.nvim_exec2(cmd, {})
end, { buffer = true, silent = true })
