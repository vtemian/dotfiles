set tabstop=2
set shiftwidth=2
set expandtab

set autoindent
set smarttab

set showmatch
set scrolloff=5
set autowrite

set list
set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮
set showbreak=↪\

set backspace=indent,eol,start  " backspace through everything in insert mode

syntax on
filetype on
filetype indent on
filetype plugin on

set nu
set ai
set history=1000

set ttyfast

" Highlight search matches
set hlsearch

set noequalalways
set splitbelow

" Open where I left off
set viminfo='1000,\"1000,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set nobackup
set nowritebackup
set noswapfile

let NERDTreeIgnore = ['\.pyc$']
map <C-n> :NERDTreeToggle<CR>

set ruler
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=80

set backspace=2
set backspace=indent,eol,start

" magic
call pathogen#infect()
