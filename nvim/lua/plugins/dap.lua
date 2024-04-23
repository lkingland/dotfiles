return {
    "mfussenegger/nvim-dap",
  config = function() 
    -- see also: 
    --   dap-go.lua
    --   :help dap-mapping
    --   :help dap-api
    --   :help dap-widgets
    -- Signs
    vim.cmd('highlight DapRed ctermbg=NONE ctermfg=red guibg=NONE guifg=#ff0000')
    vim.cmd('highlight DapOrange ctermbg=NONE ctermfg=214 guibg=NONE guifg=#FFA500') -- ANSI color 214 is like orange
    vim.cmd('highlight DapGreen ctermbg=NONE ctermfg=green guibg=NONE guifg=#00FF00')

    vim.fn.sign_define('DapBreakpoint', {text='●', texthl = 'DapRed'})
    vim.fn.sign_define('DapBreakpointRejected', { text = '✖', texthl = 'DapRed' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '?', texthl = 'DapOrange' })
    vim.fn.sign_define('DapLogPoint', { text = '☰', texthl = 'DapOrange' })
    vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapGreen' })

  end,
}

