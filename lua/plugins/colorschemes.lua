return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = true,
    config = function()
      require('gruvbox').setup({
        -- Disable italics for strings and comments --
        italic = {
          strings = false,
          comments = false,
        },
      })
    end
  },
  {
    'Shatur/neovim-ayu',
    lazy = true,
    config = function()
      local colors = require('ayu.colors')
      colors.generate()

      require('ayu').setup({
        overrides = {
          LineNr = { fg = colors.ui }
        },
      })
    end,
  },
  {
    'marko-cerovac/material.nvim',
    lazy = true,
  },
}
