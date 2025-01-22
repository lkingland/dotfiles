return { 
  'folke/which-key.nvim', 
  event = "VeryLazy",
  config = function()

    local dap = require("dap")
    local dapui = require('dap.ui.widgets')
    local ha = require("harpoon.mark")
    local haui = require("harpoon.ui")
    local cmp = require("cmp")

    vim.o.timeout = true
    vim.o.timeoutlen = 300

    require("which-key").setup({
      preset = "modern",
      icons = {
        mappings = false,
      }
    })
    -- TODO:  Potentially broken mappings in:
    --    cmp.lua
    --    cmp.lua

    require("which-key").add({
      -------------------------------------------------
      -- General/Global Mappings and Behavioral Mods --
      -------------------------------------------------
      { "<leader>?", ":WhichKey<cr>", desc = "Keymaps" },
      { "<C-s>", ":w<cr>", desc = "Save", mode = { "i", "n", "v" } },
      { "QQ", ":q!<cr>", desc = "Quit (force)", mode = { "n" } },
      { "<S-Tab>", "<C-^>", desc = "Toggle Previous Buffer", mode = { "i", "n", "v" }, noremap=True, silent=True },
      { "<A-Tab>", ":wincmd p<cr>", desc = "Toggle Previous Window", mode = { "i", "n", "v" }, noremap=True, silent=True },
      { "<space><space>", ":NoiceDismiss<cr>", desc = "Clear Notifications" },
      { "<Esc>", ":set nohlsearch<cr>", desc = "Clear Search Highlights" },
      -- Ensure space does not interfere with itself as the leader key
      { "<Space>", "<Nop>", mode = { 'n', 'v' } },
      -- Get erfereces via trouble?  TODO: Confirm functional:
      { "gR", function() require("trouble").toggle("lsp_references") end, desc = "[r]eferences via LSP" },
      -- Select the next visual line when navigating across broken lines while
      -- preserving behavior when using a count (for example `5gj`)
      { "k", "v:count == 0 ? 'gk' : 'k'", expr = true },
      { "j", "v:count == 0 ? 'gj' : 'j'", expr = true },

      -----------------------
      -- F - Function Keys --
      -----------------------
      { "<F1>", ":UndotreeToggle<cr>", desc = "Undo Tree", mode = { "i", "n", "v" }, noremap=True, silent=True },
      { "<F2>", ":AerialToggle!<cr>", desc = "Aerial Sidebar" },
      { "<F3>", ":Telescope aerial<cr>", desc = "Aerial via Telescope" },
      { "<F4>", ":AerialNavToggle<cr>", desc = "Aerial Nav Panel" },

      ----------------
      -- Completion --
      ----------------
      -- See cmp.lua

      --------------
      -- Alt Keys --
      --------------
      -- Resize Panes (note: odd behavor on right/bottom edge panes: reversed)
      { "<A-h>", ":vertical resize -1<cr>", desc = "X--" },
      { "<A-l>", ":vertical resize +1<cr>", desc = "X++" },
      { "<A-k>", ":resize -1<cr>", desc = "Y--" },
      { "<A-j>", ":resize +1<cr>", desc = "Y++" },

      --------
      -- AI --
      --------
      { "<leader>a", group = "Assistant (AI)" },
      { "<leader>ac", ":ChatGPT<cr>", desc = "Chat", mode = { "n", "v" } }, { "<leader>aa", ":ChatGPTActAs<cr>", desc = "Chat as a...", mode = { "n", "v" } }, { "<leader>ae", ":ChatGPTEditWithInstructions<cr>", desc = "Edit", mode = { "n", "v" } },
      { "<leader>ar", ":ChatGPTRun<cr>", desc = "Run", mode = { "n", "v" } },
      { "<leader>as", ":Copilot panel<cr>", desc = "Suggestions panel", mode = { "n", "v" } },

      -------------
      -- Buffers --
      -------------
      { "<leader>b", group = "Buffers" },
      { "<leader>bf", ":bfirst<cr>", desc = "First" },
      { "<leader>bl", ":blast<cr>", desc = "Last" },
      { "<leader>bp", ":bprev<cr>", desc = "Previous" },
      { "<leader>bn", ":bnext<cr>", desc = "Next" },
      { "<leader>bd", ":delete<cr>", desc = "Delete" },

      -----------
      -- Debug --
      -----------
      { "<leader>d", group = "Debug" },
      { "<leader>db", function() dap.toggle_breakpoint() end, desc = "Breakpoint Toggle" },
      { "<leader>dc", function() dap.continue() end, desc = "Continue" },
      { "<leader>df", function() dapui.sidebar(dapui.frames).toggle() end, desc = "Toggle Frames (call stack)" }, -- NOTE: can also: dapui.centered_float(widgets.frames)
      { "<leader>dh", function() dapui.hover() end, desc = "Hover" },
      { "<leader>di", function() dap.step_into() end, desc = "Into" },
      { "<leader>dl", function() dap.run_last() end, desc = "Last (rerun)" },
      { "<leader>dm", function() dap.set_breakpoint(nil, nil, vim.fn.input('[m]essage: ')) end, desc = "Breakpoint with message" },
      { "<leader>do", function() dap.step_over() end, desc = "Over" },
      { "<leader>dp", function() dapui.preview() end, desc = "Preview" },
      { "<leader>dr", function() dap.repl.open() end, desc = "Toggle Repl" },
      { "<leader>ds", function() dapui.sidebar(dapui.scopes).toggle() end, desc = "Toggle Scopes (variables)" },
      { "<leader>du", function() dap.step_out() end, desc = "Up / out" },
      { "<leader>dx", function() dap.terminate() end, desc = "Exit (terminate)" },

      -- Language-Specific Keys
      -- NOTE: language-specific implementations are loaded in individual
      -- files (dap-go.lua, dap-python.lua etc).  Just labels here.
      { "<leader>dt", desc = "Test This" },   -- Currently Go only
      { "<leader>dm", desc = "Test Method" }, -- Currently Python only
      { "<leader>dr", desc = "Retry Last" },  -- TODO: Is this redundant with dap.run_last?

      ---------
      -- Git --
      ---------
      { "<leader>g", group = "Git" },
      { "<leader>gh", ":Gitsigns preview_hunk<cr>", desc = "Hunk Preview" },
      { "<leader>gp", ":Gitsigns prev_hunk<cr>", desc = "Previous Hunk" },
      { "<leader>gn", ":Gitsigns next_hunk<cr>", desc = "Next Hunk" },
      { "<leader>gs", ":Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
      { "<leader>gu", ":Gitsigns undo_stage_hunk<cr>", desc = "Unstage Hunk" },
      { "<leader>gr", ":Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },

      ----------
      -- Go --
      ----------
      -- See vim-go.lua

      -------------
      -- Harpoon --
      -------------
      { "<leader>h",  group = "Harpoon" },
      { "<leader>ha", function() ha.add_file() end, desc = "Add file to Harpoon" },
      { "<leader>hl", function() haui.toggle_quick_menu() end, desc = "List Entries" },
      { "<A-1>", function() haui.nav_file(1) end, desc = "Goto 1" },
      { "<A-2>", function() haui.nav_file(2) end, desc = "Goto 2" },
      { "<A-3>", function() haui.nav_file(3) end, desc = "Goto 3" },
      { "<A-4>", function() haui.nav_file(4) end, desc = "Goto 4" },
      { "<A-5>", function() haui.nav_file(5) end, desc = "Goto 5" },
      { "<A-6>", function() haui.nav_file(6) end, desc = "Goto 6" },
      { "<A-7>", function() haui.nav_file(7) end, desc = "Goto 7" },
      { "<A-8>", function() haui.nav_file(8) end, desc = "Goto 8" },
      { "<A-9>", function() haui.nav_file(9) end, desc = "Goto 9" },

      --------------
      -- Nav Tree --
      --------------
      { "<leader>n", group = "Nav Tree" },
      { "<leader>nn", ":NvimTreeToggle<cr>", desc = "Nav Toggle (or C-n)" },
      { "<leader>nf", ":NvimTreeFocus<cr>", desc = "Focus (or C-f)" },
      { "<leader>ni", ":NvimTreeFindFile!<cr>", desc = "Focus File & Root (or C-i)" },
      -- Alternative:
      { "<C-n>", ":NvimTreeToggle<cr>", desc = "Nav Toggle" },
      { "<C-f>", ":NvimTreeFocus<cr>", desc = "Nav Focus" },
      { "<C-i>", ":NvimTreeFindFile!<cr>", desc = "Nav Focus File & Root" },

      --------------
      -- Quickfix --
      --------------
      { "<leader>q",  group = "Quickfix" },
      { "<leader>qo", ":copen<cr>", desc = "Open Quickfix" },
      { "<leader>qc", ":cclose<cr>", desc = "Close Quickfix" },
      { "<leader>qn", ":cnext<cr>", desc = "Next Item" },
      { "<leader>qp", ":cprev<cr>", desc = "Previous Item" },
      { "<leader>qf", ":cfirst<cr>", desc = "First Item" },
      { "<leader>ql", ":clast<cr>", desc = "Last Item" },
      { "<leader>qh", ":colder<cr>", desc = "Older List" },
      { "<leader>qj", ":cnewer<cr>", desc = "Newer List" },
      { "<leader>qq", ":cc<cr>", desc = "Show Current Error" },

      -------------
      -- Toggles --
      -------------
      { "<leader>t",  group = "Toggles" },
      { "<leader>tt", function() require('FTerm').toggle() end, desc = "Terminal (Floating)" },
      { "<leader>tT", ":Twilight<cr>", desc = "Twilight" },
      { "<leader>tn", ":set number!<cr>", desc = "Numbers" },
      { "<leader>tr", ":set relativenumber!<cr>", desc = "Relative Numbers" },
      { "<leader>tw", ":set wrap!<cr>", desc =  "Wrapping" },
      { "<leader>th", ":set list!<cr>", desc = "Hidden Characters" },
      { "<leader>ti", ":IBLToggle<cr>", desc = "Indentation Lines" },
      { "<leader>tgs", ":Gitsigns toggle_signs<cr>", desc = "Git Signs" },
      { "<leader>tgw", ":Gitsigns toggle_word_diff<cr>", desc = "Git Word-level Diff" },
      { "<leader>tgb", ":Gitsigns toggle_line_blame<cr>", desc = "Git Blame (line)" },

      -------------
      -- Trouble --
      -------------
      { "<leader>x",  group = "Trouble Window" },
      { "<leader>xx", ":Trouble diagnostics toggle<cr>", desc = "[x] Toggle Trouble list" },
      { "<leader>xX", ":Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
      { "<leader>xs", ":Trouble symbols toggle focus=false<cr>", desc = "Toggle Symbols" },
      { "<leader>xl", ":Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions, references etc." },
      { "<leader>xL", ":Trouble loclist toggle<cr>", desc = "Location List" },
      { "<leader>xq", ":Trouble qflist toggle<cr>", desc = "Quickfix List" },

      ----------
      -- Wiki --
      ----------
      { "<leader>w",  group = "Wiki" },
      { "<leader>wn", ":ObsidianNew<cr>", desc = "New note" },
      { "<leader>ws", ":ObsidianSearch<cr>", desc = "Search" },
      { "<leader>wl", ":ObsidianLink<cr>", desc = "Link selection" },
      { "<leader>wc", ":ObsidianLinkNew<cr>", desc = "Create and link selection" },
      { "<leader>wf", ":ObsidianFollowLink<cr>", desc = "Follow link" },

      -- TODO: CMP
      -- ---------
      -- See cmp.lua for control-prefixed CMP navigation
      -- <C-j>   = Next
      -- <C-k>   = Previous
      -- <C-b>   = Scroll Docs back
      -- <C-f>   = Scroll Docs forward
      -- <C-,>   = Autocomplete menu
      -- <C-e>   = Abort, closing menu
      -- <CR>    = Abort menu on return
      -- <Tab>   = Focus next autocomplete suggestion
      -- <S-Tab> = Focus previous atocomplete suggestion
      -- <C-CR>  = Accept selection
         
      -- Copilot Telescope suggestions
      -- ---------
      -- b = {":Telescope buffers<cr>", "Buffers"},
      -- d = {":Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
      -- D = {":Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
      -- f = {":Telescope find_files<cr>", "Files"},
      -- g = {":Telescope live_grep<cr>", "Grep"},
      -- h = {":Telescope help_tags<cr>", "Help"},
      -- m = {":Telescope marks<cr>", "Marks"},
      -- r = {":Telescope resume<cr>", "Resume"},
      -- s = {":Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols"},
      -- S = {":Telescope lsp_dynamic_document_symbols<cr>", "Document Symbols"},
      -- w = {":Telescope grep_string<cr>", "Word"},

    })
  end
}

      
-- ----------------------------------------- --
-- Keys which might be useful in the future  --
-- ----------------------------------------- --
