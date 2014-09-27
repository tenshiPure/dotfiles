let s:blacklist = ['.git', '.svn', '.vagrant', '.DS_Store', '*.pyc']

function! frank#entry#create(path)
	let paths = s:finder(a:path)
	let g:entries = s:convert(a:path, paths)
endfunction

function! s:finder(path)
	let blacks = ''
	for black in s:blacklist
		let blacks .= ' -name "' . black . '" -prune -or'
	endfor

	return system('find ' . a:path . blacks . ' -print')
endfunction

function! s:convert(basepath, paths)
	let s:baselen = len(a:basepath)

	let index = 4
	let entries = []
	for path in split(a:paths)
		let depth = len(substitute(path[s:baselen + 1:], '[^/]', '', 'g'))
		let entry = {'path' : path, 'isDir' : isdirectory(path), 'depth' : depth, 'fold' : 0, 'point' : 0, 'index' : index}

		function! entry.output()
			" static method的に
			let fold = self.isDir ? (self.fold ? '- ' : '+ ') : '  '
			let point = self.point ? '* ' : '  '
			let name = substitute(self.path[s:baselen + 1:], '[^/]*/', '    ', 'g')
			let slash = self.isDir ? '/' : ''

			return fold . point . name . slash
		endfunction

		let entries = entries + [entry]
		let index += 1
	endfor

	return entries[1:]
endfunction
