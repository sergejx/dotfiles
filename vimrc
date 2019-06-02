call plug#begin()
    " Editing
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'editorconfig/editorconfig-vim'
    " Utilities & tools
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-vinegar'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'qpkorr/vim-bufkill'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'mileszs/ack.vim'
    " Look & feel
    Plug 'rakr/vim-one'
    Plug 'nanotech/jellybeans.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " File types
    Plug 'lervag/vimtex'
    Plug 'peder2tm/sved'
    Plug 'vim-scripts/django.vim'
    Plug 'ap/vim-css-color'
    Plug 'groenewege/vim-less'
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
" Set terminal title
set title
" Always show gutter
set signcolumn=yes
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
" List spelling suggestion for slovak layout
nnoremap z- z=
" Switch spell language
nnoremap <F2> :set spelllang=sk<cr>
nnoremap <C-F2> :set spelllang=en<cr>
" Disable highlighting
nnoremap <F3> :nohlsearch<CR>
" CtrlP
nnoremap ; :CtrlPBuffer<cr>
" Bufkill
nnoremap <esc>w :BD<cr>
" Make
nnoremap <F8> :make<CR>
" Close quickfix window
nnoremap <F9> :cclose<CR>
" Open terminal
nnoremap <silent> <F12> :call system("gnome-terminal &")<CR>

function! Evince_ForvardSearch()
   let l:pycmd = expand('~/.vim/plugged/sved/ftplugin/evinceSync.py')
   let l:cursorpos = getcurpos()
   let l:command = shellescape(l:pycmd) . " " . shellescape(b:vimtex.out()) . " " .
               \ l:cursorpos[1] . " " . l:cursorpos[2] . " " . shellescape(expand("%:p"))
   let l:output = system(l:command)
   echo l:output
endfunction

nnoremap <leader>lf :call Evince_ForvardSearch()<CR>

" Ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Slovak and russian keyboard support
set langmap=ľščťžýáíé;234567890,úä;[],юЮ;`~,ёЁъЪ;#$%^,чЧ;=+,яжертыуиопшщ;qwertyuiop[],асдфгхйкл;asdfghjkl,зьцвбнм;zxcvbnm
map ú [
map ä ]
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
set wildignore+=node_modules,output

" User Interface ============================================================
set visualbell                  " Don't beep
if (has("termguicolors"))
    set termguicolors
endif
set background=light            " Light theme
let g:one_allow_italics=1
colorscheme one
" Vim Airline
let g:airline#extensions#whitespace#enabled = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#enabled = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.spell = '✓'
let g:airline_symbols.maxlinenr = ''
set noshowmode                  " No need for default mode indicator

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

if has("gui_running")
    set guifont=Fira\ Mono\ 10
    set guioptions-=T       " Disable toolbar
    set guioptions-=m       " Disable menu
    set guioptions-=r       " Disable right scrollbar
    set guioptions-=L       " Disable left scrollbar
    set lines=42            " Make default window taller
    set columns=84          " and wider
    " Set dark window title
    autocmd GUIEnter * silent execute '!xprop -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT "dark" -id' v:windowid
endif
