nnoremap <leader>c :call Comment()<cr>
function! Comment()
	call append(line('.')-1, "<!---->")
	call cursor(line('.')-1, 5)
	startinsert
endfunction
