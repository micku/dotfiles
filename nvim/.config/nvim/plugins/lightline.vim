let g:lightline = {
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'gitbranch' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'filetype': 'LightlineFiletype',
      \ },
      \ 'component': {
      \ },
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'VL',
      \   "\<C-v>": 'VB',
      \   'c' : 'C',
      \   's' : 'S',
      \   'S' : 'SL',
      \   "\<C-s>": 'SB',
      \   't': 'T',
      \ },
      \ }

function! LightlineFilename()
  let filename = expand('%:f') !=# '' ? expand('%:f') : '[No Name]'
  let modified = &modified ? '+' : ''
  return filename . modified
endfunction

function! LightlineFugitive()
  if exists('*FugitiveHead')
    return FugitiveHead()
  endif
  return ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : WebDevIconsGetFileTypeSymbol()
endfunction
