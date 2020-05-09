call neomake#configure#automake({
  \ 'TextChanged': {},
  \ 'InsertLeave': {},
  \ 'BufWritePost': {},
  \ 'BufWinEnter': {},
  \ }, 0)
let g:neomake_python_enabled_makers = ['mypy']
let g:neomake_python_mypy_maker = {
  \ 'exe': 'mypy',
  \ 'args': [
             \ '--show-column-numbers',
             \ '--show-error-codes',
             \ '--check-untyped-defs',
             \ '--ignore-missing-imports',
             \ ],
  \ 'errorformat':
            \ '%E%f:%l:%c: error: %m,' .
            \ '%W%f:%l:%c: warning: %m,' .
            \ '%I%f:%l:%c: note: %m,' .
            \ '%E%f:%l: error: %m,' .
            \ '%W%f:%l: warning: %m,' .
            \ '%I%f:%l: note: %m,' .
            \ '%-GSuccess%.%#,' .
            \ '%-GFound%.%#,'
  \ }
let g:neomake_error_sign = {
  \ 'text': '',
  \ 'texthl': 'NeomakeErrorSign',
  \ }

