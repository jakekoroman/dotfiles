local snippets = require('snippets')

local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

-- General Editor binds
vim.keymap.set('n', '<M-j>', '}')
vim.keymap.set('n', '<M-k>', '{')
vim.keymap.set('v', '<M-j>', '}')
vim.keymap.set('v', '<M-k>', '{')
vim.keymap.set('i', '<C-k>', snippets.expand_or_advance)
vim.keymap.set('n', '<leader>e', '<CMD>Lexplore<CR>')

-- Compilation bind
vim.keymap.set('n', '<leader>c', '<CMD>make<CR>')
vim.keymap.set('n', '<M-n>', '<CMD>cn<CR>')
vim.keymap.set('n', '<M-p>', '<CMD>cp<CR>')
vim.keymap.set('n', '<M-l>', '<CMD>cl<CR>')

-- Buffer binds
vim.keymap.set('n', '<leader>bp', '<CMD>bn<CR>')
vim.keymap.set('n', '<leader>bn', '<CMD>bp<CR>')

-- Window binds
vim.keymap.set('n', '<leader>ww', '<C-w>w')
vim.keymap.set('n', '<leader>wn', '<C-w>n')
vim.keymap.set('n', '<leader>wv', '<C-w>v')
vim.keymap.set('n', '<leader>wm', '<CMD>only<CR>')
vim.keymap.set('n', '<M-o>', '<C-w>w')
vim.keymap.set('n', '<leader>wc', '<CMD>close<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
vim.keymap.set('n', '<C-j>', '<CMD>move .+1<CR>')
vim.keymap.set('n', '<C-k>', '<CMD>move .-2<CR>')
vim.keymap.set('v', '<C-j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-k>', ":move '<-2<CR>gv=gv")
