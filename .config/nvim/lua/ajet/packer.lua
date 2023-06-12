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
      require 'hop'.setup { keys = 'etovdygfblhckisuran' }
    end
  })
  use('tribela/vim-transparent')
  use('evanleck/vim-svelte',
    { branch = 'main' },
    {
      requires = {
        { 'othree/html5.vim' },
        { 'pangloss/vim-javascript' }
      }
    })
  use({
    'simrat39/rust-tools.nvim',
    requires = {
      { 'neovim/nvim-lspconfig' }
    },
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  })
  use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })
  use { "catppuccin/nvim", as = "catppuccin" }
  use("folke/trouble.nvim", {
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require 'nvim-web-devicons'.setup {}
      require("trouble").setup {
        icons = false,
        use_lsp_diagnostic_signs = true,
      }
    end
  })
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use({ 'tpope/vim-sexp-mappings-for-regular-people', requires = { 'guns/vim-sexp' } })
  use({
    'chentoast/marks.nvim',
    config = function()
      require('marks').setup()
    end
  })
  use('lewis6991/gitsigns.nvim')
  use('github/copilot.vim')
  use('dstein64/vim-startuptime')

  -- unused plugins
  -- use({
  --   'simrat39/symbols-outline.nvim',
  --   config = function()
  --     require("symbols-outline").setup()
  --     vim.keymap.set("n", "<leader>to", ":SymbolsOutline<cr>")
  --   end
  -- })
  -- use('Olical/conjure')
  -- use('PaterJason/cmp-conjure')
  -- use('kdheepak/lazygit.nvim')
  -- use('nvim-treesitter/playground')
  -- use('EdenEast/nightfox.nvim')
  -- use('mattn/emmet-vim')
  -- use('dcampos/cmp-emmet-vim')
  -- use('Konfekt/vim-alias')
end)
