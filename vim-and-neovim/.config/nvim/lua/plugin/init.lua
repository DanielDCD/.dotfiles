-- Lazy.nvim auto installer.
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup({
  {
    'catppuccin/nvim',
    config = function()
      require('plugin.catppuccin')
    end,
  },

  -- Plenary.
  'nvim-lua/plenary.nvim',

  -- Icons.
  'kyazdani42/nvim-web-devicons',

  -- Nui
  'MunifTanjim/nui.nvim',

  -- Language Server Protocol.
  {
    'neovim/nvim-lspconfig',
    priority = 51,
    config = function()
      require('plugin.nvim-lspconfig')
    end,
  },
  {
    'williamboman/mason.nvim',
    dependencies = 'williamboman/mason-lspconfig.nvim',
    config = function()
      require('plugin.mason')
    end,
  },
  {
    'glepnir/lspsaga.nvim',
    event = { 'UIEnter', 'BufRead', 'BufReadPost' },
    config = function()
      require('plugin.lspsaga')
    end,
  },
  {
    'folke/trouble.nvim',
    config = function()
      require('plugin.trouble')
    end,
  },
  {
    'j-hui/fidget.nvim',
    config = function()
      require('plugin.fidget')
    end,
    tag = 'legacy',
  },

  -- Code completion.
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'quangnguyen30192/cmp-nvim-ultisnips',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'onsails/lspkind.nvim',
    },
    config = function()
      require('plugin.nvim-cmp')
    end,
  },
  'honza/vim-snippets',
  {
    'SirVer/ultisnips',
    config = function()
      vim.cmd([[source $HOME/.vim/plugin-config/vim-fugitive.vim]])
    end,
  },

  -- Treesitter.
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufReadPost',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require('plugin.treesitter')
    end,
  },

  -- File management.
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = 'v2.x',
    config = function()
      require('plugin.neo-tree')
    end,
  },
  {
    'X3eRo0/dired.nvim',
    config = function()
      require('plugin.dired')
    end,
  },

  -- Git.
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugin.gitsigns')
    end,
  },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.cmd([[source $HOME/.vim/plugin-config/vim-fugitive.vim]])
    end,
  },

  -- Project management.
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('plugin.project')
    end,
  },

  -- Start screen.
  {
    'goolord/alpha-nvim',
    config = function()
      require('plugin.alpha')
    end,
  },

  -- Tabline.
  {
    'nanozuki/tabby.nvim',
    config = function()
      require('plugin.tabby')
    end,
  },

  -- Window management
  {
    'dstein64/vim-win',
  },
  {
    'anuvyklack/windows.nvim',
    dependencies = {
      'anuvyklack/middleclass',
      'anuvyklack/animation.nvim',
    },
    config = function()
      require('plugin.windows')
    end,
  },

  -- Statusline.
  {
    'rebelot/heirline.nvim',
    event = 'UIEnter',
    config = function()
      require('plugin.heirline')
    end,
  },

  -- Winbar
  {
    'utilyre/barbecue.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'SmiteshP/nvim-navic',
    },
    event = 'UIEnter',
    config = function()
      require('plugin.barbecue')
    end,
  },
  -- Telescope.
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('plugin.telescope')
    end,
  },

  -- Terminal.
  {
    'akinsho/toggleterm.nvim',
    version = 'v2.*',
    config = function()
      require('plugin.toggleterm')
    end,
  },

  -- Auto Pairs.
  {
    'windwp/nvim-autopairs',
    config = function()
      require('plugin.nvim-autopairs')
    end,
  },

  -- Motion.
  {
    'ggandor/leap.nvim',
    dependencies = 'tpope/vim-repeat',
    config = function()
      require('plugin.leap')
    end,
  },

  -- Highlighting
  {
    'RRethy/vim-illuminate',
    config = function()
      require('plugin.vim-illuminate')
    end,
  },

  -- Indentation guides.
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('plugin.indent-blankline')
    end,
  },

  -- Color codes
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('plugin.nvim-colorizer')
    end,
  },

  -- vim-mundo.
  'simnalamburt/vim-mundo',

  -- editorconfig.
  {
    'editorconfig/editorconfig-vim',
    config = function()
      vim.cmd([[source $HOME/.vim/plugin-config/editorconfig-vim.vim]])
    end,
  },
}, {
  -- Lazy.nvim configuration.
  ui = {
    border = 'double',
  },
  install = {
    missing = false,
    colorscheme = { 'catppuccin-macchiato' },
  },
})
