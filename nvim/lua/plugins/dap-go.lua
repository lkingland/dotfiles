return {
  "leoluz/nvim-dap-go",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function() 
    -- See also dap.lua
    vim.keymap.set("n", ",dt", function() require("dap-go").debug_test() end )
    vim.keymap.set("n", ",dr", function() require("dap-go").debug_last_test() end)

    require("dap-go").setup()
  end,
}

