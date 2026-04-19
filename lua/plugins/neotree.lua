return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>nn', '<cmd>Neotree float<cr>' },
      { '<leader>nl', '<cmd>Neotree left<cr>' },
      { '<leader>ng', '<cmd>Neotree float git_status<cr>' },
      { '<leader>nc', '<cmd>Neotree close<cr>' },
    },
    opts = {
      popup_border_style = 'rounded',
      default_component_configs = {
        git_status = {
          symbols = {
            modified = '',
            renamed = '',
            ignored = '',
            unstaged = '',
            staged = '',
          },
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },
}
