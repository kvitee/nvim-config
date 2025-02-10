return {
  {
    'nvim-treesitter/nvim-treesitter',
    ft = {
      'python',
      'javascript',
      'typescript',
    },
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = ft,
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
      },
    },
  },
}
