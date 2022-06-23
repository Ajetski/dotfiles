call plug#begin('~/.vim/plugged')
    " File Viewer
    Plug 'scrooloose/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    "Plug 'ryanoasis/vim-devicons' " disable for git-bash (no emoji support)

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

	" git wrapper
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'

    " status bar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" theme
	Plug 'ghifarit53/tokyonight-vim'
	Plug 'EdenEast/nightfox.nvim'
	Plug 'tribela/vim-transparent'
	Plug 'junegunn/goyo.vim' 
	Plug 'arcticicestudio/nord-vim'
	Plug 'dylanaraps/wal'

	" editing extensions
	Plug 'skywind3000/asyncrun.vim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/nvim-treesitter-textobjects'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'preservim/nerdcommenter'
	Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
	Plug 'guns/vim-sexp'
	Plug 'tpope/vim-sexp-mappings-for-regular-people'
	Plug 'tpope/vim-dispatch'
	Plug 'radenling/vim-dispatch-neovim'
	Plug 'clojure-vim/vim-jack-in'
	Plug 'luochen1990/rainbow'
	Plug 'jiangmiao/auto-pairs'

    " language support
    Plug 'sheerun/vim-polyglot'
    Plug 'jparise/vim-graphql'
	Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
    Plug 'evanleck/vim-svelte'
    Plug 'pangloss/vim-javascript'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'pantharshit00/vim-prisma'
	Plug 'Olical/conjure'
	Plug 'tpope/vim-fireplace'

    " fuzzy file finder
    Plug 'kien/ctrlp.vim'
call plug#end()

" airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme='night_owl'
let g:airline_section_y = '%{strftime("%H:%M")}'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#whitespace#enabled = 0


if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

" Enable rainbow parens
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'


" ctrlp settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build\|dist\|target'

" telescope settings
lua << EOF
require('telescope').setup{ defaults = { file_ignore_patterns = {
    "node_modules",
    ".git",
    "build",
    "dist",
    "target"
} } }
EOF

