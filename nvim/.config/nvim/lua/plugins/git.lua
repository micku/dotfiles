return {
    {
        "tpope/vim-fugitive",
        dependencies = {
            "tommcdo/vim-fubitive",
            "tpope/vim-rhubarb",
            "mobiushorizons/fugitive-stash.vim",
        },
        config = function ()
            vim.g.fugitive_stash_domains = {'stash.int.klarna.net'}
        end
    },
    {
        "lewis6991/gitsigns.nvim",
	config = function ()
            require('gitsigns').setup()
	end
    },
}
