return {
  'stevearc/aerial.nvim',
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  config = function() 
    require('aerial').setup({})
    vim.keymap.set("n", "<leader>aa", ":Telescope aerial<cr>", { desc="[a]rial toggle" })
    vim.keymap.set("n", "<leader>as", ":AerialToggle!<cr>", { desc="[a]rial [s]idebar" })
    vim.keymap.set("n", "<leader>an", ":AerialToggleNav<cr>", { desc="[a]rial [n]avigator" })
  end
}
