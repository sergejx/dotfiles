call plug#begin()
" Editing
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" UI and apps
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'mrtazz/simplenote.vim'
Plug 'bling/vim-airline'
" File types
Plug 'tpope/vim-markdown'
"Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'lervag/vimtex'
Plug 'django.vim'
Plug 'ap/vim-css-color'
Plug 'groenewege/vim-less'
Plug 'vitalk/vim-lesscss'  "Autocompiling LESS files
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

" " Formatting
" nnoremap <leader>q gqip

" Search
set smartcase
set gdefault

" Wild
set wildignore+=*.pyc,*.pyo,*.hi,*.o " Programming
set wildignore+=*.aux,*.dvi,*.pdf,*.log,*.out,*.bbl,*.blg,*.fdb_latexmk,*.fls,*.synctex.gz " LaTeX

" Paste from X clipboard
" imap <S-Ins> <Esc>"+pa
" map <S-Ins> "+p

" Filetypes ==================================================================
autocmd FileType html,xhtml,xml,xsl,htmldjango setlocal shiftwidth=2
" autocmd FileType html,xhtml,xml,php source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
autocmd FileType make setlocal noexpandtab nosmarttab
let python_highlight_all = 1
au FileType tex setlocal shiftwidth=2 spell
let g:tex_flavor = 'latex'
" let g:vimtex_fold_enabled=0
let g:vimtex_quickfix_open_on_warning=0

" Language settings ==========================================================

" Spell settings
set spelllang=en
set spellsuggest=12

" By default use Slovak mapping
set keymap=slovak-querty
" but make it inactive
set iminsert=0
set imsearch=0
" imap <leader>s <Esc>:set keymap=slovak-querty<CR>:set iminsert=1<CR>a
" imap <leader>e <Esc>:set iminsert=0<CR>a

" SimpleNote settings
nnoremap <Leader>sn :Simplenote -l<cr>
source ~/.vim/simplenoterc

" GUI ========================================================================
set background=dark     " dark background in terminal
colorscheme solarized
if has("gui_running")
    set background=light
    " let g:PaperColor_Light_Override = { 'background' : '#fffff3' }
    set guifont=Fira\ Mono\ Medium\ 10
    let g:airline_detect_iminsert=1
    set guioptions=aegi " disable toolbar, menu and scrollbars
    set lines=54        " make default window higher
    set columns=83      " make space for line numbers
    set number
endif
