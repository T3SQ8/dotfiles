nnoremap <buffer> <leader>u :call Addpackage("")<cr>
function! Addpackage(package)
	let usepackage = search('\\usepackage{\w\+}', 'n') " Search for a line that already is calling a package
	if usepackage != 0
		let line = usepackage
	else
		let line = search('\\documentclass\[\=.*]\={\w\+}', 'n') " Add the line after the documentclass (line is set to 0 if no the command fails)
	endif
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
