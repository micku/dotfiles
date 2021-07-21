local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
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
        "c_sharp"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    }
}
