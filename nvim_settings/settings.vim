" SETTINGS
filetype indent plugin on
syntax on
set termguicolors
set background=dark
set guicursor=""
colorscheme retrobox

set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0

set autochdir
set breakindent
set clipboard=unnamedplus
set copyindent

" set listchars=tab:>~,nbsp:_,trail:.
" set list

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%80v', 100)
" set colorcolumn=80

set cursorline
set cursorlineopt=both
set completeopt=menuone,preview
set expandtab
set foldlevel=1
set nohlsearch
set ignorecase
set number
set laststatus=2
set lazyredraw

if has('mouse')
  set mouse=a
endif

set path+=**
set noruler
set relativenumber
set scrolloff=5
set shortmess=aoOstT
set showmatch
set showmode
set smartcase
set smartindent
set statusline=
set statusline=(%n)\ %F\ %h%m%r%=%-14.(%c%V,%L%)\ %p%%\ %P\ %f\ |
" set statusline=(%n)\ %f\ [%Y]\ \ \ \ %c:%L\ \ \ \ (%p%%\ %P)\ %f\ |
set updatetime=50
set nowrap
set wildmode=list:longest,full

let &undodir=expand('~/.local/state/nvim/undo')
let &directory=expand('~/.local/state/nvim/swap')
let &backupdir=expand('~/.local/state/nvim/backup')
set noundofile
set nobackup
set noswapfile

let g:python3_host_prog = '/usr/bin/python3'
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_winsize=20
let g:loaded_perl_provider=0

let mapleader=" "
let maplocalleader="\\"
