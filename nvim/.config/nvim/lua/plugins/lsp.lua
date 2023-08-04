local language_servers = {"tsserver", "graphql", "lua_ls", "jdtls", "yamlls", "jsonls"}

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
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
        dependencies = {
            "ahmedkhalf/project.nvim", -- Sets pwd/getcwd() to the project root
        },
        config = function()
            local checkstyle = require("lint").linters.checkstyle

            local root_dir = vim.fn.getcwd()

            -- local mason_packages_path = vim.fn.stdpath "data" .. "/mason/packages/"
            -- local checkstyle_path = mason_packages_path .. "checkstyle/"
            -- TODO: This should be changed to the above Mason path once the PR is merged:
            --  https://github.com/mason-org/mason-registry/pull/2191
            local home = os.getenv('HOME')
            local checkstyle_path = home .. "/Downloads/checkstyle-10.12.1-all.jar"

            checkstyle.cmd = "java"
            checkstyle.stdin = false
            checkstyle.args = {
                "-Dcheckstyle.config.dir=" .. root_dir .. "/config/checkstyle",
                "-jar",
                checkstyle_path,
                "-c",
                "config/checkstyle/checkstyle.xml",
            }

            checkstyle.config_file = checkstyle_path

            require("lint").linters_by_ft = {
                java = {"checkstyle",}
            }

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
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = language_servers,
            })
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
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "ahmedkhalf/project.nvim", -- Sets pwd/getcwd() to the project root
        },
        ft = "java",
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "java",
                callback = function()
                    local home = os.getenv('HOME')
                    local jdtls = require('jdtls')

                    -- TODO: This path is useful in multiple context(ie. format.lua) and may be extracted
                    local mason_packages_path = vim.fn.stdpath "data" .. "/mason/packages/"
                    local jdtls_path = mason_packages_path .. "jdtls/"
                    local java_debug_path = mason_packages_path .. "java-debug-adapter/"
                    local java_test_path = mason_packages_path .. "java-test/"

                    local root_dir = vim.fn.getcwd()

                    local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

                    local config = {
                        flags = {
                            debounce_text_changes = 80,
                        },
                        -- cmd = {jdtls_path .. "bin/jdtls"},
                        cmd = {
                            "java",
                            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                            '-Dosgi.bundles.defaultStartLevel=4',
                            '-Declipse.product=org.eclipse.jdt.ls.core.product',
                            '-Dlog.protocol=true',
                            '-Dlog.level=ALL',
                            '-Xmx4g',
                            '--add-modules=ALL-SYSTEM',
                            '--add-opens', 'java.base/java.util=ALL-UNNAMED',
                            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
                            '-javaagent:' .. jdtls_path .. 'lombok.jar',
                            '-jar', vim.fn.glob(jdtls_path .. 'plugins/org.eclipse.equinox.launcher_*.jar'),
                            '-configuration', jdtls_path .. 'config_linux',
                            '-data', workspace_folder,
                        },
                        root_dir = root_dir,

                        settings = {
                            java = {
                                signatureHelp = { enabled = true },
                                contentProvider = { preferred = 'fernflower' },
                            },
                        },

                        -- TODO: These are debugging configurations, those should stay in debugger.lua
                        init_options = {
                            bundles = {
                                vim.fn.glob(java_debug_path .. "extension/server/com.microsoft.java.debug.plugin-*.jar", true),
                                vim.fn.glob(java_test_path .. "extension/server/*.jar", true),
                            }
                        },
                    }
                    jdtls.start_or_attach(config)
                end
            })
        end,
        keys = {
            {"<leader>df", "<cmd>lua require'jdtls'.test_class()<cr>", desc = "Debug JUnit test class"},
            {"<leader>dn", "<cmd>lua require'jdtls'.test_nearest_method()<cr>", desc = "Debug JUnit nearest method"},
        },
    },
    { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
    {
        "folke/neodev.nvim", -- Utils for Neovim config editing/development
        config = function()
            require("neodev").setup()
        end
    },
    {
        "jinzhongjia/LspUI.nvim",
        event="VeryLazy",
        config=function()
            require("LspUI").setup()
        end,
        keys = {
            {"K", "<cmd>lua require('LspUI').api.hover()<cr>", desc = "Show doc tooltip", { noremap=true, silent=true }},
            {"[d", "<cmd>lua require('LspUI').api.diagnostic('prev')<cr>", desc = "Go to prev diagnostic", { noremap=true, silent=true }},
            {"]d", "<cmd>lua require('LspUI').api.diagnostic('next')<cr>", desc = "Go to next diagnostic", { noremap=true, silent=true }},
            {"gr", "<cmd>lua require('LspUI').api.rename()<cr>", desc = "Rename", { noremap=true, silent=true }},
            {"<leader>ca", "<cmd>lua require('LspUI').api.code_action()<cr>", desc = "Code actions", { noremap=true, silent=true }},
        },
    },
}
