" Basic setup
set nocompatible
call pathogen#infect()
syntax on
filetype plugin indent on

" Tabs & indentation
set expandtab           "Use spaces
set shiftwidth=4        "4 spaces for indentation (but keep tabwidth)
set smarttab            "Use shiftwidth in the beginning of line
set autoindent

set visualbell

let mapleader = ","
let maplocalleader = ","

set hidden              " allow hidden buffers

set linebreak           "Visually wrap lines
nnoremap k gk
nnoremap j gj
set display=lastline    "Show beginning of long last line
set scrolloff=3         "Keep 3 lines on edges
set shortmess=I         "Don't display intro message

"set textwidth=78        "Set standard line length
" set formatoptions+=1    "but don't break lines automatically
" nnoremap <leader>q gqip

set wildmenu
set wildignore+=*.pyc,*.pyo,*.hi,*.o " Programming
set wildignore+=*.aux,*.dvi,*.pdf,*.log,*.out,*.bbl,*.blg,*.fdb_latexmk " LaTeX

" Display white spaces with F12
set lcs=trail:·,tab:▸\ ,nbsp:°
map <F12> :set list!<CR>

set makeprg=~/.local/bin/build.sh\ %
map <F8> :make<cr>

set pastetoggle=<F3>
" Paste from X clipboard
imap <S-Ins> <Esc>"+pa
map <S-Ins> "+p

" Filetypes ==================================================================
let filetype_sql = "mysql"
autocmd FileType html,xhtml,xml,xsl setlocal shiftwidth=2
autocmd FileType html,xhtml,xml,php source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
autocmd FileType make setlocal noexpandtab nosmarttab
let python_highlight_all = 1

au FileType tex setlocal shiftwidth=2 spell

" Language settings ==========================================================

" Spell settings
set spelllang=sk
"set spellsuggest=fast,14

" By default use Slovak mapping
set keymap=slovak-querty
" but make it inactive
set iminsert=0
set imsearch=0

" GUI ========================================================================
set background=dark     "dark background in terminal
if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono\ 10
    set guioptions-=T   "disable toolbar
    set lines=64        "make default window higher
    "Colors
    set cursorline
    colorscheme forest
endif
