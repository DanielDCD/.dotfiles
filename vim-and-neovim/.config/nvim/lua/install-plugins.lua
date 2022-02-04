-- Packer auto installer.
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Language Server Protocol
  use 'neovim/nvim-lspconfig'

  -- Snippets
  use 'honza/vim-snippets'
  use 'SirVer/ultisnips'

  -- Themes
  use {'dracula/vim', as = 'dracula'}

  -- Git
  use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'

  -- vim-mundo
  use 'simnalamburt/vim-mundo'

  -- editorconfig
  use 'editorconfig/editorconfig-vim'
end)
