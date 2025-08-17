(module main
  {require {a aniseed.core}})

;; for the memes. gotta have a macro example that compiles. replace with some thing useful soon
(macro unless [condition & code]
  `(when (not ,condition)
     ,(unpack code)))


;; general keymaps
(->> [
      ["fs" "w" "[f]ile [s]ave"]

      ["cf" "e ~/.config/nvim/fnl/init.fnl" "[c]onfig [f]ennel"] ;config helpers
      ["cl" "e ~/.config/nvim/init.lua" "[c]onfig [l]ua"]

      ["bn" "bn" "[b]uffer [n]ext"] ;buffer controls
      ["bp" "bp" "[b]uffer [p]revious"]
      ["bd" "bd" "[b]uffer [d]elete"]
      ]
     (a.map (lambda [[ks then-do desc]]
              (vim.keymap.set "n"
                              (.. "<leader>" ks)
                              (.. ":" then-do "<cr>")
                              (when desc {:desc desc})))))

;; general settings
(->> {
      :number true ;line numbers
      :rnu true
      :scrolloff 10
      :confirm true

      :mouse :a
      :showmode false
      :cursorline true

      :ts 2 ;tab setttings
      :sts 2
      :et true
      :bri true ;tab wrapped lines
      :undofile true

      :swf false
      :scl :yes

      :ut 250 ;perf timeouts
      :tm 350

      :spr true ;splits
      :sb true

      :list true ;whitespace
      :listchars "tab:» ,trail:·,nbsp:␣"
      :inccommand :split

      :ignorecase true
      :smartcase true
      }
     (a.map-indexed (lambda [[name value]]
                      (tset vim.o name value))))

;; speed up scroll
(def scroll-speed 8)
(vim.keymap.set "n" "<c-e>" (.. scroll-speed "<c-e>") {:desc "scroll down"})
(vim.keymap.set "n" "<c-y>" (.. scroll-speed "<c-y>") {:desc "scroll up"})

(comment
  ;; repl imports
  (do
    (local a (require "aniseed.core")))


  ;; playground
  (a.map a.inc {1 1 2 1 3 1})
  (type [])

  ;
  )
