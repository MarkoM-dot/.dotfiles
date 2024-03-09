local set = vim.opt

set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.scrolloff = 8
set.wrap = true
set.number = true
set.relativenumber = true
set.hlsearch = false
set.termguicolors = true
set.splitbelow = true
set.splitright = true
set.errorbells = false
set.clipboard:append("unnamedplus")
set.completeopt = { "menu", "menuone", "noselect" }
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
