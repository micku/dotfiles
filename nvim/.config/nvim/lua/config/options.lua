-- vim.o for setting global options
-- vim.bo for setting buffer-scoped options
-- vim.wo for setting window-scoped options
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- Show line numbers relative to cursor
opt('w', 'number', true)
opt('w', 'relativenumber', true)

-- Hide '-- INSERT --' since it is already shown in lightline
opt('o', 'showmode', false)

-- Set unix line endings
opt('b', 'fileformat', "unix")

-- When reading files try unix line endings then dos, also use unix for new buffers
opt('o', 'fileformats', "unix,dos")

-- Save up to 100 marks, enable capital marks
opt('o', 'viminfo', "'100,f1")

-- Screen will not be redrawn while running macros, registers or other non-typed comments
opt('o', 'lazyredraw', true)

-- Keep the cursor visible within 3 lines when scrolling
opt('w', 'scrolloff', 3)

-- Indentation
opt('b', 'expandtab', true)       -- use spaces instead of tabs
opt('b', 'smartindent', true)     -- smarter indent for C-like languages
opt('b', 'shiftwidth', 4)         -- when reading, tabs are 4 spaces
opt('b', 'softtabstop', 4)        -- in insert mode, tabs are 4 spaces

-- Search settings
opt('o', 'ignorecase', true)       -- Do case insensitive matching
opt('o', 'smartcase', true)        -- With ignorecase, if all lowercase, case insensitive

-- Make undo persistant
opt('b', 'undofile', true)
