local fn = vim.fn

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd 'autocmd BufWritePost plugins.lua source <afile> | PackerSync' -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    config = function() require('telescope').setup({ defaults = { file_ignore_patterns = { "node_modules" }} }) end
  }
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use 'jvgrootveld/telescope-zoxide'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'ray-x/lsp_signature.nvim'
  use 'L3MON4D3/LuaSnip'  
  use 'saadparwaiz1/cmp_luasnip'
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup({ disable_filetype = { "TelescopePrompt" , "vim" } }) end
  }
  use 'preservim/nerdtree'
  use 'mhinz/vim-startify'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'simrat39/rust-tools.nvim'
  --
  -- use {
    -- 'numToStr/Comment.nvim'
  -- }
  use {
      'numToStr/Comment.nvim',
      tag = 'v0.6',
      config = function()
          require('Comment').setup()
      end
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    cond = function() return vim.bo.filetype == 'alpha' end,
    config = function() require('indent_blankline').setup({ show_current_context = true, show_current_context_start = true }) end
  }
  use 'voldikss/vim-floaterm'
  use 'numToStr/FTerm.nvim'
  use {
    'akinsho/toggleterm.nvim',
    config = function() require'toggleterm'.setup({
      shade_terminals = true, 
      open_mapping = [[<c-\>]],
    })
  end
  }
  use 'lervag/vimtex' -- LaTeX
  use 'folke/zen-mode.nvim'
  use 'mhartington/oceanic-next'
  use 'nvim-lualine/lualine.nvim'
  use 'jbyuki/instant.nvim'
  use 'svermeulen/vim-cutlass'
  use 'mg979/vim-visual-multi'
  use 'glacambre/firenvim'

  -- use '~/smortcd'
end)
