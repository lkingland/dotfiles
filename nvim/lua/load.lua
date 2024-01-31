-- [[ Load ]] --
-- Install the Lazy package manager and setup plugins.  Plugins may be
-- individually configured further through a .lua file required in init.lua

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
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

require('lazy').setup({ import = 'plugins' },{}) -- import ./plugins/*

-- vim: ts=2 sts=2 sw=2 et


