return {
    -- the colorscheme should be available when starting Neovim
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("rose-pine").setup({
                dim_inactive_windows = true,

                styles = {
                    italic = false,
                    bold = false,
                },

                highlight_groups = {
                    -- Remove virtual text background
                    DiagnosticVirtualTextError = { bg = "none" },
                    DiagnosticVirtualTextHint = { bg = "none" },
                    DiagnosticVirtualTextInfo = { bg = "none" },
                    DiagnosticVirtualTextWarn = { bg = "none" },

                    -- Borderless Telescope
                    TelescopeBorder = { fg = "surface", bg = "surface" },
                    TelescopeNormal = { fg = "subtle", bg = "overlay" },
                    TelescopeTitle = { fg = "base", bg = "love" },

                    TelescopeResultsBorder = { fg = "overlay", bg = "overlay" },
                    TelescopeResultsNormal = { fg = "text", bg = "overlay" },

                    TelescopeSelection = { fg = "text", bg = "highlight_med" },
                    TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
                    TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

                    TelescopePreviewTitle = { fg = "base", bg = "iris" },
                    TelescopePreviewBorder = { fg = "overlay", bg = "overlay" },
                    TelescopePreviewNormal = { bg = "overlay" },

                    TelescopePromptTitle = { fg = "base", bg = "pine" },
                    TelescopePromptNormal = { fg = "text", bg = "surface" },
                    TelescopePromptBorder = { fg = "surface", bg = "surface" },
                },
            })

            vim.cmd("colorscheme rose-pine")
        end
    },
}
