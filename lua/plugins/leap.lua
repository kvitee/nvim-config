return {
  {
    'ggandor/leap.nvim',
    dependencies = {
      'tpope/vim-repeat',
    },
    keys = {
      { '<leader>f', '<Plug>(leap-forward)' },
      { '<leader>F', '<Plug>(leap-backward)' },
    },
  },
}
