-- Packer auto installer.
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Plenary
  use 'nvim-lua/plenary.nvim'

  -- Language Server Protocol
  use 'neovim/nvim-lspconfig'
  use {'williamboman/mason.nvim', requires = 'williamboman/mason-lspconfig.nvim'}
  use 'folke/trouble.nvim'
  use "jose-elias-alvarez/null-ls.nvim"
  use 'j-hui/fidget.nvim'

  -- Code completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'honza/vim-snippets'
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'onsails/lspkind.nvim'

  -- Themes
  use 'Mofiqul/dracula.nvim'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Bufferline
  use {'akinsho/bufferline.nvim', tag = "v2.*"}

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'

  -- File management
  use 'kyazdani42/nvim-tree.lua'
  use {'X3eRo0/dired.nvim', requires = 'MunifTanjim/nui.nvim'}

  -- Statusline
  use 'feline-nvim/feline.nvim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  -- Auto Pairs
  use 'windwp/nvim-autopairs'

  -- vim-mundo
  use 'simnalamburt/vim-mundo'

  -- editorconfig
  use 'editorconfig/editorconfig-vim'
end)
