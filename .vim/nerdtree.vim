autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore=['\~$', '\.pyc$', '\.class$', '\.hi$', '\.o$']    " Files to ignore (default = ['\~$'])
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer = 1
