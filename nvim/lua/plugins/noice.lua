return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = { },
  dependencies = {
    "MunifTanjim/nui.nvim", -- if lazy-load plugin below, add `module="..."` entries
    "rcarriga/nvim-notify", -- only if using notificaiton view (mini) default
  },
  config = function() 
    vim.keymap.set("n", "<leader>nn", ":NoiceDismiss<cr>", {noremap=true})

    require("noice").setup {
      messages = {
        view = "mini"
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins
        -- use Treesitter
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        -- command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    }
  end,
}

