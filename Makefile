BST = alpha apalike
BSTINPUTS = /usr/local/texlive/2008/texmf-dist/bibtex/bst/base/:
HURL = $(BST:%=%hurl.bst)
URLH = $(BST:%=%urlh.bst)
KWARC.bib = extpubs.bib kwarcpubs.bib kwarccrossrefs.bib extcrossrefs.bib
KWARC.xml = $(KWARC.bib:%=%.xml)
LBIBS = $(KWARC.xml:%=--bibliography=%)
all: kwarcpubs.pdf $(KWARC.xml)
bst: $(HURL) $(URLH)

$(HURL): %hurl.bst: $(BSTINPUTS)/%.bst
	urlbst --inlinelinks --hyperref $< > $@

$(URLH): %urlh.bst: $(BSTINPUTS)/%.bst
	urlbst --hyperref $< > $@

kwarcpubs.pdf: kwarcpubs.tex kwarcnocites.tex $(KWARC.bib)
	pdflatex kwarcpubs
	biber kwarcpubs
	pdflatex kwarcpubs
	pdflatex kwarcpubs

$(KWARC.xml): %.bib.xml: %.bib 
	latexmlc $< --bibtex --preload=kwarcbibs.sty --destination=$@ --log=$<.ltxlog

pubs.html: pubs.tex $(KWARC.xml)
	latexmlc $(LBIBS) --format=html5 --destination=pubs.html --log=pubs.ltxlog $<
