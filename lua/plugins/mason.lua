return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    keys = {
      { '<leader>mm', '<cmd>:Mason<cr>', { desc = 'Mason | Menu' }},
    },
    opts = {
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '',
          package_pending = '',
          package_uninstalled = '',
        },
      },
    },
  },
}
