" vim:set ft=vim:

" emacs (move)
inoremap <C-a> <HOME>
inoremap <C-e> <END>

" emacs (edit)
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-w> <C-w>
inoremap <C-k> <C-o><S-d>
inoremap <C-u> <C-u>

" auto ime off
inoremap <ESC> <ESC>:set iminsert=0<CR>

" complete-func
inoremap <expr> <M-CR>   pumvisible() ? "\<C-p>" : "\<C-x><C-u>"
inoremap <expr> <S-M-CR> pumvisible() ? "\<C-n>" : "\<C-x><C-u>"

inoremap <expr> <C-p>    pumvisible() ? "\<C-p>" : "\<C-x><C-u>"
inoremap <expr> <C-n>    pumvisible() ? "\<C-n>" : "\<C-x><C-u>"
