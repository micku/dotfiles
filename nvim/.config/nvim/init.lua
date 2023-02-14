vim.g.mapleader = " "

vim.g.python_host_prog = "~/.pyenv/versions/neovim2/bin/python"
vim.g.python3_host_prog = "~/.pyenv/versions/neovim3/bin/python"

require('plugin')

-- Enable matchit plugin which ships with vim and greatly enhances "%"
vim.cmd "runtime macros/matchit.vim"
