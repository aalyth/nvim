-- this file is added so potential lua-only extensions can be added

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- these are the needed plugins for a fully functional lsp config 
  -- the /after/plugin directory contains the rest of the config 
  -- the lsp config is commented due to my current usage of CoC
  --[[
  use {'neovim/nvim-lspconfig'}

  use {'hrsh7th/nvim-cmp'}

  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}

  use {'hrsh7th/vim-vsnip'}
  use {'hrsh7th/cmp-vsnip'}
  ]]--

end)

