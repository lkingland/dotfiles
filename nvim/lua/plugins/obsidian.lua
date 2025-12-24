return {
  'obsidian-nvim/obsidian.nvim',
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
          path = '~/wiki', -- path = '~/src/github.com/lkingland/wiki',
        },
      },
      disable_frontmatter = true,
      legacy_commands = false,
      follow_url_func = function(url)
        vim.fn.jobstart({'open', url})
      end,
      note_id_func = function(title)
        return title
      end,

    })
  end,
}
