" Key binds{{{
" Headers
vnoremap <buffer> <leader>h1 :<c-u>call Visualwrap("<h1>", "</h1>")<cr>
vnoremap <buffer> <leader>h2 :<c-u>call Visualwrap("<h2>", "</h2>")<cr>
vnoremap <buffer> <leader>h3 :<c-u>call Visualwrap("<h3>", "</h3>")<cr>
vnoremap <buffer> <leader>h4 :<c-u>call Visualwrap("<h4>", "</h4>")<cr>
vnoremap <buffer> <leader>h5 :<c-u>call Visualwrap("<h5>", "</h5>")<cr>
vnoremap <buffer> <leader>h6 :<c-u>call Visualwrap("<h6>", "</h6>")<cr>

" Formating
nnoremap <buffer> <m-space> /<++><cr>ca<
inoremap <buffer> <c-p> <p></p><left><left><left><left>
inoremap <buffer> <c-space> <hr/>
inoremap <buffer> <m-space> </br>
vnoremap <buffer> <leader>cm :<c-u>call Visualwrap("<!--", "-->")<cr>
vnoremap <buffer> <leader>hl :<c-u>call Visualwrap("<mark>", "</mark>")<cr>
vnoremap <buffer> <leader>bg :<c-u>call Visualwrap("<big>", "</big>")<cr>
vnoremap <buffer> <leader>sm :<c-u>call Visualwrap("<small>", "</small>")<cr>
vnoremap <buffer> <leader>bl :<c-u>call Visualwrap("<b>", "</b>")<cr>
vnoremap <buffer> <leader>it :<c-u>call Visualwrap("<i>", "</i>")<cr>

" media
vnoremap <buffer> <leader>ln :<c-u>call Visualwrap('<a href="<++>">', "</a>")<cr>
nnoremap <leader>ig :normal! i<img width="<++>" height="<++>" src="<++>" alt="<++>"/><cr>
vnoremap <buffer> <leader>vd :<c-u>call Visualwrap('<video src="<++>" poster="<++>" controls>', "</video>")<cr>
"}}}

" Functions{{{
nnoremap <leader>bg :call Beginhtml()<cr>
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
endfunction "}}}
