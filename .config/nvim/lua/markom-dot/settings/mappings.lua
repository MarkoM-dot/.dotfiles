local command = require("markom-dot.common.commands").command
local map = vim.keymap

map.set("i", "jj", "<Esc>")

map.set("n", "<leader><leader>", "<C-^>")
map.set("n", "<leader>h", command({ cmd = "wincmd", args = { "h" } }))
map.set("n", "<leader>j", command({ cmd = "wincmd", args = { "j" } }))
map.set("n", "<leader>k", command({ cmd = "wincmd", args = { "k" } }))
map.set("n", "<leader>l", command({ cmd = "wincmd", args = { "l" } }))
map.set("n", "<leader>n", command({ cmd = "Explore" }))
map.set("n", "<leader>T", command({ cmd = "InspectTree" }))
map.set("n", "<C-k>", command({ cmd = "resize", args = { "+1" } }))
map.set("n", "<C-j>", command({ cmd = "resize", args = { "-1" } }))
map.set(
  "n",
  "<C-h>",
  command({ cmd = "resize", args = { "-1" }, mods = { vertical = true } })
)
map.set(
  "n",
  "<C-l>",
  command({ cmd = "resize", args = { "+1" }, mods = { vertical = true } })
)

map.set("t", "<Esc>", [[<C-\><C-n>]])
