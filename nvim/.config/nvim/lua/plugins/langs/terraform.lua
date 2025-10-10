return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        opts = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
            vim.lsp.config("terraformls", {capabilities = capabilities})
        end,
    }
}
