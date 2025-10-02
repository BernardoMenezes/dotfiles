" ===============================
" Basics
" ===============================
set nocompatible
syntax on
filetype plugin indent on

" ===============================
" Plugins (vim-plug)
" ===============================
call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" Statusline (works in Vim, not Lua-based)
Plug 'itchyny/lightline.vim'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" ===============================
" Colors & UI
" ===============================
if has('termguicolors')
  set termguicolors
endif
set background=dark
try
  colorscheme gruvbox
catch
  colorscheme desert
endtry

set number
set cursorline
set ruler
set laststatus=2

" ===============================
" Editing
" ===============================
set expandtab
set shiftwidth=2
set tabstop=2
set smartindent
set nowrap

" ===============================
" Search
" ===============================
set ignorecase
set smartcase
set incsearch
set hlsearch

" ===============================
" Clipboard & Mouse
" ===============================
set clipboard=unnamedplus
set mouse=a

" ===============================
" Lightline config (statusline)
" ===============================
let g:lightline = { 'colorscheme': 'gruvbox' }
