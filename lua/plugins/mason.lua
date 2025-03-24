return {
  {
    'williamboman/mason.nvim',
    init = function()
      vim.keymap.set('n', '<leader>mm', '<cmd>:Mason<cr>', { desc = 'Mason | Menu' })
    end,
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
