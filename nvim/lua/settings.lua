local o = vim.o
local g = vim.g

g.mapleader = " "
g.netrw_keepdir = 0
g.netrw_banner = 0
g.netrw_winsize = 15
g.netrw_localcopydircmd = 'cp -r'
-- o.termguicolors = true
g.zig_fmt_autosave = 0

vim.cmd('colorscheme catppuccin')
vim.cmd('set wrap!')
vim.cmd('set makeprg=./build.sh')

o.mouse = 'a'
o.relativenumber = true
o.number = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
-- o.autochdir = true
o.guifont = "Liberation Mono:h10"

-- my super cool c indentation style
o.cindent = true
o.cino = "l1,t0,(0" -- :0 will align case to the switch statement

o.swapfile = false
o.backup = false
-- o.scrolloff = 8

osmartcase = true

o.clipboard = 'unnamedplus'
