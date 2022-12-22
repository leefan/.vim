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
  call minpac#add('luochen1990/rainbow')
  call minpac#add('mattn/emmet-vim')
  call minpac#add('simnalamburt/vim-mundo')
  call minpac#add('christoomey/vim-tmux-navigator')
  call minpac#add('majutsushi/tagbar')
  call minpac#add('w0rp/ale')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('junegunn/fzf')

  " Version Control
  call minpac#add('mhinz/vim-signify')
  call minpac#add('ludovicchabant/vim-lawrencium')
  call minpac#add('tpope/vim-fugitive')

  " Language Support
  call minpac#add('pangloss/vim-javascript', {'type': 'opt'})
  call minpac#add('mxw/vim-jsx', {'type': 'opt'})
  call minpac#add('leafgarland/typescript-vim')
  call minpac#add('ianks/vim-tsx', {'type': 'opt'})
  call minpac#add('StanAngeloff/php.vim', {'type': 'opt'})
  call minpac#add('tpope/vim-git', {'type': 'opt'})
  call minpac#add('dag/vim-fish')
  call minpac#add('tmux-plugins/vim-tmux', {'type': 'opt'})
  call minpac#add('jparise/vim-graphql')
endfunction
command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

" Basic Options
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
set undofile                        " persistent undo history across vim sessions
set undodir=~/.vim/undo             " setting undo history file

if exists('+fdm')
set fdm=syntax                      " set folding to base off of syntax
endif

if executable('rg')
    set grepprg=rg\ --color=never
elseif executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif

if executable('fish')
  set shell=fish
else
  set shell=bash
endif

" toggle highlighting search with F12
nnoremap <silent><F12> :set hls!<cr>
inoremap <silent><F12> <Esc>:set hls!<cr>a
nnoremap <silent>n :set hls<cr>n
nnoremap <silent>N :set hls<cr>N
nnoremap <silent>* :set hls<cr>*
nnoremap <silent># :set hls<cr>#
nnoremap <silent>/ :set hls<cr>/
nnoremap <silent>? :set hls<cr>?

" completion settings
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Disable Help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

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
  autocmd FileType tmux packadd vim-tmux
  autocmd FileType git packadd vim-git
  autocmd FileType javascript packadd vim-javascript
  autocmd FileType javascript packadd vim-jsx
  autocmd FileType typescript packadd vim-tsx
augroup END

" Color and Styling Options
colorscheme slate
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
let g:ale_fixers = { 'javascript': ['prettier'], 'typescript': ['prettier'] }
let g:ale_fix_on_save = 1
hi ALEError ctermbg=88
nnoremap <C-g>g :ALEGoToDefinition<cr>
nnoremap <C-g>t :ALEGoToDefinitionInTab<cr>
nnoremap <C-g>s :ALEGoToDefinitionInSplit<cr>
nnoremap <C-g>v :ALEGoToDefinitionInVSplit<cr>
inoremap <C-g>g <Esc>:ALEGoToDefinition<cr>
inoremap <C-g>t <Esc>:ALEGoToDefinitionInTab<cr>
inoremap <C-g>s <Esc>:ALEGoToDefinitionInSplit<cr>
inoremap <C-g>v <Esc>:ALEGoToDefinitionInVSplit<cr>

" emmet-vim
let g:user_emmet_settings = { 'tsx' : { 'extends' : 'jsx' } }

" fzf.vim
if executable('fzf')
  set rtp+=/usr/local/opt/fzf
endif
nnoremap <C-p>p :Files<cr>
nnoremap <C-p>g :GFiles<cr>
nnoremap <C-p>r :Rg<cr>
nnoremap <C-p>b :Buffers<cr>
nnoremap <C-p>l :BLines<cr>
nnoremap <C-p>/ :Lines<cr>
imap <c-f> <plug>(fzf-complete-path)
imap <c-j> <plug>(fzf-complete-file-ag)
imap <c-l> <plug>(fzf-complete-line)

" indentLine
let g:indentLine_enabled = 0
nnoremap <silent><F10> :IndentLinesToggle<cr>
inoremap <silent><F10> <Esc>:IndentLinesToggle<cr>a

" rainbow
let g:rainbow_active = 0
nnoremap <silent><F11> :RainbowToggle<cr>
inoremap <silent><F11> <Esc>:RainbowToggle<cr>a

" gundo.vim
nnoremap <F1> :MundoToggle<CR>
inoremap <F1> <Esc>:MundoToggle<CR>

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
