" unuse swap file
set noswapfile
" display line and row
set ruler
" cursorline
set cursorline
" command height
set cmdheight=2
" show file info on title bar
set title
" activate completion in cmd mode
set wildmenu
" show command
set showcmd
" smartcase
set smartcase
" highlight
set hlsearch
" tab to spase
set expandtab
" set incremental search
set incsearch
" set hidden
set hidden
" show invisible character
set list
" show line number
set number
" show relative line number
set relativenumber
" show match braket
set showmatch
" set autoindent
set autoindent
" set smart indent
set smartindent
" set tabstop to t
set tabstop=2
" set shift width to 2
set shiftwidth=2
" set soft tabstop 2
set softtabstop=2
" set smart tab
set smarttab
" allow specified keys that move the cursor
set whichwrap=b,s,h,l,<,>,[,],~
" no wrap around
set nowrap
" open new window on the rignth
set splitright
" open new window below 
set splitbelow
" set noequalalways
set noequalalways

if has('nvim')
  set clipboard+=unnamedplus
  if has('mouse')
    set mouse=
  endif
else
  set clipboard+=unnamed,autoselect
endif

if has('unix')
  autocmd MyAutoCmd ColorScheme * hi SpecialKey ctermfg=darkmagenta ctermbg=none
else
  autocmd MyAutoCmd ColorScheme * hi SpecialKey ctermfg=darkmagenta
endif

set list listchars=tab:¦_
" highlighting zenkaku space
autocmd MyAutoCmd BufRead,BufNew * match Error /　/
" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste
