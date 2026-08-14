--[[
  Key mappings module.
--]]

-- Leader keys --
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Buffers --
vim.keymap.set('n', '<leader>bs', function ()
  vim.cmd.bu('#')
end, { desc = 'Buffers | Switch last' })
vim.keymap.set('n', '<leader>bn', vim.cmd.bn, { desc = 'Buffers | Next' })
vim.keymap.set('n', '<leader>bp', vim.cmd.bp, { desc = 'Buffers | Previous' })
vim.keymap.set('n', '<leader>bq', vim.cmd.bd, { desc = 'Buffers | Close' })

-- Search --
vim.keymap.set(
  'n',
  '<leader>h',
  vim.cmd.nohlsearch,
  { desc = 'Search | Disable highlight' }
)
