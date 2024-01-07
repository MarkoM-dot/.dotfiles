local set = vim.opt

set.expandtab = true
set.smartindent = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

set.relativenumber = true
set.number = true

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

set.completeopt = { "menu", "menuone", "noselect" }
set.clipboard:append("unnamedplus")

vim.cmd([[
    filetype plugin indent on
]])
