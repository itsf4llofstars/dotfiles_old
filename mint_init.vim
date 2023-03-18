"" init.vim

filetype indent plugin on
syntax enable
set termguicolors
set guicursor=""

set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0
set expandtab
set nowrap

set number
set relativenumber
set smartindent
set ignorecase
set smartcase
set autochdir
set breakindent
set clipboard=unnamedplus
set colorcolumn=80
set copyindent
set cursorline
set cursorlineopt=both
set digraph
set foldcolumn=3
set foldlevel=0
set foldlevelstart=-1
set nohlsearch
set laststatus=2
set lazyredraw
set mouse=a
set scrolloff=8
set shortmess=aoOstTF
set showmatch
set sidescroll=8

set wildmode=list:longest,full
set completeopt=menuone,noinsert

set noundofile
set nobackup
set noswapfile

let mapleader=" "
let maplocalleader="\\"

colorscheme gruvbox

inoremap kj <esc>
vnoremap kj <esc>

nnoremap <leader>w :write<cr>
nnoremap <leader>q :quit!<cr>
nnoremap <leader>z :write<cr>:quit<cr>
nnoremap <leader>o :edit .<cr>
nnoremap <localleader>e :edit $MYVIMRC<cr>
nnoremap <localleader>ve :vsplit<cr><C-w>l:edit $MYVIMRC<cr>
nnoremap <localleader>s :write<cr>:source $MYVIMRC<cr>

nnoremap ' `
nnoremap '' ``
nnoremap ,a zt
nnoremap ,b zb
nnoremap ,z zz
nnoremap n nzz
nnoremap N Nzz
nnoremap w W
nnoremap <F8> @
nnoremap <F9> @@
nnoremap J :m '>+1<cr>gv=gv
nnoremap K :m '<-2<cr>gv=gv
nnoremap <leader>* :%s/\<C-r><C-w>//gI<left><left><left>
nnoremap <leader>& :%s/\<C-r><C-w>//gcI<left><left><left><left>
nnoremap <tab> :bnext<cr>
nnoremap <S-tab> :bprevious<cr>
nnoremap Y y$
nnoremap B _
nnoremap E $
nnoremap w W

vnoremap > >gv
vnoremap < <gv

nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>( viw<esc>a(<esc>bi(<esc>lel
nnoremap <leader>[ viw<esc>a[<esc>bi[<esc>lel
nnoremap <leader>{ viw<esc>a{<esc>bi{<esc>lel
nnoremap <leader>< viw<esc>a<<esc>bi<<esc>lel

nnoremap <leader>v :vsplit<cr><C-w>l
nnoremap <leader>s :split<cr><C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <leader>rs <C-w>=

function CheckTW()
  if &filetype != "text" && &l:textwidth != 0
    echom "tw -ne 0"
  endif
endfunction

function Indent()
  normal! mpgg=G`p
endfunction

" ALL
augroup ALL
  autocmd!
  autocmd InsertEnter * set nornu
  autocmd InsertLeave * set rnu
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufRead * call CheckTW()
augroup END
"
" VIM
augroup VIM
  autocmd!
  autocmd FileType vim silent setlocal ts=2 sw=2 sts=2
  autocmd BufWritePre $MYVIMRC call Indent()
  autocmd BufEnter $MYVIMRC,*.vim nnoremap <buffer> <localleader>c I"<space><esc>$
  autocmd BufRead *.vim call CheckTW()
augroup END

" PYTHON
augroup PYTHON
  autocmd!
  autocmd BufEnter *.py nnoremap <buffer> <localleader>c mpI#<space><esc>`p
  autocmd BufEnter *.py nnoremap <buffer> <F5> :write<cr>:!python3 %<cr>
augroup END

" BASH
augroup SH
  autocmd!
  autocmd BufEnter *.sh nnoremap <buffer> <localleader>c mpI#<space><esc>`p
  autocmd BufEnter *.sh iabbrev logdate printf "%s\n" "[$(date +'%Y-%m-%dT%H%M %:::z')Z] $0" >> "$HOME"/logfiles/mint.log 2>&1
augroup END

" HTML
augroup HTML
  autocmd!
  autocmd FileType html,css silent setlocal ts=2 sw=2 sts=2 tw=0 cc=120 fdc=1
  autocmd BufWritePre,BufEnter *.html,*.css normal! mpgg=G`p
augroup END

" TEXT
augroup TEXT
  autocmd!
  autocmd FileType text silent setlocal ts=8 sw=4 sts=8 tw=78 noet wrap cc=80
  autocmd BufEnter *.txt nnoremap <buffer> <leader>xa :<c-u>execute "normal! mpgg03j2lI{\eA}\<lt>Esc>`p"<cr>
  autocmd BufEnter *.txt nnoremap <buffer> <leader>xs :<c-u>execute "normal! mpgg03j2lI[\eA]\e`p"<cr>
augroup END

" TEST
augroup TEST
  au!
  au BufWrite * :echom "Baz"
augroup END
