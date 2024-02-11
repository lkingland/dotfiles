return {
  'epwalsh/obsidian.nvim',
  version = '*',  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function() 

    vim.keymap.set('n', '<leader>on', ':ObsidianNew<cr>', { desc = '[n]ew note X' } )
    vim.keymap.set('n', '<leader>os', ':ObsidianSearch<cr>', { desc = '[s]earch' } )
    vim.keymap.set('n', '<leader>ol', ':ObsidianLink<cr>', { desc = '[l]ink selection to X' } )
    vim.keymap.set('n', '<leader>oc', ':ObsidianLinkNew<cr>', { desc = '[c]reate X and link selection' } )
    vim.keymap.set('n', '<leader>ot', ':ObsidianToday<cr>', { desc = '[t]oday\'s daily note' } )
    vim.keymap.set('n', '<leader>of', ':ObsidianFollowLink<cr>', { desc = '[f]ollow link' } )

    vim.keymap.set('n', 'gf', function()
      if require('obsidian').util.cursor_on_markdown_link() then
        return '<cmd>ObsidianFollowLink<CR>'
      else
        return 'gf'
      end
    end, { noremap = false, expr = true })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        vim.wo.conceallevel = 2
      end,
    })

    require('obsidian').setup({
      workspaces = {
        {
          name = 'wiki',
          path = '~/wiki',
        },
      },
      disable_frontmatter = true,
      completion = {
        -- The following are mutually exclusive:
        prepend_note_id = false,
        prepend_note_path = false,
        use_path_only = true,
      },
      follow_url_func = function(url)
        vim.fn.jobstart({'xdg-open', url})
        -- vim.fn.jobstart({"open", url})  -- Mac OS
      end,
      note_id_func = function(title)
        return title
      end,

    })
  end,
}
