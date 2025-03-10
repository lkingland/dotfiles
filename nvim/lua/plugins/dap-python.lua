return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  config = function() 
    -- TODO: Ensure mappinsg for dap-python only load in .py files, and
    -- likewise dap-go for go files, then overload ",dt".  For now, 
    -- they are both loading and conflict so use ",dm" for python.
    vim.keymap.set("n", ",dpr", function() require("dap-python").test_method() end, { desc = "Test Method" })
    require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
  end,
}

