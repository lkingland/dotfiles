-- [[ Load ]] --
-- Install the Lazy package manager and setup plugins.  Plugins may be
-- individually configured further through a .lua file required in init.lua

---------------------------
--  Initialize Lazy      --
---------------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  print("git clone folke/lazy.nvim")
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

---------------------------
--  Load Plugins         --
---------------------------

-- NOTE: To load All Plugins from ./plugins, use:
-- require('lazy').setup({ import = 'plugins' },{}) -- import ./plugins/*

-- To Load Plugins Individually instead, use (making it easy to disable):
require('lazy').setup({
  -- require('plugins.copilot'),
  require('plugins.noice'),
  require('plugins.notify'),
  -- require('plugins.tokyonight'),
  -- require('plugins.onedark'),
  --
  require('plugins.catppuccin'),
  
  require('plugins.aerial'),
  -- require('plugins.evergarden'),
  require('plugins.chatgpt'),
  require('plugins.cmp'),
  require('plugins.comment'),
  require('plugins.dap'),
  require('plugins.dap-go'),
  require('plugins.dap-python'),
  require('plugins.dap-ui'),
  require('plugins.fterm'),
  require('plugins.fugitive'),
  require('plugins.gitsigns'),
  require('plugins.harpoon'),
  require('plugins.indent-blankline'),
  require('plugins.init'),
  require('plugins.lspconfig'),
  require('plugins.lualine'),
  require('plugins.obsidian'),
  require('plugins.telescope'),
  require('plugins.tmux-navigator'),
  require('plugins.tree'),
  require('plugins.treesitter'),
  require('plugins.trouble'),
  require('plugins.twilight'),
  require('plugins.undotree'),
  require('plugins.winresize'),
  require('plugins.vim-go'),
  require('keymaps')
},{})

-- vim: ts=2 sts=2 sw=2 et


