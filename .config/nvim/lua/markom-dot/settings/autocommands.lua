local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  desc = "Briefly highlight yanked text.",
  pattern = "*",
})

local terminal_group =
  vim.api.nvim_create_augroup("Terminal settings", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  command = "setlocal nonumber norelativenumber",
  group = terminal_group,
  desc = "No line numbers in terminal mode",
  pattern = "term://*",
})
