return { 
  "numToStr/Comment.nvim",
  keys = {
    { "gcc", mode = "n", desc = "Comment toggle current line" },
    { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
    { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
    { "gbc", mode = "n", desc = "Comment toggle current block" },
    { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
    { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
  },
  init = function()
    -- Toggle current line's comment prefix when in normal mode:
    vim.keymap.set('n', '<leader>/', require('Comment.api').toggle.linewise.current, { desc="Comment" } )
    -- Toggle selected block's comment prefix when in visual block select:
    vim.keymap.set('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", { desc="Comment" } )
  end,
  config = function(_,opts)
    require("Comment").setup(opts)
  end,
}

