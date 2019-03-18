" dotfiles/vimrc

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'gcmt/taboo.vim'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdtree'
Plugin 'jamessan/vim-gnupg'
Plugin 'hotchpotch/perldoc-vim'

call vundle#end()
filetype plugin indent on

set magic               " For regular expressions turn magic on

set history=700         " Sets how many lines of history VIM has to remember

set autoread            " Set to auto read when a file is changed from the outside

set so=2                " Set 2 lines to the cursor - when moving vertically 

set wildmenu            " Turn on the WiLd menu
set wildignore=*.o,*~

set ruler               " Always show current position

set number              " Show line numbers

set showtabline=2
set laststatus=2        " Always show the status line

set cmdheight=1         " Height of the command bar

set hid                 " A buffer becomes hidden when it is abandoned

set ignorecase          " Ignore case when searching
set smartcase           " When searching try to be smart about cases 
set hlsearch            " Highlight search results
"set incsearch          " Makes search act like search in modern browsers

set lazyredraw          " Don't redraw while executing macros

set showmatch           " Show matching brackets when text indicator is over them
set mat=2               " How many tenths of a second to blink when matching brackets

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable           " Enable syntax highlighting

colorscheme slate
set background=dark

set encoding=utf8       " Set utf8 as standard encoding

" Turn backup off, since most stuff is in git anyway...
set nobackup
set nowb
set noswapfile

set expandtab
set smarttab
set shiftwidth=2
set autoindent
set tabstop=2

set ai                  " Auto indent
set si                  " Smart indent
set wrap                " Wrap lines

" Remember info about open buffers on close
"set viminfo^=%

set sessionoptions+=tabpages,globals

map <C-n> :tabnew<CR>
map <C-x> :tabclose<CR>

nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

let NERDTreeQuitOnOpen = 1
map <C-o> :NERDTreeToggle<CR>

