let &makeprg = 'pandoc -s --toc -o ' . expand('%:r') . '.html'
