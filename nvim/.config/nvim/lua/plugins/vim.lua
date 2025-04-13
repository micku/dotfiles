return {
    { -- Improves Vimdoc view
        "OXY2DEV/helpview.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = false,
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, {"vimdoc"})
        end,
    }
}
