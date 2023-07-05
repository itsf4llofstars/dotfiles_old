": Neovim Configuration

if has('nvim')
  if $TERM == 'linux'
    :source /home/bumper/.config/nvim/init_linux.vim
  elseif $TERM == 'xterm-256color' || $TERM == 'tmux-256color'
    :source /home/bumper/.config/nvim/init_xterm.vim
  endif
endif
