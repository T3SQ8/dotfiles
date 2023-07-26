setlocal spelllang=sv

nnoremap <buffer> <leader>b :call Mkenviroment('')<left><left>
function! Mkenviroment(pkg)
	call append('.', [
				\ '\begin{' . a:pkg . '}',
				\ '\end{'   . a:pkg . '}',
				\ ])
	normal! jo
	startinsert
endfunction

vnoremap <leader>b :Visualwrap \textbf{ }<cr>
vnoremap <leader>i :Visualwrap \textit{ }<cr>
nnoremap <leader>c :make!<cr>
