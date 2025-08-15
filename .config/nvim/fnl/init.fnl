(module main
  {require {a aniseed.core}})

;; for the memes. gotta have a macro example that compiles. replace with some thing useful sooon
(macro unless [condition & code]
  `(when (not ,condition)
     ,(unpack code)))


;; utils
(fn opt! [name value]
  (tset vim.o name value))

(local keymap! vim.keymap.set)

(fn nmap! [ks then-do desc]
  (keymap! "n" ks then-do
           (when desc
             {:desc desc})))


;; general settings
(opt! :relativenumber true)
(opt! :tabstop 2)
(opt! :softtabstop 2)
(opt! :shiftwidth 2)
(opt! :expandtab true)


;; keymaps
(nmap! "<leader>fs" ":w<cr>" "[f]ile [s]ave")
(nmap! "<leader>cf" ":e ~/.config/nvim/fnl/init.fnl<cr>" "[c]onfig [f]ennel" )
(nmap! "<leader>bn" ":bn<cr>" "[b]uffer [n]ext" )
(nmap! "<leader>bp" ":bp<cr>" "[b]uffer [p]revious" )
(nmap! "<leader>bd" ":bd<cr>" "[b]uffer [d]elete" )

