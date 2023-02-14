return {
    {
        "alexghergh/nvim-tmux-navigation",
        -- This is required until the bug below has been fixed, otherwise the navigation
        --  bindings won"t work.
        keys = {
            { "<C-J>", "<cmd>NvimTmuxNavigateDown<cr>", desc = "Navigate Pane Down", silent = true },
            { "<C-K>", "<cmd>NvimTmuxNavigateUp<cr>", desc = "Navigate Pane Up", silent = true },
            { "<C-H>", "<cmd>NvimTmuxNavigateLeft<cr>", desc = "Navigate Pane Left", silent = true },
            { "<C-L>", "<cmd>NvimTmuxNavigateRight<cr>", desc = "Navigate Pane Right", silent = true },
            { "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<cr>", desc = "Navigate Pane Last Active", silent = true },
            { "<C-Space>", "<cmd>NvimTmuxNavigateNext<cr>", desc = "Navigate Pane Next", silent = true },

            -- More inspiration here: https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
            {"<C-t><C-j>", "<C-w>s"},
            {"<C-t><C-k>", "<C-w>s"},
            {"<C-t><C-l>", "<C-w>v"},
            {"<C-t><C-h>", "<C-w>v"},

            {"<Leader>s", ":resize -5<CR>", silent = true},
            {"<Leader>w", ":resize +5<CR>", silent = true},
            {"<Leader>d", ":vertical resize -5<CR>", silent = true},
            {"<Leader>a", ":vertical resize +5<CR>", silent = true },

            -- Move by displayed lines, not by fisical lines
            {"k", "gk", silent = true},
            {"j", "gj", silent = true},
            {"0", "g0", silent = true},
            {"$", "g$", silent = true},
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
}
