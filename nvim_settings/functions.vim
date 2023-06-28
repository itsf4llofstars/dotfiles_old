"" Functions

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
