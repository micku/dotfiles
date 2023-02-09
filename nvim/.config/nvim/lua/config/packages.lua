local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
  is_bootstrap = true
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- List of plugins
  --  Lua
  use('nvim-lua/plenary.nvim')                                   -- Lua utils
  --  Editing
  use('tpope/vim-surround')                                      -- Work with surrounding chars
  use('RRethy/nvim-treesitter-textsubjects')                     -- Incremental selection
  --  Navigation
  use{'junegunn/fzf', run = 'fzf#install()'}                     -- Fuzzy search
  use('junegunn/fzf.vim')                                        -- ^^^^^ ^^^^^^
  use('alexghergh/nvim-tmux-navigation')                          -- Tmux + Vim splits
  --  Generic dev
  use('editorconfig/editorconfig-vim')                           -- .editorconfig support
  use{
      'neovim/nvim-lspconfig',
      requires = {
          'williamboman/mason.nvim',
          'williamboman/mason-lspconfig.nvim',
          'folke/neodev.nvim',
      },
  }                                   -- Common config for LSP
  use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}      -- Better syntax highlighting
  use('onsails/lspkind-nvim')                                    -- LSP pictograms
  use('OmniSharp/omnisharp-vim')                                 -- C# LSP
  use('mhartington/formatter.nvim')                              -- Code formatter
  use{'michaelb/sniprun', run = 'bash install.sh'}               -- Execute snippets of code
  -- Autocompletion
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')                                        -- Autocompletion
  use('L3MON4D3/LuaSnip')                                        -- Snippets
  use('saadparwaiz1/cmp_luasnip')
  --  Git
  use('tpope/vim-fugitive')                                      -- Git inside Vim
  use('tommcdo/vim-fubitive')                                    -- Bitbucket plugin for vim-fugitive
  use('tpope/vim-rhubarb')                                       -- GitHub plugin for vim-fugitive
  use('mobiushorizons/fugitive-stash.vim')                       -- Stash plugin for vim-fugitive
  --  UI
  --use{'dracula/vim', as = 'dracula'}                             -- Dracula theme mainly for lightline
  use('arcticicestudio/nord-vim')                                -- Nord theme
  --use('itchyny/lightline.vim')                                   -- Better statusline
  use('ryanoasis/vim-devicons')                                  -- DevIcons
  use('kyazdani42/nvim-web-devicons')                            -- DevIcons :|
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use('glepnir/lspsaga.nvim')                                    -- LSP UI
  use('folke/zen-mode.nvim')                                     -- Zen mode
  --  File explorer
  use('tamago324/lir.nvim')                                      -- File explorer
  --  Debugging
  use('puremourning/vimspector')                                 -- Debbugging UI

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if is_bootstrap then
    require('packer').sync()
  end
end)

if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

local reload_config = function()
  local prefix = 'config'
  local prefix_with_dot = prefix .. '.'
  for key, value in pairs(package.loaded) do
    if key == prefix or key:sub(1, #prefix_with_dot) == prefix_with_dot then
      package.loaded[key] = nil
    end
  end

  dofile(fn.stdpath('config') .. '/init.lua')

  --vim.cmd('silent! LspStop | silent! LspStart | PackerCompile')
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  callback = reload_config, --'source $MYVIMRC | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = fn.expand '$MYVIMRC',
})
