return {
  'numToStr/FTerm.nvim',
  config = function()
    require('FTerm').setup({
      dimensions = {
        width = 0.7,
        height = 0.4,
        x = 0.5,
        y = 0.7,
      },
    })
    vim.keymap.set("n", "<leader>tf", ":lua require('FTerm').toggle()<CR>", { desc="[f]loating terminal", noremap=true})
    vim.keymap.set("t", "<leader>tf", '<C-\\><C-n>:lua require("FTerm").toggle()<CR>', { desc="[f]loating terminal", noremap=true})
  end,
}
