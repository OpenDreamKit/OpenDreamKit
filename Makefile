BST = alpha apalike
BSTINPUTS = /usr/local/texlive/2008/texmf-dist/bibtex/bst/base/
HURL = $(BST:%=%hurl.bst)
URLH = $(BST:%=%urlh.bst)

all:	kwarc.xml
bst: $(HURL) $(URLH)

kwarc.tex.xml: kwarc.bib 
	 latexml --preload=url.sty --destination=kwarc.tex.xml kwarc.bib

kwarc.xml: kwarc.tex.xml
	 latexmlpost --destination=kwarc.xml kwarc.tex.xml

$(HURL): %hurl.bst: $(BSTINPUTS)/%.bst
	urlbst --inlinelinks --hyperref $< > $@

$(URLH): %urlh.bst: $(BSTINPUTS)/%.bst
	urlbst --hyperref $< > $@

