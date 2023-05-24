" Last Change: 2023 May 23 00:57:59
"" <F2> to set last change
"" init.vim

"" FUNCTIONS & SCRIPTS {{{
function Indent()
  :normal! mpgg=G`p
endfunction

function GitBuf()
  :normal! gg0
endfunction
"" END FUNCTIONS & SCRIPTS }}}

"" SETTINGS {{{
filetype indent plugin on
syntax on
set termguicolors
set guicursor=""

set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0

set autochdir
set breakindent
set clipboard=unnamedplus
set colorcolumn=88
set copyindent
set cursorline
set cursorlineopt=both
set expandtab
set foldlevel=99
set foldlevelstart=99
set nohlsearch
set ignorecase
set number
set laststatus=0
set lazyredraw
set mouse=a
set path+=**
set relativenumber
set ruler
set scrolloff=5
set shortmess=aoOstT
set showmatch
set signcolumn=yes
set noshowmode
set smartcase
set smartindent
set sidescroll=8
set statusline=
set updatetime=100
set nowrap
set completeopt=menuone
set wildmode=list:longest,full

let &undodir=expand('~/.local/state/nvim/undo')
let &directory=expand('~/.local/state/nvim/swap')
let &backupdir=expand('~/.local/state/nvim/backup')
set undofile
set backup
set swapfile

let g:python3_host_prog = '/usr/bin/python3'

let mapleader=" "
let maplocalleader="\\"
"" END SETTINGS }}}

"" PLUGINS {{{
"" VIM-PLUG {{{
call plug#begin()
" Plug 'mattn/emmet-vim'
" Plug 'easymotion/vim-easymotion'
" Plug 'mbbill/undotree'
call plug#end()

colorscheme retrobox
"" }}}

"" EMMET {{{
" let g:user_emmet_mode='inv'
" let g:user_emmet_leader_key=','
"" }}}
"" END PLUGINS }}}

"" MAPPINGS {{{
inoremap kj <esc>
vnoremap kj <esc>

nnoremap <leader>w :write<cr>
nnoremap <leader>q :quit!<cr>
nnoremap <leader>z :write<cr>:quit<cr>
nnoremap <leader>o :edit .<cr>
nnoremap <localleader>e :edit ~/.config/nvim/init.vim<cr>
nnoremap <localleader>ve :vsplit<cr><C-w>l:edit ~/.config/nvim/init.vim<cr>
nnoremap <localleader>s :write<CR>:source ~/.config/nvim/init.vim<cr>
nnoremap <leader>t :write<cr>:terminal<cr>
tnoremap <ESC> <C-\><C-n>
tnoremap <C-v><ESC> <ESC>

nnoremap <leader>p "+p
nnoremap ' `
nnoremap '' ``
nnoremap ,a 5jzt
nnoremap ,b zb
nnoremap ,z zz
nnoremap n nzz
nnoremap N Nzz
nnoremap w W
nnoremap <F8> @
nnoremap <F9> @@
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

nnoremap <leader>* :%s/\<C-r><C-w>//gI<left><left><left>
nnoremap <leader>& :%s/\<C-r><C-w>//gcI<left><left><left><left>

map <F2> msHmtgg/Last [cC]hange:\s*/e+1<CR>"_D"=strftime("%Y %b %d %H:%M:%S")<CR>p'tzt`s
map <F4> mpHmtGoHello There<ESC>'tzt`p


nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>
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
nnoremap <leader>hh :vertical resize+2<CR>
nnoremap <leader>ll :vertical resize-2<CR>
nnoremap <leader>kk :resize+2<CR>
nnoremap <leader>jj :resize-2<CR>
nnoremap <leader>rs <C-w>=

" HEAD
nnoremap <localleader>sh gg/<<<<<<<<CR>dd/=======<CR>V/>>>>>>><CR>d<ESC>
" branch
nnoremap <localleader>sr gg/<<<<<<<<CR>V/=======<CR>d/>>>>>>><CR>dd<ESC>
" Both
nnoremap <localleader>sb gg/<<<<<<<<CR>dd/=======<CR>dd/>>>>>>><CR>dd<ESC>
" Next
nnoremap <localleader>sn gg/<<<<<<<<CR>
"" END MAPPINGS }}}

"" AUGROUP AUTOCMD {{{
augroup ALL " {{{
  autocmd!
  autocmd InsertEnter * set nornu
  autocmd InsertLeave * set rnu
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd BufWritePre *.c,*.h,*.cpp,*.html,*.css,*.sh call Indent()
augroup END " }}}

augroup VIM " {{{
  autocmd!
  autocmd FileType vim setlocal ts=2 sw=2 sts=2 tw=0 et nowrap cc=80 fdm=marker fdc=2
augroup END " }}}

augroup PYTHON " {{{
  autocmd!
  autocmd FileType python setlocal ts=4 sw=4 sts=4 tw=0 fdm=indent fdc=3
  autocmd BufEnter *.py nnoremap <buffer> <F5> :write<cr>:!python3 %<cr>
  autocmd BufEnter *.py nnoremap <buffer> <F6> :!black %<CR>
  autocmd BufEnter *.py nnoremap <buffer> <F7> :call flake8#Flake8()<CR>
  autocmd BufEnter *.py nnoremap <buffer> <localleader>fl :call flake8#Flake8ShowError()<CR>
  autocmd BufEnter *.py nnoremap <buffer> <leader>i] call Indent()
augroup END " }}}

augroup SH " {{{
  autocmd!
  autocmd FileType sh setlocal ts=4 sw=4 sts=4 tw=0 nofen fdc=0 cc=80
  autocmd BufEnter *.sh nnoremap <buffer> <F5> :write<cr>:!./%<cr>
augroup END " }}}

augroup HTML_CSS " {{{
  autocmd!
  autocmd FileType html setlocal ts=2 sw=2 sts=2 tw=0 cc=80,100,120 fdc=6 fdm=manual aw updatetime=500
  autocmd FileType html,css nnoremap <buffer> <localleader>f Vatzf
  autocmd BufRead,BufEnter *.html nnoremap <buffer> <localleader>c i<!----><esc>2hi<space><esc>i<space>
  autocmd BufRead,BufEnter *.css nnoremap <buffer> <localleader>c i/**/<esc>hi<space><esc>i<space>
  autocmd BufRead,BufEnter *.html :onoremap <buffer> it :<c-u>normal! f<vi<<cr>
  autocmd CursorHold *.html,*.css write
  autocmd BufEnter *.html,*.css colorscheme jellybeans
  autocmd BufLeave *.html,*.css colorscheme gruvbox
augroup END " }}}

augroup C_CPP " {{{
  autocmd!
  autocmd FileType c,cpp setlocal ts=4 sw=4 sts=4 tw=0 noai nosi noci cc=80 cin cino=ln,c2 fdc=4 fdm=indent
  autocmd FileType c,cpp nnoremap <buffer> <leader>bb A<space>{<cr>}<esc>ko
  autocmd Filetype c nnoremap <buffer> <leader>mm :!make main<CR>
augroup END " }}}

augroup RUST " {{{
  autocmd!
  autocmd FileType rust setlocal ts=4 sw=4 sts=4 tw=0 noai nosi noci cc=80 cin cino=ln,c2 fdc=4 fdm=indent
  autocmd FileType rust nnoremap <buffer> <leader>bb A<space>{<cr>}<esc>ko
augroup END " }}}

augroup TEXT " {{{
  autocmd!
  autocmd FileType text setlocal ts=8 sw=4 sts=0 tw=78 wrap fdc=1 cc=80
augroup END " }}}

augroup GITCOMMIT " {{{
  autocmd!
  autocmd FileType gitcommit setlocal ts=2 sw=2 sts=2 tw=70 wrap cc=50
  autocmd FileType gitcommit call GitBuf()
augroup END " }}}

augroup TEST " {{{
  au!
  autocmd BufEnter *.txt nnoremap <leader>x :<c-u>execute "normal! GoHELLO\<lt>esc>"<cr>
augroup END " }}}
"" END AUGROUP AUTOCMD }}}
