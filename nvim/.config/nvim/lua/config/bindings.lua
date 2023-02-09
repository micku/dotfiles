local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- use <leader-space> to remove search higlight
map('n', '<leader><space>', ':noh<cr>')

-- Splits management
-- More inspiration here: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
local nvim_tmux_nav = require('nvim-tmux-navigation')
vim.keymap.set('n', '<C-J>', nvim_tmux_nav.NvimTmuxNavigateDown, {silent = true})
vim.keymap.set('n', '<C-K>', nvim_tmux_nav.NvimTmuxNavigateUp, {silent = true})
vim.keymap.set('n', '<C-L>', nvim_tmux_nav.NvimTmuxNavigateRight, {silent = true})
vim.keymap.set('n', '<C-H>', nvim_tmux_nav.NvimTmuxNavigateLeft, {silent = true})
vim.keymap.set('n', '<C-\\>', nvim_tmux_nav.NvimTmuxNavigateLastActive, {silent = true})
vim.keymap.set('n', '<C-Space>', nvim_tmux_nav.NvimTmuxNavigateNext, {silent = true})

map('n', '<C-t><C-j>', '<C-w>s')
map('n', '<C-t><C-k>', '<C-w>s')
map('n', '<C-t><C-l>', '<C-w>v')
map('n', '<C-t><C-h>', '<C-w>v')

map('n', '<Leader>s', ':resize -5<CR>', {silent = true})
map('n', '<Leader>w', ':resize +5<CR>', {silent = true})
map('n', '<Leader>d', ':vertical resize -5<CR>', {silent = true})
map('n', '<Leader>a', ':vertical resize +5<CR>', {silent = true})

-- Move by displayed lines, not by fisical lines
map('n', 'k', 'gk', {silent = true})
map('n', 'j', 'gj', {silent = true})
map('n', '0', 'g0', {silent = true})
map('n', '$', 'g$', {silent = true})

-- Format code
map('n', '<leader>f', ':Format<CR>', {silent = true})

-- Execute snippets of code
map('n', '<leader>e', '<Plug>SnipRunOperator', {silent = true})
map('n', '<leader>ee', '<Plug>SnipRun', {silent = true})

-- Zen mode
map('n', '<leader>z', ':ZenMode<CR>', {silent = true})

-- File explorer
map('n', '-', ":lua require'lir.float'.toggle()<CR>", {silent = true})

-- Fuzzy search
map('n', '<leader>-', ':FzfFiles!<cr>')
cmd 'command! -bang -nargs=* FzfAg call fzf#vim#ag(<q-args>, {"options": "--delimiter : --nth 4.."}, <bang>0)'
map('n', '<leader>,', ':FzfAg!<cr>')
map('n', '<leader>c', ':FzfCommits!<cr>')

-- vim-expand-region custom config
map('v', 'v', '<Plug>(expand_region_expand)', {noremap = false})

-- debugging
map('n', '<F4>', ':VimspectorReset<CR>', {silent = true})
map('n', '<F9>', ':call vimspector#ToggleBreakpoint()<CR>', {silent = true})
map('n', '<F5>', ':call vimspector#Continue()<CR>', {silent = true})
--map('n', '<F7>', ':lua require"dap".repl.open()<CR>', {silent = true})
--map('n', '<F8>', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', {silent = true})
map('n', '<F10>', ':call vimspector#StepOver()<CR>', {silent = true})
map('n', '<F11>', ':call vimspector#StepInto()<CR>', {silent = true})
map('n', '<F12>', ':call vimspector#StepOut()<CR>', {silent = true})
