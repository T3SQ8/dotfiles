setlocal spelllang=en
let g:markdown_folding = 1

highlight Title cterm=bold
highlight markdownHeadingDelimiter cterm=bold

vnoremap <leader>b :Visualwrap ** **<cr>
