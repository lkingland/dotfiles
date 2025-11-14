--[[ Options ]]--
-- see `:help {option}`

vim.o.breakindent    = true -- indent broken lines
vim.o.clipboard      = 'unnamedplus' -- Sync clipboard with OS
vim.o.colorcolumn    = "80"  -- vertical bar at 80
vim.o.completeopt    = 'menuone,noselect' -- bettter completion experience
vim.o.conceallevel   = 2 -- Required by some plugins
vim.o.hlsearch       = true -- Highlight on search
vim.o.ignorecase     = true -- Deafult to case insensitive searches
vim.o.incsearch      = true -- Incremental Search
vim.o.mouse          = 'a' -- Enable mouse
vim.o.number         = true -- Show line numbers
vim.o.numberwidth    = 2 -- only reserve two cols for line numbers
vim.o.relativenumber = true -- Relative line numbering
vim.o.scrolloff      = 8 -- Scroll when 8 lines remaining
vim.o.showmatch      = true -- Show matching bracket
vim.o.showmode       = false -- no modeline in insert or visual mode
vim.o.smartcase      = true -- Case sensitive searches if any capitals
vim.o.splitbelow     = true -- Split top to bottom
vim.o.splitright     = true -- Split left to right
vim.o.termguicolors  = true -- enable colors
vim.o.timeoutlen     = 500 -- Decrease timeout time
vim.o.undofile       = true -- Save undo history
vim.o.undolevels     = 10000 -- 10x the default
vim.o.undoreload     = 100000 -- 10x the default
vim.o.updatetime     = 250 -- Decrease update time
vim.o.wildmode       = 'list:longest,full' -- only autocmplete on double-Tab
vim.wo.signcolumn    = 'yes' --  Always show sign column (current window)
vim.opt.laststatus   = 3 -- Suggested by avante

-- Mapleader
vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '

-- Indentation 
vim.o.tabstop = 4 -- display existing tabs as 4 spaces
vim.o.shiftwidth = 4 -- set indentation operations to 4 spaces
vim.o.expandtab = true -- Tab key is auto-expanded to enter spaces
vim.o.softtabstop = 4 -- Number of spaces entered is 4 (and backspace inverse)
vim.o.smartindent = true

-- Highlight Yanked
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Remove trailing blankline character
vim.opt.fillchars    = { eob = " " } 

vim.opt.wrap = false -- toggle linewrap with <leader>tl
vim.opt.list = false -- toggle hidden characters with <leader>th 
vim.opt.listchars:append("extends:➔")

-- cursor
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" ..
                    ",a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor" ..
                    ",sm:block-blinkwait175-blinkoff150-blinkon175"

-- spelling
vim.opt_local.spell = true
vim.opt_local.spelllang = { "en_us" }

-- Go (golang)
vim.g.go_test_show_name = 1
vim.g.go_test_timeout= '20s'
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_generate_tags = 1



-- TODO
-- ---------------------

-- Use XDG_DATA_HOME instead:
vim.o.undodir = os.getenv("HOME") .. "/.vimundo" 

-- Consider line continuation:
-- vim.o.whichwrap =  "b,s,h,l,<,>,[,]"

-- Enable comment continuation
vim.opt.formatoptions:append("r") -- Continue comments when pressing Enter in Insert mode
vim.opt.formatoptions:append("o") -- Continue comments when pressing o or O in Normal mode 

-- check relying on undotree entirely:
-- vim.o.swapfile = false
-- vim.o.backup = false

-- Go err block:
-- vim.keymap.set("n", "<leader>ee", "<cmd>GoIfErr<cr>",
--   {silent = true, noremap = true}
-- )

-- Remoe quickfix buffers from buffer lists
-- autocmd("FileType", {
--  pattern = "qf",
--  callback = function()
--    vim.opt_local.buflisted = false
--  end,
-- })

-- vim: ts=2 sts=2 sw=2 et
