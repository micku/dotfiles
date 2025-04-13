---- Plugins are handled through Lazy: https://github.com/folke/lazy.nvim

-- Automatically install Lazy on startup.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

-- Automatically source all configs in plugins directory.
require("lazy").setup({
    spec = {
        {import = "plugins"},
        {import = "plugins.langs.bash"},
        {import = "plugins.langs.go"},
        {import = "plugins.langs.graphql"},
        {import = "plugins.langs.java"},
        {import = "plugins.langs.javascript"},
        {import = "plugins.langs.lua"},
        {import = "plugins.langs.markdown"},
        {import = "plugins.langs.python"},
        {import = "plugins.langs.rust"},
        {import = "plugins.langs.terraform"},
    },
    change_detection = {
        enabled = false,
    },
})
