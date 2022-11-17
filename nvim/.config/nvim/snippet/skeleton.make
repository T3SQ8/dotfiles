OUTDIR = build/
IMGDIR = images/
IMGCONV = convert
TEXFLAGS = -outdir=$(OUTDIR) -xelatex -cd -g
TEX = latexmk $(TEXFLAGS)
MARKDOWNFLAGS = --pdf-engine=xelatex
MARKDOWN = pandoc $(MARKDOWNFLAGS)

all: \
	$(OUTDIR)$(patsubst %.tex,%.pdf,$(wildcard *.tex)) \
	$(OUTDIR)$(patsubst %.md,%.pdf,$(wildcard *.md))

$(OUTDIR):
	@mkdir -p $(OUTDIR)

$(OUTDIR)%.pdf: %.tex
	$(TEX) $<

$(OUTDIR)%.pdf: %.md
	$(MARKDOWN) $< -o $@

clean:
	$(TEX) -C

images: \
	$(patsubst %.jpg,%.webp,$(wildcard $(IMGDIR)*.jpg)) \
	$(patsubst %.jpeg,%.webp,$(wildcard $(IMGDIR)*.jpeg)) \
	$(patsubst %.png,%.webp,$(wildcard $(IMGDIR)*.png))

$(IMGDIR)%.webp:
	#$(eval base := $(wildcard $(basename $@).*))
	#$(IMGCONV) $(base) $@
	#mv $(base) $(base).bak

.PHONY: clean
