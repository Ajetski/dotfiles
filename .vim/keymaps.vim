"""" Key Bindings

:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk

let mapleader = ' '
let maplocalleader = ' '

" save file bind
noremap <c-s> :w<cr>

" exit terminal mode
:tnoremap <Esc> <C-\><C-n>

" toggle relative number
function! ToggleLineNumber()
    if &rnu == 1
        set nornu
    else
        set rnu
    endif
endfunction
nnoremap <leader>tr :call ToggleLineNumber()<CR>

" toggle Zen Mode
nnoremap <leader>tz :Goyo<CR>

" tree sitter text object key bindings
lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
      },
    },
  },
}
EOF


" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)

" jump to next error
nnoremap <leader>EN <Plug>(coc-diagnostic-next)
nnoremap <leader>EB <Plug>(coc-diagnostic-prev)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" ignore for ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|target\|dist\|build'

" ignore for telescope
if has('nvim')
    lua <<EOF
        require('telescope').setup{ defaults = { file_ignore_patterns = {".git", "node_modules", "dist", "build", "DS_Store"} } }
EOF
endif

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
  else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" transparent vim toggle bind
nnoremap <leader>tt :TransparentToggle<cr>

" prettier format bind
nnoremap <leader>P :PrettierAsync<cr>

" binds for swapping buffers
nnoremap gT :bp<cr>
nnoremap gt :bn<cr>
nnoremap <leader>h :wincmd h<cr> 
nnoremap <leader>j :wincmd j<cr> 
nnoremap <leader>k :wincmd k<cr> 
nnoremap <leader>l :wincmd l<cr> 

" format clojure
nnoremap <leader>F :AsyncRun! lein cljfmt fix<cr><cr>

