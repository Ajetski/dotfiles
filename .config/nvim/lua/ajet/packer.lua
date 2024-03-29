vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
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
  use({
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  })
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
  use('github/copilot.vim')

  use {
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }

  -- clojure things
  use({ 'tpope/vim-sexp-mappings-for-regular-people', requires = { 'guns/vim-sexp' } })
  use('Olical/conjure')
  use('PaterJason/cmp-conjure')
  use({
    'HiPhish/nvim-ts-rainbow2',
    config = function()
      require('nvim-treesitter.configs').setup {
        rainbow = {
          enable = true,
          query = 'rainbow-parens',
          strategy = require('ts-rainbow').strategy.global,
          hlgroups = {
            'TSRainbowGreen',
            'TSRainbowBlue',
            'TSRainbowCyan',
            'TSRainbowYellow',
            'TSRainbowOrange',
            'TSRainbowViolet',
          },
        }
      }
    end
  })

  -- use('nvim-treesitter/playground')
  -- use('EdenEast/nightfox.nvim')
  -- use('mattn/emmet-vim')
  -- use('dcampos/cmp-emmet-vim')
  -- use('evanleck/vim-svelte',
  --   { branch = 'main' },
  --   {
  --     requires = {
  --       { 'othree/html5.vim' },
  --       { 'pangloss/vim-javascript' }
  --     }
  --   })
end)
