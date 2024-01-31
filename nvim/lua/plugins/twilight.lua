return {
  'folke/twilight.nvim',
  opts = { },
  config = function()
    vim.keymap.set('n', "<leader>tw", ":Twilight<cr>", { desc = "T[w]ilight" })
  end,
}
