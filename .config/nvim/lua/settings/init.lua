local set = vim.opt

set.termguicolors = true
set.bg = 'dark'
set.syntax = 'enable'

set.expandtab = true
set.smartindent = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

set.relativenumber = true
set.nu = true
set.termguicolors = true

set.errorbells = false
set.encoding = 'utf-8'
set.wrap = false
set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.swapfile = false
set.backup = false
set.scrolloff = 8

vim.cmd [[
    filetype plugin indent on
]]
vim.cmd [[
    colorscheme nord
]]

set.completeopt = {'menu', 'menuone', 'noselect'}
