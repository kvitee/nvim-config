local servers = {
  ft = {
    'typescript',
    'python',
    'c',
    'cpp',
  },
  ls = {
    'ts_ls',
    'pyright',
    'clangd',
  },
}

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'hrsh7th/nvim-cmp',
        opts = function(_, opts)
          table.insert(opts.sources, { name = 'nvim_lsp' })
        end
      },
      'hrsh7th/cmp-nvim-lsp',
    },
    ft = servers.ft,
    config = function()
      local nvim_lsp = require('lspconfig')

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      for _, ls in ipairs(servers.ls) do
        nvim_lsp[ls].setup({
          capabilities = capabilities,
        })
      end

      vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float)
      vim.keymap.set('n', '<leader>lD', vim.diagnostic.setloclist)

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }

          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, opts)

          vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help, opts)

          vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
          vim.keymap.set({'n', 'v'}, '<leader>la', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>lf', function()
            vim.lsp.buf.format({
              async = true,
            })
          end, opts)
        end
      })
    end
  },
}
