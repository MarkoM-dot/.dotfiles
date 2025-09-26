local common = require("markom-dot.common")
local map = vim.keymap.set

map("i", "jj", "<Esc>")

map("n", "<leader><leader>", "<C-^>")
map("n", "<leader>h", common.command({ cmd = "wincmd", args = { "h" } }))
map("n", "<leader>j", common.command({ cmd = "wincmd", args = { "j" } }))
map("n", "<leader>k", common.command({ cmd = "wincmd", args = { "k" } }))
map("n", "<leader>l", common.command({ cmd = "wincmd", args = { "l" } }))
map("n", "<leader>n", common.command({ cmd = "Explore" }))
map("n", "<leader>T", common.command({ cmd = "InspectTree" }))
map("n", "<leader>t", function()
  vim.cmd.split()
  vim.cmd.term()
end, { desc = "Open terminal" })
map("n", "<C-k>", common.command({ cmd = "resize", args = { "+1" } }))
map("n", "<C-j>", common.command({ cmd = "resize", args = { "-1" } }))
map(
  "n",
  "<C-h>",
  common.command({ cmd = "resize", args = { "-1" }, mods = { vertical = true } })
)
map(
  "n",
  "<C-l>",
  common.command({ cmd = "resize", args = { "+1" }, mods = { vertical = true } })
)

map("t", "<Esc>", [[<C-\><C-n>]])

map("v", "<leader>f", function()
  -- Yank visually selected text into register
  vim.api.nvim_exec2('noau normal! "vy"', {})
  local register = vim.fn.getreg("v")
  local text = string.gsub(register, "\n", "")
  -- parse file format
  local filename, str_lineno, str_col = string.match(text, "([^:]+):?(%d*):?(%d*)$")
  local lineno = tonumber(str_lineno) or 1
  local col = tonumber(str_col) or 0
  -- find file and open the file at the line number and column
  local ok, err = pcall(function()
    vim.api.nvim_exec2(":find " .. filename, {})
    vim.api.nvim_win_set_cursor(0, { tonumber(lineno), tonumber(col) })
  end)
  if not ok then
    vim.notify("Failed to find file..." .. err, vim.log.levels.WARN)
  end
end)
