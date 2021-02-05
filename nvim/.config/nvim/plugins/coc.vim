vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)
"  GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"  Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"  Coc Jest
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" vim-fugitive config
let g:fugitive_stash_domains = ['stash.int.klarna.net']

