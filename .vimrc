set nocompatible
set t_Co=256

" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
let g:pathogen_disabled = []
if v:version < '703'
    call add(g:pathogen_disabled, 'vimshell.vim')
    call add(g:pathogen_disabled, 'gundo.vim')
endif
if v:version < '704'
    if !has('patch584')
        call add(g:pathogen_disabled, 'YouCompleteMe')
    endif
endif
if hostname() == 'leefan.com'
    call add(g:pathogen_disabled, 'YouCompleteMe')
endif
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

" Disable Help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

let mapleader=' '

" Basic Options
set shell=bash                      " set internal shell to bash
set bg=dark                         " use dark style
set expandtab                       " inserts space characters instead of tab
set tabstop=4                       " show tab as 4 spaces
set shiftwidth=4                    " inserts 4 space characters for tab
set smarttab                        " Use 'shiftwidth' to insert tabs, <BS> removes a tab's worth
set backspace=indent,eol,start      " allows backspacing over indent, line breaks, and start of inserts
set number                          " show line number
set showmatch                       " show matching bracket
set ignorecase                      " ignore case during search
set smartcase                       " override 'ignorecase' when an upper case character is in search pattern
set incsearch                       " search while typing
set title                           " set terminal title to 'titlestring' or filename
set showmode                        " indicate which mode vim is in at the bottom
set showcmd                         " show command at the bottom
set hidden                          " when buffer is abandoned make it hidden - basically, lets you switch the buffer without saving
set wildmenu                        " enhanced-mode for command line completion
set visualbell                      " use a visual bell instead of beeping
set ttyfast                         " indicates fast terminal connection. makes things smoother.
set ruler                           " show line and column number of cursor position in bottom right
set laststatus=2                    " show status menu for all windows
set wildmode=list:longest           " When more than one match with tab completion, list all matches and complete till longest common string
set autoindent                      " automatically indents. pretty straight forward

if exists('+fdm')
    set fdm=syntax                      " set folding to base off of syntax
endif

" Relative Numbering
if exists('+relativenumber')
    autocmd FocusLost * :set norelativenumber
    autocmd FocusGained * :set relativenumber
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
endif

" Paste mode toggling
if exists('+invpaste')
    map <F2> :set invpaste<cr>
endif

" Syntax
filetype plugin indent on
syntax on

" Color Options
highlight Pmenu ctermfg=14 ctermbg=8 guifg=#ffffff guibg=#0000ff

" Control
nnoremap j gj
nnoremap k gk
" autocmd CompleteDone * pclose   " close preview window when unnecessary

" sudo and save with w!!
cmap w!! w !sudo tee % >/dev/null


"""""""""""""""""""
" Bundle Settings "
"""""""""""""""""""

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1

" ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" ctrlp.vim
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" rainbow
let g:rainbow_active = 0
nnoremap <silent><F11> :RainbowToggle<cr>
inoremap <silent><F11> <Esc>:RainbowToggle<cr>a

" gundo.vim
nnoremap <F5> :GundoToggle<CR>
inoremap <F5> <Esc>:GundoToggle<CR>
