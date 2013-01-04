set nocompatible

" Pathogen
call pathogen#infect()

" Tabs & indentation
set expandtab
set smarttab
set shiftwidth=4
set autoindent

set textwidth=78
set colorcolumn=81

" UI
set laststatus=2
set visualbell

let mapleader = ","
let maplocalleader = ","

" allow hidden buffers
set hidden
" set autowriteall
" autocmd FocusLost * :update

set linebreak
nnoremap k gk
nnoremap j gj
set display=lastline    "show beginning of long last line
set scrolloff=3         "keep 3 lines on edges
set shortmess=I         "don't display intro message
nnoremap <leader>q gqip
set formatoptions+=1

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
syntax on
filetype plugin indent on
let filetype_sql = "mysql"
autocmd FileType html,xhtml,xml,xsl setlocal shiftwidth=2
autocmd FileType html,xhtml,xml,php source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
autocmd FileType make setlocal noexpandtab nosmarttab
let python_highlight_all = 1

au FileType tex setlocal shiftwidth=2 spell

" Language settings ==========================================================

" Spell settings
set spelllang=sk
set spellsuggest=fast,14

" By default use Slovak mapping
set keymap=slovak-querty
" but make it inactive
set iminsert=0
set imsearch=0

" GUI ========================================================================
if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono\ 10
    set guioptions-=T   "disable toolbar
    set number          "show line numbers
    set columns=84      "to make space for line numbers
    set lines=64        "make default window higher
    "Colors
    "set cursorline
    let g:molokai_original=1
    let g:mayansmoke_cursor_line_visibility = 1
    let g:solarized_contrast="high"
    colorscheme solarized
    call togglebg#map("")
endif
