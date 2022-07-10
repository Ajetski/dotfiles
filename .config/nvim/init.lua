-- Basics
vim.g.mapleader = " "

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.o.mouse = "a"
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true                -- wrap lines
vim.o.encoding = "UTF-8"         -- set encoding to UTF-8 (default was "latin1")
vim.o.wildmenu = true            -- visual autocomplete for command menu
vim.o.lazyredraw = true          -- redraw screen only when we need to
vim.o.showmatch = true           -- highlight matching parentheses / brackets [{()}]
vim.o.laststatus = 2             -- always show statusline (even with only single window)
vim.o.ruler = true               -- show line and column number of the cursor on right side of statusline
vim.o.visualbell = true          -- blink cursor on error, instead of beeping
vim.o.invlist = true             -- show tabs


vim.api.nvim_set_keymap("n", "<leader>", "<Plug>(easymotion-bd-jk)", { noremap = true })
vim.keymap.set("i", "kj", "<esc>", { silent = true })  -- sets noremap automatically
vim.api.nvim_set_var("toggle_syntax_state", true)

-- Plugins
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-surround'
	Plug('scrooloose/nerdtree', {on = {'NERDTreeToggle', 'NERDTree'}})
	Plug 'junegunn/goyo.vim'
	Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
	Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['TSUpdate']})
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'wadackel/vim-dogrun' -- colorscheme
	Plug 'tribela/vim-transparent'

	-- LSP
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	Plug 'L3MON4D3/LuaSnip' -- Snippets plugin

	-- Airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
    -- Lang Support
	Plug 'sheerun/vim-polyglot'
	Plug 'evanleck/vim-svelte'
	Plug 'pantharshit00/vim-prisma'
	Plug 'pangloss/vim-javascript'
vim.call('plug#end')

vim.cmd(':colorscheme dogrun')

-- setup Airline
vim.cmd('let g:airline#extensions#tabline#enabled = 1')
vim.cmd("let g:airline#extensions#tabline#left_sep = ' '")
vim.cmd("let g:airline#extensions#tabline#left_alt_sep = '|'")
vim.cmd("let g:airline_theme='night_owl'")
vim.cmd("let g:airline_section_y = '%{strftime(\"%H:%M\")}'")

-- setup TreeSitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	sync_install = false
}

-- luasnip setup
local luasnip = require 'luasnip'

-- setup LSP
local cmp = require'cmp'
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
	}, {
		{ name = 'buffer' }
	})
})
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

vim.api.nvim_create_autocmd(
	{ "BufEnter" },
	{ pattern = { "*" }, command = "if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif" }
)

local lsp_flags = {
}
require('lspconfig')['tsserver'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
	on_attach = on_attach,
	flags = lsp_flags,

	-- Server-specific settings...
	settings = {
		["rust-analyzer"] = {}
	}
}
require('lspconfig')['svelte'].setup{
	on_attach = on_attach,
	flags = lsp_flags
}

vim.cmd("let g:ctrlp_custom_ignore = 'node_modules\\|DS_Store\\|git\\|build\\|dist\\|target'")

-- keymaps
vim.keymap.set("n", "<c-s>", ":wa<cr>")
vim.keymap.set("n", "<c-t>", ":NERDTreeToggle<cr>")
vim.keymap.set("n", "<leader>tt", ":TransparentToggle<cr>")
vim.keymap.set("n", "gt", ":bn<cr>")
vim.keymap.set("n", "gT", ":bp<cr>")
vim.keymap.set("n", "<cr>", ":nohlsearch<cr><cr>")

