return {
  'nathangrigg/vim-beancount',
  ft = { 'beancount', 'bean' },
  init = function()
    -- Set buffer-local variable when opening beancount files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'beancount',
      callback = function()
        vim.b.beancount_root = vim.fn.expand('~/src/kingland.io/pta/main.bean')
      end,
    })
  end,
}
