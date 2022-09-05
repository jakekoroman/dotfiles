local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Misc editor binds
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

-- Yank whole file
map('n', '<C-Y>', 'ggVGy')

-- Buffer binds
map('n', '<leader>[', '<CMD>bn<CR>')
map('n', '<leader>]', '<CMD>bp<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")
