local o = vim.o
local g = vim.g

g.mapleader = " "

o.termguicolors = true
vim.cmd('colorscheme gruber')

o.mouse = 'a'
o.relativenumber = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true
o.swapfile = false
o.backup = false
o.scrolloff = 8

o.ignorecase = true
o.smartcase = true

o.clipboard = 'unnamedplus'
