function! N_TerminalOpen()
	let entry = GetOneByCursor()
	if entry.isDir
		call s:open(entry)
	endif
endfunction

function! N_TerminalListSegments()
	let entry = GetOneByCursor()
	call s:ls(entry)
endfunction

function! s:open(entry)
	execute 'silent !open -a Terminal ' . a:entry.path
endfunction

function! s:ls(entry)
	if a:entry.isDir
		call s:lsDir(a:entry)
	else
		call s:lsFile(a:entry)
	endif
endfunction

function! s:lsDir(entry)
	let result  = system('ls -ld ' . a:entry.path) . "\n"
	let result .= system('ls -lF ' . a:entry.path . ' | tail +2')

	call WindowSwitch3()
	call OutputLines(split(result, '\n'))
	call WindowSwitch1()
endfunction

function! s:lsFile(entry)
	let result = system('ls -lF ' . a:entry.path)

	call WindowSwitch3()
	call OutputLines(split(result, '\n'))
	call WindowSwitch1()
endfunction