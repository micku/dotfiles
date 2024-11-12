return {
    {
        "mfussenegger/nvim-dap",
        opts = function()
            local dap = require("dap")

            dap.adapters.node2 = {
                type = "executable",
                command = "node",
                args = {os.getenv("HOME") .. "/dev/personal/microsoft/vscode-node-debug2/out/src/nodeDebug.js"},
            }

            local typescript_config = {
                {
                    name = "Launch",
                    type = "node2",
                    request = "launch",
                    program = "${workspaceFolder}/dist/index.js",
                    cwd = "${workspaceFolder}",
                    sourceMaps = true,
                    protocol = "inspector",
                    console = "integratedTerminal",
                },
                {
                    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
                    name = "Attach to process",
                    type = "node2",
                    request = "attach",
                    processId = require"dap.utils".pick_process,
                },
                {
                    name = "Integration tests",
                    type = "node2",
                    request = "launch",
                    console = "integratedTerminal",
                    program = "${workspaceFolder}/node_modules/.bin/jest",
                    skipFiles = {"*/<node_internals>/**/*.js", "node_modules/**/*.js"},
                    cwd = "${workspaceFolder}",
                    sourceMaps = true,
                    args = {"-i", "--config", "test/integration/jest/config.json", "--detectOpenHandles", "-i", "--forceExit", "${file}"},
                },
                {
                    name = "Unit tests",
                    type = "node2",
                    request = "launch",
                    console = "integratedTerminal",
                    program = "${workspaceFolder}/node_modules/.bin/jest",
                    skipFiles = {"*/<node_internals>/**/*.js", "node_modules/**/*.js"},
                    cwd = "${workspaceFolder}",
                    sourceMaps = true,
                    args = {"NODE_OPTIONS=--max-old-space-size=5120", "jest", "--maxWorkers=1", "--forceExit", "${file}"},
                }
            }

            dap.configurations.javascript = typescript_config
            dap.configurations.typescript = typescript_config
        end
    },
    {
        "mhartington/formatter.nvim",
        opts = function(_, opts)
            opts.filetype = opts.filetype or {}

            opts.filetype.javascript = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
                        stdin = true
                    }
                end
            }
            opts.filetype.typescript = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
                        stdin = true
                    }
                end
            }

            opts.pattern = opts.pattern or {}
            vim.list_extend(opts.pattern, { "*.js", "*.ts" })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        opts = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
            require("lspconfig")["ts_ls"].setup {capabilities = capabilities}
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {"javascript", "typescript"})
        end,
    },
}
