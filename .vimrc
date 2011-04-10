set nocompatible

" Tabs & indentation
set expandtab
set smarttab
set shiftwidth=4
set autoindent

" UI
set laststatus=2
set visualbell

let mapleader = ","
let maplocalleader = ","

set linebreak
map <Up> gk
map <Down> gj

set wildmenu
set wildignore+=*.pyc,*.pyo,*.hi,*.o " Programming
set wildignore+=*.aux,*.dvi,*.pdf,*.log,*.out,*.bbl,*.blg " LaTeX

" Display white spaces with F12
set lcs=trail:·,tab:»-,nbsp:°
map <F12> :set list!<CR>

set makeprg=~/bin/build.sh\ %
map <F8> :make<cr>

set pastetoggle=<F3>
" Paste from X clipboard
imap <S-Ins> <Esc>"+pa
map <S-Ins> "+p

" Filetypes ==================================================================
syntax on
filetype plugin on
filetype plugin indent on
let filetype_asm = "nasm"
let filetype_sql = "mysql"
autocmd BufRead *.thtml setlocal filetype=php
autocmd BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType html,xhtml,xml,php source ~/.vim/scripts/closetag.vim
autocmd FileType make setlocal noexpandtab nosmarttab
let python_highlight_all = 1

au FileType tex setlocal textwidth=78
au FileType tex setlocal shiftwidth=2
au FileType tex setlocal spell

" Language settings ==========================================================

" Spell settings
set spelllang=sk
set spellsuggest=fast,14

" Keymaps switching
function! SwitchKeymap ()
    if &keymap =~ 'russian'
        set keymap=slovak-querty
    else
        set keymap=russian-yazherty
    endif
endfunction
" Alt-^
imap <M-6> <Esc>:call SwitchKeymap ()<CR>a

" By default use Slovak mapping
set keymap=slovak-querty
" but make it inactive
set iminsert=0
set imsearch=0
