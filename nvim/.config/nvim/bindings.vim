" use <leader-space> to remove search higlight
nnoremap <leader><space> :noh<cr>

" Splits management
"More inspiration here: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
nnoremap <C-t><C-j> <C-w>s
nnoremap <C-t><C-k> <C-w>s
nnoremap <C-t><C-l> <C-w>v
nnoremap <C-t><C-h> <C-w>v
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <Leader>s :resize -5<CR>
nnoremap <silent> <Leader>w :resize +5<CR>
nnoremap <silent> <Leader>d :vertical resize -5<CR>
nnoremap <silent> <Leader>a :vertical resize +5<CR>

" Move by displayed lines, not by fisical lines
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

" Format code (doesn't work...)
nnoremap <silent> <leader>f :Format<CR>

lua << EOF
-- Execute snippets of code
vim.api.nvim_set_keymap('v', 'e', '<Plug>SnipRun', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>e', '<Plug>SnipRunOperator', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>ee', '<Plug>SnipRun', {silent = true})
EOF
