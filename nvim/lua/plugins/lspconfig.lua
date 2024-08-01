-- Configure NeoVim to use langauge servers etc with nvim-lspconfig
-- NOTE: some packages do not work on NixOS as Nix is not able to 
-- run dynamically linked executables by default.  TODO: nix mason for Nix.
-- Installs and updates available langauge servers with mason
-- (also linters, formatters, DAPs)
return {
  'neovim/nvim-lspconfig',

  dependencies = {
    { 'williamboman/mason.nvim', config = true }, -- Installer/Updater
    { 'williamboman/mason-lspconfig.nvim' }, -- Integrate
    { 'j-hui/fidget.nvim', opts = {} }, -- LSP progress message scroller UX
    { 'folke/neodev.nvim' }, -- Enable for neovim builtin api
  },

  -- on_attach is run when an lsp attaches to a given buffer
  on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end
      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
  end,

  -- Configure
  config = function()
    -- TODO: figure out why these all have "which_key_ignore set"
    -- require('which-key').register {
    --   ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
    --   ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
    --   ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
    --   ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
    --   ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
    --   ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
    --   ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
    --   ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    -- }

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
    end

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        signs = true,
        virtual_text = false, 
        -- update_in_insert = false,
      }
    )

    -- TODO: Remove?  Leaning on vim-fugitive for git-related stuffs.
    -- register which-key VISUAL mode
    -- required for visual <leader>hs (hunk stage) to work
    require('which-key').register({
      ['<leader>'] = { name = 'VISUAL <leader>' },
      ['<leader>h'] = { 'Git [H]unk' },
    }, { mode = 'v' })

    -- Setup individual language servers using Mason
    local servers = {
      clangd = {},
      gopls = {
        settings = {
          gopls = {
            buildFlags = { '-tags=e2e' }, 
          },
        },
      },
      pyright = {

      },
      rust_analyzer = {},
      tsserver = {},
      html = { filetypes = { 'html', 'twig', 'hbs'} },
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          -- NOTE: below ignores Lua_LS's noisy `missing-fields` warnings
          diagnostics = { disable = { 'missing-fields' } },
        },
      },
    }

    require('mason').setup()
    require('neodev').setup() -- Setup neovim lua configuration
    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }
    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }

    -- Turn on lsp status information
    require('fidget').setup()

  end,
}

-- TODO:
-- Diagnostic keymaps?
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
