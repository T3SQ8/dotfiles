nnoremap <buffer> <leader>u :call Addpackage("")<cr>
function! Addpackage(package)
	let latexsyntax = '\[\=\w*]\={\S\+}'
	let searchargs = 'ncb'
	" Try to set line after usepackage or documentclass.
	" Will assign to 0 if both fail
	let line = search('\\usepackage' . latexsyntax, searchargs)
	if line == 0
		let line = search('\\documentclass' . latexsyntax, searchargs)
	endif
	" Check if the line exists if an argument is given.
	" Otherwise move the cursor to line and enter insert mode.
	if empty(a:package)
		call append(line, "\\usepackage{}")
		call cursor(line + 1, 13)
		startinsert
	elseif search('\\usepackage{' . a:package . '}', 'n')
		return
	else
		call append(line, '\usepackage{' . a:package . '}')
	endif
endfunction

setlocal foldmarker=<<<,>>>
