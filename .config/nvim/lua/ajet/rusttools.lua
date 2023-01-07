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

require('rust-tools').setup({
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
		--adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
	}
})
