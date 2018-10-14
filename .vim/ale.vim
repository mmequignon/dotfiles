let g:ale_linters = {
\    'python': ['pylint-odoo', 'flake8'],
\    'cpp': ['cppcheck', 'clang'],
\    'rust': ['cargo', 'rustc'],
\    'latex': ['chktex'],
\}
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:airline#extensions#ale#error_symbol = '✗ '
let g:airline#extensions#ale#warning_symbol = '⚠ '
