augroup ALL
  au!
  au InsertEnter * set nornu
  au InsertLeave * set rnu
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  au BufWritePre *.vim,*.py,*.sh,*.html,*.css,*.c,*.cpp,*.h,*.rs,*.lua call Indent()
augroup END

augroup ABBREVS
  au!
  au BufEnter * iabbrev pritn print
  au BufEnter * iabbrev prnit print
  au BufEnter * iabbrev pirnt print
  au BufEnter * iabbrev esle else
  au BufEnter * iabbrev tow two
  au BufEnter * iabbrev sefl self
  au BufEnter * iabbrev slef self
augroup END

augroup VIM
  au!
  au FileType vim setlocal ts=2 sw=2 sts=2 tw=0 fdm=marker fdc=1
augroup END

augroup PYTHON
  au!
  au FileType python setlocal ts=4 sw=4 sts=4 tw=0 fdm=indent fdc=3
  au BufEnter *.py nnoremap <buffer> <F5> :write<cr>:!python3 %<cr>
  au BufEnter *.py nnoremap <buffer> <F6> :!black %<CR>
  au BufEnter *.py nnoremap <buffer> <F7> :!pylint --rcfile=~/python/pylint.conf %<CR>
  au BufEnter *.py nnoremap <buffer> <localleader>fl :call flake8#Flake8ShowError()<CR>
augroup END

augroup SH
  au!
  au FileType sh setlocal ts=4 sw=4 sts=4 tw=0 nofen fdc=0
  au BufEnter *.sh nnoremap <buffer> <F5> :write<cr>:!./%<cr>
augroup END

augroup HTML_CSS
  au!
  au FileType html setlocal ts=2 sw=2 sts=2 tw=0 fdc=6 fdm=manual aw updatetime=500
  au FileType html,css nnoremap <buffer> <localleader>f Vatzf
  au BufRead,BufEnter *.html nnoremap <buffer> <localleader>c i<!----><esc>2hi<space><esc>i<space>
  au BufRead,BufEnter *.css nnoremap <buffer> <localleader>c i/**/<esc>hi<space><esc>i<space>
  au BufRead,BufEnter *.html :onoremap <buffer> it :<c-u>normal! f<vi<<cr>
  au CursorHold *.html,*.css write
  au BufEnter *.html,*.css colorscheme wildcharm
  au BufLeave *.html,*.css colorscheme retrobox
augroup END

augroup C_CPP
  au!
  au FileType c,cpp setlocal ts=4 sw=4 sts=4 tw=0 noai nosi noci cin cino=ln,c2 fdc=4 fdm=indent
  au FileType c,cpp nnoremap <buffer> <leader>nb A<space>{<
  au Filetype c nnoremap <buffer> <leader>mm :!make main<CR>
  au BufEnter,BufWritePre *.c :call Indent()
augroup END

augroup RUST
  au!
  au FileType rust setlocal ts=4 sw=4 sts=4 tw=0 noai nosi noci cin cino=ln,c2 fdc=4 fdm=indent
  au FileType rust nnoremap <buffer> <leader>nb o{<CR>}<ESC>O
  au BufEnter *.rs nnoremap <buffer> <F5> :write<CR>:!cargo run<CR>
augroup END

augroup LUA
  au!
  au FileType lua setlocal ts=2 sw=2 sts=2 tw=0 fdm=indent fdc=3
  au BufEnter *.lua nnoremap <buffer> <F5> :write<CR>:!lua %<CR>
augroup END

augroup TEXT
  au!
  au FileType text setlocal ts=4 sw=4 sts=4 tw=79 wrap fdc=1
augroup END

" augroup NERDTREE
"   au!
"   au StdinReadPre * let s:std_in = 1
"   " au VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
"   au BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"   au BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"   au BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" augroup END

augroup GITCOMMIT
  au!
  au FileType gitcommit setlocal ts=2 sw=2 sts=2 tw=70 wrap cc=50
  au FileType gitcommit call GitBuf()
augroup END

augroup FZF
  au!
  au FileType fzf set laststatus=0 noshowmode noruler
  au BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
