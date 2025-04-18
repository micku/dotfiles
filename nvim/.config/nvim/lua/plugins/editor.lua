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
            model = "claude-3.5-sonnet",
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
}
