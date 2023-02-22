return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufRead",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "javascript",
                "typescript",
                "graphql",
                "html",
                "css",
                "bash",
                "cpp",
                "rust",
                "lua",
                "python",
                "c_sharp",
                "markdown",
                "markdown_inline"
            },
            highlight = {
                enable = true,
                use_languagetree = true
            },
        }
    end
}
