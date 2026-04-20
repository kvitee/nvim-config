return {
  {
    'folke/lazydev.nvim',
    dependencies = {
      {
        'hrsh7th/nvim-cmp',
        opts = function(_, opts)
          opts.sources = opts.sources or {}
          table.insert(opts.sources, { name = 'lazydev' })
        end,
      },
    },
    cond = function()
      return vim.fn.filereadable('lazy-lock.json') == 1
    end,
    opts = {
      library = {
        'lazy.nvim',
      },
    },
  },
}
