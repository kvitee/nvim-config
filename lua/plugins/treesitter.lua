local file_types = {
  'python',
  'javascript',
  'typescript',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    ft = file_types,
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = file_types,
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
        },
      })
    end,
  },
}
