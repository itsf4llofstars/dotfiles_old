" Last Change: 2023 May 05 13:08:47
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
"" ALE {{{
let g:ale_set_signs = 1
let g:ale_max_signs = -1
" let g:ale_close_preview_on_insert = 1
let g:ale_completion_enabled = 1
let g:ale_disable_lsp = 0
let g:ale_lsp_suggestions = 1
let g:ale_linters_explicit = 1
let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_virtualtext_cursor = 'disabled' " 'current', 'disabled', 'all'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_loclist_msg_format = '[%linter%] %s [%severity%]'
let g:ale_popup_menu_enabled = 0
let g:ale_detail_to_floating_preview = 1
let g:ale_cursor_detail = 1 " 0
" let g:ale_hover_cursor = 0
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
let g:ale_echo_cursor = 1
let g:ale_disable_lsp = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_fix_on_save = 0
let g:ale_enabled = 0
" let g:ale_exclude_highlights = ['First line', 'Parsing failed', 'invalid syntax']
"" }}}

"" YCM {{{
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_max_num_candidates = 50
" let g:ycm_max_num_candidates_to_detail = 0
let g:ycm_max_num_identifier_candidates = 10
let g:ycm_auto_trigger = 1
let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'leaderf': 1,
      \ 'mail': 1
      \}
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1
      \}
let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
nmap <leader>D <plug>(YCMHover)

"" See, :help location-list
let g:ycm_always_populate_location_list = 0

"" Try set to 0 for no-extra window
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_seed_identifiers_with_syntax = 0

"" set 0 for no previews or popups. preview or popup needed in comleteopt
let g:ycm_add_preview_to_completeopt = 1

"" Defaults for completion/insertion = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"" Some like adding 'enter' the list
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

"" Closes popup if it's blocking view
let g:ycm_key_list_stop_completion = ['<C-y>']

"" try enter
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_key_detailed_diagnostics = '<leader>d'

let g:ycm_use_clangd = 1
" let g:ycm_clangd_binary_path = ''

"" Set to 0 if seeing the new diags is not wanted
let g:ycm_update_diagnostics_in_insert_mode = 1
"" END YCM}}}

"" VIM-PLUG {{{
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mbbill/undotree'
" " Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'dense-analysis/ale'
Plug 'valloric/youcompleteme'
call plug#end()

colorscheme retrobox
"" }}}

"" FZF {{{
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
"" END FZF }}}

"" NERDTREE {{{
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"" }}}

"" EMMET {{{
let g:user_emmet_mode='inv'
let g:user_emmet_leader_key=','
"" }}}

"" LIGHTLINE {{{
"" laststatus equals 2, noshowmode must be set
"" powerline, wombat, solarized, PaperColor, one
"" LIGHTLINE ADVANCED
"" See Vim-Awesome
" let g:lightline = {'colorscheme': 'one',}
"" }}}

"" FLAKE8 {{{
let g:no_flake8_maps = 0
" let g:flake8_quickfix_location="bottom"
" let g:flake8_quickfix_height=5
let g:flake8_show_quickfix=0
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=0
let g:flake8_max_markers=500
let g:flke8_max_complexity=10
let g:flake8_error_marker='>>'
let g:flake8_warning_marker='--'
let g:flake8_pyflake_marker='M'
let g:flake8_complexity_marker='C'
let g:flake8_naming_marker='N'
" let g:flake8_ignore="D400"

"" Error WarningMsg
highlight link Flake8_Error      Error
" highlight link Flake8_Warning    WarningMsg
" highlight link Flake8_Complexity WarningMsg
" highlight link Flake8_Naming     WarningMsg
" highlight link Flake8_PyFlake    WarningMsg
"" }}}

"" ALE {{{
" 'rust': ['analyzer', 'rustc', 'cargo'],
" 'python': ['pylint', 'isort', 'mypy', 'pyright', 'ruff'],
let g:ale_linters = {
      \ 'python': ['flake8', 'pylint'],
      \ 'rust': ['analyzer', 'cargo', 'rsl'],
      \ 'vim': ['vimls', 'vint'],
      \ 'cpp': ['clangd', 'cpplint'],
      \ 'sh': ['shellcheck', 'bashate', 'shell'],
      \ 'json': ['jsonlint', 'spectral', 'vscodejson'],
      \ }
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'python': ['autopep8', 'isort'],
      \ 'rust': ['rustfmt'],
      \ 'cpp': ['clang-format'],
      \ 'sh': ['shfmt'],
      \ 'json': ['prettier'],
      \}
""}}}
"" END PLUGINS }}}

"" MAPPINGS {{{
inoremap kj <esc>
vnoremap kj <esc>

"" NERDTREE
let NERDTreeQuitOnOpen = 1
nnoremap <leader>o :NERDTree<CR>gg2j

"" EASY MOTION
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
nnoremap <leader>ga :write<cr>:Git add .<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gb :Git branch<cr>
nnoremap <leader>gr :Git remote<cr>
nnoremap <leader>gdd :Git diff<cr>
nnoremap <leader>gds :Git diff --staged<cr>

"" ALE
nnoremap <leader>alt :ALEToggle<CR>
nnoremap <leader>all :ALELint<CR>
nnoremap <leader>alf :ALEFix<CR>:write<CR>
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
  autocmd FileType c,cpp,rust setlocal ts=4 sw=4 sts=4 tw=0 noai nosi noci cc=80 cin cino=ln,c2 fdc=4 fdm=indent
  autocmd FileType c,cpp,rust nnoremap <buffer> <leader>nb A<space>{<cr>}<esc>ko
  autocmd Filetype c nnoremap <buffer> <leader>mm :!make main<CR>
augroup END " }}}

augroup TEXT " {{{
  autocmd!
  autocmd FileType text setlocal ts=8 sw=4 sts=0 tw=78 wrap fdc=1 cc=80
augroup END " }}}

augroup NERDTREE " {{{
  autocmd!
  autocmd StdinReadPre * let s:std_in = 1
  " autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
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
