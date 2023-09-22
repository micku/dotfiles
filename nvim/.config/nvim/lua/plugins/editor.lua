return {
    "tpope/vim-sleuth",
    {
	"lukas-reineke/indent-blankline.nvim",
	config = function ()
            vim.opt.list = true
            vim.opt.listchars:append "eol:↴"

            require("indent_blankline").setup {
                char = "┊",
                show_end_of_line = true,
                space_char_blankline = " ",
		show_current_context = true,
                show_trailing_blankline_indent = false,
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
    }
}
