" MAPPINGS
inoremap kj <esc>
vnoremap kj <esc>

" Experimental
"" Will populate a blank sh file with snips.sh text
nnoremap ,sni :r ~/.vim/snippets/snips.sh<CR>ggddG

nnoremap ; :
nnoremap : ;

" Nerdtree
" let NERDTreeQuitOnOpen = 1
" nnoremap <leader>o :NERDTree<CR>gg2j

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

" WHICH KEY
nnoremap <silent> <leader> :<C-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<C-u>WhichKey ','<CR>

nnoremap <leader>w :write<cr>
nnoremap <leader>qq ZQ
nnoremap <leader>z ZZ
nnoremap <localleader>r :edit .<CR>
nnoremap <localleader>e :edit ~/.config/nvim/init.vim<cr>
nnoremap <localleader>ve :vsplit<cr><C-w>l:edit ~/.config/nvim/init.vim<cr>
nnoremap ,s :write<CR>:source ~/.config/nvim/init.vim<cr>
nnoremap <localleader>t :write<cr>:terminal<cr>
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

nnoremap <localleader>v :vsplit<cr><C-w>l
nnoremap <localleader>s :split<cr><C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <M-LEFT> :vertical resize+2<CR>
nnoremap <M-RIGHT> :vertical resize-2<CR>
nnoremap <M-UP> :resize+2<CR>
nnoremap <M-DOWN> :resize-2<CR>
nnoremap <M-=> <C-w>=

nnoremap <localleader>sh gg/<<<<<<<<CR>dd/=======<CR>V/>>>>>>><CR>d<ESC>
nnoremap <localleader>sr gg/<<<<<<<<CR>V/=======<CR>d/>>>>>>><CR>dd<ESC>
nnoremap <localleader>sb gg/<<<<<<<<CR>dd/=======<CR>dd/>>>>>>><CR>dd<ESC>
nnoremap <localleader>sn gg/<<<<<<<<CR>
