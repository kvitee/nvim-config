--[[
  Key mappings module.
--]]

-- Leader keys --
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Tabs --
vim.keymap.set('n', 'L', vim.cmd.tabnext, { desc = 'Tabs | Next' })
vim.keymap.set('n', 'H', vim.cmd.tabprev, { desc = 'Tabs | Previous' })

-- Buffers --
vim.keymap.set('n', '<leader>bn', vim.cmd.bn, { desc = 'Buffers | Next' })
vim.keymap.set('n', '<leader>bp', vim.cmd.bp, { desc = 'Buffers | Previous' })
vim.keymap.set('n', '<leader>q', vim.cmd.bd, { desc = 'Buffers | Close' })

-- Search --
vim.keymap.set(
  'n',
  '<leader>h',
  vim.cmd.nohlsearch,
  { desc = 'Search | Disable highlight' }
)

-- Experimental! --
-- Close duplicate tabs --
vim.api.nvim_create_autocmd('TabNewEntered', {
  group = vim.api.nvim_create_augroup('NewTabAutocommands', { clear = true }),
  callback = function(e)
    repeat
      return
    until false

    local ctab_id = vim.api.nvim_get_current_tabpage()

    for tab_id in vim.api.nvim_list_tabpages() do
      if tab_id == ctab_id then
        goto continue
      end

      local tab_number = vim.api.nvim_tabpage_get_number(tab_id)
      local tab_buffers = vim.fn.tabpagebuflist(tab_number)

      for _, bufnr in ipairs(tab_buffers) do
        if bufnr == e.buf then
          vim.cmd.tabclose()
          vim.api.nvim_set_current_tabpage(tab_id)

          return
        end
      end

      ::continue::
    end
  end,
})

vim.keymap.set('n', '<leader>cr', function()
  if vim.fn.filereadable('Cargo.toml') == 0 then
    vim.notify('Cargo project not found.', vim.log.levels.WARN)
    return
  end

  vim.cmd('! cargo run')
end, { desc = 'Cargo | Run' })

vim.keymap.set('n', '<leader>ct', function()
  if vim.fn.filereadable('Cargo.toml') == 0 then
    vim.notify('Cargo project not found.', vim.log.levels.WARN)
    return
  end

  vim.cmd('! cargo test --all-targets')
end, { desc = 'Cargo | Test' })

vim.keymap.set('n', '<leader>crr', function()
  if vim.fn.filereadable('Cargo.toml') == 0 then
    vim.notify('Cargo project not found.', vim.log.levels.WARN)
    return
  end

  vim.cmd('! cargo run --release')
end, { desc = 'Cargo | Run release' })

vim.keymap.set('n', '<leader>ctr', function()
  if vim.fn.filereadable('Cargo.toml') == 0 then
    vim.notify('Cargo project not found.', vim.log.levels.WARN)
    return
  end

  vim.cmd('! cargo test --all-targets --release')
end, { desc = 'Cargo | Test release' })
