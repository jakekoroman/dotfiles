local o = vim.o
local g = vim.g

g.mapleader = " "

o.termguicolors = true
o.background = 'dark'
vim.cmd('colorscheme base16-onedark')

o.relativenumber = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

o.ignorecase = true
o.smartcase = true

o.clipboard = 'unnamedplus'
