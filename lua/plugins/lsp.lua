return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'hrsh7th/nvim-cmp',
        opts = function(_, opts)
          opts.sources = opts.sources or {}
          table.insert(opts.sources, { name = 'nvim_lsp' })
        end,
      },
      'hrsh7th/cmp-nvim-lsp',
    },
    cmd = 'LspInfo',
    event = 'VeryLazy',
    config = function()
      local function expand_macro()
        vim.lsp.buf_request_all(
          0,
          'rust-analyzer/expandMacro',
          vim.lsp.util.make_position_params(0, 'utf-8'),
          function(results)
            if
              results == nil
              or results[1] == nil
              or results[1].result == nil
            then
              vim.notify('No macro expansion available', vim.log.levels.WARN)
              return
            end

            local result = results[1].result
            local name = result.name .. ' macro expansion'
            local expansion = vim.split(result.expansion, '\n')

            -- create new buffer for macro expansion
            local expansion_buf_id = vim.api.nvim_create_buf(false, true)

            -- Set buffer name and filetype for syntax highlighting
            vim.api.nvim_buf_set_name(expansion_buf_id, name)
            vim.bo[expansion_buf_id].filetype = 'rust'

            -- Set buffer contents to received expansion
            vim.api.nvim_buf_set_lines(expansion_buf_id, 0, 0, false, expansion)

            -- Jump to new buffer
            vim.api.nvim_win_set_buf(0, expansion_buf_id)
            vim.api.nvim_win_set_cursor(0, { 1, 0 })
          end
        )
      end

      vim.lsp.config('rust_analyzer', {
        commands = {
          ExpandMacro = {
            expand_macro,
            description = 'Rust | Expand macro under cursor',
          },
        },
      })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'rust',
        callback = function()
          vim.keymap.set(
            'n',
            '<leader>me',
            expand_macro,
            { desc = 'Rust | Expand macro under cursor' }
          )
        end,
      })

      vim.lsp.enable({
        'ts_ls',
        'pyright',
        'clangd',
        'lua_ls',
        'rust_analyzer',
      })

      vim.diagnostic.config({
        float = {
          border = 'rounded',
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = '󰌵 ',
          },
          linehl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
            [vim.diagnostic.severity.INFO] = 'InfoMsg',
            [vim.diagnostic.severity.HINT] = 'HintMsg',
          },
          numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
          },
        },
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('LspAttach', {}),
        callback = function(e)
          local opts = {
            buffer = e.buf,
            noremap = true,
            silent = true,
          }

          vim.bo[e.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          vim.keymap.set(
            'n',
            '<leader>ld',
            vim.diagnostic.open_float,
            vim.tbl_extend('force', opts, { desc = 'Diagnostic | Open float' })
          )

          vim.keymap.set('n', '<leader>k', function()
            vim.lsp.buf.hover({
              border = 'rounded',
              focusable = false,
            })
          end, vim.tbl_extend(
            'force',
            opts,
            { desc = 'Lsp | Explain item' }
          ))

          vim.keymap.set('n', '<leader>K', function()
            vim.lsp.buf.signature_help({
              border = 'rounded',
              focusable = false,
            })
          end, vim.tbl_extend(
            'force',
            opts,
            { desc = 'Lsp | Signature help' }
          ))

          vim.keymap.set(
            'n',
            '<leader>gd',
            vim.lsp.buf.definition,
            vim.tbl_extend('force', opts, { desc = 'Lsp | Go to definition' })
          )

          vim.keymap.set(
            'n',
            '<leader>gD',
            vim.lsp.buf.declaration,
            vim.tbl_extend('force', opts, { desc = 'Lsp | Go to declaration' })
          )

          vim.keymap.set(
            'n',
            '<leader>gr',
            vim.lsp.buf.references,
            vim.tbl_extend('force', opts, { desc = 'Lsp | Go to references' })
          )

          vim.keymap.set(
            'n',
            '<leader>lr',
            vim.lsp.buf.rename,
            vim.tbl_extend('force', opts, { desc = 'Lsp | Rename item' })
          )

          vim.keymap.set(
            'n',
            '<leader>la',
            vim.lsp.buf.code_action,
            vim.tbl_extend('force', opts, { desc = 'Lsp | Code actions' })
          )

          vim.keymap.set('n', '<leader>lf', function()
            vim.lsp.buf.format({
              async = true,
            })
          end, vim.tbl_extend(
            'force',
            opts,
            { desc = 'Lsp | Format buffer' }
          ))
        end,
      })
    end,
  },
}
