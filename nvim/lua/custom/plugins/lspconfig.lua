return {

  'neovim/nvim-lspconfig',
  dependencies = {

    'mrcjkb/rustaceanvim',
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',

    { 'j-hui/fidget.nvim', opts = {} },

    'folke/neoconf.nvim',
    'saghen/blink.cmp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

        map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

        map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

        map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

        map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    local servers = {
      clangd = {
        cmd = {
          'clangd',
          '--background-index',
          '--query-driver=/opt/devkitpro/devkitARM/bin/arm-none-eabi*,/usr/bin/gcc,**',
        },
      },

      lua_ls = {

        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      },
      racket_langserver = {
        filetypes = { 'rkt', 'racket' },
      },
    }
    for server, config in pairs(servers) do
      config = vim.tbl_deep_extend('force', {
        capabilities = capabilities,
      }, config or {})
      vim.lsp.config(server, config)
      vim.lsp.enable(server, true)
    end
  end,
}
