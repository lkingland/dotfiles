return { 
  'folke/which-key.nvim', 
  event = "VeryLazy",
  config = function()
    local dap = require("dap")
    local dapui = require('dap.ui.widgets')
    local ha = require("harpoon.mark")
    local haui = require("harpoon.ui")

    vim.o.timeout = true
    vim.o.timeoutlen = 300

    require("which-key").setup({})
    require("which-key").register({
      -- General
      ["jj"]      = { "<Esc>", "Escape", mode = { "i" } },
      ["qq"]      = { ":q<cr>", "Quit" },
      ["QQ"]      = { ":q!<cr>", "Force quit"},
      ["E"]       = { "$", "End of line"},
      ["B"]       = { "^", "Beginning of line"},
      ["<C-s>"]   = { "<cmd>w<cr>", "Save", mode = { "i", "n", "v" } },
      ["<C-Tab>"] = {"<C-^>", "Toggle previous buffer", mode = { "i", "n", "v" } },

      -- Buffers
      ["bd"] = {":bdelete<enter>", "Buffer Delete"},
      ["bf"] = {":bfirst<enter>", "Buffer First" },
      ["bl"] = {":blast<enter>", "Buffer Last" },
      ["bn"] = {":bnext<enter>", "Buffer Next" },
      ["bp"] = {":bprev<enter>", "Buffer Previous" },

      ["<space><space>"] = { ":set nohlsearch<CR>", "Clear highlights" },

      -- Panes
      ["<c-u>"] = { ":UndotreeToggle<cr>", "Toggle Undotree" },
      ["<C-i>"] = { ":copen<cr>", "Focus Quickfix" },
      ["<C-o>"] = { ":wincmd p<cr>", "Toggle Previous" },
      ["<c-n>"] = { function() require("nvim-tree.api").tree.toggle({focus=false}) end, "Toggle Tree" },
      ["<c-,>"] = { function() require("nvim-tree.api").tree.open({find_file=false}) end, "Focus Tree" },
      ["<c-.>"] = { ":NvimTreeFindFile!<cr>", "Focus tree at file" },
      -- FIXME: Mapping <c-m> (from anywhere) breaks the quickfix jump-to-file.  Following two keys shifted to the right:
      -- vim.keymap.set('n', "<c-m>", function() require("nvim-tree.api").tree.open({find_file=false}) end, { desc = "Tree Focus" } )
      -- NOTE: For reference: note the use of the buffer-selector API:
      -- vim.keymap.set('n', "<c-/>", function() require("nvim-tree.api").tree.toggle({buf = vim.api.nvim_buf_get_name(0), focus=false, update_root=true}) end, { desc = "Tree Toggle and Update Root" } )
    
      -- ["<c-h>"] = { function() vim.cmd("TmuxNavigateLeft") end, mode = { 'n', 'i' }},
      -- ["<c-j>"] = { function() vim.cmd("TmuxNavigateDown") end, mode = { 'n', 'i' }},
      -- ["<c-k>"] = { function() vim.cmd("TmuxNavigateUp") end, mode = { 'n', 'i' }},
      -- ["<c-l>"] = { function() vim.cmd("TmuxNavigateRight") end, mode = { 'n', 'i' }},

      ["<C-Up>"]    = { ":resize +2<CR>" },
      ["<C-Down>"]  = { ":resize -2<CR>" },
      ["<C-Left>"]  = { ":vertical resize -2<CR>" },
      ["<C-Right>"] = { ":vertical resize +2<CR>" },

      -- Primary commands (Leader)
      ["<leader>"] = {
        a = {
          name = "+Aerial Code Navigator",
          a = {":Telescope aerial<cr>", "Aerial via Telescope"},
          s = {":AerialToggle!<cr>", "Aerial side panel"},
          n = {":AerialNavToggle<cr>", "Aerial navigation panel"},
        },
        g = {
          name = "+Git Hunks",
          h = {":Gitsigns preview_hunk<cr>", "Preview" },
          s = {":Gitsigns stage_hunk<cr>", "Stage" },
          r = {":Gitsigns reset_hunk<cr>", "Reset" },
          u = {":Gitsigns undo_stage_hunk<cr>", "Unstage" },
          ["["] = {":Gitsigns prev_hunk<cr>", "Previous" },
          ["]"] = {":Gitsigns next_hunk<cr>", "Next" },
        },
        n = {":NoiceDismiss<cr>", "Dismiss (noice) messages"},
        s = {
          name = "+Search (Telescope)",
          -- Copilot suggestions
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


        },
        t = {
          name = "+Toggles",
          f = { function() require('FTerm').toggle() end, "Floating Term" },
          h = {":set list!<cr>", "Toggle hidden characters"},
          i = {":IBLToggle<cr>", "Toggle Indentation Lines" },
          l = {":set wrap!<cr>", "Toggle line wrapping"},
          n = {":set number<cr>", "Toggle line numbers"},
          r = {":set relativenumber!<cr>", "Toggle relative numbers"},
          w = {":Twilight<cr>", "Toggle Twilight" },
          g = {
            name = "+Git",
            s = {":Gitsigns toggle_signs<cr>","Toggle Git Symbols"},
            n = {":Gitsigns toggle_numhl<cr>","Toggle Git NumHL"},
            l = {":Gitsigns toggle_linehl<cr>","Toggle Git LineHL"},
            d = {":Gitsigns toggle_word_diff<cr>", "Toggle Git Word Diff"},
            b = {":Gitsigns toggle_line_blame<cr>", "Toggle Git Line Author (blame)"},
          },
        },
        w = {
          name = "+Wiki (Obsidian)",
          n = {":ObsidianNew<cr>", "New note"},
          s = {":ObsidianSearch<cr>", "Search"},
          l = {":ObsidianLink<cr>", "Link selection"},
          c = {":ObsidianLinkNew<cr>", "Create and link selection"},
          t = {":ObsidianToday<cr>", "Today's daily note"},
          f = {":ObsidianFollowLink<cr>", "Follow link"},
        },
        x = {
          name = "Trouble",
          x = { function() require("trouble").toggle() end, "[x] Toggle Trouble list"},
          w = { function() require("trouble").toggle("workspace_diagnostics") end, "[w]orkspace diagnostics"},
          d = { function() require("trouble").toggle("document_diagnostics") end, "[d]ocument diagnostics"},
          q = { function() require("trouble").toggle("quickfix") end, "[q]uickfix"},
          l = { function() require("trouble").toggle("loclist") end, "[l]oclist"},
        },
        -- "/" = "Toggle comment (line or visual block)" -- See comment.lua
      },
      [";"] = {
        name = "+Assistant (AI)",
        c = { ":ChatGPT<cr>", "Chat", mode = { "n", "v" } },
        a = { ":ChatGPTActAs<cr>", "Chat as a...", mode = { "n", "v" } },
        e = { ":ChatGPTEditWithInstructions<cr>", "Edit", mode = { "n", "v" } },
        r = { ":ChatGPTRun<cr>", "Run", mode = { "n", "v" } },
        s = { ":Copilot panel<cr>", "Suggestions panel", mode = { "n", "v" } },
        -- TODO: Copilot {x} additional mappings
      },
      [","] = {
        name = "+Code Actions (Testing, Debugging)",
        l = {
          name = "+LSP"

        },
        d = {
          name = "+Debug",
          b = { function() dap.toggle_breakpoint() end, "Breakpoint Toggle"},
          c = { function() dap.continue() end, "Continue"},
          f = { function() dapui.sidebar(dapui.frames).toggle() end, "Toggle Frames (call stack)" }, -- NOTE: can also: dapui.centered_float(widgets.frames)
          h = { function() dapui.hover() end, "Hover"},
          i = { function() dap.step_into() end, "Into"},
          l = { function() dap.run_last() end, "Last (rerun)"},
          m = { function() dap.set_breakpoint(nil, nil, vim.fn.input('[m]essage: ')) end, "Breakpoint with message"},
          o = { function() dap.step_over() end, "Over"},
          p = { function() dapui.preview() end, "Preview"},
          r = { function() dap.repl.open() end, "Toggle Repl"},
          s = { function() dapui.sidebar(dapui.scopes).toggle() end, "Toggle Scopes (variables)"},
          u = { function() dap.step_out() end, "Up / out"},
          x = { function() dap.terminate() end, "Exit (terminate)"},

          -- Language-Specific Keys
          -- NOTE: language-specific implementations are loaded in individual
          -- files (dap-go.lua, dap-python.lua etc).  Just labels here.
          t = "Test This",   -- Currently Go only
          m = "Test Method", -- Currently Python only
          r = "Retry Last", -- TODO: Is this redundant with dap.run_last?
        },
      },

      -- Harpoon
      -- -------
      ["<C-a>"] = { function() ha.add_file() end, "Add file to Harpoon"},
      ["<C-e>"] = { function() haui.toggle_quick_menu() end, "Harpoon Entries"},
      ["<A-1>"] = { function() haui.nav_file(1) end, "Goto 1"},
      ["<A-2>"] = { function() haui.nav_file(2) end, "Goto 2"},
      ["<A-3>"] = { function() haui.nav_file(3) end, "Goto 3"},
      ["<A-4>"] = { function() haui.nav_file(4) end, "Goto 4"},
      ["<A-5>"] = { function() haui.nav_file(5) end, "Goto 5"},
      ["<A-6>"] = { function() haui.nav_file(6) end, "Goto 6"},
      ["<A-7>"] = { function() haui.nav_file(7) end, "Goto 7"},
      ["<A-8>"] = { function() haui.nav_file(8) end, "Goto 8"},
      ["<A-9>"] = { function() haui.nav_file(9) end, "Goto 9"},

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

      -- Behaviorial Changes
      -- -------------------
      -- Ensure space does not interfere with itself as the leader key
      ["<Space>"] =  { '<Nop>', mode = { 'n', 'v' } },
      -- Select the next visual line when navigating across broken lines while
      -- preserving behavior when using a count (for example `5gj`)
      ["k"] = { "v:count == 0 ? 'gk' : 'k'", expr = true },
      ["j"] = { "v:count == 0 ? 'gj' : 'j'", expr = true },
      -- Get erfereces via trouble?  TODO: Confirm functional:
      ["gR"] = { function() require("trouble").toggle("lsp_references") end, "[r]eferences via LSP"},


    })
  end
}

      
