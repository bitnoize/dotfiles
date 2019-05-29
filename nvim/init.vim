" define plugins to load
call plug#begin('~/.config/nvim/plugged')
Plug 'thaerkh/vim-workspace'
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
set number
set title

