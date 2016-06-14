
KWARC.bib = kwarcpubs.bib kwarccrossrefs.bib extcrossrefs.bib
KWARC.xml = $(KWARC.bib:%=%.xml)
KWARCEXT.bib = $(KWARC.bib) extpubs.bib
KWARCEXT.xml = $(KWARCEXT.bib:%=%.xml)
LBIBS = $(KWARC.xml:%=--bibliography=%)

KWARC = mkohlhase ako
TYPES = article incollection inproceedings proceedings masterthesis phdthesis techreport unpublished misc
KPUBS.tex = $(foreach k,$(KWARC),$(foreach t,$(TYPES),$(k)-$(t).tex))

KPUBS.html = $(KPUBS.tex:%.tex=%.html)

pubs: $(KPUBS.html)
all: kwarcpubs.pdf pubs
xml: $(KWARC.xml)

kwarcpubs.pdf: kwarcpubs.tex kwarcnocites.tex $(KWARC.bib)
	pdflatex kwarcpubs
	biber kwarcpubs
	pdflatex kwarcpubs
	pdflatex kwarcpubs

$(KWARCEXT.xml): %.bib.xml: %.bib 
	latexmlc $< --bibtex --includestyles --preload=kwarcbibs.sty.ltxml --destination=$@ --log=$<.ltxlog

pubs.html: pubs.tex $(KWARC.xml)
	latexmlc $(LBIBS) --format=html5 --destination=pubs.html --log=pubs.ltxlog $<

$(KPUBS.tex): kwarcpubs.bib.xml mybib.xsl
	xsltproc --stringparam file $(@:%.tex=%) -o $@ mybib.xsl kwarcpubs.bib.xml

$(KPUBS.html): %.html: %.tex $(KWARC.xml)
	latexmlc $(LBIBS) --format=html5 --destination=$@ --log=$<.ltxlog --css=bib.css $<

echo: 
	@echo $(KPUBS.tex)
