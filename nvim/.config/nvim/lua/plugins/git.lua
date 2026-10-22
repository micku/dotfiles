return {
    {
        "tpope/vim-fugitive",
        dependencies = {
            "tpope/vim-rhubarb",
        },
    },
    {
        "lewis6991/gitsigns.nvim",
	config = function ()
            require('gitsigns').setup()
	end
    },
    {
        "whiteinge/diffconflicts",
    },
}
