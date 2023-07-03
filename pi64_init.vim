": Neovim Configuration

if has('nvim')
  if $TERM == 'linux'
    :source /home/bumper/.config/nvim/init_linux.vim
  else
    :source /home/bumper/.config/nvim/init_xterm.vim
  endif
endif
