return {
  "ThePrimeagen/harpoon",
  -- dependencies = { '' },
  config = function()
    require("harpoon").setup({
        menu = {
            width = vim.api.nvim_win_get_width(0) - 20,
        }
    })

    vim.keymap.set('n', "<leader>ha", require('harpoon.mark').add_file, { desc = "[H]arpoon [a]dd" } )
    vim.keymap.set('n', "<C-e>", require('harpoon.ui').toggle_quick_menu)
    vim.keymap.set('n', "<A-1>", function() require('harpoon.ui').nav_file(1) end)
    vim.keymap.set('n', "<A-2>", function() require('harpoon.ui').nav_file(2) end)
    vim.keymap.set('n', "<A-3>", function() require('harpoon.ui').nav_file(3) end)
    vim.keymap.set('n', "<A-4>", function() require('harpoon.ui').nav_file(4) end)
    vim.keymap.set('n', "<A-5>", function() require('harpoon.ui').nav_file(5) end)
    vim.keymap.set('n', "<A-6>", function() require('harpoon.ui').nav_file(6) end)
    vim.keymap.set('n', "<A-7>", function() require('harpoon.ui').nav_file(7) end)
    vim.keymap.set('n', "<A-8>", function() require('harpoon.ui').nav_file(8) end)
    vim.keymap.set('n', "<A-9>", function() require('harpoon.ui').nav_file(9) end)
    vim.keymap.set('n', "<A-0>", function() require('harpoon.ui').nav_file(0) end)
  end,
}

