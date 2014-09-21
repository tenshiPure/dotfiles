let s:workfile1 = $frank2 . '/workfiles/workfile1.frank2'
let s:workfile2 = $frank2 . '/workfiles/workfile2.frank2'
let s:workfile3 = $frank2 . '/workfiles/workfile3.frank2'

function! Frank2Open(path)
	call DSNew()

	call s:openWork2()
	call s:openWork1()
	call s:openWork3()

	call DSPush(a:path)

	call Remake(a:path)
endfunction

function! Remake(path)
	call CreateEntries(a:path)
	call WindowSwitch1()
	call s:outputEntries(a:path)
endfunction

function! CloseAll()
	call s:close(s:workfile1_bufnum)
	call s:close(s:workfile2_bufnum)
	call s:close(s:workfile3_bufnum)
endfunction

function! s:openWork1()
	execute 'vsplit ' . s:workfile1
	let s:workfile1_bufnum = bufnr('')
	call s:clearnBuffer()
endfunction

function! s:openWork2()
	if s:isBlank()
		execute 'edit ' . s:workfile2
	else
		execute 'tabedit ' . s:workfile2
	endif
	let s:workfile2_bufnum = bufnr('')
	call s:clearnBuffer()
endfunction

function! s:openWork3()
	execute 'botright 10 split ' . s:workfile3
	let s:workfile3_bufnum = bufnr('')
	call s:clearnBuffer()
endfunction

function! s:close(bufnum)
	if bufexists(a:bufnum)
		execute 'bwipeout! ' . a:bufnum
	endif
endfunction

function! WindowSwitch1()
	call s:windowSwitch(s:workfile1_bufnum)
endfunction

function! WindowSwitch2()
	call s:windowSwitch(s:workfile2_bufnum)
endfunction

function! WindowSwitch3()
	call s:windowSwitch(s:workfile3_bufnum)
endfunction

function! s:windowSwitch(bufnum)
	let l:winnum = bufwinnr(a:bufnum)
	execute winnum . 'wincmd w'
endfunction

function! s:isWork1()
	return !exists('s:workfile1_bufnum') ? 0 : bufnr('') == s:workfile1_bufnum
endfunction

function! s:isWork2()
	return !exists('s:workfile2_bufnum') ? 0 : bufnr('') == s:workfile2_bufnum
endfunction

function! s:isWork3()
	return !exists('s:workfile3_bufnum') ? 0 : bufnr('') == s:workfile3_bufnum
endfunction

function! IsFrank()
	return 1 == s:isWork1() + s:isWork2() + s:isWork3()
endfunction

function! s:isBlank()
	return bufname('%') == ''
endfunction

function! s:outputEntries(path)
	call s:clearnBuffer()
	call s:outputHead(a:path)
	call s:outputBody()
	call s:cursorAdjustWork1()
endfunction

function! s:clearnBuffer()
	execute '0,$delete _'
endfunction

function! s:outputHead(path)
	execute ':normal ggO'
	execute ':normal ' . len(a:path) . 'i-'
	call append(1, a:path)
	execute ':normal GO'
	execute ':normal ' . len(a:path) . 'i-'
endfunction

function! s:outputBody()
	for entry in g:entries
		call append('$', entry.output())
	endfor
endfunction

function! s:outputLines(lines)
	call append(0, a:lines)
	execute '$delete _'
endfunction

function! s:cursorAdjustWork1()
	execute 'normal 5gg0'
endfunction

function! s:cursorAdjustWork3()
	execute 'normal gg0'
endfunction

function! OutputLines(lines)
	call s:clearnBuffer()
	call s:outputLines(a:lines)
	call s:cursorAdjustWork3()
endfunction

function! ReadFile(path)
	call s:clearnBuffer()
	execute 'r ' . a:path
	execute '0delete _'
	let extension = fnamemodify(a:path, ':e')
	" tmp
	if extension == '' | let extension = 'vim' | endif
	let &filetype = extension
endfunction

function! DSNew()
	let s:directoryStacks = []
endfunction	

function! DSPush(path)
	let s:directoryStacks = s:directoryStacks + [a:path]
	return a:path
endfunction	

function! DSPop()
	if len(s:directoryStacks) != 1
		call remove(s:directoryStacks, -1)
	endif
	return s:directoryStacks[-1]
endfunction	

function! DSLast()
	return s:directoryStacks[-1]
endfunction	

function! LauncherOpenAtWork3(bookmarks)
	call WindowSwitch3()
	call s:close(s:workfile3_bufnum)
	call s:openBookmarks(a:bookmarks)
endfunction

function! s:openBookmarks(path)
	execute 'botright 10 split ' . a:path
	let s:workfile3_bufnum = bufnr('')
endfunction
