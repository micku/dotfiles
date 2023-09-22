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
        },
        config = function()
            require("nvim-tmux-navigation").setup({})
        end
    },
}
