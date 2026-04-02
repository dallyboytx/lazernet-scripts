" ~/.vimrc — lazernet standard vim config
" Part of dallyboytx/lazernet-scripts

set number
set tabstop=4
set shiftwidth=4
set expandtab
syntax on

set cursorline
set cursorcolumn
highlight CursorLine cterm=NONE ctermbg=darkred guibg=#444444
highlight CursorColumn ctermbg=8 guibg=#333333

" Only highlight in active buffer (performance fix for large files)
autocmd BufWinLeave * set nocursorline nocursorcolumn
autocmd BufWinEnter * set cursorline cursorcolumn

set hlsearch
set incsearch
set ignorecase
set smartcase

set backspace=indent,eol,start
set ruler
set showcmd
set wildmenu
