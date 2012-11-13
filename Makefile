BST = alpha apalike
BSTINPUTS = /usr/local/texlive/2008/texmf-dist/bibtex/bst/base/:
HURL = $(BST:%=%hurl.bst)
URLH = $(BST:%=%urlh.bst)

all: kwarcpubs.pdf # kwarc.bib
bst: $(HURL) $(URLH)

$(HURL): %hurl.bst: $(BSTINPUTS)/%.bst
	urlbst --inlinelinks --hyperref $< > $@

$(URLH): %urlh.bst: $(BSTINPUTS)/%.bst
	urlbst --hyperref $< > $@

kwarc.bib: warning-kwarc.bib preamble.bib extpubs.bib kwarcpubs.bib kwarccrossrefs.bib extcrossrefs.bib
	cat warning-kwarc.bib preamble.bib extpubs.bib kwarcpubs.bib kwarccrossrefs.bib extcrossrefs.bib> kwarc.bib

kwarcpubs.pdf: kwarcpubs.tex kwarcnocites.tex
	pdflatex kwarcpubs
	bibtex kwarcpubs
	pdflatex kwarcpubs
	pdflatex kwarcpubs
