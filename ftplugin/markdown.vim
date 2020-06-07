"Functions{{{
nnoremap <buffer> <leader>ch :call Compilemarkdown("html")<cr>
nnoremap <buffer> <leader>cd :call Compilemarkdown("docx")<cr>
function! Compilemarkdown(format)
	let output_dir = expand("%:p:h")
	let output_file = expand("%:t:r")
	let final_output = eval("output_dir . '/' . output_file . '.' . a:format")
	if filewritable(final_output)
		let overwrite = input("The file already exists. Do you want to overwrite it? [y/N] ")
		if empty(overwrite) || overwrite =~ "[^Yy]"
			return
		endif
	endif
	set fileencoding=utf-8 | write
	execute '!pandoc % -o' final_output
	set fileencoding=latin1 | write
endfunction "}}}

"Key bindings{{{
vnoremap <buffer> <leader>h :<c-u>call Visualwrap("<mark>", "</mark>")<cr>
vnoremap <buffer> <leader>c :<c-u>call Visualwrap("<!--", "-->")<cr>
inoremap <buffer> <c-x> <Esc>/<++><cr>"_c4l
inoremap <buffer> <m-space> <br/>
"}}}
