return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    keys = {
      { 'nn', '<cmd>Neotree float<cr>' },
      { 'nl', '<cmd>Neotree left<cr>' },
      { 'ng', '<cmd>Neotree float git_status<cr>' },
      { 'nc', '<cmd>Neotree close<cr>' },
    },
    opts = {
      popup_border_style = 'rounded',
      default_component_configs = {
        git_status = {
          symbols = {
            modified  = '',
            renamed   = '',
            ignored   = '',
            unstaged  = '',
            staged    = '',
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
