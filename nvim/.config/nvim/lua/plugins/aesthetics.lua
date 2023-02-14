return {
    -- the colorscheme should be available when starting Neovim
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.opt.termguicolors = true

            require("tokyonight").setup({
                on_highlights = function(hl, c)
                    local prompt = "#2d3149"
                    hl.TelescopeNormal = {
                        bg = c.bg_dark,
                        fg = c.fg_dark,
                    }
                    hl.TelescopeBorder = {
                        bg = c.bg_dark,
                        fg = c.bg_dark,
                    }
                    hl.TelescopePromptNormal = {
                        bg = prompt,
                    }
                    hl.TelescopePromptBorder = {
                        bg = prompt,
                        fg = prompt,
                    }
                    hl.TelescopePromptTitle = {
                        bg = prompt,
                        fg = prompt,
                    }
                    hl.TelescopePreviewTitle = {
                        bg = c.bg_dark,
                        fg = c.bg_dark,
                    }
                    hl.TelescopeResultsTitle = {
                        bg = c.bg_dark,
                        fg = c.bg_dark,
                    }
                end,
            })

            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])

            -- Set some colors
            vim.cmd "highlight Search ctermbg=4"
            vim.cmd "highlight LineNr ctermfg=8"
            vim.cmd "highlight CursorLineNr ctermfg=5"
            vim.cmd "highlight Comment cterm=italic ctermfg=8"
            vim.cmd "highlight Todo ctermbg=8 ctermfg=6"
            vim.cmd "highlight Statement cterm=bold ctermfg=15"

            vim.opt.winbar = '%=%m %f%='
            vim.opt.laststatus = 3
        end,
    },
}
