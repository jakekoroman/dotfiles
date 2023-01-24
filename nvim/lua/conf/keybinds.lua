local telescope = require('telescope.builtin')
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- General Editor binds
map('n', '<leader>,', telescope.buffers)
map('n', '<leader>.', telescope.find_files)
map('n', '<leader>/', telescope.live_grep)
map('n', '<C-a>', '0')
map('n', '<C-e>', '$')
map('i', '<C-a>', '<ESC>I')
map('i', '<C-e>', '<ESC>A')

-- Compilation bind
map('n', '<leader>c', '<CMD>make<CR>')
map('n', '<M-n>', '<CMD>cn<CR>')
map('n', '<M-p>', '<CMD>cp<CR>')
map('n', '<M-l>', '<CMD>cl<CR>')

-- Buffer binds
map('n', '<leader>bp', '<CMD>bn<CR>')
map('n', '<leader>bn', '<CMD>bp<CR>')

-- Window binds
map('n', '<leader>ww', '<C-w>w')
map('n', '<leader>wn', '<C-w>n')
map('n', '<leader>wv', '<C-w>v')
map('n', '<M-o>', '<C-w>w')
map('n', '<leader>wc', '<CMD>close<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")
