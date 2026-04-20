return {
  {
    url = 'https://codeberg.org/andyg/leap.nvim',
    enabled = false,
    dependencies = {
      'tpope/vim-repeat',
    },
    keys = {
      { '<leader>f', '<Plug>(leap-forward)' },
      { '<leader>F', '<Plug>(leap-backward)' },
    },
  },
}
