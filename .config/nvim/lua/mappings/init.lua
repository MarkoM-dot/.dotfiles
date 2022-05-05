vim.g.mapleader = " "

local function _noremap(mode, shortcut, command)
    --Return a non-recursive map given a mode, desired shortcut, and command.
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true })
end

_noremap('n', '<leader><leader>', '<c-^>') --switch to previous buffer

_noremap('n', '<leader>f', ':Telescope find_files<CR>')
_noremap('n', '<leader>r', ':Telescope live_grep<CR>')

_noremap('n', '<leader>h', ':wincmd h<CR>')
_noremap('n', '<leader>j', ':wincmd j<CR>')
_noremap('n', '<leader>k', ':wincmd k<CR>')
_noremap('n', '<leader>l', ':wincmd l<CR>')
_noremap('n', '<leader>n', ':NERDTreeFocus<CR>')

_noremap('i', 'jj', '<Esc>')
