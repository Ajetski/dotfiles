(module main
  {require {a aniseed.core}})

;; utils
(fn opt! [name value]
  (tset vim.o name value))


;; general settings
(opt! :relativenumber true)
(opt! :tabstop 2)
(opt! :softtabstop 2)
(opt! :shiftwidth 2)
(opt! :expandtab true)


;; keymaps
(vim.keymap.set "n" "<leader>fs" ":w<cr>" { :desc  "[f]ile [s]ave" })
(vim.keymap.set "n" "<leader>fe" ":e ~/.config/nvim/fnl/init.fnl<cr>" { :desc  "[f]ennel config [e]dit" })
(vim.keymap.set "n" "<leader>bn" ":bn<cr>" { :desc  "[b]uffer [n]ext" })
(vim.keymap.set "n" "<leader>bp" ":bp<cr>" { :desc  "[b]uffer [p]revious" })
(vim.keymap.set "n" "<leader>bd" ":bd<cr>" { :desc  "[b]uffer [d]elete" })


