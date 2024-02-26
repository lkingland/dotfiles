return {
    "mfussenegger/nvim-dap",
  config = function() 
    -- see also dap-go.lua
    vim.keymap.set("n", ",db", ":DapToggleBreakpoint<cr>", {desc="[b]reakpoint"})
    vim.keymap.set("n", ",dc", ":DapContinue<cr>", {desc="[c]ontinue"})
    vim.keymap.set("n", ",di", ":DapStepInto<cr>", {desc="[i]nto"})
    vim.keymap.set("n", ",do", ":DapStepOver<cr>", {desc="[o]ver"})
    vim.keymap.set("n", ",dr", ":DapToggleRepl<cr>", {desc="[r]epl"})
    vim.keymap.set("n", ",du", ":DapStepOut<cr>", {desc="[u]p / out"})
    vim.keymap.set("n", ",dx", ":DapTerminate<cr>", {desc="[x]terminate"})

    -- Sidebars
    vim.keymap.set("n", ",dl", function()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.toggle();
    end, {desc="[l]ocals (scopes)"})
    vim.keymap.set("n", ",ds", function()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.frames);
        sidebar.toggle();
    end, {desc="[s]tack (frames)"})


    -- Signs
    vim.cmd('highlight DapRed ctermbg=NONE ctermfg=red guibg=NONE guifg=#ff0000')
    vim.cmd('highlight DapOrange ctermbg=NONE ctermfg=214 guibg=NONE guifg=#FFA500') -- ANSI color 214 is like orange
    vim.cmd('highlight DapGreen ctermbg=NONE ctermfg=green guibg=NONE guifg=#00FF00')

    vim.fn.sign_define('DapBreakpoint', {text='●', texthl = 'DapRed'})
    vim.fn.sign_define('DapBreakpointRejected', { text = '✖', texthl = 'DapRed' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '?', texthl = 'DapOrange' })
    vim.fn.sign_define('DapLogPoint', { text = '☰', texthl = 'DapOrange' })
    vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapGreen' })

    -- TODO:
    -- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    -- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
    -- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
    -- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    --   require('dap.ui.widgets').hover()
    -- end)
    -- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    --   require('dap.ui.widgets').preview()
    -- end)
    -- vim.keymap.set('n', '<Leader>df', function()
    --   local widgets = require('dap.ui.widgets')
    --   widgets.centered_float(widgets.frames)
    -- end)
    -- vim.keymap.set('n', '<Leader>ds', function()
    --   local widgets = require('dap.ui.widgets')
    --   widgets.centered_float(widgets.scopes)
    -- end)

  end,
}

