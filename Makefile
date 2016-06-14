BST = alpha apalike
BSTINPUTS = /usr/local/texlive/2008/texmf-dist/bibtex/bst/base/:
HURL = $(BST:%=%hurl.bst)
URLH = $(BST:%=%urlh.bst)
KWARC.bib = kwarcpubs.bib kwarccrossrefs.bib extcrossrefs.bib
KWARC.xml = $(KWARC.bib:%=%.xml)
KWARCEXT.bib = $(KWARC.bib) extpubs.bib
KWARCEXT.xml = $(KWARCEXT.bib:%=%.xml)
LBIBS = $(KWARC.xml:%=--bibliography=%)

KWARC = mkohlhase
PTYPE = article inproceedings
KPUBS.tex = $(PTYPE:%=mkohlhase-%.tex)
KPUBS.html = $(KPUBS.tex:%.tex=%.html)

all: kwarcpubs.pdf $(KWARC.xml)
bst: $(HURL) $(URLH)
pubs: $(KPUBS.html)

$(HURL): %hurl.bst: $(BSTINPUTS)/%.bst
	urlbst --inlinelinks --hyperref $< > $@

$(URLH): %urlh.bst: $(BSTINPUTS)/%.bst
	urlbst --hyperref $< > $@

kwarcpubs.pdf: kwarcpubs.tex kwarcnocites.tex $(KWARC.bib)
	pdflatex kwarcpubs
	biber kwarcpubs
	pdflatex kwarcpubs
	pdflatex kwarcpubs

$(KWARCEXT.xml): %.bib.xml: %.bib 
	latexmlc $< --bibtex --includestyles --preload=kwarcbibs.sty.ltxml --destination=$@ --log=$<.ltxlog

Pubs.html: pubs.tex $(KWARC.xml)
	latexmlc $(LBIBS) --format=html5 --destination=pubs.html --log=pubs.ltxlog $<

mkohlhase-article.tex: kwarcpubs.bib.xml kwarcpubs.bib.xml
	xsltproc --stringparam type article -o $@ mybib.xsl kwarcpubs.bib.xml

mkohlhase-inproceedings.tex: kwarcpubs.bib.xml kwarcpubs.bib.xml
	xsltproc --stringparam type inproceedings -o $@ mybib.xsl kwarcpubs.bib.xml

$(KPUBS.html): %.html: %.tex $(KWARC.xml)
	latexmlc $(LBIBS) --format=html5 --destination=$@ --log=$<.ltxlog  $<

echo: 
	@echo $(KWARCEXT.xml)
