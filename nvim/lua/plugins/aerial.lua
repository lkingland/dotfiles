return {
  'stevearc/aerial.nvim',
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  config = function() 
    require('aerial').setup({
      keymaps = {
        ["<C-j>"] = false,
        ["<C-k>"] = false,
        ["<C-n>"] = "actions.down_and_scroll",
        ["<C-p>"] = "actions.up_and_scroll",
      }
    })
  end
}
