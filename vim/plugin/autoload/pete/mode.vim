function! pete#mode#execute(...)
	if a:0 == 1
		let g:execute_mode = a:1
	endif

	execute 'WH'
endfunction


function! pete#mode#tool(...)
	if a:0 == 1
		let g:tool_mode = a:1
	endif

	execute 'TH'
endfunction


function! pete#mode#debug(...)
	if a:0 == 1
		let g:debug_mode = a:1
	endif

	execute 'DH'
endfunction
