"Functions{{{
nnoremap <buffer> <leader>u :call Addpackage("")<cr>
function! Addpackage(package)
	if empty(a:package)
		if search('\\usepackage{\w\+}', 'n') "Search for a line that allready is calling a package
			call append(search('\\usepackage{\w\+}', 'bn'), "\\usepackage{}") "Add the new line after that
		else
			call append(search('\\documentclass{\w\+}', 'bn'), "\\usepackage{}") "Add the line after the documentclass function
		endif
		call search('\\usepackage{}', 'b')
		call cursor('', 13)
		startinsert
	else
		if search('\\usepackage{\w\+}', 'n')
			call append(search('\\usepackage{\w\+}', 'bn'), '\usepackage{' . a:package . '}')
		else
			call append(search('\\documentclass{\w\+}', 'bn'), '\usepackage{' . a:package . '}')
		endif
	endif
endfunction

function! Begintex()
	call append(0, '\end{document}')
	call append(0, '<++>')
	call append(0, '\begin{document}')
	call append(0, '\documentclass{article}')
	global/^$/d
endfunction
"}}}

setlocal foldmarker=!{{{!,!}}}!

"Key bindings{{{
inoremap <buffer> <c-x> <Esc>/<++><cr>"_c4l
nnoremap <buffer> <c-x> /<++><cr>"_c4l
"}}}
