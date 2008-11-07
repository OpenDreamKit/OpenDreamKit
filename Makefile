BIB = /usr/local/texlive/2007/texmf-dist/bibtex/bst/base/alpha.bst

all = kwarc.xml

alphahurl.bst: $(BIB) 
	urlbst --inlinelinks --hyperref $< > $@

kwarc.xml:	kwarc.bib
	bib2xml kwarc.bib
