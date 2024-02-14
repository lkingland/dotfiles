
return {
  'nvim-tree/nvim-tree.lua',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup { 
      disable_netrw = false,
    }


    vim.keymap.set('n', "<c-n>", function() require("nvim-tree.api").tree.toggle({focus=false}) end, { desc = "Tree Toggle" } )
    -- FIXME: Mapping <c-m> (from anywhere) breaks the quickfix jump-to-file.  Following two keys shifted to the right:
    -- vim.keymap.set('n', "<c-m>", function() require("nvim-tree.api").tree.open({find_file=false}) end, { desc = "Tree Focus" } )
    vim.keymap.set('n', "<c-,>", function() require("nvim-tree.api").tree.open({find_file=false}) end, { desc = "Tree Focus" } )
    vim.keymap.set('n', "<c-.>", ":NvimTreeFindFile!<cr>", { desc = "Tree Find File" } )


    -- For reference: note the use of the buffer-selector API:
    -- vim.keymap.set('n', "<c-/>", function() require("nvim-tree.api").tree.toggle({buf = vim.api.nvim_buf_get_name(0), focus=false, update_root=true}) end, { desc = "Tree Toggle and Update Root" } )
  end,
}
