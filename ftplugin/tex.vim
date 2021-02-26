nnoremap <buffer> <leader>u :call Addpackage()<cr>
function! Addpackage(...)
	" Look backwards for a line where a package is included or the
	" documentclass. If neither exists line will be assigned to 0.
	let line = search('^\\\(usepackage\|documentclass\)\[\=\S*]\={\S\+}', 'ncb')
	if empty(a:0)
		call append(line, '\usepackage{}')
		call cursor(line + 1, 13) | startinsert
	elseif search('\\usepackage{' . a:1 . '}', 'n')
		" Exit if the package is already included.
		echo "Package already added." | return
	else
		call append(line, '\usepackage{' . a:1 . '}')
	endif
endfunction

setlocal foldmarker=<<<,>>>
