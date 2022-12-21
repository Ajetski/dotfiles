vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use('EdenEast/nightfox.nvim')
    use({ 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('kdheepak/lazygit.nvim')
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
    use("github/copilot.vim")
    use({
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            require 'hop'.setup { keys = 'etovdygfblhckisuran' }
        end
    })
    use('tribela/vim-transparent')
    use({ 'evanleck/vim-svelte',
        { branch = 'main' },
        { requires = {
            { 'othree/html5.vim' },
            { 'pangloss/vim-javascript' }
        }}
    })
end)
