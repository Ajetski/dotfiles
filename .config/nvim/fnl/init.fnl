(module main
  {require {a aniseed.core}})

(fn set-o! [name value]
  (tset vim.o name value))

(vim.keymap.set "n" "<leader>fs" ":w<cr>" { :desc  "[f]ile [s]ave" })
(set-o! "relativenumber" true)
(set-o! "tabstop" 2)
(set-o! "softtabstop" 2)
(set-o! "shiftwidth" 2)
(set-o! "expandtab" true)

