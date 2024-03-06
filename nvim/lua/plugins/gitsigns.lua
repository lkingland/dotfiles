return {
  'lewis6991/gitsigns.nvim',
  config = function() 
    require('gitsigns').setup({
      -- UX toggles
      vim.keymap.set('n', '<leader>tgs', ':Gitsigns toggle_signs<cr>', { desc="Toggle Gitsigns" }),
      vim.keymap.set('n', '<leader>tgn', ':Gitsigns toggle_numhl<cr>', { desc="Toggle Gitsigns NumHL" }),
      vim.keymap.set('n', '<leader>gh', ':Gitsigns toggle_linehl<cr>', { desc="Toggle Gitsigns Line Highlight" }),
      vim.keymap.set('n', '<leader>gd', ':Gitsigns toggle_word_diff<cr>', { desc="Toggle Gitsigns Word Diff" }),
      vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<cr>', { desc="Toggle Gitsigns Blame" }),

      -- Hunk Operations
      vim.keymap.set('n', '<leader>gh', ':Gitsigns preview_hunk<cr>', { desc="Show Hunk" }),
      vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<cr>', { desc="Stage" }),
      vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<cr>', { desc="Reset" }),
      vim.keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<cr>', { desc="Unstage" }),
      vim.keymap.set('n', '<leader>g[', ':Gitsigns prev_hunk<cr>', { desc="Previous Hunk" }),
      vim.keymap.set('n', '<leader>g]', ':Gitsigns next_hunk<cr>', { desc="Next Hunk" }),
    })
  end,
}
