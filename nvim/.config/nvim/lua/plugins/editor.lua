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
        "Aasim-A/scrollEOF.nvim", -- Applies the `scrollof` value also to the end of file
        config = function ()
            require('scrollEOF').setup()
        end
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function ()
            require("copilot").setup({
                panel = {
                    enabled = false,
                },
                suggestion = {
                    enabled = false,
                },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = {
            "zbirenbaum/copilot.lua",
            "hrsh7th/nvim-cmp",
        "CopilotC-Nvim/CopilotChat.nvim",
        opts = {
            show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
            debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
            disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
        },
        config = function()
            require("copilot_cmp").setup({})

            local cmp = require("cmp")

            cmp.event:on("menu_opened", function()
                vim.b.copilot_suggestion_hidden = true
            end)

            cmp.event:on("menu_closed", function()
                vim.b.copilot_suggestion_hidden = false
            end)
        build = function()
            vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
        end,
        event = "VeryLazy",
        keys = {
            { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
            { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
            {
                "<leader>ccv",
                ":CopilotChatVisual",
                mode = "x",
                desc = "CopilotChat - Open in vertical split",
            },
            {
                "<leader>ccx",
                ":CopilotChatInPlace<cr>",
                mode = "x",
                desc = "CopilotChat - Run in-place code",
            },
        },
    },
}
