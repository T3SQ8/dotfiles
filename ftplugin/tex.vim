"Functions{{{
nnoremap <buffer> <leader>c :call Compilelatex()<cr>
function! Compilelatex()
	let output_dir = expand("%:p:h")
	if filewritable(expand("%:p:r") . ".pdf")
		let overwrite = input("The file already exists. Do you want to overwrite it? [y/N] ")
		if empty(overwrite) || overwrite =~ "[^Yy]"
			return
		endif
	endif
	set fileencoding=utf-8 | write
	silent execute "!pdflatex"  "-output-directory=" . output_dir expand("%:p")
	set fileencoding=latin1 | write
endfunction

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
endfunction "}}}

setlocal foldmarker=!{{{!,!}}}!

"Key bindings{{{
inoremap <buffer> <c-x> <Esc>/<++><cr>"_c4l
nnoremap <buffer> <c-x> /<++><cr>"_c4l
inoremap <buffer> <m-space> \\
inoremap <buffer> <c-s>1 \section{}<left>
inoremap <buffer> <c-s>2 \subsection{}<left>
inoremap <buffer> <c-b> \textbf{}<left>
inoremap <buffer> <c-e> \emph{}<left>
inoremap <buffer> <c-i> \textit{}<left>
inoremap <buffer> <c-n> \newpage
inoremap <buffer> <c-r> \textcolor{red}{}<left>
"}}}
