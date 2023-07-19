local o = vim.o
local g = vim.g

g.mapleader = " "

o.termguicolors = true
vim.cmd('colorscheme quiet')

o.mouse = 'a'
o.relativenumber = true
o.number = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.autochdir = true
o.guifont = "Liberation Mono:h10"

-- my super cool c indentation style
o.cindent = true
o.cino = "l1,t0,(0" -- :0 will align case to the switch statement

o.swapfile = false
o.backup = false
-- o.scrolloff = 8

osmartcase = true

o.clipboard = 'unnamedplus'
