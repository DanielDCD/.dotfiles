-- Lazy.nvim auto installer.
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

require("lazy").setup({
  -- Themes.
  {
    "Mofiqul/dracula.nvim",
    config = function()
      vim.cmd[[colorscheme dracula]]
    end
  },

  -- Plenary.
  "nvim-lua/plenary.nvim",

  -- Icons.
  "kyazdani42/nvim-web-devicons",

  -- Nui
  "MunifTanjim/nui.nvim",

  -- Language Server Protocol.
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugin.nvim-lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    dependencies = "williamboman/mason-lspconfig.nvim",
    config = function()
      require "plugin.mason"
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "plugin.null-ls"
    end
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require "plugin.lspsaga"
    end
  },
  {
    "folke/trouble.nvim",
    config = function()
      require "plugin.trouble"
    end
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require "plugin.fidget"
    end
  },

  -- Code completion.
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "quangnguyen30192/cmp-nvim-ultisnips",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind.nvim",
    },
    config = function()
      require "plugin.nvim-cmp"
    end
  },
  "honza/vim-snippets",
  {
    "SirVer/ultisnips",
    config = function()
      vim.cmd[[source $HOME/.vim/plugin-config/vim-fugitive.vim]]
    end
  },

  -- Treesitter.
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require "plugin.treesitter"
    end
  },

  -- File management.
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "v2.x",
    config = function()
      require "plugin.neo-tree"
    end
  },
  {
    "X3eRo0/dired.nvim",
    config = function()
      require "plugin.dired"
    end
  },

  -- Git.
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugin.gitsigns"
    end
  },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.cmd[[source $HOME/.vim/plugin-config/vim-fugitive.vim]]
    end
  },

  -- Project management.
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require "plugin.project"
    end
  },

  -- Start screen.
  {
    "goolord/alpha-nvim",
    config = function()
      require "plugin.alpha"
    end
  },

  -- Bufferline.
  {
    "akinsho/bufferline.nvim",
    version = "v2.*",
    event = "BufReadPre",
    config = function()
      require "plugin.bufferline"
    end
  },

  -- Statusline.
  {
    "feline-nvim/feline.nvim",
    config = function()
      require "plugin.feline"
    end
  },

  -- Telescope.
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "plugin.telescope"
    end
  },

  -- Terminal.
  {
    "akinsho/toggleterm.nvim",
    version = "v2.*",
    config = function()
      require "plugin.toggleterm"
    end
  },

  -- Auto Pairs.
  {
    "windwp/nvim-autopairs",
    config = function()
      require "plugin.nvim-autopairs"
    end
  },

  -- Motion.
  {
    "ggandor/leap.nvim",
    dependencies = "tpope/vim-repeat",
    config = function()
      require "plugin.leap"
    end
  },

  -- Indentation guides.
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require "plugin.indent-blankline"
    end
  },

  -- vim-mundo.
  "simnalamburt/vim-mundo",

  -- editorconfig.
  {
    "editorconfig/editorconfig-vim",
    config = function()
      vim.cmd[[source $HOME/.vim/plugin-config/editorconfig-vim.vim]]
    end
  },
}, {
  -- Lazy.nvim configuration.
  ui = {
    border = "double",
  },
})

