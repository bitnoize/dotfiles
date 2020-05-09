" define plugins to load
call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'thaerkh/vim-workspace'
Plug 'gcmt/taboo.vim'
Plug 'powerman/vim-plugin-viewdoc'
Plug 'mileszs/ack.vim'
Plug 'jamessan/vim-gnupg'
call plug#end()

filetype plugin indent on

syntax on
color slate

set encoding=utf-8
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set ignorecase
set smartcase
set hlsearch
set ruler
set laststatus=2
set showcmd
set showmode
set wrap
set breakindent
set number
set title
set autoread
set autowrite
set showtabline=2
set termguicolors
set background=dark

nnoremap <leader>s :ToggleWorkspace<CR>

map <C-n> :tabnew<CR>
map <C-x> :tabclose<CR>
map <C-o> :NERDTreeToggle<CR>

nnoremap < :tabprevious<CR>
nnoremap > :tabnext<CR>

