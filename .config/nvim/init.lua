-- Basics
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.o.mouse = "a"
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true -- wrap lines
vim.o.encoding = "UTF-8" -- set encoding to UTF-8 (default was "latin1")
vim.o.wildmenu = true -- visual autocomplete for command menu
vim.o.lazyredraw = true -- redraw screen only when we need to
vim.o.showmatch = true -- highlight matching parentheses / brackets [{()}]
vim.o.laststatus = 2 -- always show statusline (even with only single window)
vim.o.ruler = true -- show line and column number of the cursor on right side of statusline
vim.o.visualbell = true -- blink cursor on error, instead of beeping
vim.api.nvim_set_var("toggle_syntax_state", true)

-- Plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
-- Editor basics and navigation
Plug 'tpope/vim-sensible' -- some good default configs, we love tpope :)
Plug 'tpope/vim-surround' -- add surround motion (s), example: to change the surrounding double quotes to single quotes type: cs"'
Plug 'tpope/vim-repeat'
Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install'] })
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn['TSUpdate'] }) -- add support for text objects
-- Plug 'ctrlpvim/ctrlp.vim' -- minimal fuzzyfinder
Plug 'wadackel/vim-dogrun' -- colorscheme
Plug 'tribela/vim-transparent' -- clear background
Plug 'nvim-lua/plenary.nvim' -- testing framework, required for telescope
Plug 'nvim-telescope/telescope.nvim' -- fancy fuzzyfinder
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' }) -- faster fzf
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'kshenoy/vim-signature'
Plug 'phaazon/hop.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'dense-analysis/ale' -- async runtime for formatting
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/twilight.nvim'
Plug 'folke/zen-mode.nvim'
Plug('wfxr/minimap.vim', {['do'] = ':!cargo install --locked code-minimap'})

-- Git Integration
Plug 'airblade/vim-gitgutter'

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

-- Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

-- Lang Support
Plug 'sheerun/vim-polyglot'
Plug 'pantharshit00/vim-prisma'
Plug 'simrat39/rust-tools.nvim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug('evanleck/vim-svelte', { ['branch'] = 'main' })
vim.call('plug#end')

-- set colorscheme
vim.cmd(':colorscheme dogrun')
vim.cmd(':highlight LineNr ctermfg=grey')

vim.cmd(':hi Twilight ctermfg=8')
require("twilight").setup {
  dimming = {
    alpha = 0.25, -- amount of dimming
    color = { "Normal", "#ffffff" },
    term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
    inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
  },
  context = 10, -- amount of lines we will try to show around the current line
  treesitter = true, -- use treesitter when available for the filetype
  expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
    "function",
    "method",
    "table",
    "if_statement",
  },
  exclude = {}, -- exclude these filetypes
}
require("zen-mode").setup {
  window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 120, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = false,
      font = "+6", -- font size increment
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
}

-- setup svelte
vim.cmd("let g:svelte_preprocessor_tags = [ { 'name': 'ts', 'tag': 'script', 'as': 'typescript' } ]")
vim.cmd("let g:svelte_preprocessors = ['ts']")

-- setup TreeSitter
require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "rust", "javascript", "typescript", "graphql", "svelte" },
	sync_install = false,
	context_commentstring = {
		enable = true
	}
}

-- setup minimap
vim.cmd'let g:minimap_width = 6'
vim.cmd'let g:minimap_auto_start = 1'
--vim.cmd'let g:minimap_git_colors = 1'
--vim.cmd'let g:minimap_left = 1'
vim.cmd'let g:minimap_highlight_range = 1'
vim.cmd'let g:minimap_highlight_search = 1'
vim.cmd'let g:minimap_auto_start_win_enter = 1'
vim.cmd'hi MinimapCurrentLine ctermfg=Green'
vim.cmd"let g:minimap_cursor_color = 'MinimapCurrentLine'"
vim.cmd'hi MinimapRange ctermfg=blue'
vim.cmd"let g:minimap_range_color = 'MinimapRange'"

-- setup comments
-- require('nvim_comment').setup({
-- 	hook = function()
-- 		if vim.api.nvim_buf_get_option(0, "filetype") == "svelte" then
-- 			require("ts_context_commentstring.internal").update_commentstring{}
-- 		end
-- 	end
-- })
require('Comment').setup()

-- setup hop
require 'hop'.setup {}

-- setup lualine
-- local colors = {
--   blue   = '#80a0ff',
--   cyan   = '#79dac8',
--   black  = '#080808',
--   white  = '#c6c6c6',
--   red    = '#ff5189',
--   violet = '#d183e8',
--   grey   = '#303030',
-- }
--
-- local bubbles_theme = {
--   normal = {
--     a = { fg = colors.black, bg = colors.blue },
--     b = { fg = colors.white, bg = colors.grey },
--     c = { fg = colors.black, bg = colors.black },
--   },
--
--   insert = { a = { fg = colors.black, bg = colors.violet } },
--   visual = { a = { fg = colors.black, bg = colors.cyan } },
--   replace = { a = { fg = colors.black, bg = colors.red } },
--
--   inactive = {
--     a = { fg = colors.white, bg = colors.black },
--     b = { fg = colors.white, bg = colors.black },
--     c = { fg = colors.black, bg = colors.black },
--   },
-- }

require('lualine').setup {
  options = {
    theme = 'modus-vivendi', -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      -- { 'mode', separator = { left = '' }, right_padding = 2 },
      'mode'
    },
    lualine_b = {{ 'filename', path = 1 }, 'branch', 'diff', 'diagnostics' },
    lualine_c = {'searchcount'},
    lualine_x = {},
    lualine_y = {'fileformat', { 'filetype', colored = true, icon_only = true, padding = { left = 1, right = 2 }}},
    lualine_z = {
      -- { 'location', separator = { right = '' }, left_padding = 2 },
      'progress'
    },
  },
  inactive_sections = {
    lualine_a = { {'filename', path = 1} },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'progress'},
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'},
  },
  winbar = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {'quickfix'},
}

-- setup dashboard
local home = os.getenv('HOME')
local db = require('dashboard')
db.preview_command = 'cat | lolcat -F .2'
db.preview_file_path = home .. '/.config/nvim/static/neovim.bold'
db.preview_file_height = 12
db.preview_file_width = 80
db.session_directory = home .. '/.sessions'
db.custom_center = {
	{
		icon = '🕑 ',
		desc = 'Open Most Recent Session                ',
		shortcut = '<leader>sl',
		action = 'SessionLoad'
	},
	{
		icon = '🕑 ',
		desc = 'Open Default Layout Session             ',
		shortcut = '<leader>sd',
		action = 'source ~/.sessions/default_layout.vim'
	},
	{
		icon = '🔍 ',
		desc = 'Find File                               ',
		action = 'Telescope find_files find_command=rg,--hidden,--files',
		shortcut = '<leader>ff'
	},
	{
		icon = '🌲 ',
		desc = 'File Browser                            ',
		action = 'Telescope file_browser',
		shortcut = '<leader>fb'
	},
	{
		icon = '📓 ',
		desc = 'Find \\w grep                            ',
		action = 'Telescope live_grep',
		shortcut = '<leader>fg'
	},
}

-- snippets setup
local ls = require 'luasnip'
local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets("svelte", {
	s("component-svelte", {
		t { '<script lang="ts">', '\t' },
		i(1, '// Typescript Goes Here'),
		t { '', '</script>', '', '<main>', '\t' },
		i(2, '<!-- HTML Goes Here-->'),
		t { '', '</main>', '', '<style>', '\t' },
		i(3, '/* CSS Goes Here */'),
		t { '', '</style>', '' }
	}),
})

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require 'cmp'
if not cmp then
	vim.cmd("echo Error cmp not found")
	return
end

cmp.setup({
	snippet = {
		expand = function(args)
			ls.lsp_expand(args.body)
		end,
	},
	window = {},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif ls.expand_or_jumpable() then
				ls.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif ls.jumpable(-1) then
				ls.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	})
})


-- setup LSP
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
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
	vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { silent = true, buffer = bufnr })
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>F', vim.lsp.buf.formatting, bufopts)
end

-- setup file browser
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 -- override = {
 --  zsh = {
 --    icon = "",
 --    color = "#428850",
 --    cterm_color = "65",
 --    name = "Zsh"
 --  }
 -- };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
local lib = require("nvim-tree.lib")
local view = require("nvim-tree.view")

local git_add = function()
  local node = lib.get_node_at_cursor()
  local gs = node.git_status

  -- If the file is untracked, unstaged or partially staged, we stage it
  if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
    vim.cmd("silent !git add " .. node.absolute_path)

  -- If the file is staged, we unstage
  elseif gs == "M " or gs == "A " then
    vim.cmd("silent !git restore --staged " .. node.absolute_path)
  end

  lib.refresh_tree()
end
local function collapse_all()
    require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
end

local function edit_or_open()
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
        view.close() -- Close the tree if file was opened

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
        view.close() -- Close the tree if file was opened
    end

end

local function vsplit_preview()
    -- open as vsplit on current node
    local action = "vsplit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)

    end

    -- Finally refocus on tree if it was lost
    view.focus()
end
require("nvim-tree").setup({
    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = "l", action = "edit", action_cb = edit_or_open },
                { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
                { key = "h", action = "close_node" },
                { key = "H", action = "collapse_all", action_cb = collapse_all },
								{ key = "ga", action = "git_add", action_cb = git_add },
            }
        },
    },
    actions = {
        open_file = {
            quit_on_open = false
        }
    }
})

require("nvim-lsp-installer").setup {
	automatic_installation = false
}

local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			runtime = {
				version = 'LuaJIT',
			},
			telemetry = {
				enable = false,
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			}
		}
	},
	on_attach = on_attach,
}
lspconfig.tsserver.setup {
	on_attach = on_attach,
}
require('rust-tools').setup {
	tools = { -- rust-tools options
		executor = require("rust-tools/executors").termopen,
		on_initialized = nil,
		reload_workspace_from_cargo_toml = true,
		autoSetHints = true,
		hover_with_actions = false,
		hover_actions = {
			border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			},
			auto_focus = true,
		},
		inlay_hints = {
			show_parameter_hints = true,
			parameter_hints_prefix = "<- ",
			other_hints_prefix = "=> ",
			current_line_only = false,
		}
	},
	server = {
		on_attach = function(_, buffnr)
			on_attach(_, buffnr)
			local bufopts = { silent = true, buffer = buffnr }
			vim.keymap.set('n', '<leader>ca', ':RustCodeAction<cr>', bufopts)
			vim.keymap.set('n', '<leader>K', ':RustHoverActions<cr>', bufopts)
			vim.keymap.set('n', '<leader>R', ':RustRunnables<cr>', bufopts)
			vim.keymap.set('n', '<leader>D', ':RustDebuggables<cr>', bufopts)
		end,
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy"
				}
			}
		}
	},
	dap = {
		adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
	}
}
require('lspconfig')['svelte'].setup {
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
	},
	pickers = {},
	extensions = {},
})
telescope.load_extension('file_browser')
telescope.load_extension('fzf')
telescope.load_extension("ui-select")

-- Debugger
local dap = require('dap')
require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	expand_lines = vim.fn.has("nvim-0.7"),
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40, -- 40 columns
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	}
})
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open {}
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close {}
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close {}
end

-- formatting
vim.cmd [[let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\   'svelte': ['prettier'],
\		'rust': ['rustfmt'],
\}]]
vim.cmd [[let g:ale_linters_explicit = 1]]
vim.cmd [[let g:ale_fix_on_save = 1]]
vim.cmd [[let g:ale_linters_ignore = {
      \   'typescript': ['eslint'],
      \}]]

-- keymaps
local loud_opts = { noremap = true }
vim.keymap.set("n", "<c-s>", ":wa<cr>:echo 'File saved.'<cr>", loud_opts)
vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>" ,{silent = true, noremap = true})
vim.keymap.set("n", "<leader>tt", ":TransparentToggle<cr>", opts)
vim.keymap.set("n", "<leader>tz", ":ZenMode<cr>", opts)
vim.keymap.set("n", "<leader>tr", ":set relativenumber!<cr>")
vim.keymap.set("n", "<leader>ti", ":set invlist!<cr>")
vim.keymap.set("n", "tj", ":bn<cr>", opts)
vim.keymap.set("n", "tk", ":bp<cr>", opts)
vim.keymap.set("n", "<cr>", ":nohlsearch<cr><cr>", opts)
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", opts)
vim.keymap.set('n', '<leader>fk', ':Telescope keymaps<cr>', opts)
vim.keymap.set('n', '<leader>fB', ':Telescope file_browser<cr>', opts)
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>', opts)
vim.keymap.set("n", "<c-p>", ":Telescope git_files<cr>", opts)
vim.keymap.set("n", "<leader>fc", ":Telescope git<cr>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<leader>fC", ":Telescope git_bcommits<cr>", opts)
vim.keymap.set("n", "<leader>fc", ":Telescope git_commits<cr>", opts)
vim.keymap.set("i", "<f1>", "", opts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<cr>", ":nohlsearch<cr>", opts)
vim.keymap.set("n", "]h", "<Plug>(GitGutterNextHunk)", opts)
vim.keymap.set("n", "[h", "<Plug>(GitGutterPrevHunk)", opts)
vim.keymap.set("n", "<leader>gd", ":GitGutterDiffOrig<cr>", opts)
vim.keymap.set("n", "<leader>gf", ":GitGutterFold<cr>", opts)
vim.keymap.set("n", "<leader>sl", ":SessionLoad<cr><cr>", opts)
vim.keymap.set("n", "<leader>ss", ":SessionSave<cr><cr>", opts)
vim.keymap.set("n", "<leader>cb", ":%bd|e#<cr>:echo closed all other buffers<cr>", loud_opts)
vim.keymap.set("n", "<leader>P", ":!yarn format<cr>")
vim.keymap.set("n", "<leader>rr", ":source ~/.config/nvim/init.lua<cr>")
vim.api.nvim_set_keymap('', 'f',
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
	, {})
vim.api.nvim_set_keymap('', 'F',
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
	, {})
vim.api.nvim_set_keymap('', 't',
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>"
	, {})
vim.api.nvim_set_keymap('', 'T',
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>"
	, {})
vim.keymap.set("n", "gw", ":HopWord<cr>", opts);
vim.keymap.set("n", "gh", ":HopWordCurrentLine<cr>", opts)
vim.keymap.set("n", "gl", ":HopLine<cr>", opts)
vim.keymap.set("n", "<leader>B", dap.toggle_breakpoint)
vim.keymap.set("n", "<f3>", dap.continue)
vim.keymap.set("n", "<f4>", dap.step_into)
vim.keymap.set("n", "<f5>", dap.step_over)
vim.keymap.set("t", "<esc>", "<C-\\><C-n>", opts)
