return {
    {
        "alexghergh/nvim-tmux-navigation",
        keys = {
            -- More inspiration here: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally

            -- Move between splits - even Tmux ones
            {"<C-J>", "<cmd>NvimTmuxNavigateDown<cr>", desc = "Navigate Pane Down", silent = true},
            {"<C-K>", "<cmd>NvimTmuxNavigateUp<cr>", desc = "Navigate Pane Up", silent = true},
            {"<C-H>", "<cmd>NvimTmuxNavigateLeft<cr>", desc = "Navigate Pane Left", silent = true},
            {"<C-L>", "<cmd>NvimTmuxNavigateRight<cr>", desc = "Navigate Pane Right", silent = true},
            {"<C-\\>", "<cmd>NvimTmuxNavigateLastActive<cr>", desc = "Navigate Pane Last Active", silent = true},
            {"<C-Space>", "<cmd>NvimTmuxNavigateNext<cr>", desc = "Navigate Pane Next", silent = true},

            -- Create new splits
            {"<C-t><C-j>", "<C-w>s", desc = "Create a new split below"},
            {"<C-t><C-k>", "<C-w>s", desc = "Create a new split below"},
            {"<C-t><C-l>", "<C-w>v", desc = "Create a new split right"},
            {"<C-t><C-h>", "<C-w>v", desc = "Create a new split right"},

            {"<Leader>s", ":resize -5<CR>", desc = "Reduce split size horizontally", silent = true},
            {"<Leader>w", ":resize +5<CR>", desc = "Increase split size horizontally", silent = true},
            {"<Leader>d", ":vertical resize -5<CR>", desc = "Reduce split size vertically", silent = true},
            {"<Leader>a", ":vertical resize +5<CR>", desc = "Increase split size vertically", silent = true },

            -- Move by displayed lines, not by fisical lines
            {"k", "gk", desc = "Move up by displayed lines", silent = true},
            {"j", "gj", desc = "Move down by displayed lines", silent = true},
            {"0", "g0", desc = "Move to the beginning of the displayed line", silent = true},
            {"$", "g$", desc = "Move to the end of the displayed line", silent = true},
        },
        config = function()
            require("nvim-tmux-navigation").setup({})

            -- On windows splitting the right way
            vim.opt.splitbelow = true
            vim.opt.splitright = true

            -- Enable mouse scroll in terminal
            vim.opt.mouse = "a"
        end
    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({})
        end
    },
}
