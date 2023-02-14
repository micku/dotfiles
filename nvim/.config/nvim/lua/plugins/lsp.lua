return {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim", -- Utils for Neovim config editing/development
        "onsails/lspkind-nvim", -- Show icons in autocomplete dropdown
        "nvim-tree/nvim-web-devicons",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp", -- Autocompletion
    },
    keys = {
    },
    config = function()
        local servers = {"tsserver", "graphql"}

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = servers,
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
        for _, lsp in ipairs(servers) do
            require('lspconfig')[lsp].setup { capabilities = capabilities }
        end

        require('lspkind').init({})
    end
}
