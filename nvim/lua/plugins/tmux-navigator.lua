return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  config = function() 
    vim.keymap.set('n', "<c-h>",function() vim.cmd("TmuxNavigateLeft") end)
    vim.keymap.set('n', "<c-j>",function() vim.cmd("TmuxNavigateDown") end)
    vim.keymap.set('n', "<c-k>",function() vim.cmd("TmuxNavigateUp") end)
    vim.keymap.set('n', "<c-l>",function() vim.cmd("TmuxNavigateRight") end)
  end,
}
