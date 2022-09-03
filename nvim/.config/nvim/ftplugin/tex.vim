let g:tex_flavor = 'latexmk'
let g:tex_conceal = 'abmgs'
let b:tex_stylish = 1
set conceallevel=2
compiler tex

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
