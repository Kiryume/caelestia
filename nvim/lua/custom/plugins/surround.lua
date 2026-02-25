return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  config = function()
    vim.g.nvim_surround_no_normal_mappings = true
    vim.keymap.set("x", "<C-s>", "<Plug>(nvim-surround-visual)", {
      desc = "Add a surrounding pair around a visual selection",
    })
    require("nvim-surround").setup()
  end
}
