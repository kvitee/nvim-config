return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      {
        'nvim-lua/plenary.nvim',
      },
      {
        'nvim-tree/nvim-web-devicons',
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    keys = {
      { 'tf', '<cmd>Telescope find_files<cr>' },
      { 'tg', '<cmd>Telescope live_grep<cr>' },
    },
    config = function()
      local telescope = require('telescope')

      -- Setup telescope --
      telescope.setup({
        extensions = {
          fzf = {
            override_generic_sorter = false,
            override_file_sorter = true,
          },
        },
      })

      -- Load Telescope extensions --
      telescope.load_extension('fzf')
    end
  },
}
