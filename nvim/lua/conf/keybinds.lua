local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Misc editor binds
map('i', '<C-e>', '<ESC>A')
map('i', '<C-a>', '<ESC>I')

-- Compilation bind
-- map('n', '<leader>c', '<CMD>make<CR>')
map('n', '<M-c>', '<CMD>make<CR>')
map('n', '<M-n>', '<CMD>cn<CR>')
map('n', '<M-p>', '<CMD>cp<CR>')
map('n', '<M-l>', '<CMD>cl<CR>')

-- Yank whole file
map('n', '<C-y>', 'ggVGy')

-- Buffer binds
map('n', '<leader>[', '<CMD>bn<CR>')
map('n', '<leader>]', '<CMD>bp<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")
