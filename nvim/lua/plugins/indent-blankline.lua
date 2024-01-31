return { 
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  opts = {},
  config = function() 
    vim.keymap.set('n','<leader>ti', ":IBLToggle<cr>", { desc = "Toggle Indentation Lines" })
    require("ibl").setup({
      enabled = false,
      indent = {
        char = '┊',
      },
    })
  end,
}

