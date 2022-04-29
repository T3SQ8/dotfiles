let &makeprg = 'pandoc --pdf-engine=xelatex -o ' . shellescape(expand('%:r') . '.pdf')
