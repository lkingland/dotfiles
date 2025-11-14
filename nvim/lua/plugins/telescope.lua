-- [[ Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

-- [[ LiveGrepGitRoot ]] --
-- Creates a function which will search from the git root of the current buffer

local function find_git_root()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  if current_file == '' then
    current_dir = cwd -- return if buffer not a file
  else
    current_dir = vim.fn.fnamemodify(current_file, ':h') -- get dir
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    print 'Not a git repository. Searching on current working directory'
    return cwd
  end
  return git_root
end

local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end

-- [[ Configure Telescope ]] --
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-telescope/telescope-symbols.nvim',
    'nvim-lua/plenary.nvim',
    'sharkdp/fd',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1 -- make rquired
      end,
    },
  },
  config = function()
    -- require('telescope').load_extension('harpoon')
    -- require('telescope').load_extension('git_worktree')
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ["<C-n>"] = require('telescope.actions').move_selection_next,
            ["<C-p>"] = require('telescope.actions').move_selection_previous,
          },
        },
      }
    })
    pcall(require('telescope').load_extension, 'fzf')

    vim.keymap.set('n', '<leader>ss', require('telescope.builtin').oldfiles, { desc = 'recent' })
    vim.keymap.set("n", "<Leader>sn", "<CMD>lua require('telescope').extensions.notify.notify()<CR>", { desc = '[n]otify', silent=true })
    vim.keymap.set("n", "<Leader>st", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", { desc = "work[t]rees", silent=true })
    vim.keymap.set("n", "<Leader>sT", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", { desc = "create work[T]ree", silent=true })
    vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[b]uffers' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[d]iagnostics' })
    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[f]iles' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[g]rep' })
    vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[G]rep from Git Root' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[h]elp' })
    vim.keymap.set('n', '<leader>sm', ":Telescope harpoon marks<CR>", { desc = '[m]arks (harpoon)' })
    vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[r]esume' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[w]ord' })

    vim.keymap.set("n", "<Leader><tab>", "<Cmd>lua require('telescope.builtin').commands()<CR>", {noremap=false})

    -- fuzzy-search current buffer with example theme options
    vim.keymap.set('n', '<leader>s/', function()
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10, -- example of passing to change theme, layout, etc.
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search current buffer' })

    -- Register the LiveGrepGitRoot command
    vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})



  end,
}









