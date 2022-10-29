OUTDIR = build/
TEXFLAGS = -outdir=$(OUTDIR) -xelatex -cd -g
TEX = latexmk $(TEXFLAGS)
MARKDOWNFLAGS = --pdf-engine=xelatex
MARKDOWN = pandoc $(MARKDOWNFLAGS)

all: \
	$(OUTDIR)$(patsubst %.tex,%.pdf,$(wildcard *.tex)) \
	$(OUTDIR)$(patsubst %.md,%.pdf,$(wildcard *.md))
	@mkdir -p $(OUTDIR)

$(OUTDIR)%.pdf: %.tex
	$(TEX) $<

$(OUTDIR)%.pdf: %.md
	$(MARKDOWN) $< -o $@

clean:
	$(TEX) -C

.PHONY: clean
