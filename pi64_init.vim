" init.vim for Raspberry Pi 4 64-Bit

" Functions {{{
function Indent()
  :normal! mpHmogg=G`ozt`p
endfunction

function GitBuf()
  :normal! gg0
endfunction
" }}}

" Settings {{{
filetype indent plugin on
syntax on
set termguicolors
set background=dark
set guicursor=""

if &term == 'linux'
  colorscheme desert
else
  colorscheme retrobox
endif

set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0

set autochdir
set breakindent
set clipboard=unnamedplus
set copyindent
set cursorline
set cursorlineopt=number
set completeopt=menuone,preview
set expandtab
set foldlevel=99
set foldlevelstart=99
set nohlsearch
set ignorecase
set number
set laststatus=2
set lazyredraw
set mouse=a
set path+=**
set noruler
set relativenumber
set scrolloff=3
set shortmess=aoOstT
set showmatch
set signcolumn=yes
set noshowmode
set smartcase
set smartindent
set sidescroll=8
set statusline=
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

let mapleader=" "
let maplocalleader="\\"
" }}}

" Ale {{{
let g:ale_set_signs = 1
let g:ale_max_signs = -1
" let g:ale_close_preview_on_insert = 1
let g:ale_disable_lsp = 0
let g:ale_completion_enabled = 1
let g:ale_lsp_suggestions = 1
let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_warn_about_trailing_whitespace = 1

" '1=current', '0=disabled', '2=all'
let g:ale_virtualtext_cursor = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_format = '%code: %%S [%type%] [%linter%]'
let g:ale_loclist_msg_format = 'code: %%s [%severity%] [%linter%]'

let g:ale_popup_menu_enabled = 0
let g:ale_detail_to_floating_preview = 1
let g:ale_cursor_detail = 0

" 00 top 01 top-bott 10 top 11 top-bott
let g:ale_hover_cursor = 0
let g:ale_echo_cursor = 0

let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_enabled = 1
" }}}

" Vim Plug {{{
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'dense-analysis/ale'
" Plug 'msanders/snipmate.vim'
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
call plug#end()
" }}}

" Plugins {{{
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

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:user_emmet_mode='inv'
let g:user_emmet_leader_key=','

"" laststatus equals 2, noshowmode must be set
"" powerline, wombat, solarized, PaperColor, one
"" LIGHTLINE ADVANCED
"" See Vim-Awesome
let g:lightline = {'colorscheme': 'one',}

" let g:no_flake8_maps = 0
"" let g:flake8_quickfix_location="bottom"
"" let g:flake8_quickfix_height=5
" let g:flake8_show_quickfix=0
" let g:flake8_show_in_gutter=1
" let g:flake8_show_in_file=0
" let g:flake8_max_markers=500
" let g:flke8_max_complexity=10
" let g:flake8_error_marker='>>'
" let g:flake8_warning_marker='--'
" let g:flake8_pyflake_marker='M'
" let g:flake8_complexity_marker='C'
" let g:flake8_naming_marker='N'
"" let g:flake8_ignore="D400"

"" Error WarningMsg
" highlight link Flake8_Error      Error
" highlight link Flake8_Warning    WarningMsg
" highlight link Flake8_Complexity WarningMsg
" highlight link Flake8_Naming     WarningMsg
" highlight link Flake8_PyFlake    WarningMsg

" 'rust': ['analyzer', 'rustc', 'cargo'],
" 'python': ['pylint', 'isort', 'mypy', 'pyright', 'ruff'],
let g:ale_linters = {
      \ 'python': ['pylint'],
      \ 'rust': ['analyzer'],
      \ 'vim': [''],
      \ 'cpp': ['clangd', 'cpplint'],
      \ 'json': ['eslint'],
      \ }
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'python': ['black', 'isort'],
      \ 'rust': ['rustfmt'],
      \ 'cpp': ['clang-format'],
      \ 'json': ['prettier'],
      \}
" }}}

" Maps {{{
inoremap kj <esc>
vnoremap kj <esc>

" Nerdtree
let NERDTreeQuitOnOpen = 1
nnoremap <leader>o :NERDTree<CR>gg2j

" Easymotion
nnoremap ,f <Plug>(easymotion-bd-f)
nnoremap ,f <Plug>(easymotion-overwin-f)
nnoremap ,s <Plug>(easymotion-overwin-f2)
nnoremap ,L <Plug>(easymotion-bd-jk)
nnoremap ,L <Plug>(easymotion-overwin-line)
nnoremap ,w <Plug>(easymotion-bd-w)
nnoremap ,w <Plug>(easymotion-overwin-w)

" Undotree
nnoremap <leader>ut :UndotreeToggle<CR>

" Git
nnoremap <leader>ga :write<cr>:Git add .<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gb :Git branch<cr>
nnoremap <leader>gr :Git remote<cr>
nnoremap <leader>gdd :Git diff<cr>
nnoremap <leader>gds :Git diff --staged<cr>

" ALE
nnoremap <leader>alt :ALEToggle<CR>
nnoremap <leader>all :ALELint<CR>
nnoremap <leader>alf :ALEFix<CR>
nnoremap <leader>alo :copen<CR>
nnoremap <leader>alc <C-w>k<C-w>jZQ

nnoremap <leader>w :write<cr>
nnoremap <leader>q :quit!<cr>
nnoremap <leader>z :write<cr>:quit<cr>
nnoremap <localleader>e :edit ~/.config/nvim/init.vim<cr>
nnoremap <localleader>ve :vsplit<cr><C-w>l:edit ~/.config/nvim/init.vim<cr>
nnoremap <localleader>s :write<CR>:source ~/.config/nvim/init.vim<cr>
nnoremap <leader>t :write<cr>:terminal<cr>
tnoremap <ESC> <C-\><C-n>
tnoremap <C-v><ESC> <ESC>

nnoremap <C-f> <C-d>
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

nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bp :bprevious<cr>
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

nnoremap <leader>nt :tabnew<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tc :tabclose<CR>

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

nnoremap <localleader>sh gg/<<<<<<<<CR>dd/=======<CR>V/>>>>>>><CR>d<ESC>
nnoremap <localleader>sr gg/<<<<<<<<CR>V/=======<CR>d/>>>>>>><CR>dd<ESC>
nnoremap <localleader>sb gg/<<<<<<<<CR>dd/=======<CR>dd/>>>>>>><CR>dd<ESC>
nnoremap <localleader>sn gg/<<<<<<<<CR>
" }}}

augroup ALL " {{{
  au!
  au InsertEnter * set nornu
  au InsertLeave * set rnu
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  au BufWritePre *.c,*.cpp,*.css,*.h,*.html,*.sh,*.vim call Indent()
augroup END " }}}

augroup VIM " {{{
  au!
  au FileType vim setlocal ts=2 sw=2 sts=2 tw=0 cc=80 fdm=marker fdc=1
augroup END " }}}

augroup PYTHON " {{{
  au!
  au FileType python setlocal ts=4 sw=4 sts=4 tw=0 fdm=indent fdc=1
  au BufEnter *.py nnoremap <buffer> <F5> :write<cr>:!python3 %<cr>
  au BufEnter *.py nnoremap <buffer> <F6> :!black %<CR>
  au BufEnter *.py nnoremap <buffer> <F7> :call flake8#Flake8()<CR>
  au BufEnter *.py nnoremap <buffer> <localleader>fl :call flake8#Flake8ShowError()<CR>
  au BufEnter *.py nnoremap <buffer> <leader>in call Indent()
augroup END " }}}

augroup SH " {{{
  au!
  au FileType sh setlocal ts=4 sw=4 sts=4 tw=0 nofen fdc=0 cc=80
  au BufEnter *.sh nnoremap <buffer> <F5> :write<cr>:!./%<cr>
augroup END " }}}

augroup HTML_CSS " {{{
  au!
  au FileType html setlocal ts=2 sw=2 sts=2 tw=0 cc=80,100,120 fdc=6 fdm=manual aw updatetime=500
  au FileType html,css nnoremap <buffer> <localleader>f Vatzf
  au BufRead,BufEnter *.html nnoremap <buffer> <localleader>c i<!----><esc>2hi<space><esc>i<space>
  au BufRead,BufEnter *.css nnoremap <buffer> <localleader>c i/**/<esc>hi<space><esc>i<space>
  au BufRead,BufEnter *.html :onoremap <buffer> it :<c-u>normal! f<vi<<cr>
  au CursorHold *.html,*.css write
  au BufEnter *.html,*.css colorscheme jellybeans
  au BufLeave *.html,*.css colorscheme gruvbox
augroup END " }}}

augroup C_CPP " {{{
  au!
  au FileType c,cpp setlocal ts=4 sw=4 sts=4 tw=0 noai nosi noci cc=80 cin cino=ln,c2 fdc=4 fdm=indent
  au FileType c,cpp nnoremap <buffer> <leader>nb A<space>{<
  au Filetype c nnoremap <buffer> <leader>mm :!make main<CR>
augroup END " }}}

augroup RUST " {{{
  au!
  au FileType rust setlocal ts=4 sw=4 sts=4 tw=0 noai nosi noci cc=80 cin cino=ln,c2 fdc=4 fdm=indent
  au FileType rust nnoremap <buffer> <leader>nb A<space>{<
augroup END " }}}

augroup TEXT " {{{
  au!
  au FileType text setlocal ts=4 sw=4 sts=4 tw=79 wrap fdc=1 cc=80
  au BufEnter *.txt,*.tex colorscheme quiet
  au BufLeave *.txt,*.tex colorscheme retrobox
augroup END " }}}

augroup NERDTREE " {{{
  au!
  au StdinReadPre * let s:std_in = 1
  " au VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
  au BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  au BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  au BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
augroup END " }}}

augroup GITCOMMIT " {{{
  au!
  au FileType gitcommit setlocal ts=2 sw=2 sts=2 tw=70 wrap cc=50
  au FileType gitcommit call GitBuf()
augroup END " }}}
