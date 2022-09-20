-- Packer auto installer.
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()

  -- Packer can manage itself.
  use 'wbthomason/packer.nvim'

  -- Plenary.
  use 'nvim-lua/plenary.nvim'

  -- Themes.
  use {
    'Mofiqul/dracula.nvim',
    config = 'vim.cmd[[colorscheme dracula]]'
  }

  -- Icons.
  use 'kyazdani42/nvim-web-devicons'

  -- Language Server Protocol.
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require 'plugin.nvim-lspconfig'
    end
  }
  use {
    'williamboman/mason.nvim',
    requires = 'williamboman/mason-lspconfig.nvim',
    config = function()
      require 'plugin.mason'
    end
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require 'plugin.null-ls'
    end
  }
  use {
    'glepnir/lspsaga.nvim',
    branch = "main",
    config = function()
      require 'plugin.lspsaga'
    end
  }
  use {
    'folke/trouble.nvim',
    config = function()
      require 'plugin.trouble'
    end
  }
  use {
    'j-hui/fidget.nvim',
    config = function()
      require 'plugin.fidget'
    end
  }

  -- Code completion.
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require 'plugin.nvim-cmp'
    end
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'honza/vim-snippets'
  use {
    'SirVer/ultisnips',
    config = function()
      vim.cmd[[source $HOME/.vim/plugin-config/vim-fugitive.vim]]
    end
  }
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'onsails/lspkind.nvim'

  -- Treesitter.
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function()
      require 'plugin.treesitter'
    end
  }

  -- File management.
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require 'plugin.nvim-tree'
    end
  }
  use {
    'X3eRo0/dired.nvim',
    requires = 'MunifTanjim/nui.nvim',
    config = function()
      require 'plugin.dired'
    end
  }

  -- Git.
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require 'plugin.gitsigns'
    end
  }
  use {
    'tpope/vim-fugitive',
    config = function()
      vim.cmd[[source $HOME/.vim/plugin-config/vim-fugitive.vim]]
    end
  }

  -- Project management.
  use {
    'ahmedkhalf/project.nvim',
    config = function()
      require 'plugin.project'
    end
  }

  -- Start screen.
  use {
    'goolord/alpha-nvim',
    config = function()
      require 'plugin.alpha'
    end
  }

  -- Bufferline.
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    after = 'nvim-lspconfig',
    config = function()
      require 'plugin.Bufferline'
    end
  }

  -- Statusline.
  use {
    'feline-nvim/feline.nvim',
    config = function()
      require 'plugin.feline'
    end
  }

  -- Telescope.
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require 'plugin.telescope'
    end
  }

  -- Terminal.
  use {
    "akinsho/toggleterm.nvim",
    tag = 'v2.*',
    config = function()
      require 'plugin.toggleterm'
    end
  }

  -- Auto Pairs.
  use {
    'windwp/nvim-autopairs',
    config = function()
      require 'plugin.nvim-autopairs'
    end
  }

  -- Motion.
  use {
    'ggandor/leap.nvim',
    requires = 'tpope/vim-repeat',
    config = function()
      require 'plugin.leap'
    end
  }

  -- Indentation guides.
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require 'plugin.indent-blankline'
    end
  }

  -- vim-mundo.
  use 'simnalamburt/vim-mundo'

  -- editorconfig.
  use {
    'editorconfig/editorconfig-vim',
    config = function()
      vim.cmd[[source $HOME/.vim/plugin-config/editorconfig-vim.vim]]
    end
  }

end)

