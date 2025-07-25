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
            "ahmedkhalf/project.nvim", -- Sets pwd/getcwd() to the project root
            "mfussenegger/nvim-dap",
        },
        ft = "java",
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
