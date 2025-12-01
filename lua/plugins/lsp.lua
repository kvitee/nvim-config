local servers = {
  ft = {
    'typescript',
    'python',
    'c',
    'cpp',
    'rust',
  },
  ls = {
    'ts_ls',
    'pyright',
    'clangd',
    'rust_analyzer',
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
    cmd = 'LspInfo',
    config = function()
      local nvim_lsp = require('lspconfig')

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      for _, ls in ipairs(servers.ls) do
        nvim_lsp[ls].setup({
          capabilities = capabilities,
        })
      end

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.HINT] = '󰌵 ',
            [vim.diagnostic.severity.INFO] = ' ',
          },
          linehl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
          },
          numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
          },
        },
        float = {
          border = 'rounded',
        },
      })

      vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float)

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(e)
          local opts = {
            buffer = e.buf,
            noremap = true,
            silent = true
          }

          vim.api.nvim_buf_set_option(e.buf, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

          vim.keymap.set('n', '<leader>k', function()
            vim.lsp.buf.hover({
              border = 'single',
              focusable = false
            })
          end, opts)
          vim.keymap.set('n', '<leader>K', function()
            vim.lsp.buf.signature_help({
              border = 'single',
              focusable = false
            })
          end, opts)

          vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, opts)

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
