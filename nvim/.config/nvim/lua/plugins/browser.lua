return {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = false,
    dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons"},
    keys = {
        {"-", ":Telescope file_browser path=%:p:h<cr>", desc = "File browser"},
    },
    config = function()
        require("telescope").setup {
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                    hidden = true,
                    respect_gitignore = true,
                },
            },
        }
        require("telescope").load_extension "file_browser"
    end
}

