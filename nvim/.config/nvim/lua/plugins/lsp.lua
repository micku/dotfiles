local language_servers = {"tsserver", "graphql", "lua_ls", "yamlls", "jsonls", "terraformls", "marksman"}

return {
    {
        "neovim/nvim-lspconfig",
        event = "BufRead",
        config = function()
            local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end,
        keys = {
            {"gd", vim.lsp.buf.definition, desc = "Go to definition", { noremap=true, silent=true }},
            {"gD", vim.lsp.buf.declaration, desc = "Go to type definition", { noremap=true, silent=true }},
            {"gi", vim.lsp.buf.implementation, desc = "Go to implementation", { noremap=true, silent=true }},
            {"gh", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", desc = "Find all references", { noremap=true, silent=true }},
        },
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup({})
        end
    },
    {
        -- TODO: If this has been included only for ensuring LSP installation, we can replace it
        --  with the actual function and remove both this and null-ls:
        --  https://github.com/williamboman/mason-lspconfig.nvim/blob/828a538ac8419f586c010996aefa5df6eb7c250b/lua/mason-lspconfig/ensure_installed.lua#L18
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, language_servers)
        end
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = nil,
                automatic_installation = true,
            })
        end,
    },
    { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
    {
        "folke/neodev.nvim", -- Utils for Neovim config editing/development
        config = function()
            require("neodev").setup()
        end
    },
}
