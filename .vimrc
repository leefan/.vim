set nocompatible

" Pathogen plugin manager
call pathogen#helptags()
call pathogen#infect()

" toggle highlighting search with F12
nnoremap <silent><F12> :set hls!<cr>
inoremap <silent><F12> <Esc>:set hls!<cr>a
nnoremap <silent>n :set hls<cr>n
nnoremap <silent>N :set hls<cr>N
nnoremap <silent>* :set hls<cr>*
nnoremap <silent># :set hls<cr>#
nnoremap <silent>/ :set hls<cr>/
nnoremap <silent>? :set hls<cr>?

" toggle rainbow parenthesis with F11
nnoremap <silent><F11> :RainbowParenthesesToggle<cr>
inoremap <silent><F11> <Esc>:RainbowParenthesesToggle<cr>a

" Disable Help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Basic Options
set shell=bash
set bg=dark
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set backspace=indent,eol,start
set number
set showmatch
set ignorecase
set smartcase
set incsearch
set title
set showmode
set showcmd
set hidden
set wildmenu
set visualbell
set ttyfast
set ruler
set laststatus=2
set wildmode=list:longest
set autoindent
set fdm=indent

" relativenumbers
autocmd FocusLost * :set norelativenumber
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" syntax
filetype plugin indent on
syntax on

" Control
nnoremap j gj
nnoremap k gk

" sudo and save with w!!
cmap w!! w !sudo tee % >/dev/null

" Bundle Settings
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
