set nocompatible              " be iMproved, required
filetype off                  " required

" Commands {{{
function! InstallVipe(info)
  if a:info.status == 'installed' || a:info.force
    if has("unix")
      let s:uname = system("uname -s")
      if s:uname =~ "Darwin"
        silent !rm -f /usr/local/bin/vipe
        silent !ln -s `pwd`/vipe /usr/local/bin || true
      else
        silent !ln -s `pwd`/vipe ~/bin || true
      endif
    endif
  endif
endfunction

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'chase/vim-ansible-yaml'
Plug 'groenewege/vim-less'
Plug 'mxw/vim-jsx'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale.git'
Plug 'cocopon/iceberg.vim'
Plug 'tpope/vim-unimpaired'
Plug 'davidhalter/jedi-vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'udalov/kotlin-vim'
Plug 'sickill/vim-monokai'
Plug 'dag/vim-fish'
Plug 'blueyed/vim-diminactive'
Plug 'Elle518/Duna'
Plug 'fatih/vim-go'
Plug 'wakatime/vim-wakatime'
Plug 'flazz/vim-colorschemes'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'ekalinin/Dockerfile.vim'
Plug 'luan/vipe', { 'do': function('InstallVipe') }

"call vundle#end()            " required
call plug#end()

filetype plugin indent on    " required

set nocompatible
filetype off

let &runtimepath.=',~/.vim/plugged/ale'

filetype plugin on

" NerdTree
let NERDTreeIgnore = ['\.pyc$']
" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" " Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

map <C-n> :NERDTreeToggle<CR>
nmap <C-t> :TagbarToggle<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" no backup
set nobackup
set noswapfile

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set ttyfast

autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

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

nnoremap F5 :so $MYVIMRC<CR>

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

autocmd BufWritePre * :%s/\s\+$//e
set pastetoggle=<F3>

set t_Co=256
" colorscheme Monokai
" colorscheme iceberg
" colorscheme seoul256
" colorscheme minimalist
" colorscheme hybrid
" colorscheme gruvbox
colorscheme hybrid_material
highlight ColorColumn ctermbg=4

let mapleader=","

map <C-a> :!cat %<CR>
map <Leader>t :Vipe<CR>

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '⚠'
let g:ale_sign_warning = '⨉'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|(node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

hi User1                      ctermfg=4          guifg=#40ffff            " Identifier
hi User2                      ctermfg=2 gui=bold guifg=#ffff60            " Statement
hi User3 term=bold cterm=bold ctermfg=1          guifg=White   guibg=Red  " Error
hi User4                      ctermfg=1          guifg=Orange             " Special
hi User5                      ctermfg=10         guifg=#80a0ff            " Comment
hi User6 term=bold cterm=bold ctermfg=1          guifg=Red                " WarningMsg

set statusline =
set statusline +=%5*%{expand('%:h')}                " relative path to file's directory
set statusline +=/
set statusline +=%1*%t%*                            " file name
set statusline +=%m                                 " modified flag
set statusline +=%1*\ %6*%{fugitive#statusline()}   " git branch
set statusline +=%=                                 " switch to RHS
set statusline +=%5*%L\ lines%*                     " number of lines

set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256

" let g:jedi#use_splits_not_buffers = "right"
let g:jedi#use_tabs_not_buffers = 1

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>G"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:virtualenv_auto_activate = 1

highlight ColorColumn ctermbg=0 guibg=#eee8d5

au FileType go nmap gd <Plug>(go-def-split)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

autocmd BufRead,BufNewFile   *.tmpl set noexpandtab

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
