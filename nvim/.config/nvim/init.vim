"Plugins-----------------------------
" Check if vim-plug is installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" TODO: Remove the package manager (https://neovim.io/doc/user/usr_05.html#05.6)
" and use the native one + git submodules (https://shapeshed.com/vim-packages/)

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
Plug 'neovim/nvim-lspconfig'                                    " Common config for LSP
Plug 'tpope/vim-fugitive'                                       " Git inside Vim
Plug 'tommcdo/vim-fubitive'                                     " Bitbucket plugin for vim-fugitive
Plug 'tpope/vim-rhubarb'                                        " GitHub plugin for vim-fugitive
Plug 'mobiushorizons/fugitive-stash.vim'                        " Stash plugin for vim-fugitive
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " Better syntax highlighting
Plug 'hrsh7th/nvim-compe'                                       " Autocompletion
Plug 'onsails/lspkind-nvim'                                     " LSP pictograms
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

" Play nice with colors and themes
set termguicolors
colorscheme dracula

" Turn on syntax highlighting
syntax on
" Set some colors
highlight Search ctermbg=4
highlight LineNr ctermfg=8
highlight CursorLineNr ctermfg=5
highlight Comment cterm=italic ctermfg=8
highlight Todo ctermbg=8 ctermfg=6
highlight Statement cterm=bold ctermfg=15

:lua require('options')

" Enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" Set , as mapleader
let mapleader = ","

" Yank to and paste from system clipboard
set clipboard+=unnamedplus

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


" " ---------------------- PLUGINS ----------------------
" 
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/defx.vim

" vim-fugitive config
let g:fugitive_stash_domains = ['stash.int.klarna.net']

" vim-expand-region custom config
vmap v <Plug>(expand_region_expand)


:lua require('treesitter')
:lua require('lsp')
:lua require('autocompletion')


" ---------------------- BINDINGS ----------------------

source ~/.config/nvim/bindings.vim
