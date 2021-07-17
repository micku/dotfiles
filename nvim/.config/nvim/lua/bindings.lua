-- use <leader-space> to remove search higlight
vim.api.nvim_set_keymap('n', '<leader><space>', ':noh<cr>', {noremap = true})

-- Splits management
-- More inspiration here: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
vim.api.nvim_set_keymap('n', '<C-t><C-j>', '<C-w>s', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-t><C-k>', '<C-w>s', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-t><C-l>', '<C-w>v', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-t><C-h>', '<C-w>v', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>s', ':resize -5<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>w', ':resize +5<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>d', ':vertical resize -5<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>a', ':vertical resize +5<CR>', {noremap = true, silent = true})

-- Move by displayed lines, not by fisical lines
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '0', 'g0', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '$', 'g$', {noremap = true, silent = true})

-- Format code
vim.api.nvim_set_keymap('n', '<leader>f', ':Format<CR>', {noremap = true, silent = true})

-- Execute snippets of code
vim.api.nvim_set_keymap('n', '<leader>e', '<Plug>SnipRunOperator', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>ee', '<Plug>SnipRun', {silent = true})
