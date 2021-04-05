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
Plug 'terryma/vim-expand-region'                                " Incremental selection
"  Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }             " Fuzzy search
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'                           " Tmux + Vim splits
"  Generic dev
Plug 'editorconfig/editorconfig-vim'                            " .editorconfig support
Plug 'neomake/neomake'                                          " Async make and linting
Plug 'tpope/vim-fugitive'                                       " Git inside Vim
Plug 'tommcdo/vim-fubitive'                                     " Bitbucket plugin for vim-fugitive
Plug 'tpope/vim-rhubarb'                                        " GitHub plugin for vim-fugitive
Plug 'mobiushorizons/fugitive-stash.vim'                        " Stash plugin for vim-fugitive
Plug 'ludovicchabant/vim-gutentags'                             " Automatically manage ctags
Plug 'sheerun/vim-polyglot'                                     " Syntax highlighting language packs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"  UI
Plug 'dracula/vim', { 'as': 'dracula' }                         " Dracula theme mainly for lightline
Plug 'itchyny/lightline.vim'                                    " Better statusline
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }       " File browser
Plug 'ryanoasis/vim-devicons'                                   " DevIcons
Plug 'kristijanhusak/defx-icons'                                " DevIcons for Defx

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
" Hide '-- INSERT --' since it is already shown in lightline
set noshowmode

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

" Enable folding
set foldmethod=syntax   
set foldnestmax=10
set nofoldenable
set foldlevel=2


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

" Enable mouse scroll in terminal
if has('mouse')
    set mouse=a
endif

" Required for operations modifying multiple buffers like rename.
set hidden


" ---------------------- BINDINGS ----------------------

source ~/.config/nvim/bindings.vim


" ---------------------- PLUGINS ----------------------

source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/neomake.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/defx.vim
source ~/.config/nvim/plugins/coc.vim

let g:gutentags_enabled = 1
let g:gutentags_define_advanced_commands = 1
let g:gutentags_cache_dir = '~/.vim/tags/'

" vim-expand-region custom config
vmap v <Plug>(expand_region_expand)
