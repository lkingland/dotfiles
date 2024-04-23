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
    -- TODO: Evaluate why this might be needed:
    -- vim.keymap.set("t", "<leader>tf", '<C-\\><C-n>:lua require("FTerm").toggle()<CR>', { desc="[f]loating terminal", noremap=true})
  end,
}
