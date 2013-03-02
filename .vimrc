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

set bg=dark
syn on

set expandtab
set tabstop=4
set shiftwidth=4

set number
