return {
    {
        "mhartington/formatter.nvim",
        opts = function(_, opts)
            opts.filetype = opts.filetype or {}

            opts.filetype.rust = {
                rust = {
                    -- Rustfmt
                    function()
                        return {
                            exe = "rustfmt",
                            args = {"--emit=stdout"},
                            stdin = true
                        }
                    end
                }
            }

            opts.pattern = opts.pattern or {}
            vim.list_extend(opts.pattern, { "*.rs" })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {"rust"})
        end,
    },
}
