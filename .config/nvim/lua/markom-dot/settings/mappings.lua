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
