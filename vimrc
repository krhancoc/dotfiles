syntax on

set clipboard=unnamed
set clipboard=unnamedplus
set term=screen-256color
set visualbell

set nocompatible
set hidden
set visualbell

" Automatic indentation rules
set autoindent
set autoread
filetype plugin indent on
set smarttab
"set expandtab
set tabstop=8
set softtabstop=4
set shiftround
set shiftwidth=4
set backspace=indent,eol,start
set encoding=utf-8
"set formatoptions=tcqor
set formatoptions=tcqoraw

" Fuzzing Searching
set path+=**
set wildmenu

" Visible Tabs
set list
set listchars=tab:>-
set hlsearch
set ignorecase
set incsearch
set ruler
set number
set showcmd

" Jumping
command! MakeTags !exctags -R --exclude=build
let $MANSECT = "2:3:4:9:1:8:n:5:6:7:l"

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir':'~/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'powerman/vim-plugin-viewdoc'
call plug#end()

" Per-terminal settings
"set t_Co=256
"set background=light
colorscheme PaperColor

if (v:version > 700)
    set spelllang=en_us
endif

" Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" NERDTree
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '+'
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ViewDoc
let g:viewdoc_open='vnew'

" Bind spellcheck to F10
nmap <silent> <F10> :silent set spell!<CR>
imap <silent> <F10> <C-O>:silent set spell!<CR>

" Mouse Wheel Support
map <MouseDown> 12<C-U>
map <MouseUp> 12<C-E>

" File Type
autocmd BufReadPre SConstruct set filetype=python
autocmd BufReadPre SConscript set filetype=python
autocmd BufReadPre *.sc set filetype=python
autocmd BufReadCmd *.tbz call tar#Browse(expand("<amatch>"))
autocmd BufRead,BufNewFile *.ll set filetype=llvm
autocmd BufRead,BufNewFile *.llx set filetype=llvm
autocmd BufRead,BufNewFile *.td set filetype=tablegen
autocmd BufRead,BufNewFile *.etch set filetype=etch
autocmd BufRead,BufNewFile *.log set filetype=liblog


" Buffer switching 
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" Go Bindings
map god :GoDoc<cr>
map gob :GoBuild<cr>
map gol :GoLint<cr>
map got :GoTest<cr>
map gor :GoRun<cr>

"CoC
map cd <Plug>(coc-definition)
map ct <Plug>(coc-type-definition)
map ci <Plug>(coc-implementation)
map cr <Plug>(coc-references)
map rn <Plug>(coc-rename)

map <C-p> :Files<CR>
map <C-o> :Rg<CR>

let g:fzf_layout = { 'down': '~20%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

source ~/.vim/freebsd.vim
