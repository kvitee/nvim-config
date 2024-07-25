return {
  {
    'ellisonleao/gruvbox.nvim',
    config = function()
      require('gruvbox').setup({
        -- Disable italics for strings and comments --
        italic = {
          strings = false,
          comments = false,
        },
      })

      vim.cmd.colorscheme('gruvbox')
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
          -- Disable italics for comments --
          Comment = { fg = colors.comment },
        },
      })
    end,
  },
  {
    'marko-cerovac/material.nvim',
    lazy = true,
  },
}
