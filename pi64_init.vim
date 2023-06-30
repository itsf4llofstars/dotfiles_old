" init.vim for Raspberry Pi 4 64-Bit

" Functions {{{
function Indent()
  :normal! mpHmogg=G`ozt`p
endfunction

function GitBuf()
  :normal! gg0
endfunction

function! HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep' . float2nr(a:blinktime * 1000) . 'm'
  set invcursorline
  redraw
endfunction
" }}}

source ~/.config/nvim/settings.vim
source ~/.config/nvim/ale_pre-setup.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/ale_post-setup.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/less_plugins.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/groups.vim
