call plug#begin()
    " Editing
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    " UI and apps
    Plug 'tpope/vim-eunuch'
    " File types
    Plug 'django.vim'
    Plug 'ap/vim-css-color'
    Plug 'groenewege/vim-less'
    Plug 'evanmiller/nginx-vim-syntax'
call plug#end()

" Tabs & indentation
set expandtab           "Use spaces
set shiftwidth=4        "4 spaces for indentation (but keep tabwidth)

set shortmess=I         "Don't display intro message
set visualbell
set hidden              " allow hidden buffers

let mapleader = ","
let maplocalleader = ","

" Lines
set linebreak           "Visually wrap lines
set breakindent         "and repeat indentation level
nnoremap k gk
nnoremap j gj

" set conceallevel=2

" Search
set smartcase
set gdefault

" Wild
set wildignore+=*.pyc,*.pyo,*.hi,*.o " Programming
set wildignore+=*.aux,*.dvi,*.pdf,*.log,*.out,*.bbl,*.blg,*.fdb_latexmk,*.fls,*.synctex.gz " LaTeX
set wildignore+=node_modules,bower_components

" Paste from X clipboard
imap <S-Ins> <C-r>+
map <S-Ins> "+p

" Open terminal
nnoremap <silent> <F12> :call system("gnome-terminal &")<CR>

" Filetypes ==================================================================
autocmd FileType html,xhtml,xml,xsl,htmldjango setlocal shiftwidth=2
autocmd FileType make setlocal noexpandtab nosmarttab
let python_highlight_all = 1
au FileType tex setlocal shiftwidth=2 spell
let g:tex_flavor = 'latex'

" Language settings ==========================================================

" Spell settings
set spelllang=en
set spellsuggest=12

nmap <F2> :set spelllang=sk<cr>
nmap <C-F2> :set spelllang=en<cr>

set langmap=´=

" GUI ========================================================================
set background=dark     " dark background in terminal

if has("gui_running")
    set background=light
    set guifont=Fira\ Mono\ 10
    set guioptions=aegi " disable toolbar, menu and scrollbars
    set lines=54        " make default window higher
    colorscheme solarized_hc
endif
