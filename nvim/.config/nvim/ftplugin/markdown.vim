let g:markdown_folding = 1
let &makeprg = 'pandoc --pdf-engine=xelatex -o ' . shellescape(expand('%:r') . '.pdf')
