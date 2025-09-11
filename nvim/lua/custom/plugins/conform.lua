return {
  'stevearc/conform.nvim',
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      c = { 'clang_format' },
    },
  },
  init = function()
    require('conform').setup {
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match '/Balatro/' then
          return
        end

        return { timeout_ms = 500, lsp_format = 'fallback' }
      end,
    }

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      vim.notify("formatting")
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      vim.notify("formatting")
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })
    vim.api.nvim_create_user_command('FormatDisable', function(args)
      if args.bang then
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true,
    })
    vim.api.nvim_create_user_command('FormatEnable', function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = 'Re-enable autoformat-on-save',
    })
  end,
}
