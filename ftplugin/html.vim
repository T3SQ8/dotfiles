function! Beginhtml()
	call append(0, "</html>")
	call append(0, "</body>")
	call append(0, "<++>")
	call append(0, "<body>")
	call append(0, "</head>")
	call append(0, "<++>")
	call append(0, "<title><++></title>")
	call append(0, '<link rel="stylesheet" Type="text/css" href="<++>">')
	call append(0, '<meta name="description" content="<++>">')
	call append(0, '<meta charset="UTF-8">')
	call append(0, "<head>")
	call append(0, '<html lang="<++>">')
	call append(0, "<!DOCTYPE html>")
	normal! gg=G
	global/^$/d
endfunction
