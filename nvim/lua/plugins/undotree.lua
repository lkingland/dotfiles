return {
  'mbbill/undotree',
  lazy = false,
  config = function()
    vim.keymap.set('n', "<c-u>", ":UndotreeToggle<cr>", { desc = "Undoo Tree" })
    vim.keymap.set('n', "<leader>tut", ":UndotreeToggle<cr>", { desc = "Toggle [u]ndo [t]ree (also <C-u>)" })
    vim.keymap.set('n', "<leader>tuf", ":UndotreeFocus<cr>", { desc = "[u]ndotree [f]ocus" })
  end,
}
