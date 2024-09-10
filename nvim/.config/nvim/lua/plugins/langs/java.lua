return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        ft = {"java"},
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "jdtls" })
        end
    },
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "ahmedkhalf/project.nvim", -- Sets pwd/getcwd() to the project root
            "mfussenegger/nvim-dap",
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

                    -- Getting the last 2 folders to handle the master/main branch when organizing projects
                    --  in the <project>/<branch> format.
                    --  For example `~/projects/my_project/main` and `~/projects/my_2_project/main` would
                    --  have the same workspace folder `main` if we only get the last folder.
                    local _, _, project_folder = string.find(vim.fn.fnamemodify(root_dir, ":p:h"), "(/[^/]*/[^/]*)$")
                    local workspace_folder = home .. "/.local/share/eclipse/" .. project_folder

                    local bundles = {
                        vim.fn.glob(java_debug_path .. "extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
                    };
                    vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "extension/server/*.jar", 1), "\n"))

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
                            bundles = bundles,
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
    {
        "mfussenegger/nvim-lint",
        dependencies = {
            "ahmedkhalf/project.nvim", -- Sets pwd/getcwd() to the project root
        },
        ft = "java",
        opts = function()
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
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = {"javadbg", "javatest"}
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {"java"})
        end,
    },
}
