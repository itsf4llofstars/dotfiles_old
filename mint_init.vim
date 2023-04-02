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
set nohlsearch
set ignorecase
set number
set laststatus=2
set lazyredraw
set mouse=a
set path+=**
set relativenumber
set noruler
set scrolloff=5
set shortmess=aoOstT
set showmatch
set noshowmode
set smartcase
set smartindent
set sidescroll=8
set statusline=
set updatetime=100
set nowrap
" set completeopt=menuone,preview,noinsert
set completeopt=menuone,preview
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
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mbbill/undotree'
Plug 'nvie/vim-flake8'
Plug 'itchyny/lightline.vim'
" Plug 'msanders/snipmate.vim'
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'valloric/youcompleteme'
call plug#end()

colorscheme gruvbox

"" FZF
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit',
      \ }
" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" - Popup window (center of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }

" - Popup window (anchored to the bottom of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

" - Window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }
set rtp+=~/.fzf
nnoremap <leader>fz :FZF<space>
"" Look for files under current directory
"" :FZF
"" Look for files under your home directory
"" :FZF ~
"" With fzf command-line options
"" :FZF --reverse --info=inline /tmp
"" Bang version starts fzf in fullscreen mode
"" :FZF!

"" NERDTREE
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"" EMMET
let g:user_emmet_mode='inv'
let g:user_emmet_leader_key=','

"" LIGHTLINE
"" laststatus equals 2, noshowmode must be set
"" powerline, wombat, solarized, PaperColor, one
"" LIGHTLINE ADVANCED
"" See Vim-Awesome
let g:lightline = {'colorscheme': 'one',}

"" YCM
"" END PLUGINS }}}

"" MAPPINGS {{{
inoremap kj <esc>
vnoremap kj <esc>

"" NERDTREE
let NERDTreeQuitOnOpen = 1
nnoremap <leader>o :NERDTree<CR>gg2j

"" EASY MOTION
" map <Leader> <Plug>(easymotion-prefix)
nnoremap ,f <Plug>(easymotion-bd-f)
nnoremap ,f <Plug>(easymotion-overwin-f)
nnoremap ,s <Plug>(easymotion-overwin-f2)
nnoremap ,L <Plug>(easymotion-bd-jk)
nnoremap ,L <Plug>(easymotion-overwin-line)
nnoremap ,w <Plug>(easymotion-bd-w)
nnoremap ,w <Plug>(easymotion-overwin-w)

"" UNDOTREE
nnoremap <leader>ut :UndotreeToggle<CR>

"" FUGITIVE
nnoremap <leader>ga :Git add .<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gb :Git branch<ck>
nnoremap <leader>gr :Git remote<cr>

"" YCM
nnoremap <leader>m <C-w>kZQ

nnoremap <leader>w :write<cr>
nnoremap <leader>q :quit!<cr>
nnoremap <leader>z :write<cr>:quit<cr>
nnoremap <localleader>e :edit ~/.config/nvim/init.vim<cr>
nnoremap <localleader>ve :vsplit<cr><C-w>l:edit ~/.config/nvim/init.vim<cr>
nnoremap <localleader>s :source ~/.config/nvim/init.vim<cr>:write<cr>
nnoremap <leader>t :write<cr>:terminal<cr>
tnoremap <ESC> <C-\><C-n>
tnoremap <C-v><ESC> <ESC>

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

" Ours
nnoremap <localleader>so gg/<<<<<<<<CR>dd/=======<CR>V/>>>>>>><CR>d<ESC>
" Theirs
nnoremap <localleader>st gg/<<<<<<<<CR>V/=======<CR>d/>>>>>>><CR>dd<ESC>
" Both
nnoremap <localleader>sb gg/<<<<<<<<CR>dd/=======<CR>dd/>>>>>>><CR>dd<ESC>
" Next
nnoremap <localleader>sn gg/<<<<<<<<CR>
"" END MAPPINGS }}}

"" AUGROUP AUTOCMD {{{
augroup ALL
  autocmd!
  autocmd InsertEnter * set nornu
  autocmd InsertLeave * set rnu
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup VIM
  autocmd!
  " autocmd FileType vim silent setlocal ts=2 sw=2 fdm=marker fdc=2
  autocmd BufRead *.vim source ~/.config/nvim/main.vim
  autocmd BufEnter $MYVIMRC call Indent()
augroup END

augroup PYTHON
  autocmd!
  autocmd FileType python silent setlocal fdm=indent fdc=4
  autocmd BufEnter *.py nnoremap <buffer> <F5> :write<cr>:!python3 %<cr>
augroup END

augroup SH
  autocmd!
  autocmd FileType sh silent setlocal ts=2 sw=2 nofen fdc=0 cc=80
augroup END

augroup HTML_CSS
  autocmd!
  autocmd FileType html setlocal ts=2 sw=2 cc=80,100,120 fdc=6 fdm=manual aw updatetime=500
  autocmd FileType html,css nnoremap <buffer> <localleader>f Vatzf
  autocmd BufRead,BufEnter *.html nnoremap <buffer> <localleader>c i<!----><esc>2hi<space><esc>i<space>
  autocmd BufRead,BufEnter *.css nnoremap <buffer> <localleader>c i/**/<esc>hi<space><esc>i<space>
  autocmd BufRead,BufEnter *.html :onoremap <buffer> it :<c-u>normal! f<vi<<cr>
  autocmd CursorHold *.html,*.css write
  autocmd BufEnter *.html,*.css colorscheme jellybeans
  autocmd BufLeave *.html,*.css colorscheme gruvbox
augroup END

augroup C_CPP
  autocmd!
  autocmd FileType c,cpp,rust setlocal noai nosi noci cc=80 cin cino=ln,c2 fdc=4 fdm=indent
  autocmd FileType c,cpp,rust nnoremap <buffer> <leader>nb A<space>{<cr>}<esc>ko
augroup END

augroup TEXT
  autocmd!
  autocmd FileType text silent setlocal tw=78 wrap fdc=1 cc=80
augroup END

augroup NERDTREE
  autocmd!
  autocmd StdinReadPre * let s:std_in = 1
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
augroup END

augroup GITCOMMIT
  autocmd!
  autocmd FileType gitcommit setlocal ts=2 sw=2 tw=55 cc=55
  autocmd FileType gitcommit call GitBuf()
augroup END
"" END AUGROUP AUTOCMD }}}
