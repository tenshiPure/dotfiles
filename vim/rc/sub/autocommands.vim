" vim:set ft=vim:

augroup subrc
	autocmd!
	autocmd VimEnter * set nowrap
	autocmd VimEnter * set nrformats=
	autocmd FileType py setlocal filetype=python
	autocmd BufEnter *.hamlet setlocal filetype=haml
	autocmd BufEnter *.lucius setlocal filetype=css
	autocmd BufEnter *.cassius setlocal filetype=css
	autocmd BufEnter *.julius setlocal filetype=javascript
	autocmd BufEnter *.hamlet O
	autocmd BufEnter *.lucius O
	autocmd BufEnter *.cassius O
	autocmd BufEnter *.julius O
augroup END
