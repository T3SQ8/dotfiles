TEX = pdflatex -output-directory $(@D)
BIB = biber

all: $(patsubst %.tex,%.pdf,$(wildcard *.tex))

%.pdf: %.tex
	$(TEX) $<
	[ -f $*.bib ] && $(BIB) $* && $(TEX) $<
	$(TEX) $<
