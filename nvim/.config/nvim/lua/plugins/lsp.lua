local servers = {"tsserver", "graphql", "lua_ls"}

return {
    servers = servers,
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "neovim/nvim-lspconfig",
        event = "BufRead",
        dependencies = {
            "folke/neodev.nvim", -- Utils for Neovim config editing/development
            "onsails/lspkind-nvim", -- Show icons in autocomplete dropdown
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
        },
        config = function()
            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = servers,
            })

            require("neodev").setup()

            require("lspkind").init({})
        end
    },
    { 'j-hui/fidget.nvim', opts = {} },
}
