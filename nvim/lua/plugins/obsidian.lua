return {
  'epwalsh/obsidian.nvim',
  version = '*',  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function() 

    -- TODO: Move to which-key global config (confirming no breaky)
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
          path = '~/src/kingland.io/wiki',
        },
      },
      disable_frontmatter = true,
      completion = {
        -- TODO: The following are deprecated and I need to use
        -- wiki_link_func instead
        -- prepend_note_id = false,
        -- prepend_note_path = false,
        -- use_path_only = true,
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
