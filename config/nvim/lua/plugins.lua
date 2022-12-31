-- Install packer
-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()

  use'christoomey/vim-tmux-navigator'

  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'

  -- use 'kosayoda/nvim-lightbulb'

  use '9mm/vim-closer'

  use {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
  }
  use 'kyazdani42/nvim-web-devicons'

--tpope------------------------------------------------------------------------
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-unimpaired'
-------------------------------------------------------------------------------

  use { 'nathom/filetype.nvim' }

  -- Plugins can have post-install/update hooks
use {"ellisonleao/glow.nvim"}

  -- Post-install/update hook with neovim command
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
  }

  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- LaTeX
  use 'lervag/vimtex'

-------------------------------------------------------------------------------
  use {
    'akinsho/bufferline.nvim', requires = { 'kyazdani42/nvim-web-devicons' },
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  }

-------------------------------------------------------------------------------


  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  use{
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      'hrsh7th/cmp-calc',
    },
  }

  -- use 'rafamadriz/friendly-snippets'
  use 'lambdalisue/suda.vim'

  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim',}

  use 'nvim-lua/popup.nvim'

  use 'glepnir/lspsaga.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-project.nvim',
    requires = { 'nvim-lua/plenary.nvim'}
  }

  use 'mfussenegger/nvim-dap'

-------------------------------------------------------------------------------

  use 'onsails/lspkind-nvim'
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  use {"metalelf0/jellybeans-nvim", requires = {"rktjmp/lush.nvim"}}
  use {"Mofiqul/vscode.nvim", requires = {"rktjmp/lush.nvim"}}
  use 'joshdick/onedark.vim'

  use 'lukas-reineke/indent-blankline.nvim'

  use 'github/copilot.vim'

end)
