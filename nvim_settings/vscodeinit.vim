"" vscodeinit.vim

set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0
set expandtab
set nowrap

set colorcolumn=80,100
set nohlsearch
set ignorecase
set number
set noruler
set scrolloff=3
set shortmess=aoOstT
set showmatch
set smartcase
set sidescroll=8

set noundofile
set nobackup
set noswapfile

let mapleader=" "

inoremap kj <esc>
vnoremap kj <esc>

nnoremap <leader>alc <C-w>k<C-w>jZQ

nnoremap <leader>w :write<cr>

nnoremap <leader>p "+p
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
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
nnoremap <leader>* :%s/\<C-r><C-w>//gI<left><left><left>
nnoremap <leader>& :%s/\<C-r><C-w>//gcI<left><left><left><left>
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
