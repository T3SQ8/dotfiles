nnoremap <buffer> <leader>o :execute '!man' expand('%:p')<cr>

let &makeprg = 'groff -r -ms % -Tpdf > ' . expand('%:r') . '.pdf'
