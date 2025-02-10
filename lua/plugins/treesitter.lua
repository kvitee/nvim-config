local ft = {
  'python',
  'javascript',
  'typescript',
  'prisma',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    ft = ft,
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
