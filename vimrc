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
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'mileszs/ack.vim'
    Plug 'junegunn/vim-peekaboo'
    " Look & feel
    Plug 'cormacrelf/vim-colors-github'
    Plug 'vim-airline/vim-airline'
    " File types
    Plug 'plasticboy/vim-markdown'
    Plug 'lervag/vimtex', {'for': 'tex'}
    Plug 'peder2tm/sved'
    Plug 'vim-scripts/django.vim'
    Plug 'lepture/vim-jinja'
    Plug 'ap/vim-css-color'
call plug#end()
" ===========================================================================

" Basic behaviour modifications
set hidden          " Allow hidden buffers
set linebreak       " Visually wrap lines
set breakindent     " and repeat indentation level
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
" Switch spell language
nnoremap <F2> :set spelllang=sk<cr>
nnoremap <C-F2> :set spelllang=en<cr>
" Disable highlighting
nnoremap <F3> :nohlsearch<CR>
" Make
nnoremap <F8> :make<CR>
" Close quickfix window
nnoremap <F9> :cclose<CR>

" Telescope
nmap <Leader>f <cmd>Telescope find_files<cr>
nmap ; <cmd>Telescope buffers<cr>

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
" set langmap=ľščťžýáíé;234567890,úä;[],юЮ;`~,ёЁъЪ;#$%^,чЧ;=+,яжертыуиопшщ;qwertyuiop[],асдфгхйкл;asdfghjkl,зьцвбнм;zxcvbnm
set langmap=юЮ;`~,ёЁъЪ;#$%^,чЧ;=+,яжертыуиопшщ;qwertyuiop[],ЯЖЕРТЫУИОПШЩ;QWERTYUIOP{},асдфгхйкл;asdfghjkl,АСДФГХЙКЛ;ASDFGHJKL,зьцвбнм;zxcvbnm,ЗЬЦВБНМ;ZXCVBNM
map ú [
map ä ]
map ш [
map щ ]

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit'
    \]

" Filetypes =================================================================
" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'aspectj=aj']

" HTML & XML
autocmd FileType html,xhtml,xml,xsl,htmldjango setlocal shiftwidth=2
" YAML
autocmd FileType yaml setlocal shiftwidth=2
" Makefiles
autocmd FileType make setlocal noexpandtab
" Python
let python_highlight_all = 1
" LaTeX
au FileType tex setlocal shiftwidth=2 spell
let g:tex_flavor = 'latex'

" Markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

" Ignored files
set wildignore+=*.pyc,*.pyo,*.hi,*.o " Programming
set wildignore+=*.aux,*.dvi,*.pdf,*.log,*.out,*.bbl,*.blg,*.fdb_latexmk,*.fls,*.synctex.gz " LaTeX

" User Interface ============================================================
set visualbell                  " Don't beep
if (has("termguicolors"))
    set termguicolors
endif
set background=light            " Light theme
let g:github_colors_block_diffmark=1
colorscheme github
highlight link mkdBlockquote Special
set cursorline
" Netrw
let g:netrw_liststyle=3
let g:netrw_fastbrowse=0
" Vim Airline
let g:airline#extensions#whitespace#enabled = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#branch#enabled = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.spell = '✓'
let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.branch = '⎇'
set noshowmode                  " No need for default mode indicator
