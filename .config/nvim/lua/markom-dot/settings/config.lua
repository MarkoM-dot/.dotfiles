local g_set = vim.g
local set = vim.opt

g_set.netrw_banner = 0
g_set.mapleader = " "
g_set.maplocalleader = " "

set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.scrolloff = 8
set.wrap = true
set.number = true
set.relativenumber = true
set.hlsearch = false
set.splitbelow = true
set.splitright = true
set.errorbells = false
set.clipboard:append("unnamedplus")
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.smartindent = true
set.expandtab = true
set.backup = false
set.swapfile = false
set.encoding = "utf-8"

vim.cmd([[
    filetype plugin indent on
]])
