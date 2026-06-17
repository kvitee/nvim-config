return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    event = 'VeryLazy',
    opts = function()
      local actions = require('telescope.actions')

      return {
        defaults = {
          mappings = {
            n = {
              ['<C-Cr>'] = actions.select_tab,
              ['q'] = actions.close,
            },
            i = {
              ['<C-Cr>'] = actions.select_tab,
              ['<C-q>'] = actions.close,
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
            },
          },
        },
        pickers = {
          buffers = {
            mappings = {
              n = {
                ['x'] = actions.delete_buffer,
              },
              i = {
                ['<C-x>'] = actions.delete_buffer,
              },
            },
          },
        },
        extensions = {
          fzf = {
            override_generic_sorter = false,
            override_file_sorter = true,
          },
        },
      }
    end,
    config = function(_, opts)
      local telescope = require('telescope')

      telescope.setup(opts)
      telescope.load_extension('fzf')

      local builtin = require('telescope.builtin')

      vim.keymap.set(
        'n',
        '<leader>ff',
        builtin.find_files,
        { desc = 'Telescope | Find files' }
      )

      vim.keymap.set(
        'n',
        '<leader>fg',
        builtin.live_grep,
        { desc = 'Telescope | Live grep' }
      )

      vim.keymap.set(
        'n',
        '<leader>fb',
        builtin.buffers,
        { desc = 'Telescope | Buffers' }
      )
    end,
  },
}
