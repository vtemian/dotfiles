set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'groenewege/vim-less'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/syntastic'
Plugin 'mileszs/ack.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tomasr/molokai'
Plugin 'sotte/presenting.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" NerdTree
map <C-n> :NERDTreeToggle<CR>
" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" " Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

" no backup
set nobackup
set noswapfile

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set ttyfast

set cursorline
set synmaxcol=800   " don't try to highlight long lines

set list
set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮
set showbreak=↪\

set backspace=indent,eol,start  " backspace through everything in insert mode

syntax on
filetype on
filetype indent on
filetype plugin on

set hlsearch
set nu
set ai
set history=1000

set noequalalways
set splitbelow

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<CR>

" Open where I left off
set viminfo='1000,\"1000,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set ruler
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=80

set backspace=2
set backspace=indent,eol,start

" w!! to write a file as sudo
" " stolen from Steve Losh
cmap w!! w !sudo tee % >/dev/null

let g:syntastic_python_python_exec = '/usr/bin/python'

set t_Co=256
colorscheme 256-jungle
highlight ColorColumn ctermbg=4
