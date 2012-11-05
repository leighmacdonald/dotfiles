" Tab key produces 4 spaces, and tab characters are converted to spaces
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
" when you start searching text with /, search is performed at every new character insertion
set incsearch
set nopaste
set autoindent
set fileformats=unix,dos
" docblock comments are continued when a newline is inserted
set comments=sr:/*,mb:*,ex:*/
syntax on
filetype on
filetype plugin on
" check syntax with Ctrl + L
autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
autocmd FileType phtml noremap <C-L> :!/usr/bin/env php -l %<CR>

:nnoremap <F5> :buffers<CR>:buffer<Space>
:set number
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

:set t_Co=256
:colorscheme zenburn
let g:miniBufExplMapCTabSwitchWindows = 1
let g:miniBufExplUseSingleClick = 1
