return {
    -- the colorscheme should be available when starting Neovim
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("catppuccin").setup({
                integrations = {
                    lsp_trouble = true,
                    telescope = {
                        enabled = true,
                        style = "nvchad",
                    },
                },
            })

            local sign = vim.fn.sign_define

            sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
            sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
            sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

            vim.cmd("colorscheme catppuccin-mocha")
        end
    },
}
