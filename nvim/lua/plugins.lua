return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/popup.nvim'
  use 'jvgrootveld/telescope-zoxide'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'ray-x/lsp_signature.nvim'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { "TelescopePrompt" , "vim" },
      })
    end
  }
  use 'preservim/nerdtree'
  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   requires = {
  --     'kyazdani42/nvim-web-devicons', -- optional, for file icon
  --   },
  --   config = function()
  --     require'nvim-tree'.setup {} 
  --   end
  -- }
  use 'goolord/alpha-nvim'
  use 'tpope/vim-surround'
  use {
    'numToStr/Comment.nvim', 
    config = function()
      require('Comment').setup()
    end 
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'voldikss/vim-floaterm'
  use 'sbdchd/neoformat'
  use 'folke/zen-mode.nvim'
  use 'dracula/vim'
  use 'mhartington/oceanic-next'
end)
