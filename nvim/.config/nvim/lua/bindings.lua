local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- use <leader-space> to remove search higlight
map('n', '<leader><space>', ':noh<cr>')

-- Splits management
-- More inspiration here: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
map('n', '<C-t><C-j>', '<C-w>s')
map('n', '<C-t><C-k>', '<C-w>s')
map('n', '<C-t><C-l>', '<C-w>v')
map('n', '<C-t><C-h>', '<C-w>v')
map('n', '<C-J>', '<C-W><C-J>', {silent = true})
map('n', '<C-K>', '<C-W><C-K>', {silent = true})
map('n', '<C-L>', '<C-W><C-L>', {silent = true})
map('n', '<C-H>', '<C-W><C-H>', {silent = true})
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
local cmd = vim.cmd
cmd 'command! -bang -nargs=* FzfAg call fzf#vim#ag(<q-args>, {"options": "--delimiter : --nth 4.."}, <bang>0)'
map('n', '<leader>,', ':FzfAg!<cr>')
map('n', '<leader>c', ':FzfCommits!<cr>')

-- vim-expand-region custom config
map('v', 'v', '<Plug>(expand_region_expand)', {noremap = false})

-- debugging
map('n', '<F5>', ':lua require"dap".continue()<CR>', {silent = true})
map('n', '<F7>', ':lua require"dap".repl.open()<CR>', {silent = true})
map('n', '<F8>', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', {silent = true})
map('n', '<F9>', ':lua require"dap".toggle_breakpoint()<CR>', {silent = true})
map('n', '<F10>', ':lua require"dap".step_over()<CR>', {silent = true})
map('n', '<F11>', ':lua require"dap".step_into()<CR>', {silent = true})
map('n', '<F12>', ':lua require"dap".step_out()<CR>', {silent = true})
--nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
--nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
