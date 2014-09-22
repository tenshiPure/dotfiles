function! LauncherKeyMap()
	nnoremap <buffer> cd   :call L_ChangeDirectory()<CR>
	nnoremap <buffer> <CR> :call L_FrankOpen()<CR>
endfunction

function! L_ChangeDirectory()
	execute 'cd ' . getline('.')
endfunction

function! L_FrankOpen()
	let path = getline('.')
	if IsFrank()
		call CloseAll()
	endif

	execute 'FF ' . path
endfunction