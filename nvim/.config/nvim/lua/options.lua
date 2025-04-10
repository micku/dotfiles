---- Neovim core options

-- Set the correct path of Python executables
vim.g.python_host_prog = "~/.pyenv/versions/neovim2/bin/python"
vim.g.python3_host_prog = "~/.pyenv/versions/neovim3/bin/python"

-- Enable matchit plugin which ships with vim and greatly enhances "%"
vim.cmd "runtime macros/matchit.vim"

-- On windows splitting the right way
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse scroll in terminal
vim.opt.mouse = "a"

-- Show line numbers relative to cursor
vim.wo.number = true

-- Hide '-- INSERT --' since it is already shown in lightline
vim.o.showmode = false

-- Sets the border of all floating windows
vim.o.winborder = "rounded"

-- Set unix line endings
vim.bo.fileformat = "unix"

-- When reading files try unix line endings then dos, also use unix for new buffers
vim.o.fileformats = "unix,dos"

-- Save up to 100 marks, enable capital marks
vim.o.viminfo = "'100,f1"

-- Screen will not be redrawn while running macros, registers or other non-typed comments
vim.o.lazyredraw = true

-- Keep the cursor visible within 3 lines/columns when scrolling
vim.o.scrolloff = 3
vim.o.sidescrolloff = 3

-- Indentation
vim.bo.expandtab = true       -- use spaces instead of tabs
vim.bo.smartindent = true     -- smarter indent for C-like languages
vim.bo.shiftwidth = 4         -- when reading, tabs are 4 spaces
vim.bo.softtabstop = 4        -- in insert mode, tabs are 4 spaces

-- Search settings
vim.o.ignorecase = true       -- Do case insensitive matching
vim.o.smartcase = true        -- With ignorecase, if all lowercase, case insensitive

-- Make undo persistant
vim.bo.undofile = true

-- Auto reload files modified outside of the editor
vim.o.autoread = true

-- Enable folding
vim.opt.foldmethod = 'syntax'
vim.opt.foldnestmax = 10
vim.opt.foldlevel = 2

-- Yank to and paste from system clipboard
vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'

-- Required for operations modifying multiple buffers like rename.
vim.opt.hidden = true

-- Set winbar text
vim.opt.winbar = '%=%m %f%='

-- Show status line in the last window
vim.opt.laststatus = 3
