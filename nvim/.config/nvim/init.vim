"Plugins-----------------------------
" Check if vim-plug is installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" List of plugins
"  Editing
Plug 'tpope/vim-surround'                                       " Work with surrounding chars
Plug 'tpope/vim-vinegar'                                        " Netrw improved
Plug 'davidhalter/jedi-vim'                                     " Static analysis
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " Autocomplete
Plug 'terryma/vim-expand-region'                                " Incremental selection
"  Navigation
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'             " Fuzzy search
Plug 'christoomey/vim-tmux-navigator'                           " Tmux + Vim splits
"  Generic dev
Plug 'editorconfig/editorconfig-vim'                            " .editorconfig support
Plug 'neomake/neomake'                                          " Async make and linting
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }                                                         " Language Server support
Plug 'tpope/vim-fugitive'                                       " Git inside Vim
Plug 'tpope/vim-rhubarb'                                        " GitHub plugin for vim-fugitive
"  Python
Plug 'SkyLeach/pudb.vim'                                        " Python debugger
Plug 'psf/black'                                                " Python formatter TBD

call plug#end()
"End vim-plug Scripts-------------------------

" -------------------- NEOVIM PYTHON CONFIGURATION --------------------

let g:python_host_prog=expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog=expand('~/.pyenv/versions/neovim3/bin/python')

" ---------------------- USABILITY CONFIGURATION ----------------------
"  Basic and pretty much needed settings to provide a solid base for
"  source code editting

" Turn on syntax highlighting
syntax on
" Set some colors
highlight Search ctermbg=4
highlight LineNr ctermfg=8
highlight CursorLineNr ctermfg=5
highlight Comment cterm=italic ctermfg=8
highlight Todo ctermbg=8 ctermfg=6
highlight Statement cterm=bold ctermfg=15
" Show line numbers relative to cursor
set number
set relativenumber

" Use UTF-8 for files
set encoding=utf-8
set fileencoding=utf-8

" Enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" Set unix line endings
set fileformat=unix

" When reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos

" Save up to 100 marks, enable capital marks
set viminfo='100,f1

" Screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw

" Set , as mapleader
let mapleader = ","

" Yank to and paste from system clipboard
set clipboard+=unnamedplus

" Keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" Indentation
set expandtab       " use spaces instead of tabs
set smartindent     " smarter indent for C-like languages
set shiftwidth=4    " when reading, tabs are 4 spaces
set softtabstop=4   " in insert mode, tabs are 4 spaces

" Search settings
set ignorecase       " Do case insensitive matching
set smartcase        " With ignorecase, if all lowercase, case insensitive

" Make undo persistant
set undofile

" Netrw configuration
let g:netrw_liststyle = 3
set wildignore+=*.pyc

" Windows splitting
set splitbelow
set splitright
"
" vim-expand-region custom config
vmap v <Plug>(expand_region_expand)


" ---------------------- FILE TYPES ----------------------

" on file types...
"   .md files are markdown files
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
"   .twig files use html syntax
autocmd BufNewFile,BufRead *.twig setlocal ft=html
"   .less files use less syntax
autocmd BufNewFile,BufRead *.less setlocal ft=less
"   .jade files use jade syntax
autocmd BufNewFile,BufRead *.jade setlocal ft=jade
"   .go files are golang files
autocmd BufNewFile,BufRead *.go setlocal ft=go


" ---------------------- BINDINGS ----------------------

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

" Enable mouse scroll in terminal
if has('mouse')
    set mouse=a
endif

" Move by displayed lines, not by fisical lines
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

" fzf
let g:fzf_command_prefix = 'Fzf'
nnoremap <leader>- :FzfFiles!<cr>
nnoremap <leader>, :FzfAg!<cr>
nnoremap <leader>c :FzfCommits!<cr>

" Black
nnoremap <leader>f :Black<cr>

" ---------------------- PLUGINS ----------------------

source ~/.config/nvim/jedi.vim
source ~/.config/nvim/pudb.vim
source ~/.config/nvim/neomake.vim

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['~/.pyenv/versions/neovim3/bin/pyls'],
    \ }
" Disable linting since it is done by Neomake + Mypy
let g:LanguageClient_diagnosticsEnable = 0

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:deoplete#enable_at_startup = 1
