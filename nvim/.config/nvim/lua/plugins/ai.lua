return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function ()
            require("copilot").setup({
                auth_provider_url = "https://klarna.ghe.com/",
                panel = {
                    enabled = false,
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    keymap = {
                        accept = "<C-j>",
                    },
                },
            })
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            "zbirenbaum/copilot.lua",
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        branch = "main",
        opts = {
            show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
            debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
            disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
            model = "claude-sonnet-4",
        },
        build = function()
            vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
        end,
        event = "VeryLazy",
        keys = {
            { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
            { "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
            {
                "<leader>cv",
                ":CopilotChatVisual",
                mode = "x",
                desc = "CopilotChat - Open in vertical split",
            },
            {
                "<leader>cx",
                ":CopilotChatInPlace<cr>",
                mode = "x",
                desc = "CopilotChat - Run in-place code",
            },
        },
    },
    -- {
    --     "yetone/avante.nvim",
    --     event = "VeryLazy",
    --     version = false, -- Never set this value to "*"! Never!
    --     opts = {
    --         provider = "copilot",
    --         providers = {
    --             copilot = {
    --                 endpoint = "https://klarna.ghe.com/",
    --                 -- model = 'claude-3.5-sonnet',
    --                 model = 'claude-sonnet-4',
    --             },
    --         },
    --         windows = {
    --             ask = {
    --                 start_insert = false,
    --             }
    --         },
    --         mappings = {
    --             diff = {
    --                 ours = "<leader>ado",
    --                 theirs = "<leader>adt",
    --                 all_theirs = "<leader>ada",
    --                 both = "<leader>adb",
    --                 cursor = "<leader>adc",
    --                 next = "<leader>adn",
    --                 prev = "<leader>adp",
    --             },
    --             files = {
    --                 add_current = "<leader>ab", -- Add current buffer to selected files
    --             },
    --         },
    --     },
    --     -- config = function()
    --     --     vim.keymap.set("n", "<leader>ac", "<cmd>AvanteClear<CR>")
    --     -- end,
    --     build = "make",
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "stevearc/dressing.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "MunifTanjim/nui.nvim",
    --         --- The below dependencies are optional,
    --         "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    --         "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    --         "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    --         {
    --             -- support for image pasting
    --             "HakonHarnes/img-clip.nvim",
    --             event = "VeryLazy",
    --             opts = {
    --                 -- recommended settings
    --                 default = {
    --                     embed_image_as_base64 = false,
    --                     prompt_for_file_name = false,
    --                     drag_and_drop = {
    --                         insert_mode = true,
    --                     },
    --                     -- required for Windows users
    --                     use_absolute_path = true,
    --                 },
    --             },
    --         },
    --         {
    --             -- Make sure to set this up properly if you have lazy=true
    --             'MeanderingProgrammer/render-markdown.nvim',
    --             opts = {
    --                 file_types = { "markdown", "Avante" },
    --             },
    --             ft = { "markdown", "Avante" },
    --         },
    --     },
    -- }
}
