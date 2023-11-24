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
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    {
        "folke/zen-mode.nvim",
        keys = {
            {"<leader>z", ":ZenMode<CR>", desc = "Toggles zen mode", silent = true}
        },
        opts = {
            window = {
                width = 180,
            },
        }
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
        "whiteinge/diffconflicts",
    },
    {
        "tpope/vim-unimpaired", -- :help unimpaired for bindings
        dependencies = {
            "tpope/vim-repeat"
        },
        lazy = false,
    },
    {
        "chrisgrieser/nvim-spider",
        keys = {
            { "b", "<cmd>lua require('spider').motion('b')<CR>", desc = "Cursor N words backward", mode = { "n", "o", "x" }},
            { "w", "<cmd>lua require('spider').motion('w')<CR>", desc = "Cursor N words forward", mode = { "n", "o", "x" }},
            { "e", "<cmd>lua require('spider').motion('e')<CR>", desc = "Cursor forward to the end of word N", mode = { "n", "o", "x" }},
            { "ge", "<cmd>lua require('spider').motion('ge')<CR>", desc = "Go backwards to the end of the previous WORD", mode = { "n", "o", "x" }},
        },
        lazy = true,
    },
    {
        "Aasim-A/scrollEOF.nvim", -- Applies the `scrollof` value also to the end of file
        config = function ()
            require('scrollEOF').setup()
        end
    },
}
