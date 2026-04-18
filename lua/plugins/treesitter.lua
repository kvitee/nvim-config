local ft = {
  'python',
  'javascript',
  'typescript',
  'prisma',
  'c',
  'cpp',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    enabled = false,
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
