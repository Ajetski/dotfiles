vim.g['conjure#extract#tree_sitter#enabled'] = true
vim.g['g:conjure#filetypes'] = {"clojure", "fennel", "lisp"}

vim.keymap.set("n", "<leader>k", ":ConjureDocWord<cr>")
