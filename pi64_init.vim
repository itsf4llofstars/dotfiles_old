" init.vim for Raspberry Pi 4 64-Bit

" Functions {{{
function Indent()
  :normal! mpHmogg=G`ozt`p
endfunction

function GitBuf()
  :normal! gg0
endfunction
" }}}

" source /home/bumper/.config/nvim/settings.vim
" source /home/bumper/.config/nvim/ale_pre-setup.vim
" source /home/bumper/.config/nvim/plugins.vim
" source /home/bumper/.config/nvim/ale_post-setup.vim
" source /home/bumper/.config/nvim/fzf.vim
" source /home/bumper/.config/nvim/less_plugins.vim
" source /home/bumper/.config/nvim/mappings.vim
" source /home/bumper/.config/nvim/groups.vim

source ~/.config/nvim/settings.vim
source ~/.config/nvim/ale_pre-setup.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/ale_post-setup.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/less_plugins.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/groups.vim
