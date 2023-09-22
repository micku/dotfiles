---- Try to behave like an IDE
return {
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                patterns = { ".git" },
                silent_chdir = false,
                detection_methods = { "pattern" },
            })
        end
    },
    {
        "lewis6991/hover.nvim",
        config = function()
            require("hover").setup {
                init = function()
                    -- Require providers
                    require("hover.providers.lsp")
                    -- require('hover.providers.gh')
                    -- require('hover.providers.gh_user')
                    -- require('hover.providers.jira')
                    -- require('hover.providers.man')
                    -- require('hover.providers.dictionary')
                end,
                preview_opts = {
                    border = nil
                },
                -- Whether the contents of a currently open hover window should be moved
                -- to a :h preview-window when pressing the hover keymap.
                preview_window = false,
                title = true
            }
        end,
        keys = {
            {"K", "<cmd>lua require('hover').hover()<cr>", desc = "Show doc tooltip", { noremap=true, silent=true }},
            {"gK", "<cmd>lua require('hover').hover_select()<cr>", desc = "Show doc tooltip (select)", { noremap=true, silent=true }},
        },
    },
}
