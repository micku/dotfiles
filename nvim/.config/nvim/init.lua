require('packages')

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
cmd 'colorscheme nord'

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
opt.foldlevel = 2

-- Enable mouse scroll in terminal
opt.mouse = 'a'

-- Required for operations modifying multiple buffers like rename.
opt.hidden = true

-------------------------- UI --------------------------
opt.winbar = '%=%m %f%='
opt.laststatus = 3

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
require('debugging')
