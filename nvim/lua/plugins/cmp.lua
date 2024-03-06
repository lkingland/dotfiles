-- Autocompletion
return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    -- TODO: evaluate:
    -- 'rafamadriz/friendly-snippets', -- snippets
  },
  config = function()
    local cmp = require('cmp')

    cmp.setup {
      preselect = cmp.PreselectMode.None, -- Do not preselect any item
      completion = {
        autocomplete = false,
        -- completeopt = 'menu,menuone,noinsert',
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-,>'] = cmp.mapping(function(fallback)
          print("toggling")
          if cmp.visible() then
            cmp.abort()
            cmp.core:reset()
          else
            cmp.complete()
          end
        end, {'i','c'}),
        ['<C-CR>'] = cmp.mapping.confirm {
          -- behavior = cmp.ConfirmBehavior.Replace,
          select = true, -- Shortcut: autoselect first entry if none selected
        },
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer' },
      },
    }

  end,
}
