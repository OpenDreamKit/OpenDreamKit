BST = alpha apalike
BSTINPUTS = /usr/local/texlive/2008/texmf-dist/bibtex/bst/base/
HURL = $(BST:%=%hurl.bst)
URLH = $(BST:%=%urlh.bst)
BIBS = kwarc.bib test.bib
BIBS.bib.xml = $(BIBS:%.bib=%.bib.xml)
BIBS.xml = $(BIBS:%.bib=%.xml)

all:	kwarc.xml
bst: $(HURL) $(URLH)

$(BIBS.bib.xml): %.bib.xml: %.bib 
	 latexml --preload=url.sty --destination=$@ $<

$(BIBS.xml): %.xml: %.bib.xml
	 latexmlpost --destination=$@ $<

$(HURL): %hurl.bst: $(BSTINPUTS)/%.bst
	urlbst --inlinelinks --hyperref $< > $@

$(URLH): %urlh.bst: $(BSTINPUTS)/%.bst
	urlbst --hyperref $< > $@

echo:
	echo $(BIBS)
