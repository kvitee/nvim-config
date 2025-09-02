-- Set mapleaders --
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Go to next or previous tab by L or H respectively --
vim.keymap.set('n', 'L', '<cmd>tabnext<cr>')
vim.keymap.set('n', 'H', '<cmd>tabprev<cr>')

-- Buffers --
vim.keymap.set('n', '<leader>bn', '<cmd>bn<cr>', { desc = 'Buffers | Next buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bp<cr>', { desc = 'Buffers | Previous buffer' })
vim.keymap.set('n', '<leader>q', '<cmd>bd<cr>', { desc = 'Buffers | Close buffer' })
