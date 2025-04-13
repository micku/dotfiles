return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufRead",
    config = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, {"luadoc", "vim"})

        require("nvim-treesitter.configs").setup {
            ensure_installed = opts.ensure_installed,
            highlight = {
                enable = true,
                use_languagetree = true
            },
        }
    end
}
