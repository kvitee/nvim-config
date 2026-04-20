return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = true,
    opts = {
      italic = {
        strings = false,
      },
    },
  },
  {
    'Shatur/neovim-ayu',
    lazy = true,
    main = 'ayu',
    opts = function()
      local colors = require('ayu.colors')
      colors.generate(false)

      return {
        overrides = {
          LineNr = { fg = colors.ui },
          Comment = { italic = false },
        },
      }
    end,
  },
  {
    'marko-cerovac/material.nvim',
    lazy = true,
  },
}
