-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- 官方配置 不支持其他插件
  -- use "altercation/vim-colors-solarized"
  use { "ellisonleao/gruvbox.nvim" }
  -- 支持其他插件，但是配色有问题
  -- use 'shaunsingh/solarized.nvim'

  use {'nvim-treesitter/nvim-treesitter', run = 'TSInstallFromGrammar, ' }

  use {'neovim/nvim-lspconfig','williamboman/nvim-lsp-installer'}

  -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer' -- { name = 'buffer' },
  use 'hrsh7th/cmp-path' -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline' -- { name = 'cmdline' }
  use 'hrsh7th/nvim-cmp'
  -- vsnip
  use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'
  -- lspkind
  use 'onsails/lspkind-nvim'

  use "numToStr/FTerm.nvim"
  use {"akinsho/toggleterm.nvim"}

  use {'nvim-telescope/telescope.nvim',requires = { {'nvim-lua/plenary.nvim'} }}
  use {'nvim-telescope/telescope-project.nvim'}

  use 'tpope/vim-surround'

  use 'glepnir/dashboard-nvim'

  use('jose-elias-alvarez/null-ls.nvim')
  -- use('MunifTanjim/prettier.nvim')

  use "lukas-reineke/indent-blankline.nvim"
  -- 注释
  use 'b3nj5m1n/kommentary'

  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use {'nvim-lualine/lualine.nvim',requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use {"SmiteshP/nvim-gps",requires = "nvim-treesitter/nvim-treesitter"}
  use "steelsojka/pears.nvim"
  use 'kyazdani42/nvim-tree.lua'
  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  use "yamatsum/nvim-cursorline" --显示当前光标下的单词
  use "edluffy/specs.nvim" --光标跳转效果，方便定位光标
  use {"folke/todo-comments.nvim",requires = "nvim-lua/plenary.nvim"}
  use "terryma/vim-multiple-cursors"
  use "p00f/nvim-ts-rainbow"
  use {"ray-x/lsp_signature.nvim"}
end)
