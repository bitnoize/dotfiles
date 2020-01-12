" define plugins to load
call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'thaerkh/vim-workspace'
Plug 'gcmt/taboo.vim'
Plug 'powerman/vim-plugin-viewdoc'
Plug 'mileszs/ack.vim'
call plug#end()

syntax on

""" Coloring
color delek
set background=dark

filetype plugin indent on
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
set ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set wrap breakindent
set encoding=utf-8
set ruler number
set title
set autoread autowrite
set showtabline=2
set laststatus=2

nnoremap <leader>s :ToggleWorkspace<CR>

map <C-n> :tabnew<CR>
map <C-x> :tabclose<CR>
map <C-o> :NERDTreeToggle<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
