local set = vim.opt

set.syntax = "enable"

set.expandtab = true
set.smartindent = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

set.relativenumber = true
set.nu = true

set.errorbells = false
set.encoding = "utf-8"
set.wrap = true
set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.hlsearch = false
set.swapfile = false
set.backup = false
set.scrolloff = 8

vim.cmd [[
    set clipboard+=unnamedplus
]]
vim.cmd [[
    filetype plugin indent on
]]

set.completeopt = { "menu", "menuone", "noselect" }
