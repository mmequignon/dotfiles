
"---------------------------------------------------------------
" raccourcis 
"--------------------------------------------------------------

nnoremap <silent><expr> <F4> g:NERDTree.IsOpen() ? ":NERDTreeClose\<CR>" : bufname("%") == "" ? ":NERDTreeCWD\<CR>" : ":NERDTreeFind\<CR>" 
nnoremap <silent> <F5> :tabp<CR>
nnoremap <silent> <F6> :tabn<CR>
nnoremap <silent> <F7> :UndotreeToggle<cr>
nnoremap <silent> <F8> :TagbarToggle <CR> \| :TagbarTogglePause<CR>
nnoremap <silent> <F9> :CMake<CR>
autocmd QuickFixCmdPost    l* nested lwindow
command -nargs=* Make make <args> | cwindow 3
nnoremap <silent> <F10> :make<CR>
nnoremap <silent> <F11> :! ../build/exe<CR>
nnoremap <C-c> :call CycleColor()<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <Leader><C><M> :CMake<CR>
nnoremap <Leader><C><C> :CMakeClean<CR>

"désactivation de la surbrillance de la dernière recherche ctrl + n
noremap	<C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
nnoremap <C-n> :nohl<CR>

"classer avec leader + s
vnoremap <Leader>s :sort<CR>

"manipuler des blocs complets avec < et >
vnoremap < <gv 
vnoremap > >gv 

nnoremap <Leader>k :CloseHiddenBuffers<CR>

nnoremap <Leader>- yyp<c-v>$r-
vnoremap <Leader>- yyp<c-v>$r-
nnoremap <Leader>+ yyp<c-v>$r+
nnoremap <Leader>_ yyp<c-v>$r_
nnoremap <Leader>= yyp<c-v>$r=

nmap <silent> <unique> + <Plug>nextvalInc
nmap <silent> <unique> - <Plug>nextvalDec
