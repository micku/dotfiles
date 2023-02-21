return {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "neovim/nvim-lspconfig",
        event = "BufRead",
        dependencies = {
            "folke/neodev.nvim", -- Utils for Neovim config editing/development
            "onsails/lspkind-nvim", -- Show icons in autocomplete dropdown
            "nvim-tree/nvim-web-devicons",
            "hrsh7th/cmp-nvim-lsp",
        },
        keys = {
        },
        config = function()
            local servers = {"tsserver", "graphql", "lua_ls"}

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = servers,
            })

            require("neodev").setup()

            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
            for _, lsp in ipairs(servers) do
                require("lspconfig")[lsp].setup {capabilities = capabilities}
            end

            require("lspkind").init({})
        end
    },
    { 'j-hui/fidget.nvim', opts = {} },
}
