-- Set mapleaders --
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Go to next or previous tab by L or H respectively --
vim.keymap.set('n', 'L', '<cmd>tabnext<cr>', { desc = 'Tab | Next' })
vim.keymap.set('n', 'H', '<cmd>tabprev<cr>', { desc = 'Tab | Previous' })

-- Buffers --
vim.keymap.set('n', '<leader>bn', '<cmd>bn<cr>', { desc = 'Buffers | Next buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bp<cr>', { desc = 'Buffers | Previous buffer' })
vim.keymap.set('n', '<leader>q', '<cmd>bd<cr>', { desc = 'Buffers | Close buffer' })

-- Experimental! --
-- Close duplicate tabs --
vim.api.nvim_create_autocmd('TabNewEntered', {
  group = vim.api.nvim_create_augroup('NewTabAutocommands', { clear = true }),
  callback = function(e)
    local ctab_id = vim.api.nvim_get_current_tabpage()

    for _, tab_id in ipairs(vim.api.nvim_list_tabpages()) do
      if (tab_id ~= ctab_id) then
        local tab_number = vim.api.nvim_tabpage_get_number(tab_id)
        local buffers_in_tab = vim.fn.tabpagebuflist(tab_number)

        for _, bufnr in ipairs(buffers_in_tab) do
          if (bufnr == e.buf) then
            vim.cmd('tabclose')
            vim.api.nvim_set_current_tabpage(tab_id)
            return
          end
        end
      end
    end
  end,
})
