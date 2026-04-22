return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
  config = function()
    require('nvim-treesitter').setup {
      auto_install = true,

      ensure_installed = {
        'markdown',
        'markdown_inline',
        'cpp',
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end,
}
