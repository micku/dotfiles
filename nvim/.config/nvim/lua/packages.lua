local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- List of plugins
  --  Lua
  use('nvim-lua/plenary.nvim')                                   -- Lua utils
  --  Editing
  use('tpope/vim-surround')                                      -- Work with surrounding chars
  use('RRethy/nvim-treesitter-textsubjects')                     -- Incremental selection
  --  Navigation
  use{'junegunn/fzf', run = 'fzf#install()'}                     -- Fuzzy search
  use('junegunn/fzf.vim')                                        -- ^^^^^ ^^^^^^
  use('christoomey/vim-tmux-navigator')                          -- Tmux + Vim splits
  --  Generic dev
  use('editorconfig/editorconfig-vim')                           -- .editorconfig support
  use('neovim/nvim-lspconfig')                                   -- Common config for LSP
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
  use('mfussenegger/nvim-dap')                                   -- Debug Adapter Protocol
  use('rcarriga/nvim-dap-ui')                                    -- UI for DAP
  use('puremourning/vimspector')                                 -- Debbugging UI

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
