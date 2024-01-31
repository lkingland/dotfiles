-- [[ Keymaps ]]--
-- General system keymaps.
-- See plugin definitions for their relevant keys.

-- Remap common commands which require a bit of a reach
vim.keymap.set("i", "jj", "<Esc>", { noremap=false })
vim.keymap.set("n", "QQ", ":q!<enter>", { noremap=false })
vim.keymap.set("n", "WW", ":w!<enter>", { noremap=false })
vim.keymap.set("n", "E", "$", { noremap=false })
vim.keymap.set("n", "B", "^", { noremap=false })

-- Ensure space does not interfere with itself as the leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true  })

-- Quickly navigate and remove buffers
vim.keymap.set("n", "tk", ":blast<enter>", { noremap=false })
vim.keymap.set("n", "tj", ":bfirst<enter>", { noremap=false })
vim.keymap.set("n", "th", ":bprev<enter>", { noremap=false })
vim.keymap.set("n", "tl", ":bnext<enter>", { noremap=false })
vim.keymap.set("n", "td", ":bdelete<enter>", { noremap=false })

-- Clear notifications and search highlights
vim.keymap.set('n', '<space><space>', ":set nohlsearch<CR>")
vim.keymap.set("n", "<Esc>", ":NoiceDismiss<cr>:noh<cr>", {noremap=true})

-- Number Toggles
vim.keymap.set('n', '<leader>tn', ":set number!<cr>")
vim.keymap.set('n', '<leader>tr', ":set relativenumber!<cr>")

-- Resize splits using Control+Arrow keys
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { noremap=true })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { noremap=true })
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", { noremap=true })
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", { noremap=true })

-- Select the next visual line when navigating across broken lines while
-- preserving behavior when using a count (for example `5gj`)
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true , silent = true  })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true , silent = true  })


-- vim: ts=2 sts=2 sw=2 et
