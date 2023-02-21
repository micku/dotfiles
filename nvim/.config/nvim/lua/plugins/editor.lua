return {
    "tpope/vim-sleuth",
    {
        "folke/zen-mode.nvim",
        keys = {
            {"<leader>z", ":ZenMode<CR>", desc = "Toggles zen mode", silent = true}
        }
    },
    {
        "tpope/vim-surround",
        dependencies = {
            "tpope/vim-repeat"
        },
        lazy = false,
        keys = {
        },
        config = function ()
            -- Show line numbers relative to cursor
            vim.wo.number = true
            vim.wo.relativenumber = true

            -- Hide '-- INSERT --' since it is already shown in lightline
            vim.o.showmode = false

            -- Set unix line endings
            vim.bo.fileformat = "unix"

            -- When reading files try unix line endings then dos, also use unix for new buffers
            vim.o.fileformats = "unix,dos"

            -- Save up to 100 marks, enable capital marks
            vim.o.viminfo = "'100,f1"

            -- Screen will not be redrawn while running macros, registers or other non-typed comments
            vim.o.lazyredraw = true

            -- Keep the cursor visible within 3 lines when scrolling
            vim.wo.scrolloff = 3

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
        end
    },
    {
        "terryma/vim-expand-region",
        keys = {
            {"v", "<Plug>(expand_region_expand)", mode = "v", noremap = false},
        }
    }
}
