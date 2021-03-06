let s:markdown_workspace = $markdown . '/workspace/'

let s:first    = s:markdown_workspace . 'first-half.template'
let s:second   = s:markdown_workspace . 'second-half.template'
let s:editing  = s:markdown_workspace . 'editing.md'
let s:html     = s:markdown_workspace . 'markdown.html'


function! markdown#main#open()
	execute 'tabedit ' . s:editing
	call markdown#main#update()
	call system('open /Applications/Google\ Chrome.app ' . s:html)
endfunction


function! markdown#main#update()
	call system('cat ' . s:first . ' ' . s:editing . ' ' . s:second . ' > ' . s:html)
endfunction
