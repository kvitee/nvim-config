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
    keys = function()
      local builtin = require('telescope.builtin')

      return {
        { '<leader>ff', builtin.find_files, { desc = 'Telescope | Find files' }},
        { '<leader>fg', builtin.live_grep, { desc = 'Telescope | Live grep' }},
        { '<leader>fb',
          function()
            builtin.buffers({ initial_mode = 'normal' })
          end,
          { desc = 'Telescope | Buffers' }
        },
      }
    end,
    opts = function()
      local actions = require('telescope.actions')

      return {
        defaults = {
          mappings = {
            n = {
              ['<C-CR>'] = actions.select_tab,
              ['q'] = actions.close,
            },
            i = {
              ['<C-CR>'] = actions.select_tab,
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
    end,
  },
}
