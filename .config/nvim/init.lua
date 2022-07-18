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
vim.cmd('set invlist')


vim.api.nvim_set_var("toggle_syntax_state", true)

-- Plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
	-- Editor basics and navigation
	Plug 'tpope/vim-sensible' -- some good default configs, we love tpope :)
	Plug 'tpope/vim-surround' -- add surround motion (s), example: to change the surrounding double quotes to single quotes type: cs"'
	Plug('scrooloose/nerdtree', {on = {'NERDTreeToggle', 'NERDTree'}}) -- file browser
	Plug 'junegunn/goyo.vim' -- zen mode
	Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
	Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['TSUpdate']}) -- add support for text objects
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	-- Plug 'ctrlpvim/ctrlp.vim' -- minimal fuzzyfinder
	Plug 'wadackel/vim-dogrun' -- colorscheme
	Plug 'tribela/vim-transparent' -- clear background
	Plug 'nvim-lua/plenary.nvim' -- testing framework, required for telescope
	Plug 'nvim-telescope/telescope.nvim' -- fancy fuzzyfinder
	Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' }) -- faster fzf

	-- LSP
	Plug "williamboman/nvim-lsp-installer"
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
	Plug 'simrat39/rust-tools.nvim'
	--Plug 'pangloss/vim-javascript'
vim.call('plug#end')

-- set colorscheme
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
local opts = { noremap=true, silent=true }
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

require("nvim-lsp-installer").setup {
	automatic_installation = true
}

local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup {}
lspconfig.tsserver.setup{
	on_attach = on_attach,
}
require('rust-tools').setup{
	tools = { -- rust-tools options
		autoSetHints = true,
		hover_with_actions = true,
		runnables = {
			use_telescope = true
		},
		inlay_hints = {
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		}
	},
	server = {
		on_attach = on_attach,
		flags = lsp_flags,
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy"
				}
			}
		}
	}
}
require('lspconfig')['svelte'].setup{
	on_attach = on_attach,
}

-- fuzzy finder config
local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-u>"] = false,
				["<C-p>"] = false,
				["<esc>"] = actions.close,
			},
		},
		file_ignore_patterns = {
			"node_modules"
		}
	},
	pickers = {},
	extensions = {},
})
telescope.load_extension('fzf')

-- keymaps
local opts = { noremap=true, silent=true }
local loud_opts = { noremap=true }
vim.keymap.set("n", "<c-s>", ":wa<cr>:echo 'File saved.'<cr>", loud_opts)
vim.keymap.set("n", "<c-t>", ":NERDTreeToggle<cr>", opts)
vim.keymap.set("n", "<leader>tt", ":TransparentToggle<cr>", opts)
vim.keymap.set("n", "<leader>tz", ":Goyo 150<cr>", opts)
vim.keymap.set("n", "<leader>tr", ":set relativenumber!<cr>")
vim.keymap.set("n", "<leader>ti", ":set invlist!<cr>")
vim.keymap.set("n", "gt", ":bn<cr>", opts)
vim.keymap.set("n", "gT", ":bp<cr>", opts)
vim.keymap.set("n", "<cr>", ":nohlsearch<cr><cr>", opts)
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", opts)
vim.keymap.set('n', '<leader>fk', ':Telescope keymaps<cr>', opts)
vim.keymap.set("n", "<c-p>", ":Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", opts)
vim.keymap.set("i", "<f1>", "", opts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<cr>", ":nohlsearch<cr>", opts)
