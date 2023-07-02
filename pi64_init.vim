": Neovim Configuration

if has('nvim')
	echom "has nvim"
	if $TERM == 'linux'
		echom 'linux'
		:source /home/bumper/.config/nvim/init_linux.vim
	else
		:source /home/bumper/.config/nvim/init_xterm.vim
	endif
endif
