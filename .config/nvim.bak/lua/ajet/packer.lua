vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use({"williamboman/mason.nvim"})
  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})

  use 'nvim-lua/plenary.nvim'
  use('nvim-telescope/telescope.nvim', {
    tag = '0.1.0',
    requires = {
      { 'nvim-lua/plenary.nvim' }
    }
  })
  use('tpope/vim-repeat')
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-surround')
  use("folke/zen-mode.nvim")
  use({
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require 'hop'.setup { keys = 'qwertyuiopasdfghjklzxcvbnm' }
    end
  })
  use('tribela/vim-transparent')
  use({
    'simrat39/rust-tools.nvim',
    requires = {
      { 'neovim/nvim-lspconfig' }
    },
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  })
  use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })

  -- color themes
  use { "catppuccin/nvim", as = "catppuccin" }
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use {'VonHeikemen/little-wonder'}

  use("folke/trouble.nvim", {
    requires = { "nvim-tree/nvim-web-devicons" },
  })
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use({
    'chentoast/marks.nvim',
    config = function()
      require('marks').setup()
    end
  })
  use('lewis6991/gitsigns.nvim')
  use('dstein64/vim-startuptime')

  -- clojure things
  use({ 'tpope/vim-sexp-mappings-for-regular-people', requires = { 'guns/vim-sexp' } })
  use('Olical/conjure')
  use('PaterJason/cmp-conjure')
end)
