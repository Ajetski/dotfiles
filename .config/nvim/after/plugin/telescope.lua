local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fls', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>flw', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ srearch = vim.fn.input("Grep > ") })
end)

