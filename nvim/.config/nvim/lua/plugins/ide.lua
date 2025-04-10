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
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()
            require("nvim-tree").setup({
                view = {
                    float = {
                        enable = true,
                        quit_on_focus_loss = true,
                        open_win_config = {
                            border = "solid",
                            width = 80,
                        }
                    }
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    git_ignored = false,
                },
                on_attach = function (bufnr)
                    local api = require('nvim-tree.api')

                    local function opts(desc)
                        return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                    end

                    vim.keymap.set('n', '<CR>', api.node.open.no_window_picker, opts('Open'))
                    vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
                end
            })
        end,
        keys = {
            {"<Leader>tr", "<cmd>lua require('nvim-tree.api').tree.toggle({find_file = true})<cr>", desc = "Show file tree", { noremap=true, silent=true }},
        }
    },
}
