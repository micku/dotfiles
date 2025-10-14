require("zen-mode").setup({
    window = {
        width = 180,
    },
})

vim.diagnostic.config({
  -- Use the default configuration
  -- virtual_lines = true

  -- Alternatively, customize specific options
  virtual_lines = {
   -- Only show virtual line diagnostics for the current cursor line
   current_line = true,
  },
})

return {
    "tpope/vim-sleuth",
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function ()
            vim.opt.list = true
            vim.opt.listchars:append "eol:↴"

            require("ibl").setup {
                indent = { char = "┊" },
                scope = { show_start = false, show_end = false },
            }
        end
    },
    {
        "tpope/vim-surround",
        dependencies = {
            "tpope/vim-repeat"
        },
        lazy = false,
    },
    {
        "terryma/vim-expand-region",
        keys = {
            {"v", "<Plug>(expand_region_expand)", mode = "v", noremap = false},
        }
    },
    {
        "tpope/vim-unimpaired", -- :help unimpaired for bindings
        dependencies = {
            "tpope/vim-repeat"
        },
        lazy = false,
    },
    {
        "Aasim-A/scrollEOF.nvim", -- Applies the `scrollof` value also to the end of file
        config = function ()
            require('scrollEOF').setup()
        end
    },
    { -- Quickfix UI improvements
        'stevearc/quicker.nvim',
        event = "FileType qf",
        opts = {
            max_filename_width = function()
                return math.floor(math.min(95, vim.o.columns / 4))
            end,
        },
        keys = {
            {">", function() require("quicker").expand({ before = 2, after = 2, add_to_existing = true }) end, desc = "Expand quickfix context"},
            {"<", function() require("quicker").collapse() end, desc = "Collapse quickfix context"},
        },
    },
    { -- Additional text edit operators
        "echasnovski/mini.operators",
        version = false,
        lazy = false,
        config = function ()
            require('mini.operators').setup()
        end,
        -- Keys:
        -- g= Evaluate
        -- gx Exchange
        -- gm Multiply
        -- gr Replace
        -- gs Sort
    }
}
