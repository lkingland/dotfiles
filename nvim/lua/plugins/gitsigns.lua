return {
  'lewis6991/gitsigns.nvim',
  config = function() 
    require('gitsigns').setup({
      vim.keymap.set('n', '<leader>tgs', ':Gitsigns toggle_signs<cr>'),
      vim.keymap.set('n', '<leader>tgn', ':Gitsigns toggle_numhl<cr>'),
      vim.keymap.set('n', '<leader>tgl', ':Gitsigns toggle_linehl<cr>'),
      vim.keymap.set('n', '<leader>tgw', ':Gitsigns toggle_word_diff<cr>'),
      vim.keymap.set('n', '<leader>tgb', ':Gitsigns toggle_current_line_blame<cr>'),
    })
  end,
}
