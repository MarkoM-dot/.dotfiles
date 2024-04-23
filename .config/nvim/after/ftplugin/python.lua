vim.keymap.set("n", "<leader>x", function()
  local cmd = "write | split | term python3 " .. vim.fn.shellescape(vim.fn.expand("%"))
  vim.api.nvim_exec2(cmd, {})
end, { buffer = true, silent = true })
