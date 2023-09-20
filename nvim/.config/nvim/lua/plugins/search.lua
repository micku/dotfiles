return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
        keys = {
            {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files"},
            {"<leader>*", "<Cmd>Telescope grep_string<CR>", desc = "Find the string under cursor"},
            {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep"},
            {"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers"},
            {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help tags"},
            {"<leader>fm", "<cmd>Telescope marks<cr>", desc = "Find mark"},
            {"<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "Find references (LSP)"},
            {"<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Find symbols (LSP)"},
            {"<leader>fc", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "Find incoming calls (LSP)"},
            {"<leader>fo", "<cmd>Telescope lsp_outgoing_calls<cr>", desc = "Find outgoing calls (LSP)"},
            {"<leader>fi", "<cmd>Telescope lsp_implementations<cr>", desc = "Find implementations (LSP)"},
            {"<leader>fx", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Find errors (LSP)"},

            {"<leader><space>", ":noh<cr>", desc = "Remove search highlight"},
        },
        config = function()
            local telescope = require("telescope")
            local telescopeConfig = require("telescope.config")

            -- Clone the default Telescope configuration
            local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

            -- I want to search in hidden/dot files.
            table.insert(vimgrep_arguments, "--hidden")
            -- I don't want to search in the `.git` directory.
            table.insert(vimgrep_arguments, "--glob")
            table.insert(vimgrep_arguments, "!**/.git/*")

            telescope.setup({
                defaults = {
                    path_display = {
                        shorten = {
                            len = 3, exclude = {1, -1}
                        },
                        truncate = true
                    },
                    dynamic_preview_title = true,
                    vimgrep_arguments = vimgrep_arguments,
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                   -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                                                        -- the default case_mode is "smart_case"
                    }
                },
                pickers = {
                    find_files = {
                        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                    },
                },
            })

            telescope.load_extension("fzf")
        end
    }
}
