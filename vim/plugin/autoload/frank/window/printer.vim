let s:finder = 'python -B ' .  $frank . '/api/Finder.py'

function! frank#window#printer#entries(path)
	let header = system(s:finder . ' -h ' . a:path)
	let tree = system(s:finder . ' -t ' . a:path)
	call frank#window#switcher#to(1)
	execute '1,$delete _'
	call append(0, split(header, '\n'))
	call append('$', split(tree, '\n'))
endfunction

"function! frank#window#printer#to2(path)
"	call frank#window#switcher#to(2)
"	execute 'r ' . a:path
"	execute '0delete _'
"	let extension = fnamemodify(a:path, ':e')
"	let &filetype = extension
"endfunction
