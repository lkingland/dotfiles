return {
  'tpope/vim-fugitive',
  config = function()
    -- Git helpers
    vim.keymap.set("n", "<leader>gc", ":Git commit -m \"", {noremap=false})
    vim.keymap.set("n", "<leader>gp", ":Git push -u origin HEAD<CR>", {noremap=false})
  end,
}
