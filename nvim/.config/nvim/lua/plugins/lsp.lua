local language_servers = {"ts_ls", "graphql", "lua_ls", "yamlls", "jsonls", "terraformls", "marksman", "gopls"}

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/neodev.nvim", -- Neodev needs to be loaded before nvim-lspconfig: https://github.com/folke/neodev.nvim#-setup
        },
        event = "BufRead",
        config = function()
            local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end,
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
    {
        -- Shows notifications and LSP progress in the bottom right of the editor.
        "j-hui/fidget.nvim",
        tag = "legacy",
        opts = {}
    },
    {
        "folke/neodev.nvim", -- Utils for Neovim config editing/development
        config = function()
            require("neodev").setup({
                library = {
                    plugins = {
                        "neotest",
                    },
                    types = true,
                }
            })
        end
    },
    {
        "stevearc/aerial.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("aerial").setup({
                close_automatic_events = {'unfocus', 'switch_buffer', 'unsupported'},
                close_on_select = true,
            })
        end,
        opts = {},
        keys = {
            {"gs", "<cmd>AerialToggle<CR>", desc = "Symbols tree", { noremap=true, silent=true }},
        },
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
}
