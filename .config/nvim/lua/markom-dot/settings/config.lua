local g_set = vim.g
local set = vim.opt

g_set.mapleader = " "
g_set.maplocalleader = " "

set.number = true
set.relativenumber = true
set.wrap = true
set.scrolloff = 8
set.sidescrolloff = 8

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.smartindent = true

set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.hlsearch = false

set.backup = false
set.swapfile = false
set.encoding = "utf-8"

set.splitbelow = true
set.splitright = true
set.errorbells = false
set.clipboard:append("unnamedplus")

set.termguicolors = true

vim.cmd([[
    filetype plugin indent on
]])
