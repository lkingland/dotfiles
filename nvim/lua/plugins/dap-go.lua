return {
  "leoluz/nvim-dap-go",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function() 
    -- See also dap.lua
    vim.keymap.set("n", ",dt", function() require("dap-go").debug_test() end, {desc="Debug [t]est"})
    -- vim.keymap.set("n", ",dl", function() require("dap-go").debug_test() end, {desc="Debug [l]ast"})

    require("dap-go").setup()
  end,
}

