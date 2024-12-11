local ts_builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("pkm", { clear = true }),
    callback = function()
        if string.match(vim.fn.getcwd(), "/My Brain") then
            print("Welcome to My Brain")
            ts_builtin.oldfiles({
                previewer = false,
            })
        end
    end,
})
