local map = vim.keymap

map.set("n", "<leader>f", ":Telescope find_files<CR>")
map.set("n", "<leader>z", ":Telescope oldfiles<CR>")
map.set("n", "<leader>r", ":Telescope live_grep<CR>")
map.set("n", "<leader>v", ":Telescope git_commits<CR>")
map.set("n", "<leader>c", ":Telescope git_bcommits<CR>")
map.set("n", "<leader>K", ":Telescope keymaps<CR>")
map.set("n", "<leader>S", ":Telescope git_status<CR>")
