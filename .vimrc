set nocompatible
set t_Co=256

" Plugins
function! PackInit() abort
  packadd minpac
  call minpac#init()

  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('bling/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  call minpac#add('Yggdroot/indentLine')
  call minpac#add('mileszs/ack.vim')
  call minpac#add('luochen1990/rainbow')
  call minpac#add('mattn/emmet-vim')
  call minpac#add('sjl/gundo.vim')
  call minpac#add('christoomey/vim-tmux-navigator')
  call minpac#add('majutsushi/tagbar')
  call minpac#add('w0rp/ale')
  call minpac#add('junegunn/fzf.vim')

  " Version Control
  call minpac#add('mhinz/vim-signify')
  call minpac#add('ludovicchabant/vim-lawrencium')
  call minpac#add('tpope/vim-fugitive')

  " Language Support
  call minpac#add('pangloss/vim-javascript', {'type': 'opt'})
  call minpac#add('mxw/vim-jsx', {'type': 'opt'})
  call minpac#add('leafgarland/typescript-vim', {'type': 'opt'})
  call minpac#add('ianks/vim-tsx', {'type': 'opt'})
  call minpac#add('StanAngeloff/php.vim', {'type': 'opt'})
  call minpac#add('tpope/vim-git', {'type': 'opt'})
  call minpac#add('dag/vim-fish', {'type': 'opt'})
  call minpac#add('tmux-plugins/vim-tmux', {'type': 'opt'})
endfunction
command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

" Basic Options
set shell=bash                      " set internal shell to bash
set expandtab                       " inserts space characters instead of tab
set tabstop=2                       " show tab as 4 spaces
set shiftwidth=2                    " inserts 4 space characters for tab
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
set ttimeoutlen=0                   " remove key code delay
set pastetoggle=<F2>                " paste toggling

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

if executable('rg')
    set grepprg=rg\ --color=never
elseif executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif

if exists('+fdm')
set fdm=syntax                      " set folding to base off of syntax
endif

" Relative Numbering
if exists('+relativenumber')
    set relativenumber
    augroup relativeNumber
        autocmd!
        autocmd FocusLost * :set norelativenumber
        autocmd FocusGained * :set relativenumber
        autocmd InsertEnter * :set norelativenumber
        autocmd InsertLeave * :set relativenumber
    augroup END
endif

" Syntax
filetype plugin indent on
let g:php_folding=2
syntax on
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction
augroup syntaxLazyLoad
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
  autocmd FileType php packadd php.vim
  autocmd FileType fish packadd vim-fish
  autocmd FileType tmux packadd vim-tmux
  autocmd FileType git packadd vim-git
  autocmd FileType javascript packadd vim-javascript
  autocmd FileType javascript packadd vim-jsx
  autocmd FileType typescript packadd typescript-vim
  autocmd FileType typescript packadd vim-tsx
augroup END

" Color and Styling Options
colorscheme ron
hi Pmenu ctermfg=14 ctermbg=8 guifg=#ffffff guibg=#0000ff
hi LineNr ctermfg=246 ctermbg=234
hi SignColumn ctermbg=234
hi VertSplit ctermbg=67 ctermfg=67
set fillchars+=vert:\  " space character
function! ClearCursorLine()
    hi clear CursorLine
    set cursorline
endfunction
function! SetCursorLineNr(ctermbg)
    execute 'hi CursorLineNr cterm=bold ctermfg=0 ctermbg='.a:ctermbg
    call ClearCursorLine()
endfunction

" Control
nnoremap j gj
nnoremap k gk

" sudo and save with w!!
cmap w!! w !sudo tee % >/dev/null


"""""""""""""""""""
" Plugin Settings "
"""""""""""""""""""

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#ale#enabled = 1

" ale
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_linters_ignore = { 'javascript': ['eslint'], 'typescript': ['eslint'] }
hi ALEError ctermbg=88

" ack.vim
if executable('rg')
    let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" emmet-vim
let g:user_emmet_settings = { 'tsx' : { 'extends' : 'jsx' } }

" fzf.vim
if executable('fzf')
  set rtp+=/usr/local/opt/fzf
endif

" indentLine
let g:indentLine_enabled = 0
nnoremap <silent><F10> :IndentLinesToggle<cr>
inoremap <silent><F10> <Esc>:IndentLinesToggle<cr>a

" rainbow
let g:rainbow_active = 0
nnoremap <silent><F11> :RainbowToggle<cr>
inoremap <silent><F11> <Esc>:RainbowToggle<cr>a

" gundo.vim
nnoremap <F5> :GundoToggle<CR>
inoremap <F5> <Esc>:GundoToggle<CR>

" vim-signify
let g:signify_vcs_list = ['git', 'hg']

" tagbar
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""
" Post-load Plugin Settings "
"""""""""""""""""""""""""""""
packloadall

" vim-airline-themes
let g:airline_theme='molokai'
call SetCursorLineNr(g:airline#themes#molokai#palette['normal']['airline_z'][3])
augroup modecolor
    autocmd!
    autocmd InsertEnter * :call SetCursorLineNr(g:airline#themes#molokai#palette['insert']['airline_z'][3])
    autocmd InsertLeave * :call SetCursorLineNr(g:airline#themes#molokai#palette['normal']['airline_z'][3])
augroup END
