vim.g.mapleader = " "
local map = vim.keymap

map.set("i", "jj", "<Esc>")

map.set("n", "<leader><leader>", "<c-^>")
map.set("n", "<leader>h", ":wincmd h<CR>")
map.set("n", "<leader>j", ":wincmd j<CR>")
map.set("n", "<leader>k", ":wincmd k<CR>")
map.set("n", "<leader>l", ":wincmd l<CR>")
map.set("n", "<leader>n", ":Ex<CR>")

map.set("t", "<Esc>", [[<C-\><C-n>]])

vim.keymap.set("n", "<leader>T", ":InspectTree<CR>")
