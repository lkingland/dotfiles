return {
  "leoluz/nvim-dap-go",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function() 
    -- See also dap.lua
    vim.keymap.set("n", ",dt", function() require("dap-go").debug_test() end, { desc = "debug test" })
    vim.keymap.set("n", ",dr", function() require("dap-go").debug_last_test() end, { desc = "debug rerun last test" } )

    require("dap-go").setup()
  end,
}

