let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit',
      \ }
" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': -1.9, 'height': 0.6 } }

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

nmap <leader><tab> <plug>(fzf-maps-n)
imap <C-x><C-f> <plug>(fzf-complete-word)
imap <C-x><C-d> <plug>(fzf-complete-path)
imap <C-x><C-a> <plug>(fzf-complete-line)

"" Look for files under current directory
"" :FZF
nnoremap <localleader>fz :FZF<cr>

"" Look for files under your home directory
nnoremap <localleader>ft :FZF ~<CR>

"" With fzf command-line options
"" :FZF --reverse --info=inline /tmp
"" Bang version starts fzf in fullscreen mode
"" :FZF!
