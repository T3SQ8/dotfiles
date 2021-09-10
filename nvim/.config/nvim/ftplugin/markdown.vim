nnoremap <buffer> <leader>o :execute '!xdg-open' expand('%:p:r'). '.html'<cr>

let &makeprg = 'pandoc % -o ' . expand('%:r') . '.html'
