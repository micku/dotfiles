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
            {"-", ":Telescope file_browser path=%:p:h<cr>", desc = "File browser"},
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
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function ()
            local harpoon = require('harpoon')
            harpoon:setup({})

            -- basic telescope configuration
            local conf = require("telescope.config").values
            function Toggle_telescope_harpoon(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),
                }):find()
            end

        end,
        keys = {
            {"<A-a>", "<cmd>lua require'harpoon':list():add()<cr>", desc = "Debug JUnit nearest method"},
            {"<A-h>", "<cmd>lua Toggle_telescope_harpoon(require'harpoon':list())<cr>", desc = "Open harpoon window"},
        },
    }
}
