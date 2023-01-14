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

vnoremap <leader>b :<c-u>call Visualwrap('\textbf{', '}')<cr>
vnoremap <leader>i :<c-u>call Visualwrap('\textit{', '}')<cr>
nnoremap <leader>c :make!<cr>
