
"---------------------------------------------------------------
" raccourcis
"--------------------------------------------------------------

nnoremap <silent> <F2> :FZF<CR>
nnoremap <silent> <F3> :Ack<Space>-Hi<Space>
nnoremap <silent><expr> <F4> g:NERDTree.IsOpen() ? ":NERDTreeClose\<CR>" : bufname("%") == "" ? ":NERDTreeCWD\<CR>" : ":NERDTreeFind\<CR>"
nnoremap <silent> <F7> :UndotreeToggle<cr>
nnoremap <silent> <F8> :TagbarToggle <CR> \| :TagbarTogglePause<CR>
nnoremap <C-t> :tabnew<CR>


"désactivation de la surbrillance de la dernière recherche ctrl + n
nnoremap <Leader>* :nohl<CR>

"classer avec leader + s
vnoremap <Leader>s :sort<CR>

"manipuler des blocs complets avec < et >
vnoremap < <gv
vnoremap > >gv

nnoremap <Leader>k :CloseHiddenBuffers<CR>

nnoremap <Leader>- yyp<c-v>$r-
nnoremap <Leader>+ yyp<c-v>$r+
nnoremap <Leader>_ yyp<c-v>$r_
nnoremap <Leader>= yyp<c-v>$r=

nmap <silent> <unique> + <Plug>nextvalInc
nmap <silent> <unique> - <Plug>nextvalDec
