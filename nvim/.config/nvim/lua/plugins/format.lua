return {
    "mhartington/formatter.nvim",
    keys = {
        {"<leader>ft", ":Format<CR>", desc = "Format the entire file"},
    },
    event = "BufWrite",
    config = function(_, opts)
        opts.filetype = opts.filetype or {}
        opts.pattern = opts.pattern or {}

        require('formatter').setup({
            logging = true,
            filetype = opts.filetype
        })

        -- Format on save
        local group = vim.api.nvim_create_augroup("FormatAutogroup", {clear = true})
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = opts.pattern,
            group = group,
            command = "FormatWrite",
        })
    end
}
