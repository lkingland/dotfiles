return {
  'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup { 
        disable_netrw = false,
      }
      vim.keymap.set('n', "<c-n>", ":NvimTreeToggle<cr>", { desc = "Tree Toggle" } )
      vim.keymap.set('n', "<c-q>", ":NvimTreeFocus<cr>", { desc = "Tree Focus" } )
      vim.keymap.set('n', "<leader>ttt", ":NvimTreeToggle<cr>", { desc = "Toggle Tree (also <c-n>)" } )
      vim.keymap.set('n', "<leader>ttf", ":NvimTreeFocus<cr>", { desc = "Toggle Tree [f]ocus (also <c-q>)" } )
      vim.keymap.set('n', "<leader>tts", ":NvimTreeFindFileToggle<cr>", { desc = "Toggle Tree and [s]elect current" } )
    end,
}
