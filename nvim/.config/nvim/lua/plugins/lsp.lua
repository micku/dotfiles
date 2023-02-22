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
        end
    },
    { 'j-hui/fidget.nvim', opts = {} },
    {
        "glepnir/lspsaga.nvim",
        event = "BufRead",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            {"K", "<cmd>Lspsaga hover_doc<CR>", desc = "Show doc tooltip", { noremap=true, silent=true }},
            {"gd", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to definition", { noremap=true, silent=true }},
            {"gD", "<cmd>Lspsaga goto_type_definition<CR>", desc = "Go to type definition", { noremap=true, silent=true }},
            {"gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "Find all occurrences", { noremap=true, silent=true }},
            {"gr", "<cmd>Lspsaga rename<CR>", desc = "Rename", { noremap=true, silent=true }},
            {"[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Rename", { noremap=true, silent=true }},
            {"]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Rename", { noremap=true, silent=true }},
        },
        config = function()
            require("lspsaga").setup({})
        end
    }
}
