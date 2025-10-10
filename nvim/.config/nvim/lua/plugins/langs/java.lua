return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "jdtls" })
        end
    },
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        ft = "java",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "java" })
        end,
    },
}
