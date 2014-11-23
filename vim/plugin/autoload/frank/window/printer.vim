function! frank#window#printer#entries(path)
	let head = frank#finder#head(a:path) . "\n\n"
	let tree = frank#finder#tree(a:path)
	call frank#window#switcher#to(1)

	call lib#buffer#print(head, 0)
	call lib#buffer#append(tree, 0)
endfunction

function! frank#window#printer#to2(path)
	call frank#window#switcher#to(2)
	call lib#buffer#clean()
	execute 'r ' . a:path
	execute '0delete _'
	let extension = fnamemodify(a:path, ':e')
	let &filetype = extension
endfunction
