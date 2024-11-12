return {
    {
        "nvim-telescope/telescope-file-browser.nvim",
        lazy = false,
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        keys = {
            -- {"-", ":Telescope file_browser path=%:p:h<cr>", desc = "File browser"},
        },
        config = function()
            require("telescope").setup {
                extensions = {
                    file_browser = {
                        hijack_netrw = true,
                        hidden = true,
                        respect_gitignore = true,
                        collapse_dirs = true,
                    },
                },
            }
            require("telescope").load_extension "file_browser"
        end
    },
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        lazy = true,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        keys = {
            {"-", ":Oil<cr>", desc = "File browser"},
        },
        config = function()
            require("oil").setup {
                view_options = {
                    show_hidden = true,
                },
            }
        end
    }
}
