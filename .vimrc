set nocompatible

filetype indent on

" Tabs & indentation
set expandtab
set smarttab
set shiftwidth=4
set autoindent

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

" Filetypes
syntax on
filetype plugin on
let filetype_asm = "nasm"
let filetype_sql = "mysql"
autocmd BufRead *.thtml setlocal filetype=php
autocmd BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType html,xhtml,xml,php source ~/.vim/scripts/closetag.vim
autocmd FileType make setlocal noexpandtab nosmarttab
let python_highlight_all = 1

" markdown filetype file
augroup markdown
    au! BufRead,BufNewFile *.markdown   setfiletype mkd
augroup END

" Omni completion
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c setlocal omnifunc=ccomplete#Complete

let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_GotoError=0
au FileType tex setlocal textwidth=78
au FileType tex setlocal shiftwidth=2
au FileType tex setlocal spell

set makeprg=~/bin/build.sh\ %
set visualbell
set pastetoggle=<F3>
" Paste from X clipboard
imap <S-Ins> <Esc>"+pa
map <S-Ins> "+p

" Spell settings
set spelllang=sk
set spellsuggest=fast,14

map <F8> :make<cr>
