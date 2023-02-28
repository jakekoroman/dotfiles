local o = vim.o
local g = vim.g

g.mapleader = " "

o.termguicolors = true
vim.cmd('colorscheme srcery')
-- g.airline_theme = 'zenburn'

o.mouse = 'a'
o.relativenumber = true
o.number = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4

-- my super cool c indentation style
o.cindent = true
o.cino = ":0,l1,t0,(0"

o.swapfile = false
o.backup = false
-- o.scrolloff = 8

o.smartcase = true

o.clipboard = 'unnamedplus'
