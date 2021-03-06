" vim:set ft=vim:

" change tab
nnoremap <Space> gt
nnoremap <S-Space> gT

" new tab
"  Actual input is <C-Space>.
"  but <C-Space> was disabled by ATOK. (ref. private.xml)
nnoremap <D-Space> :tabedit 

" close tab
nnoremap <C-Space> :bdelete<CR>

" close tab (force)
nnoremap <S-C-Space> :bdelete!<CR>

" without <Space>
nnoremap gh gT
nnoremap gl gt
nnoremap gj :bdelete<CR>
