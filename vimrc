call plug#begin()
    " Editing
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'SirVer/ultisnips'
    " Utilities & tools
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-fugitive'
    Plug 'sjl/gundo.vim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'mileszs/ack.vim'
    " Look & feel
    Plug 'rakr/vim-one'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " File types
    Plug 'lervag/vimtex'
    Plug 'django.vim'
    Plug 'ap/vim-css-color'
    Plug 'groenewege/vim-less'
    Plug 'evanmiller/nginx-vim-syntax'
call plug#end()
" ===========================================================================

" Basic behaviour modifications
set hidden          " Allow hidden buffers
set linebreak       " Visually wrap lines
set breakindent     " and repeat indentation level
set conceallevel=2  " Hide or replace concealed text
set smartcase       " Smart case for search
set gdefault        " and 'g' by default
" Tabs & indentation
set expandtab       " Use spaces
set shiftwidth=4    " 4 spaces for indentation
set softtabstop=4   " and for softtabs (but keep tabwidth)
" Spelling
set spelllang=en    " English by default
set spellsuggest=12 " 12 suggestions is enough
" Helper files
set undofile        " Store undo history
set undodir^=$HOME/.cache/vim//
set directory^=$HOME/.cache/vim//
" Leader key
let mapleader = ","
let maplocalleader = ","

" Keyboard ==================================================================
" Move by visual lines
noremap k gk
noremap j gj
" Paste from X clipboard
noremap  <S-Ins> "+p
inoremap <S-Ins> <C-r>+
" CtrlP in MRU mode
nnoremap <C-N> :CtrlPMRU<CR>
" Switch spell language
nnoremap <F2> :set spelllang=sk<cr>
nnoremap <C-F2> :set spelllang=en<cr>
" Gundo
nnoremap <F5> :GundoToggle<CR>
" Make
nnoremap <F8> :make<CR>
" Open terminal
nnoremap <silent> <F12> :call system("gnome-terminal &")<CR>

" Slovak keyboard support
set langmap=ú[ä]
map ú [
map ä ]
" Russian phonetic keyboard support
set langmap=юЮ;`~,ёЁъЪ;#$%^,чЧ;=+,яжертыуиопшщ;qwertyuiop[],асдфгхйкл;asdfghjkl,зьцвбнм;zxcvbnm
map ш [
map щ ]

" Filetypes =================================================================
" HTML & XML
autocmd FileType html,xhtml,xml,xsl,htmldjango setlocal shiftwidth=2
" Makefiles
autocmd FileType make setlocal noexpandtab
" Python
let python_highlight_all = 1
" LaTeX
au FileType tex setlocal shiftwidth=2 spell
let g:tex_flavor = 'latex'

" Ignored files
set wildignore+=*.pyc,*.pyo,*.hi,*.o " Programming
set wildignore+=*.aux,*.dvi,*.pdf,*.log,*.out,*.bbl,*.blg,*.fdb_latexmk,*.fls,*.synctex.gz " LaTeX
set wildignore+=node_modules,bower_components

" User Interface ============================================================
set visualbell                  " Don't beep
set termguicolors               " Use full color palette even in terminal
set background=dark             " Dark theme for terminal
let g:one_allow_italics=1
colorscheme one
" Vim Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 0

if has("gui_running")
    set background=light    " Light colors in GUI
    set guifont=Source\ Code\ Pro\ 10
    set guioptions-=T       " Disable toolbar
    set guioptions-=m       " Disable menu
    set guioptions-=r       " Disable right scrollbar
    set guioptions-=L       " Disable left scrollbar
    set lines=38            " Make default window higher
endif
