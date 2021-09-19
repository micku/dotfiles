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
"  Lua
Plug 'nvim-lua/plenary.nvim'                                    " Lua utils
"  Editing
Plug 'tpope/vim-surround'                                       " Work with surrounding chars
Plug 'RRethy/nvim-treesitter-textsubjects'                      " Incremental selection
"  Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }             " Fuzzy search
Plug 'junegunn/fzf.vim'                                         " ^^^^^ ^^^^^^
Plug 'christoomey/vim-tmux-navigator'                           " Tmux + Vim splits
"  Generic dev
Plug 'editorconfig/editorconfig-vim'                            " .editorconfig support
Plug 'neovim/nvim-lspconfig'                                    " Common config for LSP
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " Better syntax highlighting
Plug 'hrsh7th/nvim-compe'                                       " Autocompletion
Plug 'onsails/lspkind-nvim'                                     " LSP pictograms
Plug 'mhartington/formatter.nvim'                               " Code formatter
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}              " Execute snippets of code
"  Git
Plug 'tpope/vim-fugitive'                                       " Git inside Vim
Plug 'tommcdo/vim-fubitive'                                     " Bitbucket plugin for vim-fugitive
Plug 'tpope/vim-rhubarb'                                        " GitHub plugin for vim-fugitive
Plug 'mobiushorizons/fugitive-stash.vim'                        " Stash plugin for vim-fugitive
"  UI
Plug 'dracula/vim', { 'as': 'dracula' }                         " Dracula theme mainly for lightline
Plug 'itchyny/lightline.vim'                                    " Better statusline
Plug 'ryanoasis/vim-devicons'                                   " DevIcons
Plug 'kyazdani42/nvim-web-devicons'                             " DevIcons :|
Plug 'glepnir/lspsaga.nvim'                                     " LSP UI
Plug 'folke/zen-mode.nvim'                                      " Zen mode
"  File explorer
Plug 'tamago324/lir.nvim'                                       " File explorer

call plug#end()
"End vim-plug Scripts-------------------------

lua << EOF
local cmd = vim.cmd
local api = vim.api
local opt = vim.opt
local g = vim.g

-------------------- NEOVIM PYTHON CONFIGURATION --------------------

g.python_host_prog = '~/.pyenv/versions/neovim2/bin/python'
g.python3_host_prog = '~/.pyenv/versions/neovim3/bin/python'


---------------------- USABILITY CONFIGURATION ----------------------
-- Basic and pretty much needed settings to provide a solid base for
-- source code editting

-- Play nice with colors and themes
opt.termguicolors = true
cmd 'colorscheme dracula'

-- Turn on syntax highlighting
--syntax on
-- Set some colors
cmd 'highlight Search ctermbg=4'
cmd 'highlight LineNr ctermfg=8'
cmd 'highlight CursorLineNr ctermfg=5'
cmd 'highlight Comment cterm=italic ctermfg=8'
cmd 'highlight Todo ctermbg=8 ctermfg=6'
cmd 'highlight Statement cterm=bold ctermfg=15'

require('options')

-- Enable matchit plugin which ships with vim and greatly enhances '%'
cmd 'runtime macros/matchit.vim'

-- Set , as mapleader
g.mapleader = ','

-- Yank to and paste from system clipboard
opt.clipboard = opt.clipboard + 'unnamedplus'

-- Windows splitting
opt.splitbelow = true
opt.splitright = true

-- Enable folding
opt.foldmethod = 'syntax'
opt.foldnestmax = 10
opt.foldlevel =2

-- Enable mouse scroll in terminal
opt.mouse = 'a'

-- Required for operations modifying multiple buffers like rename.
opt.hidden = true


---------------------- FILE TYPES ----------------------

cmd([[
  autocmd BufNewFile,BufRead *.md setlocal ft=markdown " .md files are markdown files
  autocmd BufNewFile,BufRead *.go setlocal ft=go " .go files are golang files
]])

---------------------- PLUGINS ----------------------

require('fuzzysearch')
require('git')
require('treesitter')
require('codeFormat')
require('lsp')
require('autocompletion')
require('fileExplorer')
require('bindings')
EOF


" " ---------------------- PLUGINS ----------------------
" 
source ~/.config/nvim/plugins/lightline.vim
