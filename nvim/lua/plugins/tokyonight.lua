return { 
  'folke/tokyonight.nvim',
  name = "tokyonight",
  lazy = false,
  priority = 1000,
  config = function()
    require('tokyonight').setup({
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    })
    -- vim.cmd.colorscheme "tokyonight"
  end,
}

