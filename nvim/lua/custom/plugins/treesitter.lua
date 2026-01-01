return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup {
      auto_install = true,

      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
