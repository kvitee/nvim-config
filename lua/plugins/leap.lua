return {
  {
    'ggandor/leap.nvim',
    dependencies = {
      'tpope/vim-repeat',
    },
    config = function()
      -- Setup leap --
      require('leap').setup({})

      -- Custom key mappings --
      vim.keymap.set('n',        'f', '<Plug>(leap)')
      vim.keymap.set('n',        'F', '<Plug>(leap-from-window)')
      vim.keymap.set({'x', 'o'}, 'f', '<Plug>(leap-forward)')
      vim.keymap.set({'x', 'o'}, 'F', '<Plug>(leap-backward)')
    end
  },
}
