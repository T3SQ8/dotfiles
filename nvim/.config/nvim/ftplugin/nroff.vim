let &makeprg = 'groff -r -ms % -Tpdf > ' . expand('%:r') . '.pdf'
