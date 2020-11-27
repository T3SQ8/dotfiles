nnoremap <buffer> <leader>c :call Comment()<cr>
function! Comment()
	call append(line('.')-1, "<!---->")
	call cursor(line('.')-1, 5)
	startinsert
endfunction

nnoremap <buffer> <leader>m :call Addtags()<cr>
function! Addtags()
	let optionslist = [
				\'1. <a href="url">Failed to display</a>',
				\'2. <img src="url" alt="Failed to displat"/>',
				\'3. <video src="url">Failed to display</video>',
				\'4. <iframe src="url">Failed to display</iframe>',
				\'5. <link rel="stylesheet" Type="text/css" href="url">',
				\'6. <input type="text"/>',
				\'7. <textarea>placeholder</textarea>',
				\]
	let choice = inputlist(optionslist)
	call append('.', strpart(optionslist[choice-1], 3))
endfunction
