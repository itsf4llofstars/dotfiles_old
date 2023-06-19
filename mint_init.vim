"" Last Change: 2023 Jun 18 18:54:20
"" <F2> to set last change
"" init.vim

"" FUNCTIONS {{{
function Indent()
  :normal! mpHmogg=G'ozt`p
endfunction
"" }}}

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
set showmode
set smartcase
set smartindent
set sidescroll=8
" set timeoutlen=500
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
"" ALE {{{
let g:ale_enabled = 0
let g:ale_max_signs = 10
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_echo_msg_format = "% code % [%linter%] %type% "
let g:ale_lsp_suggestions = 1

let g:ale_cursor_detail = 0 " 1 gives popup
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']

" let g:ale_use_neovim_diagnostics_api = 1 " DONT USE WITH g:ale_virturaltext_cursor
"" 0 No inline comments, 1 inline comments on with corsor on line, 2 inline on always
let g:ale_virtualtext_cursor = 0

" if has('nvim')
"   let g:ale_use_neovim_diagnostics_api = 1 " DONT USE WITH g:ale_virturaltext_cursor
"   let g:ale_virtualtext_cursor = 1
" else
"   let g:ale_virtualtext_cursor = 1
" endif

let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_warn_about_trailing_whitespace = 1

let g:ale_sign_column_always = 1

" Prevents highlights in the code proper. This is a list of strings
let g:ale_set_highlights = 0
let g:ale_exclude_highlights = [
      \ 'docstring',
      \ 'Unused argument',
      \ 'import-errro',
      \ 'SC2164',
      \ 'inconsistent-return-statements',
      \ ]

let g:ale_linters_explicit = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_fix_on_save = 0 " 0 is default
"" }}}

"" VIM-PLUG {{{
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'liuchengxu/vim-which-key'
Plug 'dense-analysis/ale'
call plug#end()

colorscheme jellybeans
"" }}}

"" ALE {{{
let g:ale_linters = {
      \ 'python': ['pylint'],
      \ 'sh': ['shellcheck'],
      \ }
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'python': ['black', 'isort'],
      \ 'sh': ['shfmt'],
      \ }
nnoremap <leader>alt :ALEToggle<CR>
nnoremap <leader>all :ALELint<CR>
nnoremap <leader>alf :ALEFix<CR>
"" }}}


"" EMMET {{{
let g:user_emmet_mode='inv'
let g:user_emmet_leader_key=','
"" }}}

"" EASY MOTION {{{
nnoremap ,f <Plug>(easymotion-bd-f)
nnoremap ,f <Plug>(easymotion-overwin-f)
nnoremap ,s <Plug>(easymotion-overwin-f2)
nnoremap ,L <Plug>(easymotion-bd-jk)
nnoremap ,L <Plug>(easymotion-overwin-line)
nnoremap ,w <Plug>(easymotion-bd-w)
nnoremap ,w <Plug>(easymotion-overwin-w)
"" }}}

"" UNDOTREE {{{
nnoremap <leader>ut :UndotreeToggle<CR>
"" }}}

"" FUGITIVE {{{
nnoremap <leader>ga :write<cr>:Git add .<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gb :Git branch<cr>
nnoremap <leader>gr :Git remote<cr>
nnoremap <leader>gdd :Git diff<cr>
nnoremap <leader>gds :Git diff --staged<cr>
"" }}}

"" WHICHKEY {{{
nnoremap <silent> <leader> :<C-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<C-u>WhichKey ','<CR>
"" }}}
"" END PLUGINS }}}

"" MAPPINGS {{{
inoremap kj <esc>
vnoremap kj <esc>

nnoremap <leader>w :write<cr>
nnoremap <leader>q ZQ
nnoremap <leader>z ZZ
nnoremap <localleader>e :edit $MYVIMRC<cr>
nnoremap <leader>o :edit .<CR>
nnoremap <localleader>ve :vsplit<cr><C-w>l:edit ~/.config/nvim/init.vim<cr>
nnoremap <localleader>so :write<CR>:source ~/.config/nvim/init.vim<cr>
nnoremap <leader>t :write<cr>:terminal<cr>
tnoremap <ESC> <C-\><C-n>
tnoremap <C-v><ESC> <ESC>

nnoremap <leader>ii :call Indent()<CR>
nnoremap <leader>p "+p
nnoremap ' `
nnoremap '' ``
nnoremap ,a zt
nnoremap ,b zb
nnoremap ,z zz
nnoremap n nzz
nnoremap N Nzz
nnoremap w W
nnoremap Y y$
nnoremap B _
nnoremap E $
nnoremap <F8> @
nnoremap <F9> @@
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
vnoremap > >gv
vnoremap < <gv
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>* :%s/\<C-r><C-w>//gI<left><left><left>
nnoremap <leader>& :%s/\<C-r><C-w>//gcI<left><left><left><left>

map <F2> msHmtgg/Last [cC]hange:\s*/e+1<CR>"_D"=strftime("%Y %b %d %H:%M:%S")<CR>p'tzt`s

nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>( viw<esc>a(<esc>bi(<esc>lel
nnoremap <leader>[ viw<esc>a[<esc>bi[<esc>lel
nnoremap <leader>{ viw<esc>a{<esc>bi{<esc>lel
nnoremap <leader>< viw<esc>a<<esc>bi<<esc>lel

nnoremap <localleader>to :tabnew<CR>
nnoremap <localleader>tc :tabclose<CR>
nnoremap <localleader>tn :tabnext<CR>
nnoremap <localleader>tp :tabprevious<CR>

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
"" }}}

"" AUGROUP AUTOCMD {{{
augroup ALL " {{{
  autocmd!
  autocmd InsertEnter * set nornu
  autocmd InsertLeave * set rnu
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END " }}}

augroup VIM " {{{
  autocmd!
  autocmd FileType vim setlocal ts=2 sw=2 sts=2 tw=0 et nowrap cc=80 fdm=marker fdc=2
augroup END " }}}

augroup PYTHON " {{{
  autocmd!
  autocmd FileType python setlocal ts=4 sw=4 sts=4 tw=0 fdm=indent fdc=0
  autocmd BufEnter *.py nnoremap <buffer> <F5> :write<cr>:!python3 %<cr>
  autocmd BufEnter *.py nnoremap <buffer> <F6> :write<cr>:!pylint --rcfile pylint.toml %<cr>
augroup END " }}}

augroup SH " {{{
  autocmd!
  autocmd FileType sh setlocal ts=4 sw=4 sts=4 tw=0 nofen fdc=0 cc=80
  autocmd BufEnter *.sh nnoremap <buffer> <F5> :write<cr>:!./%<cr>
  autocmd BufEnter *.sh :source ~/.config/nvim/init.vim
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
  autocmd FileType c,cpp setlocal ts=4 sw=4 sts=4 tw=0 noai nosi noci cc=80 cin cino=ln,c2 fdc=4 fdm=indent fdl=3 fdls=1
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
  autocmd FileType text setlocal ts=4 sw=4 sts=0 tw=78 wrap fdc=0 cc=80
  autocmd BufEnter *.txt unmap ,f
  autocmd BufEnter *.txt nnoremap <leader>x :<c-u>execute "normal! GoHELLO\<lt>esc>"<cr>
augroup END " }}}

augroup GITCOMMIT " {{{
  autocmd!
  autocmd FileType gitcommit setlocal ts=2 sw=2 sts=2 tw=70 wrap cc=50
augroup END " }}}
"" END AUGROUP AUTOCMD }}}
