return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "rcasia/neotest-java",
        },
        config = function()
            require("neotest").setup({
                log_level = vim.log.levels.ERROR,
                adapters = {
                    require("neotest-java")({
                        ignore_wrapper = false,
                    })
                }
            })
        end,
        keys = {
            {"<Leader>tn", "<cmd>lua require('neotest').run.run()<cr>", desc = "Test nearest", { noremap=true, silent=true }},
            {"<Leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Run nearest test with debugger", { noremap=true, silent=true }},
            {"<Leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run tests in file", { noremap=true, silent=true }},
            {"<Leader>tt", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Toggle the test panel", { noremap=true, silent=true }},
            {"<Leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Toggle test summary panel", { noremap=true, silent=true }},
        },
    },
    {
        "rcasia/neotest-java",
        lazy = true,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
}
