local command = require("markom-dot.common.commands").command
local map = vim.keymap.set

map("i", "jj", "<Esc>")

map("n", "<leader><leader>", "<C-^>")
map("n", "<leader>h", command({ cmd = "wincmd", args = { "h" } }))
map("n", "<leader>j", command({ cmd = "wincmd", args = { "j" } }))
map("n", "<leader>k", command({ cmd = "wincmd", args = { "k" } }))
map("n", "<leader>l", command({ cmd = "wincmd", args = { "l" } }))
map("n", "<leader>n", command({ cmd = "Explore" }))
map("n", "<leader>T", command({ cmd = "InspectTree" }))
map("n", "<C-k>", command({ cmd = "resize", args = { "+1" } }))
map("n", "<C-j>", command({ cmd = "resize", args = { "-1" } }))
map(
  "n",
  "<C-h>",
  command({ cmd = "resize", args = { "-1" }, mods = { vertical = true } })
)
map(
  "n",
  "<C-l>",
  command({ cmd = "resize", args = { "+1" }, mods = { vertical = true } })
)

map("t", "<Esc>", [[<C-\><C-n>]])
